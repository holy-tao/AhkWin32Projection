#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.LegacyWindowsEnvironmentFeatures
 */
export default struct RECONCILEF {
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
    static RECONCILEF_MAYBOTHERUSER => 1

    /**
     * @type {Integer (Int32)}
     */
    static RECONCILEF_FEEDBACKWINDOWVALID => 2

    /**
     * @type {Integer (Int32)}
     */
    static RECONCILEF_NORESIDUESOK => 4

    /**
     * @type {Integer (Int32)}
     */
    static RECONCILEF_OMITSELFRESIDUE => 8

    /**
     * @type {Integer (Int32)}
     */
    static RECONCILEF_RESUMERECONCILIATION => 16

    /**
     * @type {Integer (Int32)}
     */
    static RECONCILEF_YOUMAYDOTHEUPDATES => 32

    /**
     * @type {Integer (Int32)}
     */
    static RECONCILEF_ONLYYOUWERECHANGED => 64

    /**
     * @type {Integer (Int32)}
     */
    static ALL_RECONCILE_FLAGS => 127
}
