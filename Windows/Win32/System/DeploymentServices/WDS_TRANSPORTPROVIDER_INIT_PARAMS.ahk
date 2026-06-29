#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\Registry\HKEY.ahk" { HKEY }

/**
 * This structure is used by the WdsTransportProviderInitialize callback function. (WDS_TRANSPORTPROVIDER_INIT_PARAMS)
 * @see https://learn.microsoft.com/windows/win32/api/wdstpdi/ns-wdstpdi-wds_transportprovider_init_params
 * @namespace Windows.Win32.System.DeploymentServices
 */
export default struct WDS_TRANSPORTPROVIDER_INIT_PARAMS {
    #StructPack 8

    /**
     * The length of this structure.
     */
    ulLength : UInt32

    /**
     * The multicast server's version.
     */
    ulMcServerVersion : UInt32

    /**
     * An open handle to the registry key where this provider should
     *      store and retrieve its settings.
     */
    hRegistryKey : HKEY

    /**
     * A handle that the provider can use to uniquely identify itself in calls to the multicast server.
     */
    hProvider : HANDLE

}
