#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.TabletPC
 */
export default struct DISPID_InkExtendedProperties {
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
    static DISPID_IEPs_NewEnum => -4

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IEPsItem => 0

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IEPsCount => 1

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IEPsAdd => 2

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IEPsRemove => 3

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IEPsClear => 4

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_IEPsDoesPropertyExist => 5
}
