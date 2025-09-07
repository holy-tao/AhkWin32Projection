#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Holds handle trace information returned by PssQuerySnapshot.
 * @remarks
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/processsnapshot/nf-processsnapshot-pssquerysnapshot">PssQuerySnapshot</a> returns a <b>PSS_HANDLE_TRACE_INFORMATION</b> structure when the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/processsnapshot/ne-processsnapshot-pss_query_information_class">PSS_QUERY_INFORMATION_CLASS</a> member that the caller provides it is  <b>PSS_QUERY_HANDLE_TRACE_INFORMATION</b>.
 * @see https://learn.microsoft.com/windows/win32/api/processsnapshot/ns-processsnapshot-pss_handle_trace_information
 * @namespace Windows.Win32.System.Diagnostics.ProcessSnapshotting
 * @version v4.0.30319
 */
class PSS_HANDLE_TRACE_INFORMATION extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * A handle to a section containing the handle trace information.
     * @type {Pointer<Ptr>}
     */
    SectionHandle {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The size of the handle trace section, in bytes.
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
