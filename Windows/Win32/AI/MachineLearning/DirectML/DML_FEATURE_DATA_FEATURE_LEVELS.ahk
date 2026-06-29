#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DML_FEATURE_LEVEL.ahk" { DML_FEATURE_LEVEL }

/**
 * Provides detail about the feature levels supported by a DirectML device.
 * @see https://learn.microsoft.com/windows/win32/api/directml/ns-directml-dml_feature_data_feature_levels
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 */
export default struct DML_FEATURE_DATA_FEATURE_LEVELS {
    #StructPack 4

    /**
     * Type: **[DML_FEATURE_LEVEL](/windows/win32/api/directml/ne-directml-dml_feature_level)**
     * 
     * The highest feature level supplied in the query structure's *RequestedFeatureLevels* (see [DML_FEATURE_DATA_FEATURE_LEVELS](/windows/win32/api/directml/ns-directml-dml_feature_data_feature_levels)) that is supported by this device.
     * 
     * > [!NOTE]
     * > Because this feature query only ever returns one of the values supplied in *RequestedFeatureLevels*, it's possible that the device supports an even higher feature level than the one returned by this query.
     * 
     * For example, DirectML version `1.4.0` supports a feature level of `DML_FEATURE_LEVEL_3_0`. If the *RequestedFeatureLevels* array contained only `DML_FEATURE_LEVEL_1_0` and `DML_FEATURE_LEVEL_2_0`, then this query would return `DML_FEATURE_LEVEL_2_0`, which is lower than the true feature level (3_0) supported by the device.
     */
    MaxSupportedFeatureLevel : DML_FEATURE_LEVEL

}
