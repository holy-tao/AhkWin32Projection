#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import "..\..\..\Win32\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WHEAP_PROCESS_EINJ_EVENT {
    #StructPack 8

    WheaEventLogEntry : IntPtr

    Error : CHAR[32]

    InjectionActionTableValid : BOOLEAN

    BeginInjectionInstructionCount : UInt32

    GetTriggerErrorActionTableInstructionCount : UInt32

    SetErrorTypeInstructionCount : UInt32

    GetErrorTypeInstructionCount : UInt32

    EndOperationInstructionCount : UInt32

    ExecuteOperationInstructionCount : UInt32

    CheckBusyStatusInstructionCount : UInt32

    GetCommandStatusInstructionCount : UInt32

    SetErrorTypeWithAddressInstructionCount : UInt32

    GetExecuteOperationTimingsInstructionCount : UInt32

}
