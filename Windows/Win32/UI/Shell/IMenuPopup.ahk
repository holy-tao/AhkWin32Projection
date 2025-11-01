#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDeskBar.ahk

/**
 * IMenuPopup may be altered or unavailable.
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-imenupopup
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IMenuPopup extends IDeskBar{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMenuPopup
     * @type {Guid}
     */
    static IID => Guid("{d1e7afeb-6a2e-11d0-8c78-00c04fd918b4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Popup", "OnSelect", "SetSubMenu"]

    /**
     * 
     * @param {Pointer<POINTL>} ppt 
     * @param {Pointer<RECTL>} prcExclude 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-imenupopup-popup
     */
    Popup(ppt, prcExclude, dwFlags) {
        result := ComCall(8, this, "ptr", ppt, "ptr", prcExclude, "int", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwSelectType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-imenupopup-onselect
     */
    OnSelect(dwSelectType) {
        result := ComCall(9, this, "uint", dwSelectType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMenuPopup} pmp 
     * @param {BOOL} fSet 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-imenupopup-setsubmenu
     */
    SetSubMenu(pmp, fSet) {
        result := ComCall(10, this, "ptr", pmp, "int", fSet, "HRESULT")
        return result
    }
}
