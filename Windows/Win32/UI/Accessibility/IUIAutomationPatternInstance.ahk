#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents a control pattern object. The client API wrapper uses this interface to implement all property and method calls in terms of the GetProperty and CallMethod methods.
 * @remarks
 * 
 * This interface is implemented by Microsoft UI Automation and returned by methods such as <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement-getcurrentpattern">GetCurrentPattern</a>. The interface is passed to <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nf-uiautomationcore-iuiautomationpatternhandler-createclientwrapper">CreateClientWrapper</a>, where it is used to call the appropriate methods and property getters.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nn-uiautomationcore-iuiautomationpatterninstance
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IUIAutomationPatternInstance extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUIAutomationPatternInstance
     * @type {Guid}
     */
    static IID => Guid("{c03a7fe4-9431-409f-bed8-ae7c2299bc8d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetProperty", "CallMethod"]

    /**
     * 
     * @param {Integer} index 
     * @param {BOOL} cached 
     * @param {Integer} type 
     * @returns {Void} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-iuiautomationpatterninstance-getproperty
     */
    GetProperty(index, cached, type) {
        result := ComCall(3, this, "uint", index, "int", cached, "int", type, "ptr", &pPtr := 0, "HRESULT")
        return pPtr
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<UIAutomationParameter>} pParams 
     * @param {Integer} cParams 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-iuiautomationpatterninstance-callmethod
     */
    CallMethod(index, pParams, cParams) {
        result := ComCall(4, this, "uint", index, "ptr", pParams, "uint", cParams, "HRESULT")
        return result
    }
}
