#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Memory\PAGE_PROTECTION_FLAGS.ahk" { PAGE_PROTECTION_FLAGS }
#Import "..\..\Memory\VIRTUAL_ALLOCATION_TYPE.ahk" { VIRTUAL_ALLOCATION_TYPE }
#Import "..\..\Memory\PAGE_TYPE.ahk" { PAGE_TYPE }
#Import "..\..\..\Foundation\FILETIME.ahk" { FILETIME }
#Import "..\..\Memory\MEMORY_BASIC_INFORMATION.ahk" { MEMORY_BASIC_INFORMATION }

/**
 * Holds auxiliary page entry information returned by PssWalkSnapshot.
 * @remarks
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/processsnapshot/nf-processsnapshot-psswalksnapshot">PssWalkSnapshot</a> returns a <b>PSS_AUXILIARY_PAGE_ENTRY</b> structure when the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/processsnapshot/ne-processsnapshot-pss_walk_information_class">PSS_WALK_INFORMATION_CLASS</a> member that the caller provides it is <b>PSS_WALK_AUXILIARY_PAGES</b>.
 * @see https://learn.microsoft.com/windows/win32/api/processsnapshot/ns-processsnapshot-pss_auxiliary_page_entry
 * @namespace Windows.Win32.System.Diagnostics.ProcessSnapshotting
 */
export default struct PSS_AUXILIARY_PAGE_ENTRY {
    #StructPack 8

    /**
     * The address of the captured auxiliary page, in the context of the captured process.
     */
    Address : IntPtr

    /**
     * Basic information about the captured page. See <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-memory_basic_information">MEMORY_BASIC_INFORMATION</a> for more information.
     */
    BasicInformation : MEMORY_BASIC_INFORMATION

    /**
     * The capture time of the page. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a>.
     */
    CaptureTime : FILETIME

    /**
     * A pointer to the contents of the captured page, in the context of the current process. This member may be <b>NULL</b> if page contents were not captured. The pointer is valid for the lifetime of the walk marker passed to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/processsnapshot/nf-processsnapshot-psswalksnapshot">PssWalkSnapshot</a>.
     */
    PageContents : IntPtr

    /**
     * The size of the page contents that <b>PageContents</b> points to, in bytes.
     */
    PageSize : UInt32

}
