#Requires AutoHotkey v2.0.0 64-bit

/**
 * Flags to specify what parts of a PSS_HANDLE_ENTRY structure are valid.
 * @see https://learn.microsoft.com/windows/win32/api/processsnapshot/ne-processsnapshot-pss_handle_flags
 * @namespace Windows.Win32.System.Diagnostics.ProcessSnapshotting
 * @version v4.0.30319
 */
class PSS_HANDLE_FLAGS{

    /**
     * No parts specified.
     * @type {Integer (Int32)}
     */
    static PSS_HANDLE_NONE => 0

    /**
     * The <b>ObjectType</b> member is valid.
     * @type {Integer (Int32)}
     */
    static PSS_HANDLE_HAVE_TYPE => 1

    /**
     * The <b>ObjectName</b> member is valid.
     * @type {Integer (Int32)}
     */
    static PSS_HANDLE_HAVE_NAME => 2

    /**
     * The <b>Attributes</b>, <b>GrantedAccess</b>, <b>HandleCount</b>, <b>PointerCount</b>, <b>PagedPoolCharge</b>, and <b>NonPagedPoolCharge</b> members are valid.
     * @type {Integer (Int32)}
     */
    static PSS_HANDLE_HAVE_BASIC_INFORMATION => 4

    /**
     * The <b>TypeSpecificInformation</b> member is valid (either <b>Process</b>, <b>Thread</b>, <b>Mutant</b>, <b>Event</b> or <b>Section</b>).
     * @type {Integer (Int32)}
     */
    static PSS_HANDLE_HAVE_TYPE_SPECIFIC_INFORMATION => 8
}
