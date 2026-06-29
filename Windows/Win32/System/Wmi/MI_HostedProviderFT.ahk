#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * A support structure used in the MI_HostedProvider structure. Use the functions with the name prefix &quot;MI_HostedProvider_&quot; to manipulate these structures.
 * @see https://learn.microsoft.com/windows/win32/api/mi/ns-mi-mi_hostedproviderft
 * @namespace Windows.Win32.System.Wmi
 */
export default struct MI_HostedProviderFT {
    #StructPack 8

    /**
     * See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_hostedprovider_close">MI_HostedProvider_Close</a>.
     */
    Close : IntPtr

    /**
     * See 
     *       <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_hostedprovider_getapplication">MI_HostedProvider_GetApplication</a>.
     */
    GetApplication : IntPtr

}
