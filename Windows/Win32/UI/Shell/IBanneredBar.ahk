#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * @param {Pointer<Integer>} piIcon 
     * @returns {HRESULT} 
     */
    GetIconSize(piIcon) {
        piIconMarshal := piIcon is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, piIconMarshal, piIcon, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HBITMAP} hBitmap 
     * @returns {HRESULT} 
     */
    SetBitmap(hBitmap) {
        hBitmap := hBitmap is Win32Handle ? NumGet(hBitmap, "ptr") : hBitmap

        result := ComCall(5, this, "ptr", hBitmap, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<HBITMAP>} phBitmap 
     * @returns {HRESULT} 
     */
    GetBitmap(phBitmap) {
        result := ComCall(6, this, "ptr", phBitmap, "HRESULT")
        return result
    }
}
