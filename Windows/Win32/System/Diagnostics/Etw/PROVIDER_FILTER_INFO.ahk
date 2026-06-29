#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PROPERTY_FLAGS.ahk" { PROPERTY_FLAGS }
#Import ".\EVENT_PROPERTY_INFO.ahk" { EVENT_PROPERTY_INFO }

/**
 * Defines a filter and its data.
 * @see https://learn.microsoft.com/windows/win32/api/tdh/ns-tdh-provider_filter_info
 * @namespace Windows.Win32.System.Diagnostics.Etw
 */
export default struct PROVIDER_FILTER_INFO {
    #StructPack 4

    /**
     * The filter identifier that identifies the filter in the manifest. This is the same value as the <b>value</b> attribute of the <a href="https://docs.microsoft.com/windows/desktop/WES/eventmanifestschema-filtertype-complextype">FilterType</a> complex type.
     */
    Id : Int8

    /**
     * The version number that identifies the version of the filter definition in the manifest. This is the same value as the <b>version</b> attribute of the <a href="https://docs.microsoft.com/windows/desktop/WES/eventmanifestschema-filtertype-complextype">FilterType</a> complex type.
     */
    Version : Int8

    /**
     * Offset from the beginning of this structure to the message string that describes the filter. This is the same value as the <b>message</b> attribute of the <a href="https://docs.microsoft.com/windows/desktop/WES/eventmanifestschema-filtertype-complextype">FilterType</a> complex type.
     */
    MessageOffset : UInt32

    /**
     * Reserved.
     */
    Reserved : UInt32

    /**
     * The number of elements in the <i>EventPropertyInfoArray</i> array.
     */
    PropertyCount : UInt32

    /**
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/tdh/ns-tdh-event_property_info">EVENT_PROPERTY_INFO</a> structures that define the filter data.
     */
    EventPropertyInfoArray : EVENT_PROPERTY_INFO[1]

}
