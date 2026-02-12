#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\Com\IUnknown.ahk

/**
 * Represents the method that handles [CoreWindow](corewindow.md) idle priority dispatch events. It is invoked when [CoreDispatcher.RunIdleAsync](coredispatcher_runidleasync_1309054974.md) is called.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.core.idledispatchedhandler
 * @namespace Windows.UI.Core
 * @version WindowsRuntime 1.4
 */
class IdleDispatchedHandler extends IUnknown {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IdleDispatchedHandler
     * @type {Guid}
     */
    static IID => Guid("{a42b0c24-7f21-4abc-99c1-8f01007f0880}")

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
     * @param {IdleDispatchedHandlerArgs} e 
     * @returns {HRESULT} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(e) {
        result := ComCall(3, this, "ptr", e, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
