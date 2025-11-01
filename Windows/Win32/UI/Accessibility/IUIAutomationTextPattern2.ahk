#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUIAutomationTextPattern.ahk

/**
 * Extends the IUIAutomationTextPattern interface.
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nn-uiautomationclient-iuiautomationtextpattern2
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IUIAutomationTextPattern2 extends IUIAutomationTextPattern{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUIAutomationTextPattern2
     * @type {Guid}
     */
    static IID => Guid("{506a921a-fcc9-409f-b23b-37eb74106872}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 9

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RangeFromAnnotation", "GetCaretRange"]

    /**
     * 
     * @param {IUIAutomationElement} annotation 
     * @param {Pointer<IUIAutomationTextRange>} range 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtextpattern2-rangefromannotation
     */
    RangeFromAnnotation(annotation, range) {
        result := ComCall(9, this, "ptr", annotation, "ptr*", range, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} isActive 
     * @param {Pointer<IUIAutomationTextRange>} range 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtextpattern2-getcaretrange
     */
    GetCaretRange(isActive, range) {
        result := ComCall(10, this, "ptr", isActive, "ptr*", range, "HRESULT")
        return result
    }
}
