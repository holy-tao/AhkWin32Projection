#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFVideoRendererEffectControl extends IUnknown {
    /**
     * The interface identifier for IMFVideoRendererEffectControl
     * @type {Guid}
     */
    static IID := Guid("{604d33d7-cf23-41d5-8224-5bbbb1a87475}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFVideoRendererEffectControl interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnAppServiceConnectionEstablished : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFVideoRendererEffectControl.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IUnknown} pAppServiceConnection 
     * @returns {HRESULT} 
     */
    OnAppServiceConnectionEstablished(pAppServiceConnection) {
        result := ComCall(3, this, "ptr", pAppServiceConnection, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMFVideoRendererEffectControl.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnAppServiceConnectionEstablished := CallbackCreate(GetMethod(implObj, "OnAppServiceConnectionEstablished"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnAppServiceConnectionEstablished)
    }
}
