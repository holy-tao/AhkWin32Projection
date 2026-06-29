#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * Used by the WintrustAddDefaultForUsage function to register callback information about a provider's default usage.
 * @see https://learn.microsoft.com/windows/win32/api/wintrust/ns-wintrust-crypt_provider_regdefusage
 * @namespace Windows.Win32.Security.WinTrust
 */
export default struct CRYPT_PROVIDER_REGDEFUSAGE {
    #StructPack 8

    /**
     * Size, in bytes, of this structure.
     */
    cbStruct : UInt32

    /**
     * GUID that specifies the provider's default action.
     */
    pgActionID : Guid.Ptr

    /**
     * Pointer to the name of the provider DLL.
     */
    pwszDllName : PWSTR

    /**
     * Pointer to the name of the function that loads the callback data to be returned when the <a href="https://docs.microsoft.com/windows/desktop/api/wintrust/nf-wintrust-wintrustgetdefaultforusage">WintrustGetDefaultForUsage</a> function is called with the <i>dwAction</i> parameter set to <b>DWACTION_ALLOCANDFILL</b>. This information also exists in the <a href="https://docs.microsoft.com/windows/desktop/api/wintrust/ns-wintrust-wintrust_data">WINTRUST_DATA</a> structure.
     */
    pwszLoadCallbackDataFunctionName : PSTR

    /**
     * Pointer to the name of the function that frees allocated memory when the <a href="https://docs.microsoft.com/windows/desktop/api/wintrust/nf-wintrust-wintrustgetdefaultforusage">WintrustGetDefaultForUsage</a> function is called with the <i>dwAction</i> parameter set to <b>DWACTION_FREE</b>. This information also exists in the <a href="https://docs.microsoft.com/windows/desktop/api/wintrust/ns-wintrust-wintrust_data">WINTRUST_DATA</a> structure.
     */
    pwszFreeCallbackDataFunctionName : PSTR

}
