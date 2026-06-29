#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\Foundation\SIZE.ahk" { SIZE }

/**
 * @namespace Windows.Win32.Media.MediaPlayer
 */
export default struct IWMPNodeRealEstateHost extends IUnknown {
    /**
     * The interface identifier for IWMPNodeRealEstateHost
     * @type {Guid}
     */
    static IID := Guid("{1491087d-2c6b-44c8-b019-b3c929d2ada9}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMPNodeRealEstateHost interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnDesiredSizeChange    : IntPtr
        OnFullScreenTransition : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMPNodeRealEstateHost.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<SIZE>} pSize 
     * @returns {HRESULT} 
     */
    OnDesiredSizeChange(pSize) {
        result := ComCall(3, this, SIZE.Ptr, pSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fFullScreen 
     * @returns {HRESULT} 
     */
    OnFullScreenTransition(fFullScreen) {
        result := ComCall(4, this, BOOL, fFullScreen, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWMPNodeRealEstateHost.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnDesiredSizeChange := CallbackCreate(GetMethod(implObj, "OnDesiredSizeChange"), flags, 2)
        this.vtbl.OnFullScreenTransition := CallbackCreate(GetMethod(implObj, "OnFullScreenTransition"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnDesiredSizeChange)
        CallbackFree(this.vtbl.OnFullScreenTransition)
    }
}
