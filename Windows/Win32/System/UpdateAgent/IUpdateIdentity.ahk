#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Represents the unique identifier of an update.
 * @remarks
 * 
  * You can create an instance of this interface by using the UpdateIdentity coclass.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wuapi/nn-wuapi-iupdateidentity
 * @namespace Windows.Win32.System.UpdateAgent
 * @version v4.0.30319
 */
class IUpdateIdentity extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUpdateIdentity
     * @type {Guid}
     */
    static IID => Guid("{46297823-9940-4c09-aed9-cd3ea6d05968}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_RevisionNumber", "get_UpdateID"]

    /**
     * 
     * @param {Pointer<Integer>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdateidentity-get_revisionnumber
     */
    get_RevisionNumber(retval) {
        retvalMarshal := retval is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, retvalMarshal, retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdateidentity-get_updateid
     */
    get_UpdateID(retval) {
        result := ComCall(8, this, "ptr", retval, "HRESULT")
        return result
    }
}
