#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct PrintSchemaSelectionType {
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
    static PrintSchemaSelectionType_PickOne => 0

    /**
     * @type {Integer (Int32)}
     */
    static PrintSchemaSelectionType_PickMany => 1
}
