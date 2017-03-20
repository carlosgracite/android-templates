package ${packageName}.utils;

import android.app.Activity;
import android.content.Context;
import android.graphics.Rect;
import android.os.Build;
import android.os.Handler;
import android.support.annotation.StringRes;
import android.util.TypedValue;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.view.Window;
import android.view.inputmethod.InputMethodManager;

public class ViewUtils {

    /**
     * Helper method to convert dips to pixels.
     */
    public static int dipsToPix(Context context, float dps) {
        return (int) TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, dps,
                context.getResources().getDisplayMetrics());
    }

    public static int spToPix(Context context, float sp) {
        return (int) TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_SP,
                sp, context.getResources().getDisplayMetrics());
    }

    public static void debounceClick(final View view) {
        view.setEnabled(false);
        new Handler().postDelayed(() -> view.setEnabled(true), 200);
    }

    public static String formattedStr(Context context, @StringRes int stringRes, Object... values) {
        String rawString = context.getString(stringRes);
        return String.format(rawString, values);
    }

    public static void hideKeyboard(Activity activity) {
        View view = activity.getCurrentFocus();
        if (view != null) {
            InputMethodManager imm = (InputMethodManager)activity.getSystemService(Context.INPUT_METHOD_SERVICE);
            imm.hideSoftInputFromWindow(view.getWindowToken(), 0);
        }
    }

    /**
     * Efetua redefine o tamanho de uma view de acordo com a largura da tela,
     * levando com consideração um fator de proporção e um tamanho máximo.
     *
     * @param context
     * @param view view que terá a largura alterada
     * @param scale fator de scala entre 0 e 1
     * @param maxWidth largura máxima em dpi
     */
    public static void scaleViewWidth(Context context, View view, float scale, float maxWidth) {
        int width = (int) (context.getResources().getDisplayMetrics().widthPixels * scale);
        ViewGroup.LayoutParams params = view.getLayoutParams();
        params.width = Math.min(width, ViewUtils.dipsToPix(context, maxWidth));
        view.setLayoutParams(params);
    }

    public static int getStatusBarHeight(Activity activity) {
        Rect rectangle = new Rect();
        Window window = activity.getWindow();
        window.getDecorView().getWindowVisibleDisplayFrame(rectangle);
        return rectangle.top;
    }

    public static void waitForLayout(View view, Runnable runnable) {
        view.getViewTreeObserver().addOnGlobalLayoutListener(new ViewTreeObserver.OnGlobalLayoutListener() {
            @Override
            public void onGlobalLayout() {
                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.JELLY_BEAN) {
                    view.getViewTreeObserver().removeOnGlobalLayoutListener(this);
                } else {
                    view.getViewTreeObserver().removeGlobalOnLayoutListener(this);
                }
                runnable.run();
            }
        });
    }

    public static Rect getLocationOnScreen(View view) {
        Rect mRect = new Rect();
        int[] location = new int[2];

        view.getLocationOnScreen(location);

        mRect.left = location[0];
        mRect.top = location[1];
        mRect.right = location[0] + view.getWidth();
        mRect.bottom = location[1] + view.getHeight();

        return mRect;
    }

}
