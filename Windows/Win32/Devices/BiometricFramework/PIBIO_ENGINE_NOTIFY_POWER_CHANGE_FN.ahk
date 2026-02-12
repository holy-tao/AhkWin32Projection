#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Receives notification about a change in the computer power state and prepares the engine adapter accordingly.
 * @remarks
 * When it receives a <a href="https://docs.microsoft.com/windows/desktop/Power/pbt-apmpowerstatuschange">PBT_APMPOWERSTATUSCHANGE</a> event, the adapter should call the Microsoft Win32<a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-getsystempowerstatus">GetSystemPowerStatus</a> API to determine the new power status.
 * 
 * 
 * 
 * The biometric framework calls this adapter entry point asynchronously in the context of an arbitrary thread. It is the responsibility of the adapter to synchronize  processing of this call with any other work it may be doing.
 * @see https://learn.microsoft.com/windows/win32/api//content/winbio_adapter/nc-winbio_adapter-pibio_engine_notify_power_change_fn
 * @namespace Windows.Win32.Devices.BiometricFramework
 * @version v4.0.30319
 */
class PIBIO_ENGINE_NOTIFY_POWER_CHANGE_FN extends IUnknown {

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
     * @param {Pointer<WINBIO_PIPELINE>} Pipeline 
     * @param {Integer} PowerEventType 
     * @returns {HRESULT} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(Pipeline, PowerEventType) {
        result := ComCall(3, this, "ptr", Pipeline, "uint", PowerEventType, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
