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
     * @type {Integer} 
     */
    AccessMask {
        get => this.get_AccessMask()
        set => this.put_AccessMask(value)
    }

    /**
     * @type {Integer} 
     */
    AceType {
        get => this.get_AceType()
        set => this.put_AceType(value)
    }

    /**
     * @type {Integer} 
     */
    AceFlags {
        get => this.get_AceFlags()
        set => this.put_AceFlags(value)
    }

    /**
     * @type {Integer} 
     */
    Flags {
        get => this.get_Flags()
        set => this.put_Flags(value)
    }

    /**
     * @type {BSTR} 
     */
    ObjectType {
        get => this.get_ObjectType()
        set => this.put_ObjectType(value)
    }

    /**
     * @type {BSTR} 
     */
    InheritedObjectType {
        get => this.get_InheritedObjectType()
        set => this.put_InheritedObjectType(value)
    }

    /**
     * @type {BSTR} 
     */
    Trustee {
        get => this.get_Trustee()
        set => this.put_Trustee(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AccessMask() {
        result := ComCall(7, this, "int*", &retval := 0, "HRESULT")
        return retval
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
     * @returns {Integer} 
     */
    get_AceType() {
        result := ComCall(9, this, "int*", &retval := 0, "HRESULT")
        return retval
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
     * @returns {Integer} 
     */
    get_AceFlags() {
        result := ComCall(11, this, "int*", &retval := 0, "HRESULT")
        return retval
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
     * @returns {Integer} 
     */
    get_Flags() {
        result := ComCall(13, this, "int*", &retval := 0, "HRESULT")
        return retval
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
     * @returns {BSTR} 
     */
    get_ObjectType() {
        retval := BSTR()
        result := ComCall(15, this, "ptr", retval, "HRESULT")
        return retval
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
     * @returns {BSTR} 
     */
    get_InheritedObjectType() {
        retval := BSTR()
        result := ComCall(17, this, "ptr", retval, "HRESULT")
        return retval
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
     * @returns {BSTR} 
     */
    get_Trustee() {
        retval := BSTR()
        result := ComCall(19, this, "ptr", retval, "HRESULT")
        return retval
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
