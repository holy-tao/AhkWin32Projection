#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the different types of WinML bindings.
 * @see https://learn.microsoft.com/windows/win32/api/winml/ne-winml-winml_binding_type
 * @namespace Windows.Win32.AI.MachineLearning.WinML
 */
export default struct WINML_BINDING_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Binding type undefined.
     * @type {Integer (Int32)}
     */
    static WINML_BINDING_UNDEFINED => 0

    /**
     * Binding of type tensor.
     * @type {Integer (Int32)}
     */
    static WINML_BINDING_TENSOR => 1

    /**
     * Binding of type sequence.
     * @type {Integer (Int32)}
     */
    static WINML_BINDING_SEQUENCE => 2

    /**
     * Binding of type map.
     * @type {Integer (Int32)}
     */
    static WINML_BINDING_MAP => 3

    /**
     * Binding of type image.
     * @type {Integer (Int32)}
     */
    static WINML_BINDING_IMAGE => 4

    /**
     * Binding of type resource.
     * @type {Integer (Int32)}
     */
    static WINML_BINDING_RESOURCE => 5
}
