#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\UI\ViewManagement\ActivationViewSwitcher.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Provides the object that allows you to set the view for the application.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.iviewswitcherprovider
 * @namespace Windows.ApplicationModel.Activation
 * @version WindowsRuntime 1.4
 */
class IViewSwitcherProvider extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IViewSwitcherProvider
     * @type {Guid}
     */
    static IID => Guid("{33f288a6-5c2c-4d27-bac7-7536088f1219}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ViewSwitcher"]

    /**
     * Provides the view switcher object that allows you to set the view for the application.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.iviewswitcherprovider.viewswitcher
     * @type {ActivationViewSwitcher} 
     */
    ViewSwitcher {
        get => this.get_ViewSwitcher()
    }

    /**
     * 
     * @returns {ActivationViewSwitcher} 
     */
    get_ViewSwitcher() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ActivationViewSwitcher(value)
    }
}
