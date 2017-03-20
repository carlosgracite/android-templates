package ${packageName}.ui.base;

import android.app.Activity;
import android.content.Intent;
import android.support.annotation.IntDef;
import android.support.annotation.NonNull;

import ${packageName}.R;

import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

public class ActivityTransitionDelegate {

    private static final String EXTRA_TRANSITION_MODE = "transition_mode";

    public static final int TRANSITION_NONE = -1;
    public static final int TRANSITION_ENTER_RIGHT_EXIT_LEFT = 0;
    public static final int TRANSITION_FLIP_RIGHT_TO_LEFT = 1;

    @IntDef({TRANSITION_NONE, TRANSITION_ENTER_RIGHT_EXIT_LEFT,
            TRANSITION_FLIP_RIGHT_TO_LEFT})
    @Retention(RetentionPolicy.SOURCE)
    public @interface TransitionMode {}

    private @TransitionMode
    int transitionMode;

    private Activity activity;

    public ActivityTransitionDelegate(@NonNull Activity activity) {
        this.activity = activity;
        //noinspection WrongConstant
        transitionMode = activity.getIntent().getIntExtra(EXTRA_TRANSITION_MODE, TRANSITION_NONE);
    }

    public void executeTransitionIn() {
        switch (transitionMode) {
            case TRANSITION_ENTER_RIGHT_EXIT_LEFT:
                activity.overridePendingTransition(R.anim.enter_from_right, R.anim.exit_to_left);
                break;
        }
    }

    public void executeTransitionOut() {
        switch (transitionMode) {
            case TRANSITION_ENTER_RIGHT_EXIT_LEFT:
                activity.overridePendingTransition(R.anim.enter_from_left, R.anim.exit_to_right);
                break;
        }
    }

    public static void setTransitionMode(Intent intent, @TransitionMode int transitionMode) {
        intent.putExtra(EXTRA_TRANSITION_MODE, transitionMode);
    }

}