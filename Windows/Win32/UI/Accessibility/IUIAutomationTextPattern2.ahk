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
     * 
     * @param {Pointer<IUIAutomationElement>} annotation 
     * @param {Pointer<IUIAutomationTextRange>} range 
     * @returns {HRESULT} 
     */
    RangeFromAnnotation(annotation, range) {
        result := ComCall(9, this, "ptr", annotation, "ptr", range, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} isActive 
     * @param {Pointer<IUIAutomationTextRange>} range 
     * @returns {HRESULT} 
     */
    GetCaretRange(isActive, range) {
        result := ComCall(10, this, "ptr", isActive, "ptr", range, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
