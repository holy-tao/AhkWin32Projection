#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WHEA_XPF_PROCINFO {
    #StructPack 8


    struct _CheckInfo {
        CacheCheck : IntPtr

        static __New() {
            DefineProp(this.Prototype, 'TlbCheck', { type: IntPtr, offset: 0 })
            DefineProp(this.Prototype, 'BusCheck', { type: IntPtr, offset: 0 })
            DefineProp(this.Prototype, 'MsCheck', { type: IntPtr, offset: 0 })
            DefineProp(this.Prototype, 'AsULONGLONG', { type: Int64, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    CheckInfoId : Guid

    ValidBits : IntPtr

    CheckInfo : WHEA_XPF_PROCINFO._CheckInfo

    TargetId : Int64

    RequesterId : Int64

    ResponderId : Int64

    InstructionPointer : Int64

}
