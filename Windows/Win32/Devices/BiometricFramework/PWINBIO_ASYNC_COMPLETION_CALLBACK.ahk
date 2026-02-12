#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Notifies the client application that an asynchronous operation started by using WinBioAsyncOpenSession or WinBioAsyncOpenFramework has completed.
 * @remarks
 * You must create this callback if you open a biometric session by using the <a href="https://docs.microsoft.com/windows/desktop/api/winbio/nf-winbio-winbioasyncopensession">WinBioAsyncOpenSession</a> function or the <a href="https://docs.microsoft.com/windows/desktop/api/winbio/nf-winbio-winbioasyncopenframework">WinBioAsyncOpenFramework</a> function and you set  <b>WINBIO_ASYNC_NOTIFY_CALLBACK</b> in the <i>NotificationMethod</i> parameter of either function.
 * 
 * <div class="alert"><b>Important</b>  The <a href="https://docs.microsoft.com/windows/desktop/api/winbio/ns-winbio-winbio_async_result">WINBIO_ASYNC_RESULT</a> structure is allocated internally by the Windows Biometric Framework. Therefore, when you are through using it, call <a href="https://docs.microsoft.com/windows/desktop/api/winbio/nf-winbio-winbiofree">WinBioFree</a> to release the allocated memory and avoid leaks. Because this also releases all nested data structures, you should not keep a copy of any pointers returned in the <b>WINBIO_ASYNC_RESULT</b> structure. If you want to save any data returned in a nested structure, make a private copy of that data before calling <b>WinBioFree</b>.</div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api//content/winbio/nc-winbio-pwinbio_async_completion_callback
 * @namespace Windows.Win32.Devices.BiometricFramework
 * @version v4.0.30319
 */
class PWINBIO_ASYNC_COMPLETION_CALLBACK extends IUnknown {

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
     * @param {Pointer<WINBIO_ASYNC_RESULT>} AsyncResult 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(AsyncResult) {
        ComCall(3, this, "ptr", AsyncResult)
    }
}
