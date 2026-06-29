#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PESILO.ahk" { PESILO }
#Import ".\TXN_PARAMETER_BLOCK.ahk" { TXN_PARAMETER_BLOCK }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct IO_DRIVER_CREATE_CONTEXT {
    #StructPack 8

    Size : Int16

    ExtraCreateParameter : IntPtr

    DeviceObjectHint : IntPtr

    TxnParameters : TXN_PARAMETER_BLOCK.Ptr

    SiloContext : PESILO

}
