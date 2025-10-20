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
     * 
     * @param {Integer} lPos 
     * @returns {Pointer<Void>} 
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
     */
    Begin(lStart, lEnd, lRate) {
        result := ComCall(4, this, "int", lStart, "int", lEnd, "int", lRate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    End() {
        result := ComCall(5, this, "int")
        if(result != 0)
            throw OSError(result)

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
     */
    SetFormat(lpbi, lpBits, x, y, dx, dy) {
        result := ComCall(6, this, "ptr", lpbi, "ptr", lpBits, "int", x, "int", y, "int", dx, "int", dy, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
