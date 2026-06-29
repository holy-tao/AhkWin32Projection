#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IImageDecodeEventSink.ahk" { IImageDecodeEventSink }
#Import "..\..\Graphics\Gdi\RGBQUAD.ahk" { RGBQUAD }

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 */
export default struct IDithererImpl extends IUnknown {
    /**
     * The interface identifier for IDithererImpl
     * @type {Guid}
     */
    static IID := Guid("{7c48e840-3910-11d0-86fc-00a0c913f750}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDithererImpl interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetDestColorTable : IntPtr
        SetEventSink      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDithererImpl.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} nColors 
     * @param {Pointer<RGBQUAD>} prgbColors 
     * @returns {HRESULT} 
     */
    SetDestColorTable(nColors, prgbColors) {
        result := ComCall(3, this, "uint", nColors, RGBQUAD.Ptr, prgbColors, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IImageDecodeEventSink} pEventSink 
     * @returns {HRESULT} 
     */
    SetEventSink(pEventSink) {
        result := ComCall(4, this, "ptr", pEventSink, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDithererImpl.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetDestColorTable := CallbackCreate(GetMethod(implObj, "SetDestColorTable"), flags, 3)
        this.vtbl.SetEventSink := CallbackCreate(GetMethod(implObj, "SetEventSink"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetDestColorTable)
        CallbackFree(this.vtbl.SetEventSink)
    }
}
