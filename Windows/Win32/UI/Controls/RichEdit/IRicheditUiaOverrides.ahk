#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Enables the host container of a windowless rich edit control to override the control's Microsoft UI Automation accessibility properties.
 * @see https://docs.microsoft.com/windows/win32/api//textserv/nn-textserv-irichedituiaoverrides
 * @namespace Windows.Win32.UI.Controls.RichEdit
 * @version v4.0.30319
 */
class IRicheditUiaOverrides extends IUnknown{

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} propertyId 
     * @param {Pointer<VARIANT>} pRetValue 
     * @returns {HRESULT} 
     */
    GetPropertyOverrideValue(propertyId, pRetValue) {
        result := ComCall(3, this, "int", propertyId, "ptr", pRetValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
