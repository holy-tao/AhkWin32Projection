#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that support the Lock method.
 * @remarks
 * 
  * The bitmap lock is simply an abstraction for a rectangular memory window into the bitmap. For the simplest case, a system memory bitmap, this is simply a pointer to the top left corner of the rectangle and a stride value.
  * 
  * To release the exclusive lock set by <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nf-wincodec-iwicbitmap-lock">Lock</a> method and the associated <b>IWICBitmapLock</b> object, call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> on the <b>IWICBitmapLock</b> object.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wincodec/nn-wincodec-iwicbitmaplock
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class IWICBitmapLock extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWICBitmapLock
     * @type {Guid}
     */
    static IID => Guid("{00000123-a8f2-4877-ba0a-fd2b6645fb94}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSize", "GetStride", "GetDataPointer", "GetPixelFormat"]

    /**
     * 
     * @param {Pointer<Integer>} puiWidth 
     * @param {Pointer<Integer>} puiHeight 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicbitmaplock-getsize
     */
    GetSize(puiWidth, puiHeight) {
        puiWidthMarshal := puiWidth is VarRef ? "uint*" : "ptr"
        puiHeightMarshal := puiHeight is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, puiWidthMarshal, puiWidth, puiHeightMarshal, puiHeight, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pcbStride 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicbitmaplock-getstride
     */
    GetStride(pcbStride) {
        pcbStrideMarshal := pcbStride is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, pcbStrideMarshal, pcbStride, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pcbBufferSize 
     * @param {Pointer<Pointer<Integer>>} ppbData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicbitmaplock-getdatapointer
     */
    GetDataPointer(pcbBufferSize, ppbData) {
        pcbBufferSizeMarshal := pcbBufferSize is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, pcbBufferSizeMarshal, pcbBufferSize, "ptr*", ppbData, "HRESULT")
        return result
    }

    /**
     * The GetPixelFormat function obtains the index of the currently selected pixel format of the specified device context.
     * @param {Pointer<Guid>} pPixelFormat 
     * @returns {HRESULT} If the function succeeds, the return value is the currently selected pixel format index of the specified device context. This is a positive, one-based index value.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getpixelformat
     */
    GetPixelFormat(pPixelFormat) {
        result := ComCall(6, this, "ptr", pPixelFormat, "HRESULT")
        return result
    }
}
