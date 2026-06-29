#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct UIA_LANDMARKTYPE_ID {
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
    static UIA_CustomLandmarkTypeId => 80000

    /**
     * @type {Integer (Int32)}
     */
    static UIA_FormLandmarkTypeId => 80001

    /**
     * @type {Integer (Int32)}
     */
    static UIA_MainLandmarkTypeId => 80002

    /**
     * @type {Integer (Int32)}
     */
    static UIA_NavigationLandmarkTypeId => 80003

    /**
     * @type {Integer (Int32)}
     */
    static UIA_SearchLandmarkTypeId => 80004
}
