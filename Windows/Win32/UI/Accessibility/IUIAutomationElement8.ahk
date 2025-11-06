#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUIAutomationElement7.ahk

/**
 * Extends the IUIAutomationElement7 interface.
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nn-uiautomationclient-iuiautomationelement8
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IUIAutomationElement8 extends IUIAutomationElement7{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUIAutomationElement8
     * @type {Guid}
     */
    static IID => Guid("{8c60217d-5411-4cde-bcc0-1ceda223830c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 115

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CurrentHeadingLevel", "get_CachedHeadingLevel"]

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement8-get_currentheadinglevel
     */
    get_CurrentHeadingLevel() {
        result := ComCall(115, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement8-get_cachedheadinglevel
     */
    get_CachedHeadingLevel() {
        result := ComCall(116, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }
}
