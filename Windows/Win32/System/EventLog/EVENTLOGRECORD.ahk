#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about an event record returned by the ReadEventLog function.
 * @remarks
 * 
 * The defined members are followed by the replacement strings for the message identified by the event identifier, the binary information, some pad bytes to make sure the full entry is on a <b>DWORD</b> boundary, and finally the length of the log entry again. Because the strings and the binary information can be of any length, no structure members are defined to reference them. The declaration of this structure in Winnt.h describes these members as follows:
 * 
 * <pre class="syntax" xml:space="preserve"><code>    // WCHAR SourceName[]
 *     // WCHAR Computername[]
 *     // SID   UserSid
 *     // WCHAR Strings[]
 *     // BYTE  Data[]
 *     // CHAR  Pad[]
 *     // DWORD Length;</code></pre>
 * The source name is a variable-length string that specifies the name of the event source. The computer name is the name of the computer that generated the event. It may be followed with some padding bytes so that the user SID is aligned on a <b>DWORD</b> boundary. The user SID identifies the active user at the time this event was logged. If <b>UserSidLength</b> is zero, this field may be empty.
 * 
 * The event identifier together with source name and a language identifier identify a string that describes the event in more detail. The strings are used as replacement strings and are merged into the message string to make a complete message. The message strings are contained in a message file specified in the source entry in the registry. To obtain the appropriate message string from the message file, load the message file with the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibrarya">LoadLibrary</a> function and use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function.
 * 
 * The binary information is information that is specific to the event. It could be the contents of the processor registers when a device driver got an error, a dump of an invalid packet that was received from the network, a dump of all the structures in a program (when the data area was detected to be corrupt), and so on. This information should be useful to the writer of the device driver or the application in tracking down bugs or unauthorized breaks into the application.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//winnt/ns-winnt-eventlogrecord
 * @namespace Windows.Win32.System.EventLog
 * @version v4.0.30319
 */
class EVENTLOGRECORD extends Win32Struct
{
    static sizeof => 56

    static packingSize => 4

    /**
     * The size of this event record, in bytes. Note that this value is stored at both ends of the entry to ease moving forward or backward through the log. The length includes any pad bytes inserted at the end of the record for <b>DWORD</b> alignment.
     * @type {Integer}
     */
    Length {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A DWORD value that is always set to <b>ELF_LOG_SIGNATURE</b> (the value is 0x654c664c), which is ASCII for eLfL.
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The number of the record. This value can be used with the EVENTLOG_SEEK_READ flag in the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-readeventloga">ReadEventLog</a> function to begin reading at a specified record. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/EventLog/event-log-records">Event Log Records</a>.
     * @type {Integer}
     */
    RecordNumber {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The time at which this entry was submitted. This time is measured in the number of seconds elapsed since 00:00:00 January 1, 1970, Universal Coordinated Time.
     * @type {Integer}
     */
    TimeGenerated {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * The time at which this entry was received by the service to be written to the log. This time is measured in the number of seconds elapsed since 00:00:00 January 1, 1970, Universal Coordinated Time.
     * @type {Integer}
     */
    TimeWritten {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The event identifier. The value is specific to the event source for the event, and is used with source name to locate a description string in the message file for the event source. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/EventLog/event-identifiers">Event Identifiers</a>.
     * @type {Integer}
     */
    EventID {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * 
     * @type {Integer}
     */
    EventType {
        get => NumGet(this, 24, "ushort")
        set => NumPut("ushort", value, this, 24)
    }

    /**
     * The number of strings present in the log (at the position indicated by <b>StringOffset</b>). These strings are merged into the message before it is displayed to the user.
     * @type {Integer}
     */
    NumStrings {
        get => NumGet(this, 26, "ushort")
        set => NumPut("ushort", value, this, 26)
    }

    /**
     * The category for this event. The meaning of this value depends on the event source. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/EventLog/event-categories">Event Categories</a>.
     * @type {Integer}
     */
    EventCategory {
        get => NumGet(this, 28, "ushort")
        set => NumPut("ushort", value, this, 28)
    }

    /**
     * Reserved.
     * @type {Integer}
     */
    ReservedFlags {
        get => NumGet(this, 30, "ushort")
        set => NumPut("ushort", value, this, 30)
    }

    /**
     * Reserved.
     * @type {Integer}
     */
    ClosingRecordNumber {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * The offset of the description strings within this event log record.
     * @type {Integer}
     */
    StringOffset {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * The size of the <b>UserSid</b> member, in bytes. This value can be zero if no security identifier was provided.
     * @type {Integer}
     */
    UserSidLength {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * The offset of the security identifier (SID) within this event log record. To obtain the user name for this SID, use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-lookupaccountsida">LookupAccountSid</a> function.
     * @type {Integer}
     */
    UserSidOffset {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * The size of the event-specific data (at the position indicated by <b>DataOffset</b>), in bytes.
     * @type {Integer}
     */
    DataLength {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * The offset of the event-specific information within this event log record, in bytes. This information could be something specific (a disk driver might log the number of retries, for example), followed by binary information specific to the event being logged and to the source that generated the entry.
     * @type {Integer}
     */
    DataOffset {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }
}
