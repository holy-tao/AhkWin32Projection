#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\RECT.ahk" { RECT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\Foundation\SIZE.ahk" { SIZE }

/**
 * @namespace Windows.Win32.Media.MediaPlayer
 */
export default struct IWMPNodeRealEstate extends IUnknown {
    /**
     * The interface identifier for IWMPNodeRealEstate
     * @type {Guid}
     */
    static IID := Guid("{42751198-5a50-4460-bcb4-709f8bdc8e59}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMPNodeRealEstate interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetDesiredSize : IntPtr
        SetRects       : IntPtr
        GetRects       : IntPtr
        SetWindowless  : IntPtr
        GetWindowless  : IntPtr
        SetFullScreen  : IntPtr
        GetFullScreen  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMPNodeRealEstate.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<SIZE>} pSize 
     * @returns {HRESULT} 
     */
    GetDesiredSize(pSize) {
        result := ComCall(3, this, SIZE.Ptr, pSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} pSrc 
     * @param {Pointer<RECT>} pDest 
     * @param {Pointer<RECT>} pClip 
     * @returns {HRESULT} 
     */
    SetRects(pSrc, pDest, pClip) {
        result := ComCall(4, this, RECT.Ptr, pSrc, RECT.Ptr, pDest, RECT.Ptr, pClip, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} pSrc 
     * @param {Pointer<RECT>} pDest 
     * @param {Pointer<RECT>} pClip 
     * @returns {HRESULT} 
     */
    GetRects(pSrc, pDest, pClip) {
        result := ComCall(5, this, RECT.Ptr, pSrc, RECT.Ptr, pDest, RECT.Ptr, pClip, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fWindowless 
     * @returns {HRESULT} 
     */
    SetWindowless(fWindowless) {
        result := ComCall(6, this, BOOL, fWindowless, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfWindowless 
     * @returns {HRESULT} 
     */
    GetWindowless(pfWindowless) {
        pfWindowlessMarshal := pfWindowless is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, pfWindowlessMarshal, pfWindowless, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fFullScreen 
     * @returns {HRESULT} 
     */
    SetFullScreen(fFullScreen) {
        result := ComCall(8, this, BOOL, fFullScreen, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfFullScreen 
     * @returns {HRESULT} 
     */
    GetFullScreen(pfFullScreen) {
        pfFullScreenMarshal := pfFullScreen is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, pfFullScreenMarshal, pfFullScreen, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWMPNodeRealEstate.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetDesiredSize := CallbackCreate(GetMethod(implObj, "GetDesiredSize"), flags, 2)
        this.vtbl.SetRects := CallbackCreate(GetMethod(implObj, "SetRects"), flags, 4)
        this.vtbl.GetRects := CallbackCreate(GetMethod(implObj, "GetRects"), flags, 4)
        this.vtbl.SetWindowless := CallbackCreate(GetMethod(implObj, "SetWindowless"), flags, 2)
        this.vtbl.GetWindowless := CallbackCreate(GetMethod(implObj, "GetWindowless"), flags, 2)
        this.vtbl.SetFullScreen := CallbackCreate(GetMethod(implObj, "SetFullScreen"), flags, 2)
        this.vtbl.GetFullScreen := CallbackCreate(GetMethod(implObj, "GetFullScreen"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetDesiredSize)
        CallbackFree(this.vtbl.SetRects)
        CallbackFree(this.vtbl.GetRects)
        CallbackFree(this.vtbl.SetWindowless)
        CallbackFree(this.vtbl.GetWindowless)
        CallbackFree(this.vtbl.SetFullScreen)
        CallbackFree(this.vtbl.GetFullScreen)
    }
}
