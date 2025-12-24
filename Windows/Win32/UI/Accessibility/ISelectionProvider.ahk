#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides access to controls that act as containers for a collection of individual, selectable child items.
 * @remarks
 * 
 * This interface is implemented by a UI Automation provider.
 * 
 * Providers should raise an event of type <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-event-ids">UIA_Selection_InvalidatedEventId</a> when a selection in a container has changed significantly.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nn-uiautomationcore-iselectionprovider
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class ISelectionProvider extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISelectionProvider
     * @type {Guid}
     */
    static IID => Guid("{fb8b03af-3bdf-48d4-bd36-1a65793be168}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSelection", "get_CanSelectMultiple", "get_IsSelectionRequired"]

    /**
     * @type {BOOL} 
     */
    CanSelectMultiple {
        get => this.get_CanSelectMultiple()
    }

    /**
     * @type {BOOL} 
     */
    IsSelectionRequired {
        get => this.get_IsSelectionRequired()
    }

    /**
     * Retrieves a Microsoft UI Automation provider for each child element that is selected.
     * @returns {Pointer<SAFEARRAY>} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a>**</b>
     * 
     * Receives a pointer to a <a href="https://docs.microsoft.com/windows/win32/api/oaidl/ns-oaidl-safearray">SAFEARRAY</a> that contains an array of pointers to the <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nn-uiautomationcore-irawelementprovidersimple">IRawElementProviderSimple</a> interfaces
     * 				of the selected elements. This parameter is passed uninitialized.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nf-uiautomationcore-iselectionprovider-getselection
     */
    GetSelection() {
        result := ComCall(3, this, "ptr*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    /**
     * Indicates whether the Microsoft UI Automation provider allows more than one child element to be selected concurrently.
     * @remarks
     * 
     * This property may be dynamic. For example, in rare cases a control might allow 
     *         multiple items to be selected on initialization but subsequently allow only single selections to be made.
     * 
     * 
     * @returns {BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nf-uiautomationcore-iselectionprovider-get_canselectmultiple
     */
    get_CanSelectMultiple() {
        result := ComCall(4, this, "int*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    /**
     * Indicates whether the Microsoft UI Automation provider requires at least one child element to be selected.
     * @remarks
     * 
     *        
     *         This property can be dynamic. For example, the initial state of a control might 
     *         not have any items selected by default, meaning that <b>ISelectionProvider::IsSelectionRequired</b> is <b>FALSE</b>. 
     *         However, after an item is selected the control must always have at least one item selected.
     * 
     * 
     * @returns {BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nf-uiautomationcore-iselectionprovider-get_isselectionrequired
     */
    get_IsSelectionRequired() {
        result := ComCall(5, this, "int*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }
}
