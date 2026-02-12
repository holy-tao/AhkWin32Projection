#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\Com\IUnknown.ahk

/**
 * Represents a method that is called when a timer created with [CreateTimer](threadpooltimer_createtimer_1268637445.md) or [CreatePeriodicTimer](threadpooltimer_createperiodictimer_1185775417.md) expires.
 * @remarks
 * When a timer is canceled, pending TimerElapsedHandler delegates are also canceled. TimerElapsedHandler delegates that are already running are allowed to finish.
 * @see https://learn.microsoft.com/uwp/api/windows.system.threading.timerelapsedhandler
 * @namespace Windows.System.Threading
 * @version WindowsRuntime 1.4
 */
class TimerElapsedHandler extends IUnknown {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for TimerElapsedHandler
     * @type {Guid}
     */
    static IID => Guid("{faaea667-fbeb-49cb-adb2-71184c556e43}")

    /**
     * The class identifier for TimerElapsedHandler
     * @type {Guid}
     */
    static CLSID => Guid("{faaea667-fbeb-49cb-adb2-71184c556e43}")

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
     * @param {ThreadPoolTimer} timer 
     * @returns {HRESULT} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(timer) {
        result := ComCall(3, this, "ptr", timer, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
