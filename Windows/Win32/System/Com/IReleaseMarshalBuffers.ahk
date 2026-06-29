#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IUnknown.ahk" { IUnknown }
#Import ".\RPCOLEMESSAGE.ahk" { RPCOLEMESSAGE }

/**
 * @namespace Windows.Win32.System.Com
 */
export default struct IReleaseMarshalBuffers extends IUnknown {
    /**
     * The interface identifier for IReleaseMarshalBuffers
     * @type {Guid}
     */
    static IID := Guid("{eb0cb9e8-7996-11d2-872e-0000f8080859}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IReleaseMarshalBuffers interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        ReleaseMarshalBuffer : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IReleaseMarshalBuffers.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<RPCOLEMESSAGE>} pMsg 
     * @param {Integer} dwFlags 
     * @param {IUnknown} pChnl 
     * @returns {HRESULT} 
     */
    ReleaseMarshalBuffer(pMsg, dwFlags, pChnl) {
        result := ComCall(3, this, RPCOLEMESSAGE.Ptr, pMsg, "uint", dwFlags, "ptr", pChnl, "HRESULT")
        return result
    }

    Query(iid) {
        if (IReleaseMarshalBuffers.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ReleaseMarshalBuffer := CallbackCreate(GetMethod(implObj, "ReleaseMarshalBuffer"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ReleaseMarshalBuffer)
    }
}
