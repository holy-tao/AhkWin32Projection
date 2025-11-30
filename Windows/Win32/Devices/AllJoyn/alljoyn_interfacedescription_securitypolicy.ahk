#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.AllJoyn
 * @version v4.0.30319
 */
class alljoyn_interfacedescription_securitypolicy extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static AJ_IFC_SECURITY_INHERIT => 0

    /**
     * @type {Integer (Int32)}
     */
    static AJ_IFC_SECURITY_REQUIRED => 1

    /**
     * @type {Integer (Int32)}
     */
    static AJ_IFC_SECURITY_OFF => 2
}
