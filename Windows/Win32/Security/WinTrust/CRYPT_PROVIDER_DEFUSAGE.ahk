#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Used by the WintrustGetDefaultForUsage function to retrieve callback information for a provider's default usage.
 * @see https://learn.microsoft.com/windows/win32/api/wintrust/ns-wintrust-crypt_provider_defusage
 * @namespace Windows.Win32.Security.WinTrust
 */
export default struct CRYPT_PROVIDER_DEFUSAGE {
    #StructPack 8

    /**
     * Size, in bytes, of the structure.
     */
    cbStruct : UInt32

    /**
     * GUID that specifies the provider's default action.
     */
    gActionID : Guid

    /**
     * Pointer to a data buffer used to pass policy-specific data to a policy provider.
     */
    pDefPolicyCallbackData : IntPtr

    /**
     * Pointer to a data buffer used to pass subject interface package (SIP) specific data to an SIP provider.
     */
    pDefSIPClientData : IntPtr

}
