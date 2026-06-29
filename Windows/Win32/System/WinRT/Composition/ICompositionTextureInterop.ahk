#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.WinRT.Composition
 */
export default struct ICompositionTextureInterop extends IUnknown {
    /**
     * The interface identifier for ICompositionTextureInterop
     * @type {Guid}
     */
    static IID := Guid("{d528a265-f0a5-422f-a39d-ef62d7cd1cc4}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICompositionTextureInterop interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetAvailableFence : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICompositionTextureInterop.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<Integer>} fenceValue 
     * @param {Pointer<Guid>} iid 
     * @param {Pointer<Pointer<Void>>} availableFence 
     * @returns {HRESULT} 
     */
    GetAvailableFence(fenceValue, iid, availableFence) {
        fenceValueMarshal := fenceValue is VarRef ? "uint*" : "ptr"
        availableFenceMarshal := availableFence is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, fenceValueMarshal, fenceValue, Guid.Ptr, iid, availableFenceMarshal, availableFence, "HRESULT")
        return result
    }

    Query(iid) {
        if (ICompositionTextureInterop.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetAvailableFence := CallbackCreate(GetMethod(implObj, "GetAvailableFence"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetAvailableFence)
    }
}
