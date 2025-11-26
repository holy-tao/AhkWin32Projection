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
     * Gets an enumerator for the configuration set.
     * @returns {IUnknown} 
     * @see https://docs.microsoft.com/windows/win32/api//certadm/nf-certadm-iocspcaconfigurationcollection-get__newenum
     */
    get__NewEnum() {
        result := ComCall(7, this, "ptr*", &pVal := 0, "HRESULT")
        return IUnknown(pVal)
    }

    /**
     * Gets a certification authority (CA) configuration identified by index in the configuration set.
     * @param {Integer} Index 
     * @returns {VARIANT} 
     * @see https://docs.microsoft.com/windows/win32/api//certadm/nf-certadm-iocspcaconfigurationcollection-get_item
     */
    get_Item(Index) {
        pVal := VARIANT()
        result := ComCall(8, this, "int", Index, "ptr", pVal, "HRESULT")
        return pVal
    }

    /**
     * Gets the number of certification authority (CA) configurations in the configuration set.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//certadm/nf-certadm-iocspcaconfigurationcollection-get_count
     */
    get_Count() {
        result := ComCall(9, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * Gets a certification authority (CA) configuration identified by name in the configuration set.
     * @param {BSTR} bstrIdentifier 
     * @returns {VARIANT} 
     * @see https://docs.microsoft.com/windows/win32/api//certadm/nf-certadm-iocspcaconfigurationcollection-get_itembyname
     */
    get_ItemByName(bstrIdentifier) {
        bstrIdentifier := bstrIdentifier is String ? BSTR.Alloc(bstrIdentifier).Value : bstrIdentifier

        pVal := VARIANT()
        result := ComCall(10, this, "ptr", bstrIdentifier, "ptr", pVal, "HRESULT")
        return pVal
    }

    /**
     * Creates a new certification authority (CA) configuration and adds it to the configuration set.
     * @param {BSTR} bstrIdentifier A string that contains a name for the new <a href="https://docs.microsoft.com/windows/desktop/api/certadm/nn-certadm-iocspcaconfiguration">IOCSPCAConfiguration</a> object.
     * @param {VARIANT} varCACert An X.509 CA certificate.
     * @returns {IOCSPCAConfiguration} The address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/certadm/nn-certadm-iocspcaconfiguration">IOCSPCAConfiguration</a> interface for the newly created object.
     * @see https://docs.microsoft.com/windows/win32/api//certadm/nf-certadm-iocspcaconfigurationcollection-createcaconfiguration
     */
    CreateCAConfiguration(bstrIdentifier, varCACert) {
        bstrIdentifier := bstrIdentifier is String ? BSTR.Alloc(bstrIdentifier).Value : bstrIdentifier

        result := ComCall(11, this, "ptr", bstrIdentifier, "ptr", varCACert, "ptr*", &ppVal := 0, "HRESULT")
        return IOCSPCAConfiguration(ppVal)
    }

    /**
     * Removes a named certification authority (CA) configuration from the configuration set.
     * @remarks
     * 
     * The <i>bstrIdentifier</i> value must be one previously set by the <a href="https://docs.microsoft.com/windows/desktop/api/certadm/nf-certadm-iocspcaconfigurationcollection-createcaconfiguration">CreateCAConfiguration</a> method.
     * 
     * 
     * @param {BSTR} bstrIdentifier A string that contains the name for the <a href="https://docs.microsoft.com/windows/desktop/api/certadm/nn-certadm-iocspcaconfiguration">IOCSPCAConfiguration</a> object.
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//certadm/nf-certadm-iocspcaconfigurationcollection-deletecaconfiguration
     */
    DeleteCAConfiguration(bstrIdentifier) {
        bstrIdentifier := bstrIdentifier is String ? BSTR.Alloc(bstrIdentifier).Value : bstrIdentifier

        result := ComCall(12, this, "ptr", bstrIdentifier, "HRESULT")
        return result
    }
}
