#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IXFeedItem.ahk" { IXFeedItem }

/**
 * @namespace Windows.Win32.Media.MediaPlayer
 */
export default struct IXFeedItem2 extends IXFeedItem {
    /**
     * The interface identifier for IXFeedItem2
     * @type {Guid}
     */
    static IID := Guid("{6cda2dc7-9013-4522-9970-2a9dd9ead5a3}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IXFeedItem2 interfaces
    */
    struct Vtbl extends IXFeedItem.Vtbl {
        EffectiveId : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IXFeedItem2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {Integer} 
     */
    EffectiveId() {
        result := ComCall(20, this, "uint*", &puiEffectiveId := 0, "HRESULT")
        return puiEffectiveId
    }

    Query(iid) {
        if (IXFeedItem2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.EffectiveId := CallbackCreate(GetMethod(implObj, "EffectiveId"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.EffectiveId)
    }
}
