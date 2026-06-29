#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Graphics\Imaging\IWICBitmap.ahk" { IWICBitmap }
#Import "..\..\..\..\Media\MediaFoundation\MFVideoArea.ahk" { MFVideoArea }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\..\Media\MediaFoundation\IMF2DBuffer2.ahk" { IMF2DBuffer2 }
#Import "..\..\IInspectable.ahk" { IInspectable }
#Import "..\..\..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Creates instances of ISoftwareBitmapNative.
 * @see https://learn.microsoft.com/windows/win32/api/windows.graphics.imaging.interop/nn-windows-graphics-imaging-interop-isoftwarebitmapnativefactory
 * @namespace Windows.Win32.System.WinRT.Graphics.Imaging
 */
export default struct ISoftwareBitmapNativeFactory extends IInspectable {
    /**
     * The interface identifier for ISoftwareBitmapNativeFactory
     * @type {Guid}
     */
    static IID := Guid("{c3c181ec-2914-4791-af02-02d224a10b43}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISoftwareBitmapNativeFactory interfaces
    */
    struct Vtbl extends IInspectable.Vtbl {
        CreateFromWICBitmap   : IntPtr
        CreateFromMF2DBuffer2 : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISoftwareBitmapNativeFactory.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Creates an ISoftwareBitmapNative from the provided IWICBitmap.
     * @param {IWICBitmap} data Type: <b>IWICBitmap*</b>
     * 
     * The source WIC bitmap.
     * @param {BOOL} forceReadOnly Type: <b>BOOL</b>
     * 
     * A value indicating whether the created software bitmap is read-only.
     * 
     * <div class="alert"><b>Note</b>  The read-only access applies only to the Windows Runtime <a href="https://docs.microsoft.com/uwp/api/windows.graphics.imaging.softwarebitmap">SoftwareBitmap</a> object. Access to the underlying WIC bitmap is not restricted.</div>
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * The interface to obtain from the created <a href="https://docs.microsoft.com/uwp/api/windows.graphics.imaging.softwarebitmap">SoftwareBitmap</a> object.
     * This is usually Windows.Graphics.Imaging.ISoftwareBitmap.
     * @returns {Pointer<Void>} Type: <b>LPVOID*</b>
     * 
     * When this method returns successfully, contains the requested interface.
     * @see https://learn.microsoft.com/windows/win32/api/windows.graphics.imaging.interop/nf-windows-graphics-imaging-interop-isoftwarebitmapnativefactory-createfromwicbitmap
     */
    CreateFromWICBitmap(data, forceReadOnly, riid) {
        result := ComCall(6, this, "ptr", data, BOOL, forceReadOnly, Guid.Ptr, riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * Creates an ISoftwareBitmapNative from the provided IMF2DBuffer2.
     * @param {IMF2DBuffer2} data Type: <b>IMF2DBuffer2*</b>
     * 
     * The source buffer containing a two-dimensional surface, such as a video frame.
     * @param {Pointer<Guid>} subtype Type: <b>REFGUID</b>
     * 
     * A GUID specifying the video subtype of the source buffer.
     * @param {Integer} width Type: <b>UINT32</b>
     * 
     * The width of the source surface.
     * @param {Integer} height Type: <b>UINT32</b>
     * 
     * The height of the source surface.
     * @param {BOOL} forceReadOnly Type: <b>BOOL</b>
     * 
     * A value indicating whether the created software bitmap is read-only.
     * 
     * <div class="alert"><b>Note</b>  The read-only access applies only to the Windows Runtime <a href="https://docs.microsoft.com/uwp/api/windows.graphics.imaging.softwarebitmap">SoftwareBitmap</a> object. Access to the underlying Media Foundation buffer is not restricted.</div>
     * @param {Pointer<MFVideoArea>} minDisplayAperture Type: <b>const MFVideoArea*</b>
     * 
     * The rectangular area within the surface that contains valid image data. Use NULL if the full frame is valid.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * The interface to obtain from the created <a href="https://docs.microsoft.com/uwp/api/windows.graphics.imaging.softwarebitmap">SoftwareBitmap</a> object.
     * This is usually Windows.Graphics.Imaging.ISoftwareBitmap.
     * @returns {Pointer<Void>} Type: <b>LPVOID*</b>
     * 
     * When this method returns successfully, contains the requested interface.
     * @see https://learn.microsoft.com/windows/win32/api/windows.graphics.imaging.interop/nf-windows-graphics-imaging-interop-isoftwarebitmapnativefactory-createfrommf2dbuffer2
     */
    CreateFromMF2DBuffer2(data, subtype, width, height, forceReadOnly, minDisplayAperture, riid) {
        result := ComCall(7, this, "ptr", data, Guid.Ptr, subtype, "uint", width, "uint", height, BOOL, forceReadOnly, MFVideoArea.Ptr, minDisplayAperture, Guid.Ptr, riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    Query(iid) {
        if (ISoftwareBitmapNativeFactory.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateFromWICBitmap := CallbackCreate(GetMethod(implObj, "CreateFromWICBitmap"), flags, 5)
        this.vtbl.CreateFromMF2DBuffer2 := CallbackCreate(GetMethod(implObj, "CreateFromMF2DBuffer2"), flags, 9)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateFromWICBitmap)
        CallbackFree(this.vtbl.CreateFromMF2DBuffer2)
    }
}
