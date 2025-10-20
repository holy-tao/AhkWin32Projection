#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IBanneredBar extends IUnknown{
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
     * 
     * @param {Integer} iIcon 
     * @returns {HRESULT} 
     */
    SetIconSize(iIcon) {
        result := ComCall(3, this, "uint", iIcon, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} piIcon 
     * @returns {HRESULT} 
     */
    GetIconSize(piIcon) {
        result := ComCall(4, this, "uint*", piIcon, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HBITMAP} hBitmap 
     * @returns {HRESULT} 
     */
    SetBitmap(hBitmap) {
        hBitmap := hBitmap is Win32Handle ? NumGet(hBitmap, "ptr") : hBitmap

        result := ComCall(5, this, "ptr", hBitmap, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<HBITMAP>} phBitmap 
     * @returns {HRESULT} 
     */
    GetBitmap(phBitmap) {
        result := ComCall(6, this, "ptr", phBitmap, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
