#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.RemoteManagement
 */
export default struct WSManEnumFlags {
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
    static WSManFlagNonXmlText => 1

    /**
     * @type {Integer (Int32)}
     */
    static WSManFlagReturnObject => 0

    /**
     * @type {Integer (Int32)}
     */
    static WSManFlagReturnEPR => 2

    /**
     * @type {Integer (Int32)}
     */
    static WSManFlagReturnObjectAndEPR => 4

    /**
     * @type {Integer (Int32)}
     */
    static WSManFlagHierarchyDeep => 0

    /**
     * @type {Integer (Int32)}
     */
    static WSManFlagHierarchyShallow => 32

    /**
     * @type {Integer (Int32)}
     */
    static WSManFlagHierarchyDeepBasePropsOnly => 64

    /**
     * @type {Integer (Int32)}
     */
    static WSManFlagAssociatedInstance => 0

    /**
     * @type {Integer (Int32)}
     */
    static WSManFlagAssociationInstance => 128
}
