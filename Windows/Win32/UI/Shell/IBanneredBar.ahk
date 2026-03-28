#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Graphics\Gdi\HBITMAP.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IBanneredBar extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBanneredBar
     * @type {Guid}
     */
    static IID => Guid("{596a9a94-013e-11d1-8d34-00a0c90f2719}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetIconSize", "GetIconSize", "SetBitmap", "GetBitmap"]

    /**
     * 
     * @param {Integer} iIcon 
     * @returns {HRESULT} 
     */
    SetIconSize(iIcon) {
        result := ComCall(3, this, "uint", iIcon, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetIconSize() {
        result := ComCall(4, this, "uint*", &piIcon := 0, "HRESULT")
        return piIcon
    }

    /**
     * The SetBitmapBits function sets the bits of color data for a bitmap to the specified values.
     * @remarks
     * The array identified by <i>lpBits</i> must be WORD aligned.
     * @param {HBITMAP} _hBitmap 
     * @returns {HRESULT} If the function succeeds, the return value is the number of bytes used in setting the bitmap bits.
     * 
     * If the function fails, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/api/wingdi/nf-wingdi-setbitmapbits
     */
    SetBitmap(_hBitmap) {
        _hBitmap := _hBitmap is Win32Handle ? NumGet(_hBitmap, "ptr") : _hBitmap

        result := ComCall(5, this, "ptr", _hBitmap, "HRESULT")
        return result
    }

    /**
     * The GetBitmapBits function copies the bitmap bits of a specified device-dependent bitmap into a buffer.
     * @returns {HBITMAP} 
     * @see https://learn.microsoft.com/windows/win32/api/wingdi/nf-wingdi-getbitmapbits
     */
    GetBitmap() {
        phBitmap := HBITMAP()
        result := ComCall(6, this, "ptr", phBitmap, "HRESULT")
        return phBitmap
    }
}
