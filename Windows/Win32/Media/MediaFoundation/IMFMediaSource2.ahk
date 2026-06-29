#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMFMediaType.ahk" { IMFMediaType }
#Import ".\IMFMediaSourceEx.ahk" { IMFMediaSourceEx }

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFMediaSource2 extends IMFMediaSourceEx {
    /**
     * The interface identifier for IMFMediaSource2
     * @type {Guid}
     */
    static IID := Guid("{fbb03414-d13b-4786-8319-5ac51fc0a136}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFMediaSource2 interfaces
    */
    struct Vtbl extends IMFMediaSourceEx.Vtbl {
        SetMediaType : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFMediaSource2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} dwStreamID 
     * @param {IMFMediaType} pMediaType 
     * @returns {HRESULT} 
     */
    SetMediaType(dwStreamID, pMediaType) {
        result := ComCall(16, this, "uint", dwStreamID, "ptr", pMediaType, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMFMediaSource2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetMediaType := CallbackCreate(GetMethod(implObj, "SetMediaType"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetMediaType)
    }
}
