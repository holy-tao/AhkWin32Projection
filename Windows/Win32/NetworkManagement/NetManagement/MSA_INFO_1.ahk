#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\MSA_INFO_ACCOUNT_TYPE.ahk
#Include .\MSA_INFO_STATE.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
class MSA_INFO_1 extends Win32Struct {
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {MSA_INFO_STATE}
     */
    State {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {MSA_INFO_ACCOUNT_TYPE}
     */
    AccountType {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }
}
