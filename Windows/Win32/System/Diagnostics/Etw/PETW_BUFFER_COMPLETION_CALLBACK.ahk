#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * Function definition for the callback that will be fired when ProcessTraceAddBufferToBufferStream is finished with a buffer. This callback should typically free the buffer as appropriate
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api//content/evntrace/nc-evntrace-petw_buffer_completion_callback
 * @namespace Windows.Win32.System.Diagnostics.Etw
 * @version v4.0.30319
 */
class PETW_BUFFER_COMPLETION_CALLBACK extends IUnknown {

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
     * @param {Pointer<ETW_BUFFER_HEADER>} Buffer_ 
     * @param {Pointer<Void>} CallbackContext 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(Buffer_, CallbackContext) {
        CallbackContextMarshal := CallbackContext is VarRef ? "ptr" : "ptr"

        ComCall(3, this, "ptr", Buffer_, CallbackContextMarshal, CallbackContext)
    }
}
