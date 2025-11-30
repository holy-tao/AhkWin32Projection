#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.SystemServices
 * @version v4.0.30319
 */
class ENLISTMENT_INFORMATION_CLASS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static EnlistmentBasicInformation => 0

    /**
     * @type {Integer (Int32)}
     */
    static EnlistmentRecoveryInformation => 1

    /**
     * @type {Integer (Int32)}
     */
    static EnlistmentCrmInformation => 2
}
