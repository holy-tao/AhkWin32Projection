#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\Com\IUnknown.ahk

/**
 * Represents a method that handles the app activation event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.activatedeventhandler
 * @namespace Windows.UI.WebUI
 * @version WindowsRuntime 1.4
 */
class ActivatedEventHandler extends IUnknown {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ActivatedEventHandler
     * @type {Guid}
     */
    static IID => Guid("{50f1e730-c5d1-4b6b-9adb-8a11756be29c}")

    /**
     * The class identifier for ActivatedEventHandler
     * @type {Guid}
     */
    static CLSID => Guid("{50f1e730-c5d1-4b6b-9adb-8a11756be29c}")

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
     * @param {IActivatedEventArgs} eventArgs 
     * @returns {HRESULT} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(sender, eventArgs) {
        result := ComCall(3, this, "ptr", sender, "ptr", eventArgs, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
