#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IADs.ahk

/**
 * The IADsO interface is a dual interface that inherits from IADs.
 * @see https://docs.microsoft.com/windows/win32/api//iads/nn-iads-iadso
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class IADsO extends IADs{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IADsO
     * @type {Guid}
     */
    static IID => Guid("{a1cd2dc6-effe-11cf-8abc-00c04fd8d503}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 20

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Description", "put_Description", "get_LocalityName", "put_LocalityName", "get_PostalAddress", "put_PostalAddress", "get_TelephoneNumber", "put_TelephoneNumber", "get_FaxNumber", "put_FaxNumber", "get_SeeAlso", "put_SeeAlso"]

    /**
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     */
    get_Description(retval) {
        result := ComCall(20, this, "ptr", retval, "HRESULT")
        return result
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
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     */
    get_LocalityName(retval) {
        result := ComCall(22, this, "ptr", retval, "HRESULT")
        return result
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
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     */
    get_PostalAddress(retval) {
        result := ComCall(24, this, "ptr", retval, "HRESULT")
        return result
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
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     */
    get_TelephoneNumber(retval) {
        result := ComCall(26, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrTelephoneNumber 
     * @returns {HRESULT} 
     */
    put_TelephoneNumber(bstrTelephoneNumber) {
        bstrTelephoneNumber := bstrTelephoneNumber is String ? BSTR.Alloc(bstrTelephoneNumber).Value : bstrTelephoneNumber

        result := ComCall(27, this, "ptr", bstrTelephoneNumber, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     */
    get_FaxNumber(retval) {
        result := ComCall(28, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrFaxNumber 
     * @returns {HRESULT} 
     */
    put_FaxNumber(bstrFaxNumber) {
        bstrFaxNumber := bstrFaxNumber is String ? BSTR.Alloc(bstrFaxNumber).Value : bstrFaxNumber

        result := ComCall(29, this, "ptr", bstrFaxNumber, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} retval 
     * @returns {HRESULT} 
     */
    get_SeeAlso(retval) {
        result := ComCall(30, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} vSeeAlso 
     * @returns {HRESULT} 
     */
    put_SeeAlso(vSeeAlso) {
        result := ComCall(31, this, "ptr", vSeeAlso, "HRESULT")
        return result
    }
}
