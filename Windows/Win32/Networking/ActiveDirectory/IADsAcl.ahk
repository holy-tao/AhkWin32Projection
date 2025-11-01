#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IADsAcl interface provides methods for an ADSI client to access and manipulate the ACL or Inherited ACL attribute values. This interface manipulates the attributes.
 * @see https://docs.microsoft.com/windows/win32/api//iads/nn-iads-iadsacl
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class IADsAcl extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IADsAcl
     * @type {Guid}
     */
    static IID => Guid("{8452d3ab-0869-11d1-a377-00c04fb950dc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ProtectedAttrName", "put_ProtectedAttrName", "get_SubjectName", "put_SubjectName", "get_Privileges", "put_Privileges", "CopyAcl"]

    /**
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     */
    get_ProtectedAttrName(retval) {
        result := ComCall(7, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrProtectedAttrName 
     * @returns {HRESULT} 
     */
    put_ProtectedAttrName(bstrProtectedAttrName) {
        bstrProtectedAttrName := bstrProtectedAttrName is String ? BSTR.Alloc(bstrProtectedAttrName).Value : bstrProtectedAttrName

        result := ComCall(8, this, "ptr", bstrProtectedAttrName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     */
    get_SubjectName(retval) {
        result := ComCall(9, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrSubjectName 
     * @returns {HRESULT} 
     */
    put_SubjectName(bstrSubjectName) {
        bstrSubjectName := bstrSubjectName is String ? BSTR.Alloc(bstrSubjectName).Value : bstrSubjectName

        result := ComCall(10, this, "ptr", bstrSubjectName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} retval 
     * @returns {HRESULT} 
     */
    get_Privileges(retval) {
        retvalMarshal := retval is VarRef ? "int*" : "ptr"

        result := ComCall(11, this, retvalMarshal, retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lnPrivileges 
     * @returns {HRESULT} 
     */
    put_Privileges(lnPrivileges) {
        result := ComCall(12, this, "int", lnPrivileges, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} ppAcl 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/iads/nf-iads-iadsacl-copyacl
     */
    CopyAcl(ppAcl) {
        result := ComCall(13, this, "ptr*", ppAcl, "HRESULT")
        return result
    }
}
