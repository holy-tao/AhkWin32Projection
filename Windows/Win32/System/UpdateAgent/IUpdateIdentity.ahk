#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * @type {Integer} 
     */
    RevisionNumber {
        get => this.get_RevisionNumber()
    }

    /**
     * @type {BSTR} 
     */
    UpdateID {
        get => this.get_UpdateID()
    }

    /**
     * Gets the revision number of an update.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdateidentity-get_revisionnumber
     */
    get_RevisionNumber() {
        result := ComCall(7, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets the revision-independent identifier of an update.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iupdateidentity-get_updateid
     */
    get_UpdateID() {
        retval := BSTR()
        result := ComCall(8, this, "ptr", retval, "HRESULT")
        return retval
    }
}
