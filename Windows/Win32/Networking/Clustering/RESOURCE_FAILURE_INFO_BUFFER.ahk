#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\RESOURCE_FAILURE_INFO.ahk" { RESOURCE_FAILURE_INFO }

/**
 * The RESOURCE_FAILURE_INFO_BUFFER structure represents a buffer for a resource failure. (RESOURCE_FAILURE_INFO_BUFFER)
 * @see https://learn.microsoft.com/windows/win32/api/msclus/ns-msclus-resource_failure_info_buffer
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct RESOURCE_FAILURE_INFO_BUFFER {
    #StructPack 4

    /**
     * The version of this structure. Set this parameter to <b>RESOURCE_FAILURE_INFO_VERSION_1</b> (0x1).
     */
    dwVersion : UInt32

    /**
     * The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/ns-clusapi-resource_failure_info">RESOURCE_FAILURE_INFO</a> structure that contains information about the failover attempts for the resource failure.
     */
    Info : RESOURCE_FAILURE_INFO

}
