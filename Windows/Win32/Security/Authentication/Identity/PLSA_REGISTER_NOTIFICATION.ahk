#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\HANDLE.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class PLSA_REGISTER_NOTIFICATION extends IUnknown {

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
     * @param {Pointer<LPTHREAD_START_ROUTINE>} StartFunction 
     * @param {Pointer<Void>} Parameter 
     * @param {Integer} NotificationType 
     * @param {Integer} NotificationClass 
     * @param {Integer} NotificationFlags 
     * @param {Integer} IntervalMinutes 
     * @param {HANDLE} WaitEvent 
     * @returns {HANDLE} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(StartFunction, Parameter, NotificationType, NotificationClass, NotificationFlags, IntervalMinutes, WaitEvent) {
        WaitEvent := WaitEvent is Win32Handle ? NumGet(WaitEvent, "ptr") : WaitEvent

        ParameterMarshal := Parameter is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, "ptr", StartFunction, ParameterMarshal, Parameter, "uint", NotificationType, "uint", NotificationClass, "uint", NotificationFlags, "uint", IntervalMinutes, "ptr", WaitEvent, "ptr")
        resultHandle := HANDLE({Value: result}, True)
        return resultHandle
    }
}
