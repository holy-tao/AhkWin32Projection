#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Extends the [ITransformProvider](itransformprovider.md) interface to enable Microsoft UI Automation providers to expose API to support the viewport zooming functionality of a control.
 * @remarks
 * This pattern has guidelines and conventions that aren't fully documented here. For more info on what this pattern is for, see [Transform Control Pattern](/windows/desktop/WinAuto/uiauto-implementingtransform).
 * 
 * 
 * <!--<rem  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"><xref targtype="interface_winrt" rid="w_ui_xaml_auto_prov.itransformprovider2">ITransformProvider2</xref> isn't implemented by any existing <tla rid="winrt"/> automation peers. The interface exists so that custom control authors can support the automation pattern in a custom control, and implement their automation support using the same <tla rid="winrt"/> managed or C++ <tla plural="1" rid="tla_api"/> as they use to define control logic or other automation support.</rem>-->
 * Use the [TransformPattern2Identifiers](../windows.ui.xaml.automation/transformpattern2identifiers.md) class if you want to reference the ITransformProvider2 pattern properties from control code when you call [RaisePropertyChangedEvent](../windows.ui.xaml.automation.peers/automationpeer_raisepropertychangedevent_715050195.md).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.provider.itransformprovider2
 * @namespace Windows.UI.Xaml.Automation.Provider
 * @version WindowsRuntime 1.4
 */
class ITransformProvider2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITransformProvider2
     * @type {Guid}
     */
    static IID => Guid("{a8b11756-a39f-4e97-8c7d-c1ea8dd633c5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CanZoom", "get_ZoomLevel", "get_MaxZoom", "get_MinZoom", "Zoom", "ZoomByUnit"]

    /**
     * Gets a value that indicates whether the control supports zooming of its viewport.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.provider.itransformprovider2.canzoom
     * @type {Boolean} 
     */
    CanZoom {
        get => this.get_CanZoom()
    }

    /**
     * Gets the zoom level of the control's viewport.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.provider.itransformprovider2.zoomlevel
     * @type {Float} 
     */
    ZoomLevel {
        get => this.get_ZoomLevel()
    }

    /**
     * Gets the maximum zoom level of the element.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.provider.itransformprovider2.maxzoom
     * @type {Float} 
     */
    MaxZoom {
        get => this.get_MaxZoom()
    }

    /**
     * Gets the minimum zoom level of the element.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.provider.itransformprovider2.minzoom
     * @type {Float} 
     */
    MinZoom {
        get => this.get_MinZoom()
    }

    /**
     * Indicates whether the control supports zooming of its viewport. (ITransformProvider2.get_CanZoom)
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationcore/nf-uiautomationcore-itransformprovider2-get_canzoom
     */
    get_CanZoom() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Retrieves the current zoom level of the element.
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationcore/nf-uiautomationcore-itransformprovider2-get_zoomlevel
     */
    get_ZoomLevel() {
        result := ComCall(7, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_MaxZoom() {
        result := ComCall(8, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_MinZoom() {
        result := ComCall(9, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Zooms the viewport of the control.
     * @param {Float} zoom The amount to zoom the viewport, specified as a percentage. The provider should zoom the viewport to the nearest supported value.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.provider.itransformprovider2.zoom
     */
    Zoom(zoom) {
        result := ComCall(10, this, "double", zoom, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Zooms the viewport of the control by the specified logical unit.
     * @param {Integer} zoomUnit_ The logical unit by which to increase or decrease the zoom of the viewport.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.provider.itransformprovider2.zoombyunit
     */
    ZoomByUnit(zoomUnit_) {
        result := ComCall(11, this, "int", zoomUnit_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
