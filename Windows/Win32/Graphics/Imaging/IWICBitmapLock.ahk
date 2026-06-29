#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes methods that support the Lock method.
 * @remarks
 * The bitmap lock is simply an abstraction for a rectangular memory window into the bitmap. For the simplest case, a system memory bitmap, this is simply a pointer to the top left corner of the rectangle and a stride value.
 * 
 * To release the exclusive lock set by <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nf-wincodec-iwicbitmap-lock">Lock</a> method and the associated <b>IWICBitmapLock</b> object, call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> on the <b>IWICBitmapLock</b> object.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/nn-wincodec-iwicbitmaplock
 * @namespace Windows.Win32.Graphics.Imaging
 */
export default struct IWICBitmapLock extends IUnknown {
    /**
     * The interface identifier for IWICBitmapLock
     * @type {Guid}
     */
    static IID := Guid("{00000123-a8f2-4877-ba0a-fd2b6645fb94}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWICBitmapLock interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetSize        : IntPtr
        GetStride      : IntPtr
        GetDataPointer : IntPtr
        GetPixelFormat : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWICBitmapLock.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the width and height, in pixels, of the locked rectangle.
     * @param {Pointer<Integer>} puiWidth Type: <b>UINT*</b>
     * 
     * A pointer that receives the width of the locked rectangle.
     * @param {Pointer<Integer>} puiHeight Type: <b>UINT*</b>
     * 
     * A pointer that receives the height of the locked rectangle.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicbitmaplock-getsize
     */
    GetSize(puiWidth, puiHeight) {
        puiWidthMarshal := puiWidth is VarRef ? "uint*" : "ptr"
        puiHeightMarshal := puiHeight is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, puiWidthMarshal, puiWidth, puiHeightMarshal, puiHeight, "HRESULT")
        return result
    }

    /**
     * Provides access to the stride value for the memory.
     * @remarks
     * Note the stride value is specific to the <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmaplock">IWICBitmapLock</a>, not the bitmap. 
     *             For example, two consecutive locks on the same rectangle of a bitmap may return different pointers and stride values, depending on internal implementation.
     * @returns {Integer} Type: <b>UINT*</b>
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicbitmaplock-getstride
     */
    GetStride() {
        result := ComCall(4, this, "uint*", &pcbStride := 0, "HRESULT")
        return pcbStride
    }

    /**
     * Gets the pointer to the top left pixel in the locked rectangle.
     * @remarks
     * The pointer provided by this method should not be used outside of the lifetime of the lock itself.
     * 
     * <b>GetDataPointer</b> is not available in multi-threaded apartment applications.
     * @param {Pointer<Integer>} pcbBufferSize Type: <b>UINT*</b>
     * 
     * A pointer that receives the size of the buffer.
     * @param {Pointer<Pointer<Integer>>} ppbData Type: <b>BYTE**</b>
     * 
     * A pointer that receives a pointer to the top left pixel in the locked rectangle.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicbitmaplock-getdatapointer
     */
    GetDataPointer(pcbBufferSize, ppbData) {
        pcbBufferSizeMarshal := pcbBufferSize is VarRef ? "uint*" : "ptr"
        ppbDataMarshal := ppbData is VarRef ? "ptr*" : "ptr"

        result := ComCall(5, this, pcbBufferSizeMarshal, pcbBufferSize, ppbDataMarshal, ppbData, "HRESULT")
        return result
    }

    /**
     * Gets the pixel format of for the locked area of pixels. This can be used to compute the number of bytes-per-pixel in the locked area.
     * @returns {Guid} Type: <b>WICPixelFormatGUID*</b>
     * 
     * A pointer that receives the pixel format GUID of the locked area.
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicbitmaplock-getpixelformat
     */
    GetPixelFormat() {
        pPixelFormat := Guid()
        result := ComCall(6, this, Guid.Ptr, pPixelFormat, "HRESULT")
        return pPixelFormat
    }

    Query(iid) {
        if (IWICBitmapLock.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetSize := CallbackCreate(GetMethod(implObj, "GetSize"), flags, 3)
        this.vtbl.GetStride := CallbackCreate(GetMethod(implObj, "GetStride"), flags, 2)
        this.vtbl.GetDataPointer := CallbackCreate(GetMethod(implObj, "GetDataPointer"), flags, 3)
        this.vtbl.GetPixelFormat := CallbackCreate(GetMethod(implObj, "GetPixelFormat"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetSize)
        CallbackFree(this.vtbl.GetStride)
        CallbackFree(this.vtbl.GetDataPointer)
        CallbackFree(this.vtbl.GetPixelFormat)
    }
}
