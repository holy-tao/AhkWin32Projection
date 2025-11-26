#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Com\IUnknown.ahk
#Include ..\..\..\System\Variant\VARIANT.ahk
#Include .\IOCSPCAConfiguration.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * Represents a set of certificates for which an Online Certificate Status Protocol (OCSP) service has been configured to provide certificate status responses.
 * @see https://docs.microsoft.com/windows/win32/api//certadm/nn-certadm-iocspcaconfigurationcollection
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class IOCSPCAConfigurationCollection extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOCSPCAConfigurationCollection
     * @type {Guid}
     */
    static IID => Guid("{2bebea0b-5ece-4f28-a91c-86b4bb20f0d3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get__NewEnum", "get_Item", "get_Count", "get_ItemByName", "CreateCAConfiguration", "DeleteCAConfiguration"]

    /**
     * @type {IUnknown} 
     */
    _NewEnum {
        get => this.get__NewEnum()
    }

    /**
     * @type {Integer} 
     */
    Count {
        get => this.get_Count()
    }

    /**
     * 
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/certadm/nf-certadm-iocspcaconfigurationcollection-get__newenum
     */
    get__NewEnum() {
        result := ComCall(7, this, "ptr*", &pVal := 0, "HRESULT")
        return IUnknown(pVal)
    }

    /**
     * 
     * @param {Integer} Index 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/certadm/nf-certadm-iocspcaconfigurationcollection-get_item
     */
    get_Item(Index) {
        pVal := VARIANT()
        result := ComCall(8, this, "int", Index, "ptr", pVal, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/certadm/nf-certadm-iocspcaconfigurationcollection-get_count
     */
    get_Count() {
        result := ComCall(9, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @param {BSTR} bstrIdentifier 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/certadm/nf-certadm-iocspcaconfigurationcollection-get_itembyname
     */
    get_ItemByName(bstrIdentifier) {
        bstrIdentifier := bstrIdentifier is String ? BSTR.Alloc(bstrIdentifier).Value : bstrIdentifier

        pVal := VARIANT()
        result := ComCall(10, this, "ptr", bstrIdentifier, "ptr", pVal, "HRESULT")
        return pVal
    }

    /**
     * 
     * @param {BSTR} bstrIdentifier 
     * @param {VARIANT} varCACert 
     * @returns {IOCSPCAConfiguration} 
     * @see https://learn.microsoft.com/windows/win32/api/certadm/nf-certadm-iocspcaconfigurationcollection-createcaconfiguration
     */
    CreateCAConfiguration(bstrIdentifier, varCACert) {
        bstrIdentifier := bstrIdentifier is String ? BSTR.Alloc(bstrIdentifier).Value : bstrIdentifier

        result := ComCall(11, this, "ptr", bstrIdentifier, "ptr", varCACert, "ptr*", &ppVal := 0, "HRESULT")
        return IOCSPCAConfiguration(ppVal)
    }

    /**
     * 
     * @param {BSTR} bstrIdentifier 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certadm/nf-certadm-iocspcaconfigurationcollection-deletecaconfiguration
     */
    DeleteCAConfiguration(bstrIdentifier) {
        bstrIdentifier := bstrIdentifier is String ? BSTR.Alloc(bstrIdentifier).Value : bstrIdentifier

        result := ComCall(12, this, "ptr", bstrIdentifier, "HRESULT")
        return result
    }
}
