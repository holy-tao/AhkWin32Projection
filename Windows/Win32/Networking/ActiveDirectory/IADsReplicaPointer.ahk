#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * The IADsReplicaPointer interface provides methods for an ADSI client to access the Replica Pointer attribute.
 * @see https://learn.microsoft.com/windows/win32/api/iads/nn-iads-iadsreplicapointer
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct IADsReplicaPointer extends IDispatch {
    /**
     * The interface identifier for IADsReplicaPointer
     * @type {Guid}
     */
    static IID := Guid("{f60fb803-4080-11d1-a3ac-00c04fb950dc}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IADsReplicaPointer interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_ServerName          : IntPtr
        put_ServerName          : IntPtr
        get_ReplicaType         : IntPtr
        put_ReplicaType         : IntPtr
        get_ReplicaNumber       : IntPtr
        put_ReplicaNumber       : IntPtr
        get_Count               : IntPtr
        put_Count               : IntPtr
        get_ReplicaAddressHints : IntPtr
        put_ReplicaAddressHints : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IADsReplicaPointer.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    ServerName {
        get => this.get_ServerName()
        set => this.put_ServerName(value)
    }

    /**
     * @type {Integer} 
     */
    ReplicaType {
        get => this.get_ReplicaType()
        set => this.put_ReplicaType(value)
    }

    /**
     * @type {Integer} 
     */
    ReplicaNumber {
        get => this.get_ReplicaNumber()
        set => this.put_ReplicaNumber(value)
    }

    /**
     * @type {Integer} 
     */
    Count {
        get => this.get_Count()
        set => this.put_Count(value)
    }

    /**
     * @type {VARIANT} 
     */
    ReplicaAddressHints {
        get => this.get_ReplicaAddressHints()
        set => this.put_ReplicaAddressHints(value)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ServerName() {
        retval := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {BSTR} bstrServerName 
     * @returns {HRESULT} 
     */
    put_ServerName(bstrServerName) {
        bstrServerName := bstrServerName is String ? BSTR.Alloc(bstrServerName).Value : bstrServerName

        result := ComCall(8, this, BSTR, bstrServerName, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ReplicaType() {
        result := ComCall(9, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {Integer} lnReplicaType 
     * @returns {HRESULT} 
     */
    put_ReplicaType(lnReplicaType) {
        result := ComCall(10, this, "int", lnReplicaType, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ReplicaNumber() {
        result := ComCall(11, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {Integer} lnReplicaNumber 
     * @returns {HRESULT} 
     */
    put_ReplicaNumber(lnReplicaNumber) {
        result := ComCall(12, this, "int", lnReplicaNumber, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Count() {
        result := ComCall(13, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {Integer} lnCount 
     * @returns {HRESULT} 
     */
    put_Count(lnCount) {
        result := ComCall(14, this, "int", lnCount, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_ReplicaAddressHints() {
        retval := VARIANT()
        result := ComCall(15, this, VARIANT.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {VARIANT} vReplicaAddressHints 
     * @returns {HRESULT} 
     */
    put_ReplicaAddressHints(vReplicaAddressHints) {
        result := ComCall(16, this, VARIANT, vReplicaAddressHints, "HRESULT")
        return result
    }

    Query(iid) {
        if (IADsReplicaPointer.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_ServerName := CallbackCreate(GetMethod(implObj, "get_ServerName"), flags, 2)
        this.vtbl.put_ServerName := CallbackCreate(GetMethod(implObj, "put_ServerName"), flags, 2)
        this.vtbl.get_ReplicaType := CallbackCreate(GetMethod(implObj, "get_ReplicaType"), flags, 2)
        this.vtbl.put_ReplicaType := CallbackCreate(GetMethod(implObj, "put_ReplicaType"), flags, 2)
        this.vtbl.get_ReplicaNumber := CallbackCreate(GetMethod(implObj, "get_ReplicaNumber"), flags, 2)
        this.vtbl.put_ReplicaNumber := CallbackCreate(GetMethod(implObj, "put_ReplicaNumber"), flags, 2)
        this.vtbl.get_Count := CallbackCreate(GetMethod(implObj, "get_Count"), flags, 2)
        this.vtbl.put_Count := CallbackCreate(GetMethod(implObj, "put_Count"), flags, 2)
        this.vtbl.get_ReplicaAddressHints := CallbackCreate(GetMethod(implObj, "get_ReplicaAddressHints"), flags, 2)
        this.vtbl.put_ReplicaAddressHints := CallbackCreate(GetMethod(implObj, "put_ReplicaAddressHints"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_ServerName)
        CallbackFree(this.vtbl.put_ServerName)
        CallbackFree(this.vtbl.get_ReplicaType)
        CallbackFree(this.vtbl.put_ReplicaType)
        CallbackFree(this.vtbl.get_ReplicaNumber)
        CallbackFree(this.vtbl.put_ReplicaNumber)
        CallbackFree(this.vtbl.get_Count)
        CallbackFree(this.vtbl.put_Count)
        CallbackFree(this.vtbl.get_ReplicaAddressHints)
        CallbackFree(this.vtbl.put_ReplicaAddressHints)
    }
}
