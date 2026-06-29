#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MI_HostedProviderFT.ahk" { MI_HostedProviderFT }

/**
 * Represents the hosting of a provider in a client application.
 * @see https://learn.microsoft.com/windows/win32/api/mi/ns-mi-mi_hostedprovider
 * @namespace Windows.Win32.System.Wmi
 */
export default struct MI_HostedProvider {
    #StructPack 8

    /**
     * Reserved for internal use.
     */
    reserved1 : Int64

    /**
     * Reserved for internal use.
     */
    reserved2 : IntPtr

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mi/ns-mi-mi_hostedproviderft">MI_HostedProviderFT</a> function 
     *       table.
     */
    ft : MI_HostedProviderFT.Ptr

}
