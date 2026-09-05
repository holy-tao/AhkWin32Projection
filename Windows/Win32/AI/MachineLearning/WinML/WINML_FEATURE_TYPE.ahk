#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Specifies the different types of WinML features.
 * @see https://learn.microsoft.com/windows/win32/api/winml/ne-winml-winml_feature_type
 * @namespace Windows.Win32.AI.MachineLearning.WinML
 */
class WINML_FEATURE_TYPE extends Win32Enum {

    /**
     * Native name: WINML_FEATURE_UNDEFINED
     * @type {Integer (Int32)}
     */
    static UNDEFINED => 0

    /**
     * Native name: WINML_FEATURE_TENSOR
     * @type {Integer (Int32)}
     */
    static TENSOR => 1

    /**
     * Native name: WINML_FEATURE_SEQUENCE
     * @type {Integer (Int32)}
     */
    static SEQUENCE => 2

    /**
     * Native name: WINML_FEATURE_MAP
     * @type {Integer (Int32)}
     */
    static MAP => 3

    /**
     * Native name: WINML_FEATURE_IMAGE
     * @type {Integer (Int32)}
     */
    static IMAGE => 4
}
