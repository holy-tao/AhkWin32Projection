#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\IReferenceClock.ahk" { IReferenceClock }
#Import ".\IDirectMusic.ahk" { IDirectMusic }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Media.Audio.DirectMusic
 */
export default struct IDirectMusic8 extends IDirectMusic {
    /**
     * The interface identifier for IDirectMusic8
     * @type {Guid}
     */
    static IID := Guid("{2d3629f7-813d-4939-8508-f05c6b75fd97}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDirectMusic8 interfaces
    */
    struct Vtbl extends IDirectMusic.Vtbl {
        SetExternalMasterClock : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDirectMusic8.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IReferenceClock} pClock 
     * @returns {HRESULT} 
     */
    SetExternalMasterClock(pClock) {
        result := ComCall(12, this, "ptr", pClock, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDirectMusic8.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetExternalMasterClock := CallbackCreate(GetMethod(implObj, "SetExternalMasterClock"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetExternalMasterClock)
    }
}
