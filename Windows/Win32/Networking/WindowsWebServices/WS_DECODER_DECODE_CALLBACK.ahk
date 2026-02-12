#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Decodes a message.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api//content/webservices/nc-webservices-ws_decoder_decode_callback
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_DECODER_DECODE_CALLBACK extends IUnknown {

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
     * @param {Pointer<Void>} encoderContext 
     * @param {Pointer} buffer_ 
     * @param {Integer} maxLength 
     * @param {Pointer<WS_ASYNC_CONTEXT>} asyncContext 
     * @param {Pointer<WS_ERROR>} error 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(encoderContext, buffer_, maxLength, asyncContext, error) {
        encoderContextMarshal := encoderContext is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, encoderContextMarshal, encoderContext, "ptr", buffer_, "uint", maxLength, "uint*", &length := 0, "ptr", asyncContext, "ptr", error, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return length
    }
}
