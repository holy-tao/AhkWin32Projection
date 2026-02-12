#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\Com\IUnknown.ahk

/**
 * Handles the [RedialRequested](callcontrol_redialrequested.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.devices.redialrequestedeventhandler
 * @namespace Windows.Media.Devices
 * @version WindowsRuntime 1.4
 */
class RedialRequestedEventHandler extends IUnknown {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for RedialRequestedEventHandler
     * @type {Guid}
     */
    static IID => Guid("{baf257d1-4ebd-4b84-9f47-6ec43d75d8b1}")

    /**
     * The class identifier for RedialRequestedEventHandler
     * @type {Guid}
     */
    static CLSID => Guid("{baf257d1-4ebd-4b84-9f47-6ec43d75d8b1}")

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
     * @param {CallControl} sender 
     * @param {RedialRequestedEventArgs} e 
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
