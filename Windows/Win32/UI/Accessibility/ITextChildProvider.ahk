#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ITextRangeProvider.ahk" { ITextRangeProvider }
#Import ".\IRawElementProviderSimple.ahk" { IRawElementProviderSimple }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides access to a text-based control (or an object embedded in text) that is a child or descendant of another text-based control.
 * @remarks
 * An element that implements the [TextChild control pattern](/windows/desktop/WinAuto/textchild-control-pattern) must be a child, or descendent, of an element that supports the [Text control pattern](/windows/desktop/WinAuto/uiauto-implementingtextandtextrange).
 * 
 * It is not required that this element also implement the [Text control pattern](/windows/desktop/WinAuto/uiauto-implementingtextandtextrange).
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nn-uiautomationcore-itextchildprovider
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct ITextChildProvider extends IUnknown {
    /**
     * The interface identifier for ITextChildProvider
     * @type {Guid}
     */
    static IID := Guid("{4c2de2b9-c88f-4f88-a111-f1d336b7d1a9}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITextChildProvider interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        get_TextContainer : IntPtr
        get_TextRange     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITextChildProvider.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IRawElementProviderSimple} 
     */
    TextContainer {
        get => this.get_TextContainer()
    }

    /**
     * @type {ITextRangeProvider} 
     */
    TextRange {
        get => this.get_TextRange()
    }

    /**
     * Retrieves this element's nearest ancestor provider that supports the Text control pattern.
     * @returns {IRawElementProviderSimple} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-itextchildprovider-get_textcontainer
     */
    get_TextContainer() {
        result := ComCall(3, this, "ptr*", &pRetVal := 0, "HRESULT")
        return IRawElementProviderSimple(pRetVal)
    }

    /**
     * Retrieves a text range that encloses this child element. (ITextChildProvider.get_TextRange)
     * @returns {ITextRangeProvider} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-itextchildprovider-get_textrange
     */
    get_TextRange() {
        result := ComCall(4, this, "ptr*", &pRetVal := 0, "HRESULT")
        return ITextRangeProvider(pRetVal)
    }

    Query(iid) {
        if (ITextChildProvider.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_TextContainer := CallbackCreate(GetMethod(implObj, "get_TextContainer"), flags, 2)
        this.vtbl.get_TextRange := CallbackCreate(GetMethod(implObj, "get_TextRange"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_TextContainer)
        CallbackFree(this.vtbl.get_TextRange)
    }
}
