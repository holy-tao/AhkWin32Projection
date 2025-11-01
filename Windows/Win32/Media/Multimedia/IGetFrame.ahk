#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IGetFrame interface supports extracting, decompressing, and displaying individual frames from an open stream.
 * @see https://docs.microsoft.com/windows/win32/api//vfw/nn-vfw-igetframe
 * @namespace Windows.Win32.Media.Multimedia
 * @version v4.0.30319
 */
class IGetFrame extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGetFrame
     * @type {Guid}
     */
    static IID => Guid("{00020023-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetFrame", "Begin", "End", "SetFormat"]

    /**
     * 
     * @param {Integer} lPos 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-igetframe-getframe
     */
    GetFrame(lPos) {
        result := ComCall(3, this, "int", lPos, "ptr")
        return result
    }

    /**
     * 
     * @param {Integer} lStart 
     * @param {Integer} lEnd 
     * @param {Integer} lRate 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-igetframe-begin
     */
    Begin(lStart, lEnd, lRate) {
        result := ComCall(4, this, "int", lStart, "int", lEnd, "int", lRate, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-igetframe-end
     */
    End() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BITMAPINFOHEADER>} lpbi 
     * @param {Pointer<Void>} lpBits 
     * @param {Integer} x 
     * @param {Integer} y 
     * @param {Integer} dx 
     * @param {Integer} dy 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vfw/nf-vfw-igetframe-setformat
     */
    SetFormat(lpbi, lpBits, x, y, dx, dy) {
        lpBitsMarshal := lpBits is VarRef ? "ptr" : "ptr"

        result := ComCall(6, this, "ptr", lpbi, lpBitsMarshal, lpBits, "int", x, "int", y, "int", dx, "int", dy, "HRESULT")
        return result
    }
}
