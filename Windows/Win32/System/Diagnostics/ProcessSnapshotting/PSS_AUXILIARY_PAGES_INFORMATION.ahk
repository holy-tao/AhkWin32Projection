#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Holds auxiliary pages information returned by PssQuerySnapshot.
 * @remarks
 * 
  * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/processsnapshot/nf-processsnapshot-pssquerysnapshot">PssQuerySnapshot</a> returns a <b>PSS_AUXILIARY_PAGES_INFORMATION</b> structure when the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/processsnapshot/ne-processsnapshot-pss_query_information_class">PSS_QUERY_INFORMATION_CLASS</a> member that the caller provides it is  <b>PSS_QUERY_AUXILIARY_PAGES_INFORMATION</b>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//processsnapshot/ns-processsnapshot-pss_auxiliary_pages_information
 * @namespace Windows.Win32.System.Diagnostics.ProcessSnapshotting
 * @version v4.0.30319
 */
class PSS_AUXILIARY_PAGES_INFORMATION extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * The count of auxiliary pages captured.
     * @type {Integer}
     */
    AuxPagesCaptured {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
