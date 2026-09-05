#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.LegacyWindowsEnvironmentFeatures
 */
class RECONCILEF extends Win32Enum {

    /**
     * Native name: RECONCILEF_MAYBOTHERUSER
     * @type {Integer (Int32)}
     */
    static MAYBOTHERUSER => 1

    /**
     * Native name: RECONCILEF_FEEDBACKWINDOWVALID
     * @type {Integer (Int32)}
     */
    static FEEDBACKWINDOWVALID => 2

    /**
     * Native name: RECONCILEF_NORESIDUESOK
     * @type {Integer (Int32)}
     */
    static NORESIDUESOK => 4

    /**
     * Native name: RECONCILEF_OMITSELFRESIDUE
     * @type {Integer (Int32)}
     */
    static OMITSELFRESIDUE => 8

    /**
     * Native name: RECONCILEF_RESUMERECONCILIATION
     * @type {Integer (Int32)}
     */
    static RESUMERECONCILIATION => 16

    /**
     * Native name: RECONCILEF_YOUMAYDOTHEUPDATES
     * @type {Integer (Int32)}
     */
    static YOUMAYDOTHEUPDATES => 32

    /**
     * Native name: RECONCILEF_ONLYYOUWERECHANGED
     * @type {Integer (Int32)}
     */
    static ONLYYOUWERECHANGED => 64

    /**
     * @type {Integer (Int32)}
     */
    static ALL_RECONCILE_FLAGS => 127
}
