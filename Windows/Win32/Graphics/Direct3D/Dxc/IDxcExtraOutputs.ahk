#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IDxcBlobUtf16.ahk" { IDxcBlobUtf16 }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Graphics.Direct3D.Dxc
 */
export default struct IDxcExtraOutputs extends IUnknown {
    /**
     * The interface identifier for IDxcExtraOutputs
     * @type {Guid}
     */
    static IID := Guid("{319b37a2-a5c2-494a-a5de-4801b2faf989}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDxcExtraOutputs interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetOutputCount : IntPtr
        GetOutput      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDxcExtraOutputs.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetOutputCount() {
        result := ComCall(3, this, UInt32)
        return result
    }

    /**
     * 
     * @param {Integer} uIndex 
     * @param {Pointer<Guid>} iid 
     * @param {Pointer<Pointer<Void>>} ppvObject 
     * @param {Pointer<IDxcBlobUtf16>} ppOutputType 
     * @param {Pointer<IDxcBlobUtf16>} ppOutputName 
     * @returns {HRESULT} 
     */
    GetOutput(uIndex, iid, ppvObject, ppOutputType, ppOutputName) {
        ppvObjectMarshal := ppvObject is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, "uint", uIndex, Guid.Ptr, iid, ppvObjectMarshal, ppvObject, IDxcBlobUtf16.Ptr, ppOutputType, IDxcBlobUtf16.Ptr, ppOutputName, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDxcExtraOutputs.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetOutputCount := CallbackCreate(GetMethod(implObj, "GetOutputCount"), flags, 1)
        this.vtbl.GetOutput := CallbackCreate(GetMethod(implObj, "GetOutput"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetOutputCount)
        CallbackFree(this.vtbl.GetOutput)
    }
}
