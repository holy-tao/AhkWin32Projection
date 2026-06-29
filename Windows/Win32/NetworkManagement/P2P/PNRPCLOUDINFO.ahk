#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PNRP_SCOPE.ahk" { PNRP_SCOPE }
#Import ".\PNRP_CLOUD_FLAGS.ahk" { PNRP_CLOUD_FLAGS }
#Import ".\PNRP_CLOUD_STATE.ahk" { PNRP_CLOUD_STATE }
#Import ".\PNRP_CLOUD_ID.ahk" { PNRP_CLOUD_ID }

/**
 * The PNRPCLOUDINFO structure is pointed to by the lpBlob member of the WSAQUERYSET structure.
 * @see https://learn.microsoft.com/windows/win32/api/pnrpns/ns-pnrpns-pnrpcloudinfo
 * @namespace Windows.Win32.NetworkManagement.P2P
 */
export default struct PNRPCLOUDINFO {
    #StructPack 4

    /**
     * Specifies the size of this structure.
     */
    dwSize : UInt32

    /**
     * Specifies the network cloud information stored in a <a href="https://docs.microsoft.com/windows/desktop/api/pnrpdef/ns-pnrpdef-pnrp_cloud_id">PNRP_CLOUD_ID</a> structure.
     */
    Cloud : PNRP_CLOUD_ID

    /**
     * Specifies the state of the network cloud. Valid values are specified by <a href="https://docs.microsoft.com/windows/desktop/api/pnrpdef/ne-pnrpdef-pnrp_cloud_state">PNRP_CLOUD_STATE</a>.
     */
    enCloudState : PNRP_CLOUD_STATE

    /**
     * Indicates if the cloud name is valid on the network or only valid on the current computer. Valid values are specified by <a href="https://docs.microsoft.com/windows/desktop/api/pnrpdef/ne-pnrpdef-pnrp_cloud_flags">PNRP_CLOUD_FLAGS</a>.
     */
    enCloudFlags : PNRP_CLOUD_FLAGS

}
