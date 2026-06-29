#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IFilter.ahk" { IFilter }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\RECT.ahk" { RECT }
#Import ".\IMAGE_INFO.ahk" { IMAGE_INFO }

/**
 * @namespace Windows.Win32.Storage.IndexServer
 */
export default struct IPixelFilter extends IFilter {
    /**
     * The interface identifier for IPixelFilter
     * @type {Guid}
     */
    static IID := Guid("{3d7df9a7-8da6-4fbf-a45b-7592f06d93a9}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPixelFilter interfaces
    */
    struct Vtbl extends IFilter.Vtbl {
        GetImageInfo      : IntPtr
        GetPixelsForImage : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPixelFilter.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {IMAGE_INFO} 
     */
    GetImageInfo() {
        _imageInfo := IMAGE_INFO()
        result := ComCall(8, this, IMAGE_INFO.Ptr, _imageInfo, "HRESULT")
        return _imageInfo
    }

    /**
     * 
     * @param {Float} scalingFactor 
     * @param {Pointer<RECT>} sourceRect 
     * @param {Integer} pixelBufferSize 
     * @returns {Integer} 
     */
    GetPixelsForImage(scalingFactor, sourceRect, pixelBufferSize) {
        result := ComCall(9, this, "float", scalingFactor, RECT.Ptr, sourceRect, "uint", pixelBufferSize, "char*", &pixelBuffer := 0, "HRESULT")
        return pixelBuffer
    }

    Query(iid) {
        if (IPixelFilter.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetImageInfo := CallbackCreate(GetMethod(implObj, "GetImageInfo"), flags, 2)
        this.vtbl.GetPixelsForImage := CallbackCreate(GetMethod(implObj, "GetPixelsForImage"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetImageInfo)
        CallbackFree(this.vtbl.GetPixelsForImage)
    }
}
