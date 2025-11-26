#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include .\IADs.ahk

/**
 * The IADsLocality interface is a dual interface that inherits from IADs.
 * @see https://docs.microsoft.com/windows/win32/api//iads/nn-iads-iadslocality
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class IADsLocality extends IADs{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IADsLocality
     * @type {Guid}
     */
    static IID => Guid("{a05e03a2-effe-11cf-8abc-00c04fd8d503}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 20

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Description", "put_Description", "get_LocalityName", "put_LocalityName", "get_PostalAddress", "put_PostalAddress", "get_SeeAlso", "put_SeeAlso"]

    /**
     * @type {BSTR} 
     */
    Description {
        get => this.get_Description()
        set => this.put_Description(value)
    }

    /**
     * @type {BSTR} 
     */
    LocalityName {
        get => this.get_LocalityName()
        set => this.put_LocalityName(value)
    }

    /**
     * @type {BSTR} 
     */
    PostalAddress {
        get => this.get_PostalAddress()
        set => this.put_PostalAddress(value)
    }

    /**
     * @type {VARIANT} 
     */
    SeeAlso {
        get => this.get_SeeAlso()
        set => this.put_SeeAlso(value)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Description() {
        retval := BSTR()
        result := ComCall(20, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {BSTR} bstrDescription 
     * @returns {HRESULT} 
     */
    put_Description(bstrDescription) {
        bstrDescription := bstrDescription is String ? BSTR.Alloc(bstrDescription).Value : bstrDescription

        result := ComCall(21, this, "ptr", bstrDescription, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_LocalityName() {
        retval := BSTR()
        result := ComCall(22, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {BSTR} bstrLocalityName 
     * @returns {HRESULT} 
     */
    put_LocalityName(bstrLocalityName) {
        bstrLocalityName := bstrLocalityName is String ? BSTR.Alloc(bstrLocalityName).Value : bstrLocalityName

        result := ComCall(23, this, "ptr", bstrLocalityName, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_PostalAddress() {
        retval := BSTR()
        result := ComCall(24, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {BSTR} bstrPostalAddress 
     * @returns {HRESULT} 
     */
    put_PostalAddress(bstrPostalAddress) {
        bstrPostalAddress := bstrPostalAddress is String ? BSTR.Alloc(bstrPostalAddress).Value : bstrPostalAddress

        result := ComCall(25, this, "ptr", bstrPostalAddress, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_SeeAlso() {
        retval := VARIANT()
        result := ComCall(26, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {VARIANT} vSeeAlso 
     * @returns {HRESULT} 
     */
    put_SeeAlso(vSeeAlso) {
        result := ComCall(27, this, "ptr", vSeeAlso, "HRESULT")
        return result
    }
}
