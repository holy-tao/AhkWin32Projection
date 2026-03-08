#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\IInspectable.ahk

/**
 * Creates instances of ISoftwareBitmapNative.
 * @see https://learn.microsoft.com/windows/win32/api/windows.graphics.imaging.interop/nn-windows-graphics-imaging-interop-isoftwarebitmapnativefactory
 * @namespace Windows.Win32.System.WinRT.Graphics.Imaging
 * @version v4.0.30319
 */
class ISoftwareBitmapNativeFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISoftwareBitmapNativeFactory
     * @type {Guid}
     */
    static IID => Guid("{c3c181ec-2914-4791-af02-02d224a10b43}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateFromWICBitmap", "CreateFromMF2DBuffer2"]

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
        result := ComCall(6, this, "ptr", data, "int", forceReadOnly, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
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
        result := ComCall(7, this, "ptr", data, "ptr", subtype, "uint", width, "uint", height, "int", forceReadOnly, "ptr", minDisplayAperture, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }
}
