#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Exposes methods and properties to support Microsoft UI Automation client access to controls that provide, and are able to switch between, multiple representations of the same set of information or child controls. Implement this interface in order to support the capabilities that an automation client requests with a [GetPattern](../windows.ui.xaml.automation.peers/automationpeer_getpattern_2046576749.md) call and [PatternInterface.MultipleView](../windows.ui.xaml.automation.peers/patterninterface.md).
 * @remarks
 * This pattern has guidelines and conventions that aren't fully documented here. For more info on what this pattern is for, see [MultipleView Control Pattern](/windows/desktop/WinAuto/uiauto-implementingmultipleview).
 * 
 * IMultipleViewProvider isn't implemented by any existing Windows Runtime automation peers. Notably, IMultipleViewProvider doesn't exist for [SemanticZoom](../windows.ui.xaml.controls/semanticzoom.md). The interface exists so that custom control authors can support the automation pattern in a custom control, and implement their automation support using the same Windows Runtime managed or C++ API as they use to define control logic or other automation support.
 * 
 * Use [MultipleViewPatternIdentifiers](../windows.ui.xaml.automation/multipleviewpatternidentifiers.md) if you want to reference the [IGridProvider](igridprovider.md) pattern properties from control code when you fire automation events or call [RaisePropertyChangedEvent](../windows.ui.xaml.automation.peers/automationpeer_raisepropertychangedevent_715050195.md).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.provider.imultipleviewprovider
 * @namespace Windows.UI.Xaml.Automation.Provider
 * @version WindowsRuntime 1.4
 */
class IMultipleViewProvider extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMultipleViewProvider
     * @type {Guid}
     */
    static IID => Guid("{d014e196-0e50-4843-a5d2-c22897c8845a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CurrentView", "GetSupportedViews", "GetViewName", "SetCurrentView"]

    /**
     * Gets the current control-specific view.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.provider.imultipleviewprovider.currentview
     * @type {Integer} 
     */
    CurrentView {
        get => this.get_CurrentView()
    }

    /**
     * Identifies the current view that the control is using to display information or child controls.
     * @remarks
     * The collection of view identifiers must be identical for all instances of a control.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationcore/nf-uiautomationcore-imultipleviewprovider-get_currentview
     */
    get_CurrentView() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Retrieves a collection of control-specific view identifiers. (IMultipleViewProvider.GetSupportedViews)
     * @remarks
     * An empty array is returned by UIAutoCore.dll if the provider does not supply any view identifiers.
     *         
     * 
     * The collection of view identifiers must be identical for all instances of a control.
     *             
     * 
     * View identifier values can be passed to <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nf-uiautomationcore-imultipleviewprovider-getviewname">IMultipleViewProvider::GetViewName</a>.
     * @param {Pointer<Pointer>} result_ 
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationcore/nf-uiautomationcore-imultipleviewprovider-getsupportedviews
     */
    GetSupportedViews(result_) {
        result := ComCall(7, this, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the name of a control-specific view. (IMultipleViewProvider.GetViewName)
     * @remarks
     * View identifiers can be retrieved by using <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcore/nf-uiautomationcore-imultipleviewprovider-getsupportedviews">IMultipleViewProvider::GetSupportedViews</a>.
     *             
     * 
     * The collection of view identifiers must be identical for all instances of a control.
     *             
     * 
     * View names must be suitable for use in text-to-speech, Braille, and other accessible applications.
     * @param {Integer} viewId Type: <b>int</b>
     * 
     * A view identifier.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationcore/nf-uiautomationcore-imultipleviewprovider-getviewname
     */
    GetViewName(viewId) {
        result_ := HSTRING()
        result := ComCall(8, this, "int", viewId, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * Sets the current control-specific view.
     * @param {Integer} viewId A view identifier.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.provider.imultipleviewprovider.setcurrentview
     */
    SetCurrentView(viewId) {
        result := ComCall(9, this, "int", viewId, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
