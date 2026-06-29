#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\..\Graphics\Direct3D12\ID3D12Resource.ahk" { ID3D12Resource }

/**
 * @namespace Windows.Win32.System.WinRT.ML
 */
export default struct ITensorStaticsNative extends IUnknown {
    /**
     * The interface identifier for ITensorStaticsNative
     * @type {Guid}
     */
    static IID := Guid("{39d055a4-66f6-4ebc-95d9-7a29ebe7690a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITensorStaticsNative interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CreateFromD3D12Resource : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITensorStaticsNative.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {ID3D12Resource} value 
     * @param {Pointer<Integer>} shape 
     * @param {Integer} shapeCount 
     * @returns {IUnknown} 
     */
    CreateFromD3D12Resource(value, shape, shapeCount) {
        shapeMarshal := shape is VarRef ? "int64*" : "ptr"

        result := ComCall(3, this, "ptr", value, shapeMarshal, shape, "int", shapeCount, "ptr*", &result := 0, "HRESULT")
        return IUnknown(result)
    }

    Query(iid) {
        if (ITensorStaticsNative.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateFromD3D12Resource := CallbackCreate(GetMethod(implObj, "CreateFromD3D12Resource"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateFromD3D12Resource)
    }
}
