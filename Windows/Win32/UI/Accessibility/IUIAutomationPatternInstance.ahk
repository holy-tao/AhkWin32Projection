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
     * The client wrapper object implements the IUIAutomation::get_CurrentX and IUIAutomationElement::get_CachedX methods by calling this function, specifying the property by index.
     * @param {Integer} index Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The index of the property.
     * @param {BOOL} cached Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * <b>TRUE</b> if the property should be retrieved from the cache, otherwise <b>FALSE</b>.
     * @param {Integer} type 
     * @returns {Void} Type: <b>void*</b>
     * 
     * Receives the value of the property.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nf-uiautomationcore-iuiautomationpatterninstance-getproperty
     */
    GetProperty(index, cached, type) {
        result := ComCall(3, this, "uint", index, "int", cached, "int", type, "ptr", &pPtr := 0, "HRESULT")
        return pPtr
    }

    /**
     * Client wrapper implements methods by calling this CallMethod function, specifying the parameters as an array of pointers.
     * @param {Integer} index Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The index of the method.
     * @param {Pointer<UIAutomationParameter>} pParams Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/ns-uiautomationcore-uiautomationparameter">UIAutomationParameter</a>*</b>
     * 
     *  A pointer to an array of structures describing the parameters.
     * @param {Integer} cParams Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The count of parameters in <i>pParams</i>.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nf-uiautomationcore-iuiautomationpatterninstance-callmethod
     */
    CallMethod(index, pParams, cParams) {
        result := ComCall(4, this, "uint", index, "ptr", pParams, "uint", cParams, "HRESULT")
        return result
    }
}
