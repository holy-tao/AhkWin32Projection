#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * The IMenuButton interface enables the user to add and manage menu buttons for a snap-in.
 * @see https://docs.microsoft.com/windows/win32/api//mmc/nn-mmc-imenubutton
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class IMenuButton extends IUnknown{
    /**
     * The interface identifier for IMenuButton
     * @type {Guid}
     */
    static IID => Guid("{951ed750-d080-11d0-b197-000000000000}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} idCommand 
     * @param {PWSTR} lpButtonText 
     * @param {PWSTR} lpTooltipText 
     * @returns {HRESULT} 
     */
    AddButton(idCommand, lpButtonText, lpTooltipText) {
        lpButtonText := lpButtonText is String ? StrPtr(lpButtonText) : lpButtonText
        lpTooltipText := lpTooltipText is String ? StrPtr(lpTooltipText) : lpTooltipText

        result := ComCall(3, this, "int", idCommand, "ptr", lpButtonText, "ptr", lpTooltipText, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} idCommand 
     * @param {PWSTR} lpButtonText 
     * @param {PWSTR} lpTooltipText 
     * @returns {HRESULT} 
     */
    SetButton(idCommand, lpButtonText, lpTooltipText) {
        lpButtonText := lpButtonText is String ? StrPtr(lpButtonText) : lpButtonText
        lpTooltipText := lpTooltipText is String ? StrPtr(lpTooltipText) : lpTooltipText

        result := ComCall(4, this, "int", idCommand, "ptr", lpButtonText, "ptr", lpTooltipText, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} idCommand 
     * @param {Integer} nState 
     * @param {BOOL} bState 
     * @returns {HRESULT} 
     */
    SetButtonState(idCommand, nState, bState) {
        result := ComCall(5, this, "int", idCommand, "int", nState, "int", bState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
