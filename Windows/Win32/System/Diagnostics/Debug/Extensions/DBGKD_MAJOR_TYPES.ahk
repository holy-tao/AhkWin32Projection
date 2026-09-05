#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
class DBGKD_MAJOR_TYPES extends Win32Enum {

    /**
     * Native name: DBGKD_MAJOR_NT
     * @type {Integer (Int32)}
     */
    static NT => 0

    /**
     * Native name: DBGKD_MAJOR_XBOX
     * @type {Integer (Int32)}
     */
    static XBOX => 1

    /**
     * Native name: DBGKD_MAJOR_BIG
     * @type {Integer (Int32)}
     */
    static BIG => 2

    /**
     * Native name: DBGKD_MAJOR_EXDI
     * @type {Integer (Int32)}
     */
    static EXDI => 3

    /**
     * Native name: DBGKD_MAJOR_NTBD
     * @type {Integer (Int32)}
     */
    static NTBD => 4

    /**
     * Native name: DBGKD_MAJOR_EFI
     * @type {Integer (Int32)}
     */
    static EFI => 5

    /**
     * Native name: DBGKD_MAJOR_TNT
     * @type {Integer (Int32)}
     */
    static TNT => 6

    /**
     * Native name: DBGKD_MAJOR_SINGULARITY
     * @type {Integer (Int32)}
     */
    static SINGULARITY => 7

    /**
     * Native name: DBGKD_MAJOR_HYPERVISOR
     * @type {Integer (Int32)}
     */
    static HYPERVISOR => 8

    /**
     * Native name: DBGKD_MAJOR_MIDORI
     * @type {Integer (Int32)}
     */
    static MIDORI => 9

    /**
     * Native name: DBGKD_MAJOR_CE
     * @type {Integer (Int32)}
     */
    static CE => 10

    /**
     * Native name: DBGKD_MAJOR_COUNT
     * @type {Integer (Int32)}
     */
    static COUNT => 11
}
