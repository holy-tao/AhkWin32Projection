#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Called by GINA to specify the context pointer passed by Winlogon as the first parameter to all future calls to GINA functions.
 * @remarks
 * If the GINA must call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/nc-winwlx-pwlx_sas_notify">WlxSasNotify</a> from the <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/nf-winwlx-wlxinitialize">WlxInitialize</a> function, it should first call <b>WlxSetContextPointer</b> to let Winlogon associate a context with the GINA.
 * @see https://learn.microsoft.com/windows/win32/api//content/winwlx/nc-winwlx-pwlx_set_context_pointer
 * @namespace Windows.Win32.Security.WinWlx
 * @version v4.0.30319
 */
class PWLX_SET_CONTEXT_POINTER extends IUnknown {

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
     * @param {HANDLE} hWlx 
     * @param {Pointer<Void>} pWlxContext 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(hWlx, pWlxContext) {
        hWlx := hWlx is Win32Handle ? NumGet(hWlx, "ptr") : hWlx

        pWlxContextMarshal := pWlxContext is VarRef ? "ptr" : "ptr"

        ComCall(3, this, "ptr", hWlx, pWlxContextMarshal, pWlxContext)
    }
}
