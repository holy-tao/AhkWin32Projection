#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Controls.RichEdit
 */
export default struct RICH_EDIT_GET_OBJECT_FLAGS {
    value : UInt32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (UInt32)}
     */
    static REO_GETOBJ_POLEOBJ => 1

    /**
     * @type {Integer (UInt32)}
     */
    static REO_GETOBJ_PSTG => 2

    /**
     * @type {Integer (UInt32)}
     */
    static REO_GETOBJ_POLESITE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static REO_GETOBJ_NO_INTERFACES => 0

    /**
     * @type {Integer (UInt32)}
     */
    static REO_GETOBJ_ALL_INTERFACES => 7
}
