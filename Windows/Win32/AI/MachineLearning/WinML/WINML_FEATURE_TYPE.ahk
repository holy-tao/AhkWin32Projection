#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the different types of WinML features.
 * @see https://learn.microsoft.com/windows/win32/api/winml/ne-winml-winml_feature_type
 * @namespace Windows.Win32.AI.MachineLearning.WinML
 */
export default struct WINML_FEATURE_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Int32)}
     */
    static WINML_FEATURE_UNDEFINED => 0

    /**
     * @type {Integer (Int32)}
     */
    static WINML_FEATURE_TENSOR => 1

    /**
     * @type {Integer (Int32)}
     */
    static WINML_FEATURE_SEQUENCE => 2

    /**
     * @type {Integer (Int32)}
     */
    static WINML_FEATURE_MAP => 3

    /**
     * @type {Integer (Int32)}
     */
    static WINML_FEATURE_IMAGE => 4
}
