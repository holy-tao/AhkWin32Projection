#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct IO_INTERRUPT_MESSAGE_INFO {
    #StructPack 8

    UnifiedIrql : Int8

    MessageCount : UInt32

    MessageInfo : IntPtr[1]

}
