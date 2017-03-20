package ${packageName}.api.entity;

import com.google.auto.value.AutoValue;
import com.google.gson.Gson;
import com.google.gson.TypeAdapter;

@AutoValue
public abstract class Stub {

    public static TypeAdapter<Stub> typeAdapter(Gson gson) {
        return new AutoValue_Stub.GsonTypeAdapter(gson);
    }

}
