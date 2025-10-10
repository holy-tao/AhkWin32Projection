#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies shadow copy provider properties.
 * @see https://docs.microsoft.com/windows/win32/api//vss/ns-vss-vss_provider_prop
 * @namespace Windows.Win32.Storage.Vss
 * @version v4.0.30319
 */
class VSS_PROVIDER_PROP extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * Identifies the provider who supports shadow copies of this class.
     * @type {Pointer<Guid>}
     */
    m_ProviderId {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Null-terminated wide character string containing the provider name.
     * @type {Pointer<UInt16>}
     */
    m_pwszProviderName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Provider type. See <a href="https://docs.microsoft.com/windows/desktop/api/vss/ne-vss-vss_provider_type">VSS_PROVIDER_TYPE</a> for more 
     *       information.
     * @type {Integer}
     */
    m_eProviderType {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * Null-terminated wide character string containing the provider version in readable format.
     * @type {Pointer<UInt16>}
     */
    m_pwszProviderVersion {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/VSS/volume-shadow-copy-api-data-types">VSS_ID</a> (GUID) uniquely 
     *       identifying the version of a provider.
     * @type {Pointer<Guid>}
     */
    m_ProviderVersionId {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Class identifier of the component registered in the local machine's COM catalog.
     * @type {Pointer<Guid>}
     */
    m_ClassId {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }
}
