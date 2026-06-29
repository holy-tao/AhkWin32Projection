#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines a set of optional features and capabilities that can be queried from the DirectML device.
 * @see https://learn.microsoft.com/windows/win32/api/directml/ne-directml-dml_feature
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 */
export default struct DML_FEATURE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Allows querying for tensor data type support. The query type is [DML_FEATURE_QUERY_TENSOR_DATA_TYPE_SUPPORT](/windows/win32/api/directml/ns-directml-dml_feature_query_tensor_data_type_support), and the support data type is [DML_FEATURE_DATA_TENSOR_DATA_TYPE_SUPPORT](/windows/win32/api/directml/ns-directml-dml_feature_data_tensor_data_type_support).
     * @type {Integer (Int32)}
     */
    static DML_FEATURE_TENSOR_DATA_TYPE_SUPPORT => 0

    /**
     * Allows querying for the feature levels supported by the device. The query type is [DML_FEATURE_QUERY_FEATURE_LEVELS](/windows/win32/api/directml/ns-directml-dml_feature_query_feature_levels), and the support data type is [DML_FEATURE_DATA_FEATURE_LEVELS](/windows/win32/api/directml/ns-directml-dml_feature_data_feature_levels).
     * @type {Integer (Int32)}
     */
    static DML_FEATURE_FEATURE_LEVELS => 1
}
