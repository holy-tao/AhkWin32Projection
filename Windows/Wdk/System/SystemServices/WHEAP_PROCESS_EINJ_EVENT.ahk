#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\Foundation\BOOLEAN.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class WHEAP_PROCESS_EINJ_EVENT extends Win32Struct {
    static sizeof => 88

    static packingSize => 8

    /**
     * @type {Pointer}
     */
    WheaEventLogEntry {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {String}
     */
    Error {
        get => StrGet(this.ptr + 8, 31, "UTF-8")
        set => StrPut(value, this.ptr + 8, 31, "UTF-8")
    }

    /**
     * @type {BOOLEAN}
     */
    InjectionActionTableValid {
        get => NumGet(this, 40, "char")
        set => NumPut("char", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    BeginInjectionInstructionCount {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * @type {Integer}
     */
    GetTriggerErrorActionTableInstructionCount {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    SetErrorTypeInstructionCount {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * @type {Integer}
     */
    GetErrorTypeInstructionCount {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * @type {Integer}
     */
    EndOperationInstructionCount {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * @type {Integer}
     */
    ExecuteOperationInstructionCount {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * @type {Integer}
     */
    CheckBusyStatusInstructionCount {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }

    /**
     * @type {Integer}
     */
    GetCommandStatusInstructionCount {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * @type {Integer}
     */
    SetErrorTypeWithAddressInstructionCount {
        get => NumGet(this, 76, "uint")
        set => NumPut("uint", value, this, 76)
    }

    /**
     * @type {Integer}
     */
    GetExecuteOperationTimingsInstructionCount {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }
}
