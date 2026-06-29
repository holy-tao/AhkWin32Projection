#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\VSS_PROVIDER_TYPE.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Specifies shadow copy provider properties.
 * @see https://learn.microsoft.com/windows/win32/api/vss/ns-vss-vss_provider_prop
 * @namespace Windows.Win32.Storage.Vss
 */
class VSS_PROVIDER_PROP extends Win32Struct {
    static sizeof => 72

    static packingSize => 8

    /**
     * Identifies the provider who supports shadow copies of this class.
     * @type {Guid}
     */
    m_ProviderId {
        get {
            if(!this.HasProp("__m_ProviderId"))
                this.__m_ProviderId := Guid(0, this)
            return this.__m_ProviderId
        }
    }

    /**
     * Null-terminated wide character string containing the provider name.
     * @type {Pointer<Integer>}
     */
    m_pwszProviderName {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Provider type. See <a href="https://docs.microsoft.com/windows/desktop/api/vss/ne-vss-vss_provider_type">VSS_PROVIDER_TYPE</a> for more 
     *       information.
     * @type {VSS_PROVIDER_TYPE}
     */
    m_eProviderType {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * Null-terminated wide character string containing the provider version in readable format.
     * @type {Pointer<Integer>}
     */
    m_pwszProviderVersion {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/VSS/volume-shadow-copy-api-data-types">VSS_ID</a> (GUID) uniquely 
     *       identifying the version of a provider.
     * @type {Guid}
     */
    m_ProviderVersionId {
        get {
            if(!this.HasProp("__m_ProviderVersionId"))
                this.__m_ProviderVersionId := Guid(40, this)
            return this.__m_ProviderVersionId
        }
    }

    /**
     * Class identifier of the component registered in the local machine's COM catalog.
     * @type {Guid}
     */
    m_ClassId {
        get {
            if(!this.HasProp("__m_ClassId"))
                this.__m_ClassId := Guid(56, this)
            return this.__m_ClassId
        }
    }
}
