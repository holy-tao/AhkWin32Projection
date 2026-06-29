#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PEERDIST_STATUS.ahk" { PEERDIST_STATUS }
#Import ".\PEERDIST_RETRIEVAL_OPTIONS_CONTENTINFO_VERSION_VALUE.ahk" { PEERDIST_RETRIEVAL_OPTIONS_CONTENTINFO_VERSION_VALUE }

/**
 * The PEERDIST_STATUS_INFO structure contains information about the current status and capabilities of the BranchCache service on the local computer.
 * @see https://learn.microsoft.com/windows/win32/api/peerdist/ns-peerdist-peerdist_status_info
 * @namespace Windows.Win32.NetworkManagement.P2P
 */
export default struct PEERDIST_STATUS_INFO {
    #StructPack 4

    /**
     * Size, in bytes, of the <b>PEERDIST_STATUS_INFO</b> structure.
     */
    cbSize : UInt32 := this.Size

    /**
     * Specifies the current status of the BranchCache service. This member should be one of following values defined in the <a href="https://docs.microsoft.com/windows/desktop/api/peerdist/ne-peerdist-peerdist_status">PEERDIST_STATUS</a> enumeration.
     */
    status : PEERDIST_STATUS

    dwMinVer : PEERDIST_RETRIEVAL_OPTIONS_CONTENTINFO_VERSION_VALUE

    dwMaxVer : PEERDIST_RETRIEVAL_OPTIONS_CONTENTINFO_VERSION_VALUE

}
