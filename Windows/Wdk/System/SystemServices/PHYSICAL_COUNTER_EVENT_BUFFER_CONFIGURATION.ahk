#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PPHYSICAL_COUNTER_EVENT_BUFFER_OVERFLOW_HANDLER.ahk" { PPHYSICAL_COUNTER_EVENT_BUFFER_OVERFLOW_HANDLER }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PHYSICAL_COUNTER_EVENT_BUFFER_CONFIGURATION {
    #StructPack 8

    OverflowHandler : PPHYSICAL_COUNTER_EVENT_BUFFER_OVERFLOW_HANDLER

    CustomEventBufferEntrySize : UInt32

    EventThreshold : UInt32

}
