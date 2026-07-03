#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 */
export default struct IRTCPresenceContact extends IUnknown {
    /**
     * The interface identifier for IRTCPresenceContact
     * @type {Guid}
     */
    static IID := Guid("{8b22f92c-cd90-42db-a733-212205c3e3df}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRTCPresenceContact interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        get_PresentityURI : IntPtr
        put_PresentityURI : IntPtr
        get_Name          : IntPtr
        put_Name          : IntPtr
        get_Data          : IntPtr
        put_Data          : IntPtr
        get_Persistent    : IntPtr
        put_Persistent    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRTCPresenceContact.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    PresentityURI {
        get => this.get_PresentityURI()
        set => this.put_PresentityURI(value)
    }

    /**
     * @type {BSTR} 
     */
    Name {
        get => this.get_Name()
        set => this.put_Name(value)
    }

    /**
     * @type {BSTR} 
     */
    Data {
        get => this.get_Data()
        set => this.put_Data(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    Persistent {
        get => this.get_Persistent()
        set => this.put_Persistent(value)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_PresentityURI() {
        pbstrPresentityURI := BSTR.Owned()
        result := ComCall(3, this, BSTR.Ptr, pbstrPresentityURI, "HRESULT")
        return pbstrPresentityURI
    }

    /**
     * 
     * @param {BSTR} bstrPresentityURI 
     * @returns {HRESULT} 
     */
    put_PresentityURI(bstrPresentityURI) {
        bstrPresentityURI := bstrPresentityURI is String ? BSTR.Alloc(bstrPresentityURI).Value : bstrPresentityURI

        result := ComCall(4, this, BSTR, bstrPresentityURI, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Name() {
        pbstrName := BSTR.Owned()
        result := ComCall(5, this, BSTR.Ptr, pbstrName, "HRESULT")
        return pbstrName
    }

    /**
     * 
     * @param {BSTR} bstrName 
     * @returns {HRESULT} 
     */
    put_Name(bstrName) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(6, this, BSTR, bstrName, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Data() {
        pbstrData := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, pbstrData, "HRESULT")
        return pbstrData
    }

    /**
     * 
     * @param {BSTR} bstrData 
     * @returns {HRESULT} 
     */
    put_Data(bstrData) {
        bstrData := bstrData is String ? BSTR.Alloc(bstrData).Value : bstrData

        result := ComCall(8, this, BSTR, bstrData, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_Persistent() {
        result := ComCall(9, this, VARIANT_BOOL.Ptr, &pfPersistent := 0, "HRESULT")
        return pfPersistent
    }

    /**
     * 
     * @param {VARIANT_BOOL} fPersistent 
     * @returns {HRESULT} 
     */
    put_Persistent(fPersistent) {
        result := ComCall(10, this, VARIANT_BOOL, fPersistent, "HRESULT")
        return result
    }

    Query(iid) {
        if (IRTCPresenceContact.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_PresentityURI := CallbackCreate(GetMethod(implObj, "get_PresentityURI"), flags, 2)
        this.vtbl.put_PresentityURI := CallbackCreate(GetMethod(implObj, "put_PresentityURI"), flags, 2)
        this.vtbl.get_Name := CallbackCreate(GetMethod(implObj, "get_Name"), flags, 2)
        this.vtbl.put_Name := CallbackCreate(GetMethod(implObj, "put_Name"), flags, 2)
        this.vtbl.get_Data := CallbackCreate(GetMethod(implObj, "get_Data"), flags, 2)
        this.vtbl.put_Data := CallbackCreate(GetMethod(implObj, "put_Data"), flags, 2)
        this.vtbl.get_Persistent := CallbackCreate(GetMethod(implObj, "get_Persistent"), flags, 2)
        this.vtbl.put_Persistent := CallbackCreate(GetMethod(implObj, "put_Persistent"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_PresentityURI)
        CallbackFree(this.vtbl.put_PresentityURI)
        CallbackFree(this.vtbl.get_Name)
        CallbackFree(this.vtbl.put_Name)
        CallbackFree(this.vtbl.get_Data)
        CallbackFree(this.vtbl.put_Data)
        CallbackFree(this.vtbl.get_Persistent)
        CallbackFree(this.vtbl.put_Persistent)
    }
}
