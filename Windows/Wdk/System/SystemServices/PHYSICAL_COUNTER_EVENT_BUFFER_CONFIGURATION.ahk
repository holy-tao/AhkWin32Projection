#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PHYSICAL_COUNTER_EVENT_BUFFER_CONFIGURATION {
    #StructPack 8

    OverflowHandler : IntPtr

    CustomEventBufferEntrySize : UInt32

    EventThreshold : UInt32

}
