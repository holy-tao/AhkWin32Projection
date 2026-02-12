#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\Com\IUnknown.ahk

/**
 * Handles the [AnswerRequested](callcontrol_answerrequested.md) and [AudioTransferRequested](callcontrol_audiotransferrequested.md) events.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.devices.callcontroleventhandler
 * @namespace Windows.Media.Devices
 * @version WindowsRuntime 1.4
 */
class CallControlEventHandler extends IUnknown {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for CallControlEventHandler
     * @type {Guid}
     */
    static IID => Guid("{596f759f-50df-4454-bc63-4d3d01b61958}")

    /**
     * The class identifier for CallControlEventHandler
     * @type {Guid}
     */
    static CLSID => Guid("{596f759f-50df-4454-bc63-4d3d01b61958}")

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
     * @returns {HRESULT} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(sender) {
        result := ComCall(3, this, "ptr", sender, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
