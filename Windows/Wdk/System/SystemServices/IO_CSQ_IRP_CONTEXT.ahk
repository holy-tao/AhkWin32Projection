#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IO_CSQ.ahk" { IO_CSQ }
#Import "..\..\Foundation\IRP.ahk" { IRP }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct IO_CSQ_IRP_CONTEXT {
    #StructPack 8

    Type : UInt32

    Irp : IRP.Ptr

    Csq : IO_CSQ.Ptr

}
