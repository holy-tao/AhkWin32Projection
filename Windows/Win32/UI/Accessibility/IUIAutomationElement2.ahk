#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IUIAutomationElementArray.ahk" { IUIAutomationElementArray }
#Import ".\LiveSetting.ahk" { LiveSetting }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\IUIAutomationElement.ahk" { IUIAutomationElement }

/**
 * Extends the IUIAutomationElement interface.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nn-uiautomationclient-iuiautomationelement2
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct IUIAutomationElement2 extends IUIAutomationElement {
    /**
     * The interface identifier for IUIAutomationElement2
     * @type {Guid}
     */
    static IID := Guid("{6749c683-f70d-4487-a698-5f79d55290d6}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUIAutomationElement2 interfaces
    */
    struct Vtbl extends IUIAutomationElement.Vtbl {
        get_CurrentOptimizeForVisualContent : IntPtr
        get_CachedOptimizeForVisualContent  : IntPtr
        get_CurrentLiveSetting              : IntPtr
        get_CachedLiveSetting               : IntPtr
        get_CurrentFlowsFrom                : IntPtr
        get_CachedFlowsFrom                 : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUIAutomationElement2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BOOL} 
     */
    CurrentOptimizeForVisualContent {
        get => this.get_CurrentOptimizeForVisualContent()
    }

    /**
     * @type {BOOL} 
     */
    CachedOptimizeForVisualContent {
        get => this.get_CachedOptimizeForVisualContent()
    }

    /**
     * @type {LiveSetting} 
     */
    CurrentLiveSetting {
        get => this.get_CurrentLiveSetting()
    }

    /**
     * @type {LiveSetting} 
     */
    CachedLiveSetting {
        get => this.get_CachedLiveSetting()
    }

    /**
     * @type {IUIAutomationElementArray} 
     */
    CurrentFlowsFrom {
        get => this.get_CurrentFlowsFrom()
    }

    /**
     * @type {IUIAutomationElementArray} 
     */
    CachedFlowsFrom {
        get => this.get_CachedFlowsFrom()
    }

    /**
     * Indicates whether the provider exposes only elements that are visible.
     * @remarks
     * A value of TRUE indicates that the provider optimizes for visual content, while FALSE indicates that the provider optimizes for virtual content. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-workingwithvirtualizeditems">Working with Virtualized Items</a>.
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement2-get_currentoptimizeforvisualcontent
     */
    get_CurrentOptimizeForVisualContent() {
        result := ComCall(85, this, BOOL.Ptr, &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves a cached value that indicates whether the provider exposes only elements that are visible.
     * @remarks
     * A value of TRUE indicates that the provider optimizes for visual content, while FALSE indicates that the provider optimizes for virtual content. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-workingwithvirtualizeditems">Working with Virtualized Items</a>.
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement2-get_cachedoptimizeforvisualcontent
     */
    get_CachedOptimizeForVisualContent() {
        result := ComCall(86, this, BOOL.Ptr, &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Indicates the type of notifications, if any, that the element sends when the content of the element changes.
     * @remarks
     * This property maps to the Accessible Rich Internet Applications (ARIA)<b> live</b> property.
     * 
     * The LiveSetting property is supported by provider elements that are part of a live region. When the content of a live region changes, the provider element can raise a notification. A client application determines whether to notify the user of the changes based on the value of the LiveSetting property.
     * @returns {LiveSetting} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement2-get_currentlivesetting
     */
    get_CurrentLiveSetting() {
        result := ComCall(87, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves a cached value that indicates the type of notifications, if any, that the element sends when the content of the element changes.
     * @remarks
     * This property maps to the Accessible Rich Internet Applications (ARIA)<b> live</b> property.
     * 
     * The LiveSetting property is supported by provider elements that are part of a live region. When the content of a live region changes, the provider element can raise a notification. A client application determines whether to notify the user of the changes based on the value of the LiveSetting property.
     * @returns {LiveSetting} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement2-get_cachedlivesetting
     */
    get_CachedLiveSetting() {
        result := ComCall(88, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves an array of elements that indicates the reading order before the current element.
     * @remarks
     * This property maps to the Microsoft Accessible Rich Internet Applications (ARIA) <a href="https://docs.microsoft.com/previous-versions/hh969192(v=vs.85)">x-ms-aria-flowfrom</a> property.
     * @returns {IUIAutomationElementArray} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement2-get_currentflowsfrom
     */
    get_CurrentFlowsFrom() {
        result := ComCall(89, this, "ptr*", &retVal := 0, "HRESULT")
        return IUIAutomationElementArray(retVal)
    }

    /**
     * Retrieves a cached array of elements that indicate the reading order before the current element.
     * @remarks
     * This property maps to the Microsoft Accessible Rich Internet Applications (ARIA) <a href="https://docs.microsoft.com/previous-versions/hh969192(v=vs.85)">x-ms-aria-flowfrom</a> property.
     * @returns {IUIAutomationElementArray} 
     * @see https://learn.microsoft.com/windows/win32/api/uiautomationclient/nf-uiautomationclient-iuiautomationelement2-get_cachedflowsfrom
     */
    get_CachedFlowsFrom() {
        result := ComCall(90, this, "ptr*", &retVal := 0, "HRESULT")
        return IUIAutomationElementArray(retVal)
    }

    Query(iid) {
        if (IUIAutomationElement2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_CurrentOptimizeForVisualContent := CallbackCreate(GetMethod(implObj, "get_CurrentOptimizeForVisualContent"), flags, 2)
        this.vtbl.get_CachedOptimizeForVisualContent := CallbackCreate(GetMethod(implObj, "get_CachedOptimizeForVisualContent"), flags, 2)
        this.vtbl.get_CurrentLiveSetting := CallbackCreate(GetMethod(implObj, "get_CurrentLiveSetting"), flags, 2)
        this.vtbl.get_CachedLiveSetting := CallbackCreate(GetMethod(implObj, "get_CachedLiveSetting"), flags, 2)
        this.vtbl.get_CurrentFlowsFrom := CallbackCreate(GetMethod(implObj, "get_CurrentFlowsFrom"), flags, 2)
        this.vtbl.get_CachedFlowsFrom := CallbackCreate(GetMethod(implObj, "get_CachedFlowsFrom"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_CurrentOptimizeForVisualContent)
        CallbackFree(this.vtbl.get_CachedOptimizeForVisualContent)
        CallbackFree(this.vtbl.get_CurrentLiveSetting)
        CallbackFree(this.vtbl.get_CachedLiveSetting)
        CallbackFree(this.vtbl.get_CurrentFlowsFrom)
        CallbackFree(this.vtbl.get_CachedFlowsFrom)
    }
}
