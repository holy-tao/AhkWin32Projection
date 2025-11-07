#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides access to controls that can cycle through a set of states and maintain a state after it is set.
 * @remarks
 * 
 * Implemented on a Microsoft UI Automation provider that must support the <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-implementingtoggle">Toggle</a> control pattern.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nn-uiautomationcore-itoggleprovider
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IToggleProvider extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IToggleProvider
     * @type {Guid}
     */
    static IID => Guid("{56d00bd0-c4f4-433c-a836-1a52a57e0892}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Toggle", "get_ToggleState"]

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-itoggleprovider-toggle
     */
    Toggle() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-itoggleprovider-get_togglestate
     */
    get_ToggleState() {
        result := ComCall(4, this, "int*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }
}
