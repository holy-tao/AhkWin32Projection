#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.SystemServices
 */
class ENLISTMENT_INFORMATION_CLASS extends Win32Enum {

    /**
     * Native name: EnlistmentBasicInformation
     * @type {Integer (Int32)}
     */
    static BasicInformation => 0

    /**
     * Native name: EnlistmentRecoveryInformation
     * @type {Integer (Int32)}
     */
    static RecoveryInformation => 1

    /**
     * Native name: EnlistmentCrmInformation
     * @type {Integer (Int32)}
     */
    static CrmInformation => 2
}
