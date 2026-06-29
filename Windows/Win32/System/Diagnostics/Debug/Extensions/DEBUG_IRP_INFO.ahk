#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DEBUG_IRP_STACK_INFO.ahk" { DEBUG_IRP_STACK_INFO }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct DEBUG_IRP_INFO {
    #StructPack 8

    SizeOfStruct : UInt32

    IrpAddress : Int64

    IoStatus : UInt32

    StackCount : UInt32

    CurrentLocation : UInt32

    MdlAddress : Int64

    Thread : Int64

    CancelRoutine : Int64

    CurrentStack : DEBUG_IRP_STACK_INFO

    Stack : DEBUG_IRP_STACK_INFO[10]

}
