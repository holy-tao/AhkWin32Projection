#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Flags to specify what parts of a PSS_HANDLE_ENTRY structure are valid.
 * @see https://learn.microsoft.com/windows/win32/api/processsnapshot/ne-processsnapshot-pss_handle_flags
 * @namespace Windows.Win32.System.Diagnostics.ProcessSnapshotting
 */
class PSS_HANDLE_FLAGS extends Win32BitflagEnum {

    /**
     * No parts specified.
     * Native name: PSS_HANDLE_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * The <b>ObjectType</b> member is valid.
     * Native name: PSS_HANDLE_HAVE_TYPE
     * @type {Integer (Int32)}
     */
    static HAVE_TYPE => 1

    /**
     * The <b>ObjectName</b> member is valid.
     * Native name: PSS_HANDLE_HAVE_NAME
     * @type {Integer (Int32)}
     */
    static HAVE_NAME => 2

    /**
     * The <b>Attributes</b>, <b>GrantedAccess</b>, <b>HandleCount</b>, <b>PointerCount</b>, <b>PagedPoolCharge</b>, and <b>NonPagedPoolCharge</b> members are valid.
     * Native name: PSS_HANDLE_HAVE_BASIC_INFORMATION
     * @type {Integer (Int32)}
     */
    static HAVE_BASIC_INFORMATION => 4

    /**
     * The <b>TypeSpecificInformation</b> member is valid (either <b>Process</b>, <b>Thread</b>, <b>Mutant</b>, <b>Event</b> or <b>Section</b>).
     * Native name: PSS_HANDLE_HAVE_TYPE_SPECIFIC_INFORMATION
     * @type {Integer (Int32)}
     */
    static HAVE_TYPE_SPECIFIC_INFORMATION => 8
}
