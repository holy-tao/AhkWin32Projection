#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Foundation\Uri.ahk
#Include .\PlayReadyContentHeader.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Protection.PlayReady
 * @version WindowsRuntime 1.4
 */
class IPlayReadyContentHeader extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPlayReadyContentHeader
     * @type {Guid}
     */
    static IID => Guid("{9a438a6a-7f4c-452e-88bd-0148c6387a2c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_KeyId", "get_KeyIdString", "get_LicenseAcquisitionUrl", "get_LicenseAcquisitionUserInterfaceUrl", "get_DomainServiceId", "get_EncryptionType", "get_CustomAttributes", "get_DecryptorSetup", "GetSerializedHeader", "get_HeaderWithEmbeddedUpdates"]

    /**
     * @type {Guid} 
     */
    KeyId {
        get => this.get_KeyId()
    }

    /**
     * @type {HSTRING} 
     */
    KeyIdString {
        get => this.get_KeyIdString()
    }

    /**
     * @type {Uri} 
     */
    LicenseAcquisitionUrl {
        get => this.get_LicenseAcquisitionUrl()
    }

    /**
     * @type {Uri} 
     */
    LicenseAcquisitionUserInterfaceUrl {
        get => this.get_LicenseAcquisitionUserInterfaceUrl()
    }

    /**
     * @type {Guid} 
     */
    DomainServiceId {
        get => this.get_DomainServiceId()
    }

    /**
     * @type {Integer} 
     */
    EncryptionType {
        get => this.get_EncryptionType()
    }

    /**
     * @type {HSTRING} 
     */
    CustomAttributes {
        get => this.get_CustomAttributes()
    }

    /**
     * @type {Integer} 
     */
    DecryptorSetup {
        get => this.get_DecryptorSetup()
    }

    /**
     * @type {PlayReadyContentHeader} 
     */
    HeaderWithEmbeddedUpdates {
        get => this.get_HeaderWithEmbeddedUpdates()
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_KeyId() {
        value := Guid()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_KeyIdString() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_LicenseAcquisitionUrl() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Uri(value)
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_LicenseAcquisitionUserInterfaceUrl() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Uri(value)
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_DomainServiceId() {
        value := Guid()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_EncryptionType() {
        result := ComCall(11, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_CustomAttributes() {
        value := HSTRING()
        result := ComCall(12, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DecryptorSetup() {
        result := ComCall(13, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Pointer<Pointer>} headerBytes 
     * @returns {HRESULT} 
     */
    GetSerializedHeader(headerBytes) {
        result := ComCall(14, this, "ptr", headerBytes, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {PlayReadyContentHeader} 
     */
    get_HeaderWithEmbeddedUpdates() {
        result := ComCall(15, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PlayReadyContentHeader(value)
    }
}
