#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides access to controls that contain text.
 * @remarks
 * 
  * Implemented on a Microsoft UI Automation provider that must support the <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-implementingtextandtextrange">Text</a> control pattern.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nn-uiautomationcore-itextprovider
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class ITextProvider extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITextProvider
     * @type {Guid}
     */
    static IID => Guid("{3589c92c-63f3-4367-99bb-ada653b77cf2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSelection", "GetVisibleRanges", "RangeFromChild", "RangeFromPoint", "get_DocumentRange", "get_SupportedTextSelection"]

    /**
     * 
     * @param {Pointer<Pointer<SAFEARRAY>>} pRetVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-itextprovider-getselection
     */
    GetSelection(pRetVal) {
        result := ComCall(3, this, "ptr*", pRetVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<SAFEARRAY>>} pRetVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-itextprovider-getvisibleranges
     */
    GetVisibleRanges(pRetVal) {
        result := ComCall(4, this, "ptr*", pRetVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IRawElementProviderSimple} childElement 
     * @param {Pointer<ITextRangeProvider>} pRetVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-itextprovider-rangefromchild
     */
    RangeFromChild(childElement, pRetVal) {
        result := ComCall(5, this, "ptr", childElement, "ptr*", pRetVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {UiaPoint} point 
     * @param {Pointer<ITextRangeProvider>} pRetVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-itextprovider-rangefrompoint
     */
    RangeFromPoint(point, pRetVal) {
        result := ComCall(6, this, "ptr", point, "ptr*", pRetVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ITextRangeProvider>} pRetVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-itextprovider-get_documentrange
     */
    get_DocumentRange(pRetVal) {
        result := ComCall(7, this, "ptr*", pRetVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pRetVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-itextprovider-get_supportedtextselection
     */
    get_SupportedTextSelection(pRetVal) {
        result := ComCall(8, this, "int*", pRetVal, "HRESULT")
        return result
    }
}
