#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class DBGKD_MAJOR_TYPES extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DBGKD_MAJOR_NT => 0

    /**
     * @type {Integer (Int32)}
     */
    static DBGKD_MAJOR_XBOX => 1

    /**
     * @type {Integer (Int32)}
     */
    static DBGKD_MAJOR_BIG => 2

    /**
     * @type {Integer (Int32)}
     */
    static DBGKD_MAJOR_EXDI => 3

    /**
     * @type {Integer (Int32)}
     */
    static DBGKD_MAJOR_NTBD => 4

    /**
     * @type {Integer (Int32)}
     */
    static DBGKD_MAJOR_EFI => 5

    /**
     * @type {Integer (Int32)}
     */
    static DBGKD_MAJOR_TNT => 6

    /**
     * @type {Integer (Int32)}
     */
    static DBGKD_MAJOR_SINGULARITY => 7

    /**
     * @type {Integer (Int32)}
     */
    static DBGKD_MAJOR_HYPERVISOR => 8

    /**
     * @type {Integer (Int32)}
     */
    static DBGKD_MAJOR_MIDORI => 9

    /**
     * @type {Integer (Int32)}
     */
    static DBGKD_MAJOR_CE => 10

    /**
     * @type {Integer (Int32)}
     */
    static DBGKD_MAJOR_COUNT => 11
}
