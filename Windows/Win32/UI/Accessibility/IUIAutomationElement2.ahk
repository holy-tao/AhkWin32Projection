#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUIAutomationElementArray.ahk
#Include .\IUIAutomationElement.ahk

/**
 * Extends the IUIAutomationElement interface.
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nn-uiautomationclient-iuiautomationelement2
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IUIAutomationElement2 extends IUIAutomationElement{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUIAutomationElement2
     * @type {Guid}
     */
    static IID => Guid("{6749c683-f70d-4487-a698-5f79d55290d6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 85

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CurrentOptimizeForVisualContent", "get_CachedOptimizeForVisualContent", "get_CurrentLiveSetting", "get_CachedLiveSetting", "get_CurrentFlowsFrom", "get_CachedFlowsFrom"]

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
     * @type {Integer} 
     */
    CurrentLiveSetting {
        get => this.get_CurrentLiveSetting()
    }

    /**
     * @type {Integer} 
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
     * 
     * A value of TRUE indicates that the provider optimizes for visual content, while FALSE indicates that the provider optimizes for virtual content. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-workingwithvirtualizeditems">Working with Virtualized Items</a>.
     * 
     * 
     * @returns {BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationelement2-get_currentoptimizeforvisualcontent
     */
    get_CurrentOptimizeForVisualContent() {
        result := ComCall(85, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves a cached value that indicates whether the provider exposes only elements that are visible.
     * @remarks
     * 
     * A value of TRUE indicates that the provider optimizes for visual content, while FALSE indicates that the provider optimizes for virtual content. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-workingwithvirtualizeditems">Working with Virtualized Items</a>.
     * 
     * 
     * @returns {BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationelement2-get_cachedoptimizeforvisualcontent
     */
    get_CachedOptimizeForVisualContent() {
        result := ComCall(86, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Indicates the type of notifications, if any, that the element sends when the content of the element changes.
     * @remarks
     * 
     * This property maps to the Accessible Rich Internet Applications (ARIA)<b> live</b> property.
     * 
     * The LiveSetting property is supported by provider elements that are part of a live region. When the content of a live region changes, the provider element can raise a notification. A client application determines whether to notify the user of the changes based on the value of the LiveSetting property.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationelement2-get_currentlivesetting
     */
    get_CurrentLiveSetting() {
        result := ComCall(87, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves a cached value that indicates the type of notifications, if any, that the element sends when the content of the element changes.
     * @remarks
     * 
     * This property maps to the Accessible Rich Internet Applications (ARIA)<b> live</b> property.
     * 
     * The LiveSetting property is supported by provider elements that are part of a live region. When the content of a live region changes, the provider element can raise a notification. A client application determines whether to notify the user of the changes based on the value of the LiveSetting property.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationelement2-get_cachedlivesetting
     */
    get_CachedLiveSetting() {
        result := ComCall(88, this, "int*", &retVal := 0, "HRESULT")
        return retVal
    }

    /**
     * Retrieves an array of elements that indicates the reading order before the current element.
     * @remarks
     * 
     * This property maps to the Microsoft Accessible Rich Internet Applications (ARIA) <a href="https://docs.microsoft.com/previous-versions/hh969192(v=vs.85)">x-ms-aria-flowfrom</a> property.
     * 
     * 
     * @returns {IUIAutomationElementArray} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationelement2-get_currentflowsfrom
     */
    get_CurrentFlowsFrom() {
        result := ComCall(89, this, "ptr*", &retVal := 0, "HRESULT")
        return IUIAutomationElementArray(retVal)
    }

    /**
     * Retrieves a cached array of elements that indicate the reading order before the current element.
     * @remarks
     * 
     * This property maps to the Microsoft Accessible Rich Internet Applications (ARIA) <a href="https://docs.microsoft.com/previous-versions/hh969192(v=vs.85)">x-ms-aria-flowfrom</a> property.
     * 
     * 
     * @returns {IUIAutomationElementArray} 
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationclient/nf-uiautomationclient-iuiautomationelement2-get_cachedflowsfrom
     */
    get_CachedFlowsFrom() {
        result := ComCall(90, this, "ptr*", &retVal := 0, "HRESULT")
        return IUIAutomationElementArray(retVal)
    }
}
