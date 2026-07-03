#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IWICImagingFactory2.ahk" { IWICImagingFactory2 }
#Import "..\IWICBitmapToneMapper.ahk" { IWICBitmapToneMapper }

/**
 * @namespace Windows.Win32.Graphics.Imaging.D2D
 */
export default struct IWICImagingFactory3 extends IWICImagingFactory2 {
    /**
     * The interface identifier for IWICImagingFactory3
     * @type {Guid}
     */
    static IID := Guid("{489b3d8b-624a-4258-b678-7eece70f299d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWICImagingFactory3 interfaces
    */
    struct Vtbl extends IWICImagingFactory2.Vtbl {
        CreateBitmapToneMapper : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWICImagingFactory3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {IWICBitmapToneMapper} 
     */
    CreateBitmapToneMapper() {
        result := ComCall(29, this, "ptr*", &ppToneMapper := 0, "HRESULT")
        return IWICBitmapToneMapper(ppToneMapper)
    }

    Query(iid) {
        if (IWICImagingFactory3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateBitmapToneMapper := CallbackCreate(GetMethod(implObj, "CreateBitmapToneMapper"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateBitmapToneMapper)
    }
}
