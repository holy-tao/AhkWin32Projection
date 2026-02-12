#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Win32\System\Com\IUnknown.ahk

/**
 * A callback that will be executed on the **DispatcherQueue** thread.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.system.dispatcherqueuehandler
 * @namespace Windows.System
 * @version WindowsRuntime 1.4
 */
class DispatcherQueueHandler extends IUnknown {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for DispatcherQueueHandler
     * @type {Guid}
     */
    static IID => Guid("{dfa2dc9c-1a2d-4917-98f2-939af1d6e0c8}")

    /**
     * The class identifier for DispatcherQueueHandler
     * @type {Guid}
     */
    static CLSID => Guid("{dfa2dc9c-1a2d-4917-98f2-939af1d6e0c8}")

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
     * @returns {HRESULT} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke() {
        result := ComCall(3, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
