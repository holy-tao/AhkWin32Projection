#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ole
 */
export default struct ENUM_CONTROLS_WHICH_FLAGS {
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
    static GCW_WCH_SIBLING => 1

    /**
     * @type {Integer (UInt32)}
     */
    static GC_WCH_CONTAINER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static GC_WCH_CONTAINED => 3

    /**
     * @type {Integer (UInt32)}
     */
    static GC_WCH_ALL => 4

    /**
     * @type {Integer (UInt32)}
     */
    static GC_WCH_FREVERSEDIR => 134217728

    /**
     * @type {Integer (UInt32)}
     */
    static GC_WCH_FONLYAFTER => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static GC_WCH_FONLYBEFORE => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static GC_WCH_FSELECTED => 1073741824
}
