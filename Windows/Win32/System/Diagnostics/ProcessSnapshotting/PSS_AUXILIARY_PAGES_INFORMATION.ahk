#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Holds auxiliary pages information returned by PssQuerySnapshot.
 * @remarks
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/processsnapshot/nf-processsnapshot-pssquerysnapshot">PssQuerySnapshot</a> returns a <b>PSS_AUXILIARY_PAGES_INFORMATION</b> structure when the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/processsnapshot/ne-processsnapshot-pss_query_information_class">PSS_QUERY_INFORMATION_CLASS</a> member that the caller provides it is  <b>PSS_QUERY_AUXILIARY_PAGES_INFORMATION</b>.
 * @see https://learn.microsoft.com/windows/win32/api/processsnapshot/ns-processsnapshot-pss_auxiliary_pages_information
 * @namespace Windows.Win32.System.Diagnostics.ProcessSnapshotting
 */
export default struct PSS_AUXILIARY_PAGES_INFORMATION {
    #StructPack 4

    /**
     * The count of auxiliary pages captured.
     */
    AuxPagesCaptured : UInt32

}
