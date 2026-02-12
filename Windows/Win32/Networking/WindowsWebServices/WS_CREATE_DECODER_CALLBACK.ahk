#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Handles creating a decoder instance.
 * @remarks
 * The channel will create decoder instances as necessary.  Each decoder
 *                instance will be called in a single-threaded fashion.  A single decoder 
 *                instance however should not assume that it will see all messages from a
 *                channel, as the channel may use multiple decoder instances for processing
 *                messages.
 * @see https://learn.microsoft.com/windows/win32/api//content/webservices/nc-webservices-ws_create_decoder_callback
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_CREATE_DECODER_CALLBACK extends IUnknown {

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
     * @param {Pointer<Void>} createContext 
     * @param {Pointer<WS_READ_CALLBACK>} readCallback 
     * @param {Pointer<Void>} readContext 
     * @param {Pointer<WS_ERROR>} error 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(createContext, readCallback, readContext, error) {
        createContextMarshal := createContext is VarRef ? "ptr" : "ptr"
        readContextMarshal := readContext is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, createContextMarshal, createContext, "ptr", readCallback, readContextMarshal, readContext, "ptr*", &decoderContext := 0, "ptr", error, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return decoderContext
    }
}
