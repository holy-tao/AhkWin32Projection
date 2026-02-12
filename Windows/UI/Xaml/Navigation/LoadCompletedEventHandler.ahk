#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\Com\IUnknown.ahk

/**
 * Represents the method that will handle the [LoadCompleted](../windows.ui.xaml.controls/webview_loadcompleted.md) event.
  * 
  * > [!IMPORTANT]
  * > [LoadCompleted](../windows.ui.xaml.controls/webview_loadcompleted.md) may be altered or unavailable for releases after Windows 8.1. Instead, use [NavigationCompleted](../windows.ui.xaml.controls/webview_navigationcompleted.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.navigation.loadcompletedeventhandler
 * @namespace Windows.UI.Xaml.Navigation
 * @version WindowsRuntime 1.4
 */
class LoadCompletedEventHandler extends IUnknown {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for LoadCompletedEventHandler
     * @type {Guid}
     */
    static IID => Guid("{aebaf785-43fc-4e2c-95c3-97ae84eabc8e}")

    /**
     * The class identifier for LoadCompletedEventHandler
     * @type {Guid}
     */
    static CLSID => Guid("{aebaf785-43fc-4e2c-95c3-97ae84eabc8e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {IInspectable} sender 
     * @param {NavigationEventArgs} e 
     * @returns {HRESULT} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(sender, e) {
        result := ComCall(3, this, "ptr", sender, "ptr", e, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
