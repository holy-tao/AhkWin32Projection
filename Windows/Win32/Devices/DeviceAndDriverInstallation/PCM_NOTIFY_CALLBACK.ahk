#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @version v4.0.30319
 */
class PCM_NOTIFY_CALLBACK extends IUnknown {

    static sizeof => A_PtrSize

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
     * @param {HCMNOTIFICATION} hNotify 
     * @param {Pointer<Void>} Context_ 
     * @param {Integer} Action 
     * @param {Pointer} EventData 
     * @param {Integer} EventDataSize 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(hNotify, Context_, Action, EventData, EventDataSize) {
        hNotify := hNotify is Win32Handle ? NumGet(hNotify, "ptr") : hNotify

        Context_Marshal := Context_ is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, "ptr", hNotify, Context_Marshal, Context_, "int", Action, "ptr", EventData, "uint", EventDataSize, "uint")
        return result
    }
}
