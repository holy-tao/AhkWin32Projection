#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\GROUP_FAILURE_INFO.ahk" { GROUP_FAILURE_INFO }

/**
 * The GROUP_FAILURE_INFO_BUFFER structure represents a buffer for a GROUP_FAILURE_INFO structure. (GROUP_FAILURE_INFO_BUFFER)
 * @see https://learn.microsoft.com/windows/win32/api/msclus/ns-msclus-group_failure_info_buffer
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct GROUP_FAILURE_INFO_BUFFER {
    #StructPack 4

    /**
     * The version of this structure. Set this parameter to <b>GROUP_FAILURE_INFO_VERSION_1</b>        (0x1).
     */
    dwVersion : UInt32

    /**
     * The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/ns-clusapi-group_failure_info">GROUP_FAILURE_INFO</a> structure that contains information about the failover attempts for the group failure.
     */
    Info : GROUP_FAILURE_INFO

}
