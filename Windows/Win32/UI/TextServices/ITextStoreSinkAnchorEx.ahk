#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ITextStoreAnchorSink.ahk" { ITextStoreAnchorSink }

/**
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct ITextStoreSinkAnchorEx extends ITextStoreAnchorSink {
    /**
     * The interface identifier for ITextStoreSinkAnchorEx
     * @type {Guid}
     */
    static IID := Guid("{25642426-028d-4474-977b-111bb114fe3e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITextStoreSinkAnchorEx interfaces
    */
    struct Vtbl extends ITextStoreAnchorSink.Vtbl {
        OnDisconnect : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITextStoreSinkAnchorEx.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    OnDisconnect() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITextStoreSinkAnchorEx.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnDisconnect := CallbackCreate(GetMethod(implObj, "OnDisconnect"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnDisconnect)
    }
}
