#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PKINTERRUPT.ahk" { PKINTERRUPT }
#Import ".\KINTERRUPT_POLARITY.ahk" { KINTERRUPT_POLARITY }
#Import ".\KINTERRUPT_MODE.ahk" { KINTERRUPT_MODE }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct IO_INTERRUPT_MESSAGE_INFO_ENTRY {
    #StructPack 8

    MessageAddress : Int64

    TargetProcessorSet : IntPtr

    InterruptObject : PKINTERRUPT

    MessageData : UInt32

    Vector : UInt32

    Irql : Int8

    Mode : KINTERRUPT_MODE

    Polarity : KINTERRUPT_POLARITY

}
