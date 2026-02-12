#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\Com\IUnknown.ahk

/**
 * Represents the method that will handle the [Window.SizeChanged](window_sizechanged.md) event.
 * @remarks
 * The [SizeChanged](window_sizechanged.md) event fires when the [Window](window.md) size changes. There are multiple reasons why the [Window](window.md) size of an app might change. These reasons include changes to device orientation that result in a redraw of the current app UI, or the user resizes the app. By handling the [SizeChanged](window_sizechanged.md) event, an app can determine what the current app view is in order to modify their UI. This gives your app code a chance to assure that the elements are presented correctly for the new window size and shape. If the view state is changing to a narrow width, this often means that you are making choices about which UI elements should remain displayed and which should be hidden until the app is restored to a wider view. [SizeChanged](window_sizechanged.md) is an important event to handle because the multiple views that your UWP app can offer are controlled by the user and can change at any time. 
 * <!--Can they change while app is suspended?-->
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.windowsizechangedeventhandler
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class WindowSizeChangedEventHandler extends IUnknown {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for WindowSizeChangedEventHandler
     * @type {Guid}
     */
    static IID => Guid("{5c21c742-2ced-4fd9-ba38-7118d40e966b}")

    /**
     * The class identifier for WindowSizeChangedEventHandler
     * @type {Guid}
     */
    static CLSID => Guid("{5c21c742-2ced-4fd9-ba38-7118d40e966b}")

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
     * @param {WindowSizeChangedEventArgs} e 
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
