#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\Com\IUnknown.ahk

/**
 * Handles the [DialRequested](callcontrol_dialrequested.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.devices.dialrequestedeventhandler
 * @namespace Windows.Media.Devices
 * @version WindowsRuntime 1.4
 */
class DialRequestedEventHandler extends IUnknown {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for DialRequestedEventHandler
     * @type {Guid}
     */
    static IID => Guid("{5abbffdb-c21f-4bc4-891b-257e28c1b1a4}")

    /**
     * The class identifier for DialRequestedEventHandler
     * @type {Guid}
     */
    static CLSID => Guid("{5abbffdb-c21f-4bc4-891b-257e28c1b1a4}")

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
     * @param {DialRequestedEventArgs} e 
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
