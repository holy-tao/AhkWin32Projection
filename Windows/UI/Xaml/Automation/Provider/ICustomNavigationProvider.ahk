#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Exposes a method to support access by a Microsoft UI Automation client to controls that support a custom navigation order. Implement ICustomNavigationProvider to support the capabilities that an automation client requests with a [GetPattern](../windows.ui.xaml.automation.peers/automationpeer_getpattern_2046576749.md) call and PatternInterface.CustomNavigation.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.provider.icustomnavigationprovider
 * @namespace Windows.UI.Xaml.Automation.Provider
 * @version WindowsRuntime 1.4
 */
class ICustomNavigationProvider extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICustomNavigationProvider
     * @type {Guid}
     */
    static IID => Guid("{2bd8a6d0-2fa3-4717-b28c-4917ce54928d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["NavigateCustom"]

    /**
     * Gets the next element in the specified direction within the logical UI tree.
     * @param {Integer} direction_ The specified direction.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.provider.icustomnavigationprovider.navigatecustom
     */
    NavigateCustom(direction_) {
        result := ComCall(6, this, "int", direction_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(result_)
    }
}
