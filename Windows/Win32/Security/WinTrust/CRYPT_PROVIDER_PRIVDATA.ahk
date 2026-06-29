#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Contains private data to be used by a provider.
 * @see https://learn.microsoft.com/windows/win32/api/wintrust/ns-wintrust-crypt_provider_privdata
 * @namespace Windows.Win32.Security.WinTrust
 */
export default struct CRYPT_PROVIDER_PRIVDATA {
    #StructPack 8

    /**
     * The size, in bytes, of this structure.
     */
    cbStruct : UInt32

    /**
     * <b>GUID</b> that identifies the provider.
     */
    gProviderID : Guid

    /**
     * Number of bytes referenced by <b>pvProvData</b>.
     */
    cbProvData : UInt32

    /**
     * A pointer to a <b>void</b> that contains the private data.
     */
    pvProvData : IntPtr

}
