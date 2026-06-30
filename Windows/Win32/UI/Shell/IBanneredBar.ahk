#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Graphics\Gdi\HBITMAP.ahk
#Include ..\..\System\Com\IUnknown.ahk
#Include ..\..\Foundation\HRESULT.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 */
class IBanneredBar extends IUnknown {

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
     * 
     * @param {HBITMAP} _hBitmap 
     * @returns {HRESULT} 
     */
    SetBitmap(_hBitmap) {
        _hBitmap := _hBitmap is Win32Handle ? NumGet(_hBitmap, "ptr") : _hBitmap

        result := ComCall(5, this, "ptr", _hBitmap, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HBITMAP} 
     */
    GetBitmap() {
        phBitmap := HBITMAP({Value: 0}, True)
        result := ComCall(6, this, "ptr", phBitmap, "HRESULT")
        return phBitmap
    }
}
