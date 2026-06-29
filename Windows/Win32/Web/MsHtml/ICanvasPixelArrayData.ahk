#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct ICanvasPixelArrayData extends IUnknown {
    /**
     * The interface identifier for ICanvasPixelArrayData
     * @type {Guid}
     */
    static IID := Guid("{305107f9-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICanvasPixelArrayData interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetBufferPointer : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICanvasPixelArrayData.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<Pointer<Integer>>} ppBuffer 
     * @param {Pointer<Integer>} pBufferLength 
     * @returns {HRESULT} 
     */
    GetBufferPointer(ppBuffer, pBufferLength) {
        ppBufferMarshal := ppBuffer is VarRef ? "ptr*" : "ptr"
        pBufferLengthMarshal := pBufferLength is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, ppBufferMarshal, ppBuffer, pBufferLengthMarshal, pBufferLength, "HRESULT")
        return result
    }

    Query(iid) {
        if (ICanvasPixelArrayData.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetBufferPointer := CallbackCreate(GetMethod(implObj, "GetBufferPointer"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetBufferPointer)
    }
}
