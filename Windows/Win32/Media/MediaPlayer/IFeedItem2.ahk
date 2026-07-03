#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IFeedItem.ahk" { IFeedItem }

/**
 * @namespace Windows.Win32.Media.MediaPlayer
 */
export default struct IFeedItem2 extends IFeedItem {
    /**
     * The interface identifier for IFeedItem2
     * @type {Guid}
     */
    static IID := Guid("{79ac9ef4-f9c1-4d2b-a50b-a7ffba4dcf37}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFeedItem2 interfaces
    */
    struct Vtbl extends IFeedItem.Vtbl {
        get_EffectiveId : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFeedItem2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    EffectiveId {
        get => this.get_EffectiveId()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_EffectiveId() {
        result := ComCall(24, this, "int*", &effectiveId := 0, "HRESULT")
        return effectiveId
    }

    Query(iid) {
        if (IFeedItem2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_EffectiveId := CallbackCreate(GetMethod(implObj, "get_EffectiveId"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_EffectiveId)
    }
}
