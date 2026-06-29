#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IEnumUnknown.ahk" { IEnumUnknown }
#Import "..\..\Foundation\POINT.ahk" { POINT }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct IAccStore extends IUnknown {
    /**
     * The interface identifier for IAccStore
     * @type {Guid}
     */
    static IID := Guid("{e2cd4a63-2b72-4d48-b739-95e4765195ba}")

    /**
     * The class identifier for AccStore
     * @type {Guid}
     */
    static CLSID := Guid("{5440837f-4bff-4ae5-a1b1-7722ecc6332a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAccStore interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Register        : IntPtr
        Unregister      : IntPtr
        GetDocuments    : IntPtr
        LookupByHWND    : IntPtr
        LookupByPoint   : IntPtr
        OnDocumentFocus : IntPtr
        GetFocused      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAccStore.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The expert must implement the Register expert function. Network Monitor calls the Register expert function to obtain information about the expert.
     * @remarks
     * The **Version** member of the [**EXPERTENUMINFO**](expertenuminfo.md) structure must be zero.
     * @param {Pointer<Guid>} riid 
     * @param {IUnknown} punk 
     * @returns {HRESULT} If the function is successful, the return value is **TRUE**, and the function returns the requested information.
     * 
     * If the function is unsuccessful, the return value is **FALSE**.
     * @see https://learn.microsoft.com/windows/win32/NetMon2/register-expert
     */
    Register(riid, punk) {
        result := ComCall(3, this, Guid.Ptr, riid, "ptr", punk, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} punk 
     * @returns {HRESULT} 
     */
    Unregister(punk) {
        result := ComCall(4, this, "ptr", punk, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IEnumUnknown} 
     */
    GetDocuments() {
        result := ComCall(5, this, "ptr*", &enumUnknown := 0, "HRESULT")
        return IEnumUnknown(enumUnknown)
    }

    /**
     * 
     * @param {HWND} _hWnd 
     * @param {Pointer<Guid>} riid 
     * @returns {IUnknown} 
     */
    LookupByHWND(_hWnd, riid) {
        result := ComCall(6, this, HWND, _hWnd, Guid.Ptr, riid, "ptr*", &ppunk := 0, "HRESULT")
        return IUnknown(ppunk)
    }

    /**
     * 
     * @param {POINT} pt 
     * @param {Pointer<Guid>} riid 
     * @returns {IUnknown} 
     */
    LookupByPoint(pt, riid) {
        result := ComCall(7, this, POINT, pt, Guid.Ptr, riid, "ptr*", &ppunk := 0, "HRESULT")
        return IUnknown(ppunk)
    }

    /**
     * 
     * @param {IUnknown} punk 
     * @returns {HRESULT} 
     */
    OnDocumentFocus(punk) {
        result := ComCall(8, this, "ptr", punk, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @returns {IUnknown} 
     */
    GetFocused(riid) {
        result := ComCall(9, this, Guid.Ptr, riid, "ptr*", &ppunk := 0, "HRESULT")
        return IUnknown(ppunk)
    }

    Query(iid) {
        if (IAccStore.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Register := CallbackCreate(GetMethod(implObj, "Register"), flags, 3)
        this.vtbl.Unregister := CallbackCreate(GetMethod(implObj, "Unregister"), flags, 2)
        this.vtbl.GetDocuments := CallbackCreate(GetMethod(implObj, "GetDocuments"), flags, 2)
        this.vtbl.LookupByHWND := CallbackCreate(GetMethod(implObj, "LookupByHWND"), flags, 4)
        this.vtbl.LookupByPoint := CallbackCreate(GetMethod(implObj, "LookupByPoint"), flags, 4)
        this.vtbl.OnDocumentFocus := CallbackCreate(GetMethod(implObj, "OnDocumentFocus"), flags, 2)
        this.vtbl.GetFocused := CallbackCreate(GetMethod(implObj, "GetFocused"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Register)
        CallbackFree(this.vtbl.Unregister)
        CallbackFree(this.vtbl.GetDocuments)
        CallbackFree(this.vtbl.LookupByHWND)
        CallbackFree(this.vtbl.LookupByPoint)
        CallbackFree(this.vtbl.OnDocumentFocus)
        CallbackFree(this.vtbl.GetFocused)
    }
}
