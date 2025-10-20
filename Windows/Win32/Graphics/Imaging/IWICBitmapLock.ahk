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
     * 
     * @param {Pointer<UInt32>} puiWidth 
     * @param {Pointer<UInt32>} puiHeight 
     * @returns {HRESULT} 
     */
    GetSize(puiWidth, puiHeight) {
        result := ComCall(3, this, "uint*", puiWidth, "uint*", puiHeight, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pcbStride 
     * @returns {HRESULT} 
     */
    GetStride(pcbStride) {
        result := ComCall(4, this, "uint*", pcbStride, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pcbBufferSize 
     * @param {Pointer<Byte>} ppbData 
     * @returns {HRESULT} 
     */
    GetDataPointer(pcbBufferSize, ppbData) {
        result := ComCall(5, this, "uint*", pcbBufferSize, "char*", ppbData, "int")
        if(result != 0)
            throw OSError(result)

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
        result := ComCall(6, this, "ptr", pPixelFormat, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
