#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Used by the WS_XML_READERto read from some source into a buffer.
 * @remarks
 * Returning size of 0 in the <i>actualSize</i> output parameter indicates the end of the file.
 * @see https://learn.microsoft.com/windows/win32/api//content/webservices/nc-webservices-ws_read_callback
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_READ_CALLBACK extends IUnknown {

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
     * @param {Pointer<Void>} callbackState 
     * @param {Pointer} bytes 
     * @param {Integer} maxSize 
     * @param {Pointer<WS_ASYNC_CONTEXT>} asyncContext 
     * @param {Pointer<WS_ERROR>} error 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(callbackState, bytes, maxSize, asyncContext, error) {
        callbackStateMarshal := callbackState is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, callbackStateMarshal, callbackState, "ptr", bytes, "uint", maxSize, "uint*", &actualSize := 0, "ptr", asyncContext, "ptr", error, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return actualSize
    }
}
