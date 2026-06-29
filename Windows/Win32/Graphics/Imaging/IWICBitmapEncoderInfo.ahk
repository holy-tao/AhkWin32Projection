#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IWICBitmapCodecInfo.ahk" { IWICBitmapCodecInfo }
#Import ".\IWICBitmapEncoder.ahk" { IWICBitmapEncoder }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Exposes methods that provide information about an encoder.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/nn-wincodec-iwicbitmapencoderinfo
 * @namespace Windows.Win32.Graphics.Imaging
 */
export default struct IWICBitmapEncoderInfo extends IWICBitmapCodecInfo {
    /**
     * The interface identifier for IWICBitmapEncoderInfo
     * @type {Guid}
     */
    static IID := Guid("{94c9b4ee-a09f-4f92-8a1e-4a9bce7e76fb}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWICBitmapEncoderInfo interfaces
    */
    struct Vtbl extends IWICBitmapCodecInfo.Vtbl {
        CreateInstance : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWICBitmapEncoderInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Creates a new IWICBitmapEncoder instance.
     * @returns {IWICBitmapEncoder} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapencoder">IWICBitmapEncoder</a>**</b>
     * 
     * A pointer that receives a pointer to a new <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapencoder">IWICBitmapEncoder</a> instance.
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicbitmapencoderinfo-createinstance
     */
    CreateInstance() {
        result := ComCall(23, this, "ptr*", &ppIBitmapEncoder := 0, "HRESULT")
        return IWICBitmapEncoder(ppIBitmapEncoder)
    }

    Query(iid) {
        if (IWICBitmapEncoderInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateInstance := CallbackCreate(GetMethod(implObj, "CreateInstance"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateInstance)
    }
}
