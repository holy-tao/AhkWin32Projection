#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\WHEA_RECOVERY_CONTEXT_ERROR_TYPE.ahk" { WHEA_RECOVERY_CONTEXT_ERROR_TYPE }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WHEA_RECOVERY_CONTEXT {
    #StructPack 8


    struct _MemoryError {
        Address : IntPtr

        Consumed : BOOLEAN

        ErrorCode : UInt16

        ErrorIpValid : BOOLEAN

        RestartIpValid : BOOLEAN

        ClearPoison : BOOLEAN

    }

    struct _PmemError {
        PmemErrInfo : IntPtr

    }

    MemoryError : WHEA_RECOVERY_CONTEXT._MemoryError

    PartitionId : Int64

    VpIndex : UInt32

    ErrorType : WHEA_RECOVERY_CONTEXT_ERROR_TYPE

    static __New() {
        DefineProp(this.Prototype, 'PmemError', { type: WHEA_RECOVERY_CONTEXT._PmemError, offset: 0 })
        this.DeleteProp("__New")
    }
}
