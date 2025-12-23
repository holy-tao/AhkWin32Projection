#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class ApplicationTypeType extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static SCTE28_ConditionalAccess => 0

    /**
     * @type {Integer (Int32)}
     */
    static SCTE28_POD_Host_Binding_Information => 1

    /**
     * @type {Integer (Int32)}
     */
    static SCTE28_IPService => 2

    /**
     * @type {Integer (Int32)}
     */
    static SCTE28_NetworkInterface_SCTE55_2 => 3

    /**
     * @type {Integer (Int32)}
     */
    static SCTE28_NetworkInterface_SCTE55_1 => 4

    /**
     * @type {Integer (Int32)}
     */
    static SCTE28_CopyProtection => 5

    /**
     * @type {Integer (Int32)}
     */
    static SCTE28_Diagnostic => 6

    /**
     * @type {Integer (Int32)}
     */
    static SCTE28_Undesignated => 7

    /**
     * @type {Integer (Int32)}
     */
    static SCTE28_Reserved => 8
}
