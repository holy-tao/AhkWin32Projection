#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Specifies the different types of WinML bindings.
 * @see https://learn.microsoft.com/windows/win32/api/winml/ne-winml-winml_binding_type
 * @namespace Windows.Win32.AI.MachineLearning.WinML
 */
class WINML_BINDING_TYPE extends Win32Enum {

    /**
     * Binding type undefined.
     * Native name: WINML_BINDING_UNDEFINED
     * @type {Integer (Int32)}
     */
    static UNDEFINED => 0

    /**
     * Binding of type tensor.
     * Native name: WINML_BINDING_TENSOR
     * @type {Integer (Int32)}
     */
    static TENSOR => 1

    /**
     * Binding of type sequence.
     * Native name: WINML_BINDING_SEQUENCE
     * @type {Integer (Int32)}
     */
    static SEQUENCE => 2

    /**
     * Binding of type map.
     * Native name: WINML_BINDING_MAP
     * @type {Integer (Int32)}
     */
    static MAP => 3

    /**
     * Binding of type image.
     * Native name: WINML_BINDING_IMAGE
     * @type {Integer (Int32)}
     */
    static IMAGE => 4

    /**
     * Binding of type resource.
     * Native name: WINML_BINDING_RESOURCE
     * @type {Integer (Int32)}
     */
    static RESOURCE => 5
}
