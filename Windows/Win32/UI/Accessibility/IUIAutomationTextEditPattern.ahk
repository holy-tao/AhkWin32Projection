#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUIAutomationTextPattern.ahk

/**
 * Provides access to a control that modifies text, for example a control that performs auto-correction or enables input composition through an Input Method Editor (IME).
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nn-uiautomationclient-iuiautomationtexteditpattern
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IUIAutomationTextEditPattern extends IUIAutomationTextPattern{
    /**
     * The interface identifier for IUIAutomationTextEditPattern
     * @type {Guid}
     */
    static IID => Guid("{17e21576-996c-4870-99d9-bff323380c06}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 9

    /**
     * 
     * @param {Pointer<IUIAutomationTextRange>} range 
     * @returns {HRESULT} 
     */
    GetActiveComposition(range) {
        result := ComCall(9, this, "ptr", range, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUIAutomationTextRange>} range 
     * @returns {HRESULT} 
     */
    GetConversionTarget(range) {
        result := ComCall(10, this, "ptr", range, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
