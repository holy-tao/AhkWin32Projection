#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IADsAccessControlEntry interface is a dual interface that enables directory clients to access and manipulate individual access-control entries (ACEs) of the owning object.
 * @see https://docs.microsoft.com/windows/win32/api//iads/nn-iads-iadsaccesscontrolentry
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class IADsAccessControlEntry extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IADsAccessControlEntry
     * @type {Guid}
     */
    static IID => Guid("{b4f3a14c-9bdd-11d0-852c-00c04fd8d503}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AccessMask", "put_AccessMask", "get_AceType", "put_AceType", "get_AceFlags", "put_AceFlags", "get_Flags", "put_Flags", "get_ObjectType", "put_ObjectType", "get_InheritedObjectType", "put_InheritedObjectType", "get_Trustee", "put_Trustee"]

    /**
     * 
     * @param {Pointer<Integer>} retval 
     * @returns {HRESULT} 
     */
    get_AccessMask(retval) {
        result := ComCall(7, this, "int*", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lnAccessMask 
     * @returns {HRESULT} 
     */
    put_AccessMask(lnAccessMask) {
        result := ComCall(8, this, "int", lnAccessMask, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} retval 
     * @returns {HRESULT} 
     */
    get_AceType(retval) {
        result := ComCall(9, this, "int*", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lnAceType 
     * @returns {HRESULT} 
     */
    put_AceType(lnAceType) {
        result := ComCall(10, this, "int", lnAceType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} retval 
     * @returns {HRESULT} 
     */
    get_AceFlags(retval) {
        result := ComCall(11, this, "int*", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lnAceFlags 
     * @returns {HRESULT} 
     */
    put_AceFlags(lnAceFlags) {
        result := ComCall(12, this, "int", lnAceFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} retval 
     * @returns {HRESULT} 
     */
    get_Flags(retval) {
        result := ComCall(13, this, "int*", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lnFlags 
     * @returns {HRESULT} 
     */
    put_Flags(lnFlags) {
        result := ComCall(14, this, "int", lnFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     */
    get_ObjectType(retval) {
        result := ComCall(15, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrObjectType 
     * @returns {HRESULT} 
     */
    put_ObjectType(bstrObjectType) {
        bstrObjectType := bstrObjectType is String ? BSTR.Alloc(bstrObjectType).Value : bstrObjectType

        result := ComCall(16, this, "ptr", bstrObjectType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     */
    get_InheritedObjectType(retval) {
        result := ComCall(17, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrInheritedObjectType 
     * @returns {HRESULT} 
     */
    put_InheritedObjectType(bstrInheritedObjectType) {
        bstrInheritedObjectType := bstrInheritedObjectType is String ? BSTR.Alloc(bstrInheritedObjectType).Value : bstrInheritedObjectType

        result := ComCall(18, this, "ptr", bstrInheritedObjectType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     */
    get_Trustee(retval) {
        result := ComCall(19, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrTrustee 
     * @returns {HRESULT} 
     */
    put_Trustee(bstrTrustee) {
        bstrTrustee := bstrTrustee is String ? BSTR.Alloc(bstrTrustee).Value : bstrTrustee

        result := ComCall(20, this, "ptr", bstrTrustee, "HRESULT")
        return result
    }
}
