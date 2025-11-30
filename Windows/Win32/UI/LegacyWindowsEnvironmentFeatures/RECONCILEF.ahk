#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.LegacyWindowsEnvironmentFeatures
 * @version v4.0.30319
 */
class RECONCILEF extends Win32Enum{

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
