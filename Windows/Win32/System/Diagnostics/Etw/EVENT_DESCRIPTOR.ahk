#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Contains metadata that defines the event.
 * @remarks
 * This structure represents an event defined in the manifest. You do not declare and populate this structure, instead you use the <a href="https://docs.microsoft.com/windows/desktop/WES/message-compiler--mc-exe-">Message Compiler (MC.exe)</a> to generate a header file that declares and populates this structure for each event in the manifest. For details on writing the manifest and generating the header file, see <a href="https://docs.microsoft.com/windows/desktop/WES/writing-an-instrumentation-manifest">Writing an Instrumentation Manifest</a> and <a href="https://docs.microsoft.com/windows/desktop/WES/compiling-an-instrumentation-manifest">Compiling an Instrumentation Manifest</a>.
 * 
 * For details on the members of this structure, see the attributes of the <a href="https://docs.microsoft.com/windows/desktop/WES/eventmanifestschema-eventdefinitiontype-complextype">EventDefinitionType</a> complex type. 
 * 
 *  You specify this structure when calling <a href="https://docs.microsoft.com/windows/desktop/api/evntprov/nf-evntprov-eventwrite">EventWrite</a> or <a href="https://docs.microsoft.com/windows/desktop/api/evntprov/nf-evntprov-eventwritetransfer">EventWriteTransfer</a> to write the event. You can also use it when calling <a href="https://docs.microsoft.com/windows/desktop/api/evntprov/nf-evntprov-eventenabled">EventEnabled</a> to determine if you should write the event.
 * 
 * This structure is also included in the <a href="https://docs.microsoft.com/windows/desktop/api/evntcons/ns-evntcons-event_header">EVENT_HEADER</a> structure that is returned with the event record when you consume events using the <a href="https://docs.microsoft.com/windows/desktop/ETW/eventrecordcallback">EventRecordCallback</a> callback. For MOF-defined events, the <b>Opcode</b> member contains the event type value. The <b>Version</b> and <b>Level</b> members contain the expected information.
 * @see https://learn.microsoft.com/windows/win32/api//content/relogger/ns-relogger-event_descriptor
 * @namespace Windows.Win32.System.Diagnostics.Etw
 * @version v4.0.30319
 */
class EVENT_DESCRIPTOR extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The event identifier.
     * @type {Integer}
     */
    Id {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * The version of the event. The version indicates a revision to the event definition. You can use this member and the Id member to uniquely identify the event within the scope of a provider.
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 2, "char")
        set => NumPut("char", value, this, 2)
    }

    /**
     * The audience for the event (for example, administrator or developer).
     * @type {Integer}
     */
    Channel {
        get => NumGet(this, 3, "char")
        set => NumPut("char", value, this, 3)
    }

    /**
     * The severity or level of detail included in the event (for example, informational or fatal).
     * @type {Integer}
     */
    Level {
        get => NumGet(this, 4, "char")
        set => NumPut("char", value, this, 4)
    }

    /**
     * A step in a sequence of operations being performed within the Task.
     * @type {Integer}
     */
    Opcode {
        get => NumGet(this, 5, "char")
        set => NumPut("char", value, this, 5)
    }

    /**
     * A larger unit of work within an application or component (is broader than the Opcode).
     * @type {Integer}
     */
    Task {
        get => NumGet(this, 6, "ushort")
        set => NumPut("ushort", value, this, 6)
    }

    /**
     * A bitmask that specifies a logical group of related events. Each bit corresponds to one group. An event may belong to one or more groups. The keyword can contain one or more provider-defined keywords, standard keywords, or both.
     * @type {Integer}
     */
    Keyword {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
