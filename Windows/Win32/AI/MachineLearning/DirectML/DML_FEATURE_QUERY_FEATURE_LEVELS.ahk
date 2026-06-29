#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DML_FEATURE_LEVEL.ahk" { DML_FEATURE_LEVEL }

/**
 * Used to query a DirectML device for its support for one or more feature levels.
 * @remarks
 * This query is useful in combination with the *minimumFeatureLevel* parameter of [DMLCreateDevice1](/windows/win32/api/directml/nf-directml-dmlcreatedevice1). By supplying a minimum feature level to **DMLCreateDevice1**, you can be guaranteed a *lower* bound to the underlying DirectML device's feature level support.
 * 
 * Using this query, you can then also retrieve an *upper* bound for the feature levels supported by this DirectML device. This information can then be used to achieve graceful fallbacks in cases where particular features are unavailable.
 * @see https://learn.microsoft.com/windows/win32/api/directml/ns-directml-dml_feature_query_feature_levels
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 */
export default struct DML_FEATURE_QUERY_FEATURE_LEVELS {
    #StructPack 8

    /**
     * Type: **[UINT](/windows/desktop/WinProg/windows-data-types)**
     * 
     * The number of elements in the *RequestedFeatureLevels* array.
     */
    RequestedFeatureLevelCount : UInt32

    /**
     * Type: \_Field\_size\_(RequestedFeatureLevelCount) **[DML_FEATURE_LEVEL](/windows/win32/api/directml/ne-directml-dml_feature_level)\***
     * 
     * An array of feature levels to query support for. When [IDMLDevice::CheckFeatureSupport](/windows/win32/api/directml/nf-directml-idmldevice-checkfeaturesupport) returns, the [DML_FEATURE_DATA_FEATURE_LEVELS](/windows/win32/api/directml/ns-directml-dml_feature_data_feature_levels) struct contains the highest feature level in this array that is supported by the device.
     */
    RequestedFeatureLevels : DML_FEATURE_LEVEL.Ptr

}
