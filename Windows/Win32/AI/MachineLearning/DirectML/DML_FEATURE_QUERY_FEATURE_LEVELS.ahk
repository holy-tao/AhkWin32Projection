#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Used to query a DirectML device for its support for one or more feature levels.
 * @remarks
 * This query is useful in combination with the *minimumFeatureLevel* parameter of [DMLCreateDevice1](/windows/win32/api/directml/nf-directml-dmlcreatedevice1). By supplying a minimum feature level to **DMLCreateDevice1**, you can be guaranteed a *lower* bound to the underlying DirectML device's feature level support.
 * 
 * Using this query, you can then also retrieve an *upper* bound for the feature levels supported by this DirectML device. This information can then be used to achieve graceful fallbacks in cases where particular features are unavailable.
 * @see https://learn.microsoft.com/windows/win32/api/directml/ns-directml-dml_feature_query_feature_levels
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 * @version v4.0.30319
 */
class DML_FEATURE_QUERY_FEATURE_LEVELS extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Type: **[UINT](/windows/desktop/WinProg/windows-data-types)**
     * 
     * The number of elements in the *RequestedFeatureLevels* array.
     * @type {Integer}
     */
    RequestedFeatureLevelCount {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: \_Field\_size\_(RequestedFeatureLevelCount) **[DML_FEATURE_LEVEL](/windows/win32/api/directml/ne-directml-dml_feature_level)\***
     * 
     * An array of feature levels to query support for. When [IDMLDevice::CheckFeatureSupport](/windows/win32/api/directml/nf-directml-idmldevice-checkfeaturesupport) returns, the [DML_FEATURE_DATA_FEATURE_LEVELS](/windows/win32/api/directml/ns-directml-dml_feature_data_feature_levels) struct contains the highest feature level in this array that is supported by the device.
     * @type {Pointer<Integer>}
     */
    RequestedFeatureLevels {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
