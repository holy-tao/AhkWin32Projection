#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\VSS_PROVIDER_TYPE.ahk" { VSS_PROVIDER_TYPE }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Specifies shadow copy provider properties.
 * @see https://learn.microsoft.com/windows/win32/api/vss/ns-vss-vss_provider_prop
 * @namespace Windows.Win32.Storage.Vss
 */
export default struct VSS_PROVIDER_PROP {
    #StructPack 8

    /**
     * Identifies the provider who supports shadow copies of this class.
     */
    m_ProviderId : Guid

    /**
     * Null-terminated wide character string containing the provider name.
     */
    m_pwszProviderName : IntPtr

    /**
     * Provider type. See <a href="https://docs.microsoft.com/windows/desktop/api/vss/ne-vss-vss_provider_type">VSS_PROVIDER_TYPE</a> for more 
     *       information.
     */
    m_eProviderType : VSS_PROVIDER_TYPE

    /**
     * Null-terminated wide character string containing the provider version in readable format.
     */
    m_pwszProviderVersion : IntPtr

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/VSS/volume-shadow-copy-api-data-types">VSS_ID</a> (GUID) uniquely 
     *       identifying the version of a provider.
     */
    m_ProviderVersionId : Guid

    /**
     * Class identifier of the component registered in the local machine's COM catalog.
     */
    m_ClassId : Guid

}
