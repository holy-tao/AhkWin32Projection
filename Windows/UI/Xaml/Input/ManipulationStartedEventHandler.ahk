#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\Com\IUnknown.ahk

/**
 * Represents the method that will handle [ManipulationStarted](../windows.ui.xaml/uielement_manipulationstarted.md) and related events.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.manipulationstartedeventhandler
 * @namespace Windows.UI.Xaml.Input
 * @version WindowsRuntime 1.4
 */
class ManipulationStartedEventHandler extends IUnknown {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ManipulationStartedEventHandler
     * @type {Guid}
     */
    static IID => Guid("{f88345f8-e0a3-4be2-b90c-dc20e6d8beb0}")

    /**
     * The class identifier for ManipulationStartedEventHandler
     * @type {Guid}
     */
    static CLSID => Guid("{f88345f8-e0a3-4be2-b90c-dc20e6d8beb0}")

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
     * @param {ManipulationStartedRoutedEventArgs} e 
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
