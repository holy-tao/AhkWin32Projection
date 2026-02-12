#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\Com\IUnknown.ahk

/**
 * Represents a method that is called when a signal notifier's attached event or semaphore is signaled, or when the optional timeout value has elapsed (whichever comes first).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.system.threading.core.signalhandler
 * @namespace Windows.System.Threading.Core
 * @version WindowsRuntime 1.4
 */
class SignalHandler extends IUnknown {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for SignalHandler
     * @type {Guid}
     */
    static IID => Guid("{923c402e-4721-440e-9dda-55b6f2e07710}")

    /**
     * The class identifier for SignalHandler
     * @type {Guid}
     */
    static CLSID => Guid("{923c402e-4721-440e-9dda-55b6f2e07710}")

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
     * @param {SignalNotifier} signalNotifier_ 
     * @param {Boolean} timedOut 
     * @returns {HRESULT} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(signalNotifier_, timedOut) {
        result := ComCall(3, this, "ptr", signalNotifier_, "int", timedOut, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
