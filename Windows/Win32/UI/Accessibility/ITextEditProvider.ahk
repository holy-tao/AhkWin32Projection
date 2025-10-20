#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITextProvider.ahk

/**
 * Extends the ITextProvider interface to enable Microsoft UI Automation providers to expose programmatic text-edit actions.
 * @remarks
 * 
  * Call  the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcoreapi/nf-uiautomationcoreapi-uiaraisetextedittextchangedevent">UiaRaiseTextEditTextChangedEvent</a> function to raise the UI Automation events that notify clients of changes. Use values of <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/ne-uiautomationcore-texteditchangetype">TextEditChangeType</a> to describe the change. Follow the guidance given in <a href="https://docs.microsoft.com/windows/desktop/WinAuto/textedit-control-pattern">TextEdit Control Pattern</a> that describes when to raise the events and what payload the events should pass to UI Automation.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nn-uiautomationcore-itexteditprovider
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class ITextEditProvider extends ITextProvider{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITextEditProvider
     * @type {Guid}
     */
    static IID => Guid("{ea3605b4-3a05-400e-b5f9-4e91b40f6176}")

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
     * @param {Pointer<ITextRangeProvider>} pRetVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-itexteditprovider-getactivecomposition
     */
    GetActiveComposition(pRetVal) {
        result := ComCall(9, this, "ptr*", pRetVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ITextRangeProvider>} pRetVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-itexteditprovider-getconversiontarget
     */
    GetConversionTarget(pRetVal) {
        result := ComCall(10, this, "ptr*", pRetVal, "HRESULT")
        return result
    }
}
