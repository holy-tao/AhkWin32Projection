#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ITextStoreACPSink.ahk" { ITextStoreACPSink }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct ITextStoreACPSinkEx extends ITextStoreACPSink {
    /**
     * The interface identifier for ITextStoreACPSinkEx
     * @type {Guid}
     */
    static IID := Guid("{2bdf9464-41e2-43e3-950c-a6865ba25cd4}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITextStoreACPSinkEx interfaces
    */
    struct Vtbl extends ITextStoreACPSink.Vtbl {
        OnDisconnect : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITextStoreACPSinkEx.Vtbl()
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
        if (ITextStoreACPSinkEx.IID.Equals(iid)) {
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
