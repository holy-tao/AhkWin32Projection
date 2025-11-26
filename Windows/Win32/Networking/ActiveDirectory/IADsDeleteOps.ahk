#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IADsDeleteOps interface specifies a method an object can use to delete itself from the underlying directory. For a container object, the method deletes its children and the entire subtree.
 * @see https://docs.microsoft.com/windows/win32/api//iads/nn-iads-iadsdeleteops
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class IADsDeleteOps extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IADsDeleteOps
     * @type {Guid}
     */
    static IID => Guid("{b2bd0902-8878-11d1-8c21-00c04fd8d503}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["DeleteObject"]

    /**
     * The IADsDeleteOps::DeleteObject method deletes an ADSI object.
     * @param {Integer} lnFlags Reserved.
     * @returns {HRESULT} This method supports standard return values, including S_OK for a successful operation. For more information about error codes, see  <a href="/windows/desktop/ADSI/adsi-error-codes">ADSI Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//iads/nf-iads-iadsdeleteops-deleteobject
     */
    DeleteObject(lnFlags) {
        result := ComCall(7, this, "int", lnFlags, "HRESULT")
        return result
    }
}
