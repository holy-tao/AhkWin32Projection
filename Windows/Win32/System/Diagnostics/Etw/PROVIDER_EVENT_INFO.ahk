#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\EVENT_DESCRIPTOR.ahk" { EVENT_DESCRIPTOR }

/**
 * Defines an array of events in a provider manifest.
 * @see https://learn.microsoft.com/windows/win32/api/tdh/ns-tdh-provider_event_info
 * @namespace Windows.Win32.System.Diagnostics.Etw
 */
export default struct PROVIDER_EVENT_INFO {
    #StructPack 8

    /**
     * The number of elements in the <b>EventDescriptorsArray</b> array.
     */
    NumberOfEvents : UInt32

    /**
     * Reserved.
     */
    Reserved : UInt32

    /**
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/evntprov/ns-evntprov-event_descriptor">EVENT_DESCRIPTOR</a> structures that contain information about each event.
     */
    EventDescriptorsArray : EVENT_DESCRIPTOR[1]

}
