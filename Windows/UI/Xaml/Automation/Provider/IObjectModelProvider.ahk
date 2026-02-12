#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Provides access to the underlying object model implemented by a control or app.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.provider.iobjectmodelprovider
 * @namespace Windows.UI.Xaml.Automation.Provider
 * @version WindowsRuntime 1.4
 */
class IObjectModelProvider extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IObjectModelProvider
     * @type {Guid}
     */
    static IID => Guid("{c3ca36b9-0793-4ed0-bbf4-9ff4e0f98f80}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetUnderlyingObjectModel"]

    /**
     * Retrieves an interface used to access the underlying object model of the provider. (IObjectModelProvider.GetUnderlyingObjectModel)
     * @remarks
     * Client applications can use the object model to directly access the content of the control or application.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/windows/win32/api//content/uiautomationcore/nf-uiautomationcore-iobjectmodelprovider-getunderlyingobjectmodel
     */
    GetUnderlyingObjectModel() {
        result := ComCall(6, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(result_)
    }
}
