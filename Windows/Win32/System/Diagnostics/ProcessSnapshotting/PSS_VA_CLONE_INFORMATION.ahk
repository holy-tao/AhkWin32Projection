#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\HANDLE.ahk

/**
 * Holds virtual address (VA) clone information returned by PssQuerySnapshot.
 * @remarks
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/processsnapshot/nf-processsnapshot-pssquerysnapshot">PssQuerySnapshot</a> returns a <b>PSS_VA_CLONE_INFORMATION</b> structure when the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/processsnapshot/ne-processsnapshot-pss_query_information_class">PSS_QUERY_INFORMATION_CLASS</a> member that the caller provides it is  <b>PSS_QUERY_VA_CLONE_INFORMATION</b>.
 * @see https://learn.microsoft.com/windows/win32/api/processsnapshot/ns-processsnapshot-pss_va_clone_information
 * @namespace Windows.Win32.System.Diagnostics.ProcessSnapshotting
 * @version v4.0.30319
 */
class PSS_VA_CLONE_INFORMATION extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * A handle to the VA clone process.
     * @type {HANDLE}
     */
    VaCloneHandle{
        get {
            if(!this.HasProp("__VaCloneHandle"))
                this.__VaCloneHandle := HANDLE(0, this)
            return this.__VaCloneHandle
        }
    }
}
