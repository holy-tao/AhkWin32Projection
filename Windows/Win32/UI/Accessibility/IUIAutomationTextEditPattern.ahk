#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUIAutomationTextRange.ahk
#Include .\IUIAutomationTextPattern.ahk

/**
 * Provides access to a control that modifies text, for example a control that performs auto-correction or enables input composition through an Input Method Editor (IME).
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nn-uiautomationclient-iuiautomationtexteditpattern
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IUIAutomationTextEditPattern extends IUIAutomationTextPattern{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetActiveComposition", "GetConversionTarget"]

    /**
     * 
     * @returns {IUIAutomationTextRange} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtexteditpattern-getactivecomposition
     */
    GetActiveComposition() {
        result := ComCall(9, this, "ptr*", &range := 0, "HRESULT")
        return IUIAutomationTextRange(range)
    }

    /**
     * 
     * @returns {IUIAutomationTextRange} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationtexteditpattern-getconversiontarget
     */
    GetConversionTarget() {
        result := ComCall(10, this, "ptr*", &range := 0, "HRESULT")
        return IUIAutomationTextRange(range)
    }
}
