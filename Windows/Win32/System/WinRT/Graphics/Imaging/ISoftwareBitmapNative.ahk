#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\IInspectable.ahk" { IInspectable }

/**
 * Represents a software bitmap.
 * @see https://learn.microsoft.com/windows/win32/api/windows.graphics.imaging.interop/nn-windows-graphics-imaging-interop-isoftwarebitmapnative
 * @namespace Windows.Win32.System.WinRT.Graphics.Imaging
 */
export default struct ISoftwareBitmapNative extends IInspectable {
    /**
     * The interface identifier for ISoftwareBitmapNative
     * @type {Guid}
     */
    static IID := Guid("{94bc8415-04ea-4b2e-af13-4de95aa898eb}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISoftwareBitmapNative interfaces
    */
    struct Vtbl extends IInspectable.Vtbl {
        GetData : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISoftwareBitmapNative.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    GetData(riid) {
        result := ComCall(6, this, Guid.Ptr, riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    Query(iid) {
        if (ISoftwareBitmapNative.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetData := CallbackCreate(GetMethod(implObj, "GetData"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetData)
    }
}
