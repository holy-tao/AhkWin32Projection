#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ITextProvider.ahk" { ITextProvider }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ITextRangeProvider.ahk" { ITextRangeProvider }

/**
 * Extends the ITextProvider interface to enable Microsoft UI Automation providers to expose programmatic text-edit actions.
 * @remarks
 * Call  the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcoreapi/nf-uiautomationcoreapi-uiaraisetextedittextchangedevent">UiaRaiseTextEditTextChangedEvent</a> function to raise the UI Automation events that notify clients of changes. Use values of <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/ne-uiautomationcore-texteditchangetype">TextEditChangeType</a> to describe the change. Follow the guidance given in <a href="https://docs.microsoft.com/windows/desktop/WinAuto/textedit-control-pattern">TextEdit Control Pattern</a> that describes when to raise the events and what payload the events should pass to UI Automation.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nn-uiautomationcore-itexteditprovider
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct ITextEditProvider extends ITextProvider {
    /**
     * The interface identifier for ITextEditProvider
     * @type {Guid}
     */
    static IID := Guid("{ea3605b4-3a05-400e-b5f9-4e91b40f6176}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITextEditProvider interfaces
    */
    struct Vtbl extends ITextProvider.Vtbl {
        GetActiveComposition : IntPtr
        GetConversionTarget  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITextEditProvider.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Returns the active composition. (ITextEditProvider.GetActiveComposition)
     * @remarks
     * Follow the guidance given in <a href="https://docs.microsoft.com/windows/desktop/WinAuto/textedit-control-pattern">TextEdit Control Pattern</a> that describes how to implement this method and how to raise the related notification events.
     * @returns {ITextRangeProvider} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-itextrangeprovider">ITextRangeProvider</a>**</b>
     * 
     * Pointer to the range of the current conversion (none if there is no conversion).
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-itexteditprovider-getactivecomposition
     */
    GetActiveComposition() {
        result := ComCall(9, this, "ptr*", &pRetVal := 0, "HRESULT")
        return ITextRangeProvider(pRetVal)
    }

    /**
     * Returns the current conversion target range. (ITextEditProvider.GetConversionTarget)
     * @remarks
     * Follow the guidance given in <a href="https://docs.microsoft.com/windows/desktop/WinAuto/textedit-control-pattern">TextEdit Control Pattern</a> that describes how to implement this method and how to raise the related notification events.
     * @returns {ITextRangeProvider} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-itextrangeprovider">ITextRangeProvider</a>**</b>
     * 
     * Pointer to the conversion target range (none if there is no conversion).
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/nf-uiautomationcore-itexteditprovider-getconversiontarget
     */
    GetConversionTarget() {
        result := ComCall(10, this, "ptr*", &pRetVal := 0, "HRESULT")
        return ITextRangeProvider(pRetVal)
    }

    Query(iid) {
        if (ITextEditProvider.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetActiveComposition := CallbackCreate(GetMethod(implObj, "GetActiveComposition"), flags, 2)
        this.vtbl.GetConversionTarget := CallbackCreate(GetMethod(implObj, "GetConversionTarget"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetActiveComposition)
        CallbackFree(this.vtbl.GetConversionTarget)
    }
}
