#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the different types of WinML features.
 * @see https://docs.microsoft.com/windows/win32/api//winml/ne-winml-winml_feature_type
 * @namespace Windows.Win32.AI.MachineLearning.WinML
 * @version v4.0.30319
 */
class WINML_FEATURE_TYPE{

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WINML_FEATURE_UNDEFINED => 0

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WINML_FEATURE_TENSOR => 1

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WINML_FEATURE_SEQUENCE => 2

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WINML_FEATURE_MAP => 3

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WINML_FEATURE_IMAGE => 4
}
