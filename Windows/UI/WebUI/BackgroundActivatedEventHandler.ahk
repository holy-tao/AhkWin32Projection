#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\Com\IUnknown.ahk

/**
 * Provides info when a background task activates the app.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.backgroundactivatedeventhandler
 * @namespace Windows.UI.WebUI
 * @version WindowsRuntime 1.4
 */
class BackgroundActivatedEventHandler extends IUnknown {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for BackgroundActivatedEventHandler
     * @type {Guid}
     */
    static IID => Guid("{edb19fbb-0761-47cc-9a77-24d7072965ca}")

    /**
     * The class identifier for BackgroundActivatedEventHandler
     * @type {Guid}
     */
    static CLSID => Guid("{edb19fbb-0761-47cc-9a77-24d7072965ca}")

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
     * @param {IBackgroundActivatedEventArgs} eventArgs 
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
