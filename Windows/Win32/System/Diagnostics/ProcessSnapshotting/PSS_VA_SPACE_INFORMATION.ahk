#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Holds virtual address (VA) space information returned by PssQuerySnapshot.
 * @remarks
 * 
  * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/processsnapshot/nf-processsnapshot-pssquerysnapshot">PssQuerySnapshot</a> returns a <b>PSS_VA_SPACE_INFORMATION</b> structure when the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/processsnapshot/ne-processsnapshot-pss_query_information_class">PSS_QUERY_INFORMATION_CLASS</a> member that the caller provides it is  <b>PSS_QUERY_VA_SPACE_INFORMATION</b>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//processsnapshot/ns-processsnapshot-pss_va_space_information
 * @namespace Windows.Win32.System.Diagnostics.ProcessSnapshotting
 * @version v4.0.30319
 */
class PSS_VA_SPACE_INFORMATION extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * The count of VA regions captured.
     * @type {Integer}
     */
    RegionCount {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
