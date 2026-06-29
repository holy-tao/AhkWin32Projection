#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ITextProvider.ahk" { ITextProvider }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ITextRangeProvider.ahk" { ITextRangeProvider }
#Import ".\IRawElementProviderSimple.ahk" { IRawElementProviderSimple }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Extends the ITextProvider interface to enable Microsoft UI Automation providers to expose textual content that is the target of an annotation, and information about a caret that belongs to the provider.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nn-uiautomationcore-itextprovider2
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct ITextProvider2 extends ITextProvider {
    /**
     * The interface identifier for ITextProvider2
     * @type {Guid}
     */
    static IID := Guid("{0dc5e6ed-3e16-4bf1-8f9a-a979878bc195}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITextProvider2 interfaces
    */
    struct Vtbl extends ITextProvider.Vtbl {
        RangeFromAnnotation : IntPtr
        GetCaretRange       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITextProvider2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Exposes a text range that contains the text that is the target of the annotation associated with the specified annotation element.
     * @param {IRawElementProviderSimple} annotationElement Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-irawelementprovidersimple">IRawElementProviderSimple</a>*</b>
     * 
     * The provider for an element that implements the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-iannotationprovider">IAnnotationProvider</a> interface. The annotation element is a sibling of the element that implements the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-itextprovider2">ITextProvider2</a> interface for the document.
     * @returns {ITextRangeProvider} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-itextrangeprovider">ITextRangeProvider</a>**</b>
     * 
     * Receives a text range that contains the annotation target text.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-itextprovider2-rangefromannotation
     */
    RangeFromAnnotation(annotationElement) {
        result := ComCall(9, this, "ptr", annotationElement, "ptr*", &pRetVal := 0, "HRESULT")
        return ITextRangeProvider(pRetVal)
    }

    /**
     * Provides a zero-length text range at the location of the caret that belongs to the text-based control.
     * @remarks
     * If the <i>isActive</i> parameter is <b>FALSE</b>, the caret that belongs to the text-based control might not be at the same location as the system caret.
     * 
     * This method retrieves a text range that a client can use to find the bounding rectangle of the caret that belongs to the text-based control, or to find the text near the caret.
     * @param {Pointer<BOOL>} isActive Type: <b>BOOL*</b>
     * 
     * <b>TRUE</b> if the text-based control that contains the caret has keyboard focus, otherwise <b>FALSE</b>.
     * @returns {ITextRangeProvider} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-itextrangeprovider">ITextRangeProvider</a>**</b>
     * 
     *  A text range that represents the current location of the caret that belongs to the text-based control.
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-itextprovider2-getcaretrange
     */
    GetCaretRange(isActive) {
        isActiveMarshal := isActive is VarRef ? "int*" : "ptr"

        result := ComCall(10, this, isActiveMarshal, isActive, "ptr*", &pRetVal := 0, "HRESULT")
        return ITextRangeProvider(pRetVal)
    }

    Query(iid) {
        if (ITextProvider2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.RangeFromAnnotation := CallbackCreate(GetMethod(implObj, "RangeFromAnnotation"), flags, 3)
        this.vtbl.GetCaretRange := CallbackCreate(GetMethod(implObj, "GetCaretRange"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.RangeFromAnnotation)
        CallbackFree(this.vtbl.GetCaretRange)
    }
}
