#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\EVENT_DESCRIPTOR.ahk
#Include .\EVENT_PROPERTY_INFO.ahk

/**
 * Defines the information about the event.
 * @remarks
 * The value of an offset is zero if the member is not defined.
 * @see https://learn.microsoft.com/windows/win32/api/tdh/ns-tdh-trace_event_info
 * @namespace Windows.Win32.System.Diagnostics.Etw
 * @version v4.0.30319
 */
class TRACE_EVENT_INFO extends Win32Struct
{
    static sizeof => 104

    static packingSize => 8

    /**
     * A GUID that identifies the provider.
     * @type {Pointer<Guid>}
     */
    ProviderGuid {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * A GUID that identifies the MOF class that contains the event. If the provider uses a manifest to define its events, this member is GUID_NULL.
     * @type {Pointer<Guid>}
     */
    EventGuid {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/evntprov/ns-evntprov-event_descriptor">EVENT_DESCRIPTOR</a> structure that describes the event.
     * @type {EVENT_DESCRIPTOR}
     */
    EventDescriptor{
        get {
            if(!this.HasProp("__EventDescriptor"))
                this.__EventDescriptor := EVENT_DESCRIPTOR(this.ptr + 16)
            return this.__EventDescriptor
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/tdh/ne-tdh-decoding_source">DECODING_SOURCE</a> enumeration value that identifies the source used to parse the event's data (for example, an instrumentation manifest of WMI MOF class).
     * @type {Integer}
     */
    DecodingSource {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }

    /**
     * The offset from the beginning of this structure to a null-terminated Unicode string that contains the name of the provider.
     * @type {Integer}
     */
    ProviderNameOffset {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * The offset from the beginning of this structure to a null-terminated Unicode string that contains the name of the level. For possible names, see Remarks in <a href="https://docs.microsoft.com/windows/desktop/WES/eventmanifestschema-leveltype-complextype">LevelType</a>.
     * @type {Integer}
     */
    LevelNameOffset {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * The offset from the beginning of this structure to a null-terminated Unicode string that contains the name of the channel. For possible names, see Remarks in <a href="https://docs.microsoft.com/windows/desktop/WES/eventmanifestschema-channeltype-complextype">ChannelType</a>.
     * @type {Integer}
     */
    ChannelNameOffset {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * The offset from the beginning of this structure to a list of null-terminated Unicode strings that contains the names of the keywords. The list is terminated with two NULL characters. For possible names, see Remarks in <a href="https://docs.microsoft.com/windows/desktop/WES/eventmanifestschema-keywordtype-complextype">KeywordType</a>.
     * @type {Integer}
     */
    KeywordsNameOffset {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * The offset from the beginning of this structure to a null-terminated Unicode string that contains the name of the task. For possible names, see Remarks in <a href="https://docs.microsoft.com/windows/desktop/WES/eventmanifestschema-tasktype-complextype">TaskType</a>.
     * @type {Integer}
     */
    TaskNameOffset {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * The offset from the beginning of this structure to a null-terminated Unicode string that contains the name of the operation. For possible names, see Remarks in <a href="https://docs.microsoft.com/windows/desktop/WES/eventmanifestschema-opcodetype-complextype">OpcodeType</a>.
     * @type {Integer}
     */
    OpcodeNameOffset {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * The offset from the beginning of this structure to a null-terminated Unicode string that contains the event message string.  The offset is zero if there is no message string. For information on message strings, see the <b>message</b> attribute for <a href="https://docs.microsoft.com/windows/desktop/WES/eventmanifestschema-eventdefinitiontype-complextype">EventDefinitionType</a>.
     * 
     * The message string can contain insert sequences, for example, Unable to connect to the %1 printer. The number of the insert sequence identifies the property in the event data to use for the substitution.
     * @type {Integer}
     */
    EventMessageOffset {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * The offset from the beginning of this structure to a null-terminated Unicode string that contains the localized provider name.
     * @type {Integer}
     */
    ProviderMessageOffset {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * Reserved.
     * @type {Integer}
     */
    BinaryXMLOffset {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }

    /**
     * Reserved.
     * @type {Integer}
     */
    BinaryXMLSize {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * @type {Integer}
     */
    EventNameOffset {
        get => NumGet(this, 76, "uint")
        set => NumPut("uint", value, this, 76)
    }

    /**
     * @type {Integer}
     */
    ActivityIDNameOffset {
        get => NumGet(this, 76, "uint")
        set => NumPut("uint", value, this, 76)
    }

    /**
     * @type {Integer}
     */
    EventAttributesOffset {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * @type {Integer}
     */
    RelatedActivityIDNameOffset {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * The number of elements in the <b>EventPropertyInfoArray</b> array.
     * @type {Integer}
     */
    PropertyCount {
        get => NumGet(this, 84, "uint")
        set => NumPut("uint", value, this, 84)
    }

    /**
     * The number of properties in the <b>EventPropertyInfoArray</b> array that are top-level properties. This number does not include members of structures. Top-level properties come before all member properties in the array.
     * @type {Integer}
     */
    TopLevelPropertyCount {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 92, "int")
        set => NumPut("int", value, this, 92)
    }

    /**
     * @type {Integer}
     */
    Anonymous {
        get => NumGet(this, 92, "uint")
        set => NumPut("uint", value, this, 92)
    }

    /**
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/tdh/ns-tdh-event_property_info">EVENT_PROPERTY_INFO</a> structures that provides information about each property of the event's user data.
     * @type {Array<EVENT_PROPERTY_INFO>}
     */
    EventPropertyInfoArray{
        get {
            if(!this.HasProp("__EventPropertyInfoArrayProxyArray"))
                this.__EventPropertyInfoArrayProxyArray := Win32FixedArray(this.ptr + 96, 8, EVENT_PROPERTY_INFO, "")
            return this.__EventPropertyInfoArrayProxyArray
        }
    }
}
