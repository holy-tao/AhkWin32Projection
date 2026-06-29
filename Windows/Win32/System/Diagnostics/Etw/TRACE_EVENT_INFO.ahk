#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PROPERTY_FLAGS.ahk" { PROPERTY_FLAGS }
#Import ".\EVENT_DESCRIPTOR.ahk" { EVENT_DESCRIPTOR }
#Import ".\EVENT_PROPERTY_INFO.ahk" { EVENT_PROPERTY_INFO }
#Import ".\DECODING_SOURCE.ahk" { DECODING_SOURCE }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\TEMPLATE_FLAGS.ahk" { TEMPLATE_FLAGS }

/**
 * Defines the information about the event.
 * @remarks
 * The value of an offset is zero if the member is not defined.
 * @see https://learn.microsoft.com/windows/win32/api/tdh/ns-tdh-trace_event_info
 * @namespace Windows.Win32.System.Diagnostics.Etw
 */
export default struct TRACE_EVENT_INFO {
    #StructPack 8

    /**
     * A GUID that identifies the provider.
     */
    ProviderGuid : Guid

    /**
     * A GUID that identifies the MOF class that contains the event. If the provider uses a manifest to define its events, this member is GUID_NULL.
     */
    EventGuid : Guid

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/evntprov/ns-evntprov-event_descriptor">EVENT_DESCRIPTOR</a> structure that describes the event.
     */
    EventDescriptor : EVENT_DESCRIPTOR

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/tdh/ne-tdh-decoding_source">DECODING_SOURCE</a> enumeration value that identifies the source used to parse the event's data (for example, an instrumentation manifest of WMI MOF class).
     */
    DecodingSource : DECODING_SOURCE

    /**
     * The offset from the beginning of this structure to a null-terminated Unicode string that contains the name of the provider.
     */
    ProviderNameOffset : UInt32

    /**
     * The offset from the beginning of this structure to a null-terminated Unicode string that contains the name of the level. For possible names, see Remarks in <a href="https://docs.microsoft.com/windows/desktop/WES/eventmanifestschema-leveltype-complextype">LevelType</a>.
     */
    LevelNameOffset : UInt32

    /**
     * The offset from the beginning of this structure to a null-terminated Unicode string that contains the name of the channel. For possible names, see Remarks in <a href="https://docs.microsoft.com/windows/desktop/WES/eventmanifestschema-channeltype-complextype">ChannelType</a>.
     */
    ChannelNameOffset : UInt32

    /**
     * The offset from the beginning of this structure to a list of null-terminated Unicode strings that contains the names of the keywords. The list is terminated with two NULL characters. For possible names, see Remarks in <a href="https://docs.microsoft.com/windows/desktop/WES/eventmanifestschema-keywordtype-complextype">KeywordType</a>.
     */
    KeywordsNameOffset : UInt32

    /**
     * The offset from the beginning of this structure to a null-terminated Unicode string that contains the name of the task. For possible names, see Remarks in <a href="https://docs.microsoft.com/windows/desktop/WES/eventmanifestschema-tasktype-complextype">TaskType</a>.
     */
    TaskNameOffset : UInt32

    /**
     * The offset from the beginning of this structure to a null-terminated Unicode string that contains the name of the operation. For possible names, see Remarks in <a href="https://docs.microsoft.com/windows/desktop/WES/eventmanifestschema-opcodetype-complextype">OpcodeType</a>.
     */
    OpcodeNameOffset : UInt32

    /**
     * The offset from the beginning of this structure to a null-terminated Unicode string that contains the event message string.  The offset is zero if there is no message string. For information on message strings, see the <b>message</b> attribute for <a href="https://docs.microsoft.com/windows/desktop/WES/eventmanifestschema-eventdefinitiontype-complextype">EventDefinitionType</a>.
     * 
     * The message string can contain insert sequences, for example, Unable to connect to the %1 printer. The number of the insert sequence identifies the property in the event data to use for the substitution.
     */
    EventMessageOffset : UInt32

    /**
     * The offset from the beginning of this structure to a null-terminated Unicode string that contains the localized provider name.
     */
    ProviderMessageOffset : UInt32

    /**
     * Reserved.
     */
    BinaryXMLOffset : UInt32

    /**
     * Reserved.
     */
    BinaryXMLSize : UInt32

    EventNameOffset : UInt32

    EventAttributesOffset : UInt32

    /**
     * The number of elements in the <b>EventPropertyInfoArray</b> array.
     */
    PropertyCount : UInt32

    /**
     * The number of properties in the <b>EventPropertyInfoArray</b> array that are top-level properties. This number does not include members of structures. Top-level properties come before all member properties in the array.
     */
    TopLevelPropertyCount : UInt32

    Flags : TEMPLATE_FLAGS


    /**
     * @type {Integer}
     */
    Tags {
        get => (this._bitfield >> 4) & 0xFFFFFFF
        set => this._bitfield := ((value & 0xFFFFFFF) << 4) | (this._bitfield & ~(0xFFFFFFF << 4))
    }
    /**
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/tdh/ns-tdh-event_property_info">EVENT_PROPERTY_INFO</a> structures that provides information about each property of the event's user data.
     */
    EventPropertyInfoArray : EVENT_PROPERTY_INFO[1]

    static __New() {
        DefineProp(this.Prototype, 'ActivityIDNameOffset', { type: UInt32, offset: 92 })
        DefineProp(this.Prototype, 'RelatedActivityIDNameOffset', { type: UInt32, offset: 96 })
        DefineProp(this.Prototype, '_bitfield', { type: Int32, offset: 108 })
        this.DeleteProp("__New")
    }
}
