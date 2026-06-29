#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Describes a provider.
 * @see https://learn.microsoft.com/windows/win32/api/wdspxe/ns-wdspxe-pxe_provider
 * @namespace Windows.Win32.System.DeploymentServices
 */
export default struct PXE_PROVIDER {
    #StructPack 8

    /**
     * Size of the <b>PXE_PROVIDER</b> structure.
     */
    uSizeOfStruct : UInt32

    /**
     * Address of a null-terminated string that specifies the display name of the provider. This name is displayed 
     *       to the user and must be unique among registered providers.
     */
    pwszName : PWSTR

    /**
     * Address of a null-terminated string that specifies the full path to the provider DLL.
     */
    pwszFilePath : PWSTR

    /**
     * Indicates whether the provider is critical. If a critical provider fails, the WDS server will also 
     *       fail.
     */
    bIsCritical : BOOL

    /**
     * Index of a provider in the list of registered providers.
     */
    uIndex : UInt32

}
