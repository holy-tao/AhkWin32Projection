#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * Represents a name-value pair for OCSPServiceProperties or ProviderProperties.
 * @see https://docs.microsoft.com/windows/win32/api//certadm/nn-certadm-iocspproperty
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class IOCSPProperty extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOCSPProperty
     * @type {Guid}
     */
    static IID => Guid("{66fb7839-5f04-4c25-ad18-9ff1a8376ee0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Name", "get_Value", "put_Value", "get_Modified"]

    /**
     * 
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certadm/nf-certadm-iocspproperty-get_name
     */
    get_Name(pVal) {
        result := ComCall(7, this, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certadm/nf-certadm-iocspproperty-get_value
     */
    get_Value(pVal) {
        result := ComCall(8, this, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} newVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certadm/nf-certadm-iocspproperty-put_value
     */
    put_Value(newVal) {
        result := ComCall(9, this, "ptr", newVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certadm/nf-certadm-iocspproperty-get_modified
     */
    get_Modified(pVal) {
        result := ComCall(10, this, "ptr", pVal, "HRESULT")
        return result
    }
}
