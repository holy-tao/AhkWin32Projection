#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITextProvider.ahk

/**
 * Extends the ITextProvider interface to enable Microsoft UI Automation providers to expose textual content that is the target of an annotation, and information about a caret that belongs to the provider.
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nn-uiautomationcore-itextprovider2
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class ITextProvider2 extends ITextProvider{
    /**
     * The interface identifier for ITextProvider2
     * @type {Guid}
     */
    static IID => Guid("{0dc5e6ed-3e16-4bf1-8f9a-a979878bc195}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 9

    /**
     * 
     * @param {Pointer<IRawElementProviderSimple>} annotationElement 
     * @param {Pointer<ITextRangeProvider>} pRetVal 
     * @returns {HRESULT} 
     */
    RangeFromAnnotation(annotationElement, pRetVal) {
        result := ComCall(9, this, "ptr", annotationElement, "ptr", pRetVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} isActive 
     * @param {Pointer<ITextRangeProvider>} pRetVal 
     * @returns {HRESULT} 
     */
    GetCaretRange(isActive, pRetVal) {
        result := ComCall(10, this, "ptr", isActive, "ptr", pRetVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
