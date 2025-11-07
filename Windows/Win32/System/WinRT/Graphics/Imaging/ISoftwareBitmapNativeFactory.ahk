#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\IInspectable.ahk

/**
 * 
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
     * 
     * @param {IWICBitmap} data 
     * @param {BOOL} forceReadOnly 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/windows.graphics.imaging.interop/nf-windows-graphics-imaging-interop-isoftwarebitmapnativefactory-createfromwicbitmap
     */
    CreateFromWICBitmap(data, forceReadOnly, riid) {
        result := ComCall(6, this, "ptr", data, "int", forceReadOnly, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * 
     * @param {IMF2DBuffer2} data 
     * @param {Pointer<Guid>} subtype 
     * @param {Integer} width 
     * @param {Integer} height 
     * @param {BOOL} forceReadOnly 
     * @param {Pointer<MFVideoArea>} minDisplayAperture 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/windows.graphics.imaging.interop/nf-windows-graphics-imaging-interop-isoftwarebitmapnativefactory-createfrommf2dbuffer2
     */
    CreateFromMF2DBuffer2(data, subtype, width, height, forceReadOnly, minDisplayAperture, riid) {
        result := ComCall(7, this, "ptr", data, "ptr", subtype, "uint", width, "uint", height, "int", forceReadOnly, "ptr", minDisplayAperture, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }
}
