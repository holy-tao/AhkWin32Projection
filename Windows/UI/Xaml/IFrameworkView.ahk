#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Initializes the app view. Called when an app object is launched.
 * @remarks
 * This method is called by [CoreApplication.Run](coreapplication_run_1480028297.md) on the view object that implements this interface. It is the first method called on the view implementation when the app object is activated.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.core.iframeworkview.initialize
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class IFrameworkView extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFrameworkView
     * @type {Guid}
     */
    static IID => Guid("{ddba664b-b603-47aa-942d-3833174f0d80}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => []
}
