#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
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
     * 
     * @param {Pointer<IUnknown>} ppVal 
     * @returns {HRESULT} 
     */
    get__NewEnum(ppVal) {
        result := ComCall(7, this, "ptr", ppVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {Pointer<VARIANT>} pVal 
     * @returns {HRESULT} 
     */
    get_Item(Index, pVal) {
        result := ComCall(8, this, "int", Index, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pVal 
     * @returns {HRESULT} 
     */
    get_Count(pVal) {
        result := ComCall(9, this, "int*", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrPropName 
     * @param {Pointer<VARIANT>} pVal 
     * @returns {HRESULT} 
     */
    get_ItemByName(bstrPropName, pVal) {
        bstrPropName := bstrPropName is String ? BSTR.Alloc(bstrPropName).Value : bstrPropName

        result := ComCall(10, this, "ptr", bstrPropName, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrPropName 
     * @param {Pointer<VARIANT>} pVarPropValue 
     * @param {Pointer<IOCSPProperty>} ppVal 
     * @returns {HRESULT} 
     */
    CreateProperty(bstrPropName, pVarPropValue, ppVal) {
        bstrPropName := bstrPropName is String ? BSTR.Alloc(bstrPropName).Value : bstrPropName

        result := ComCall(11, this, "ptr", bstrPropName, "ptr", pVarPropValue, "ptr", ppVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrPropName 
     * @returns {HRESULT} 
     */
    DeleteProperty(bstrPropName) {
        bstrPropName := bstrPropName is String ? BSTR.Alloc(bstrPropName).Value : bstrPropName

        result := ComCall(12, this, "ptr", bstrPropName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pVarProperties 
     * @returns {HRESULT} 
     */
    InitializeFromProperties(pVarProperties) {
        result := ComCall(13, this, "ptr", pVarProperties, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pVarProperties 
     * @returns {HRESULT} 
     */
    GetAllProperties(pVarProperties) {
        result := ComCall(14, this, "ptr", pVarProperties, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
