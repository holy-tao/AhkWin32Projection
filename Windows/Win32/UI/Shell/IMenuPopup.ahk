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
     * 
     * @param {Pointer<POINTL>} ppt 
     * @param {Pointer<RECTL>} prcExclude 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    Popup(ppt, prcExclude, dwFlags) {
        result := ComCall(8, this, "ptr", ppt, "ptr", prcExclude, "int", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwSelectType 
     * @returns {HRESULT} 
     */
    OnSelect(dwSelectType) {
        result := ComCall(9, this, "uint", dwSelectType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMenuPopup>} pmp 
     * @param {BOOL} fSet 
     * @returns {HRESULT} 
     */
    SetSubMenu(pmp, fSet) {
        result := ComCall(10, this, "ptr", pmp, "int", fSet, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
