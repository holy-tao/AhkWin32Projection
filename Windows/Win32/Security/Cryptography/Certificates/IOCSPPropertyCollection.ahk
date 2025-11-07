#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Com\IUnknown.ahk
#Include ..\..\..\System\Variant\VARIANT.ahk
#Include .\IOCSPProperty.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * Represents a set of configurable attribute properties (name-value pairs) for an Online Certificate Status Protocol (OCSP) service.
 * @remarks
 * 
 * The <b>IOCSPPropertyCollection</b> contains attributes for the following:
 * 
 * <ul>
 * <li>Web proxy settings that include the  number of threads and number of cache entries</li>
 * <li>Audit settings that include start/stop, configuration change, security change, and request events</li>
 * <li>Security settings that include ACEs for <a href="https://docs.microsoft.com/windows/desktop/api/certadm/nn-certadm-iocspadmin">IOCSPAdmin</a> interfaces</li>
 * </ul>
 * All OCSP attribute information is stored in the following registry key:
 * 
 * 
 * <b>HKEY_LOCAL_MACHINE</b>&#92;<b>SYSTEM</b>&#92;<b>CurrentControlSet</b>&#92;<b>Services</b>&#92;<b>OCSPSvc</b>&#92;<b>Responder</b>
 * 
 * 
 * 
 * OCSP attributes govern OCSP responder service behavior for all CA configurations. For more information on CA configurations, see the <a href="https://docs.microsoft.com/windows/desktop/api/certadm/nn-certadm-iocspcaconfiguration">IOCSPCAConfiguration</a> interface topic.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//certadm/nn-certadm-iocsppropertycollection
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class IOCSPPropertyCollection extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOCSPPropertyCollection
     * @type {Guid}
     */
    static IID => Guid("{2597c18d-54e6-4b74-9fa9-a6bfda99cbbe}")

    /**
     * The class identifier for OCSPPropertyCollection
     * @type {Guid}
     */
    static CLSID => Guid("{f935a528-ba8a-4dd9-ba79-f283275cb2de}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get__NewEnum", "get_Item", "get_Count", "get_ItemByName", "CreateProperty", "DeleteProperty", "InitializeFromProperties", "GetAllProperties"]

    /**
     * 
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/certadm/nf-certadm-iocsppropertycollection-get__newenum
     */
    get__NewEnum() {
        result := ComCall(7, this, "ptr*", &ppVal := 0, "HRESULT")
        return IUnknown(ppVal)
    }

    /**
     * 
     * @param {Integer} Index 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/certadm/nf-certadm-iocsppropertycollection-get_item
     */
    get_Item(Index) {
        pVal := VARIANT()
        result := ComCall(8, this, "int", Index, "ptr", pVal, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/certadm/nf-certadm-iocsppropertycollection-get_count
     */
    get_Count() {
        result := ComCall(9, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @param {BSTR} bstrPropName 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/certadm/nf-certadm-iocsppropertycollection-get_itembyname
     */
    get_ItemByName(bstrPropName) {
        bstrPropName := bstrPropName is String ? BSTR.Alloc(bstrPropName).Value : bstrPropName

        pVal := VARIANT()
        result := ComCall(10, this, "ptr", bstrPropName, "ptr", pVal, "HRESULT")
        return pVal
    }

    /**
     * 
     * @param {BSTR} bstrPropName 
     * @param {Pointer<VARIANT>} pVarPropValue 
     * @returns {IOCSPProperty} 
     * @see https://learn.microsoft.com/windows/win32/api/certadm/nf-certadm-iocsppropertycollection-createproperty
     */
    CreateProperty(bstrPropName, pVarPropValue) {
        bstrPropName := bstrPropName is String ? BSTR.Alloc(bstrPropName).Value : bstrPropName

        result := ComCall(11, this, "ptr", bstrPropName, "ptr", pVarPropValue, "ptr*", &ppVal := 0, "HRESULT")
        return IOCSPProperty(ppVal)
    }

    /**
     * 
     * @param {BSTR} bstrPropName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certadm/nf-certadm-iocsppropertycollection-deleteproperty
     */
    DeleteProperty(bstrPropName) {
        bstrPropName := bstrPropName is String ? BSTR.Alloc(bstrPropName).Value : bstrPropName

        result := ComCall(12, this, "ptr", bstrPropName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pVarProperties 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certadm/nf-certadm-iocsppropertycollection-initializefromproperties
     */
    InitializeFromProperties(pVarProperties) {
        result := ComCall(13, this, "ptr", pVarProperties, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/certadm/nf-certadm-iocsppropertycollection-getallproperties
     */
    GetAllProperties() {
        pVarProperties := VARIANT()
        result := ComCall(14, this, "ptr", pVarProperties, "HRESULT")
        return pVarProperties
    }
}
