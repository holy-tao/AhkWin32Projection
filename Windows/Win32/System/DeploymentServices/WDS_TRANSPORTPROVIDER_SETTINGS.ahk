#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * This structure is used by the WdsTransportProviderInitialize callback function. (WDS_TRANSPORTPROVIDER_SETTINGS)
 * @see https://learn.microsoft.com/windows/win32/api/wdstpdi/ns-wdstpdi-wds_transportprovider_settings
 * @namespace Windows.Win32.System.DeploymentServices
 */
export default struct WDS_TRANSPORTPROVIDER_SETTINGS {
    #StructPack 4

    /**
     * The length of this structure.
     * 
     * The version of the api that this provider implements.
     */
    ulLength : UInt32

    ulProviderVersion : UInt32

}
