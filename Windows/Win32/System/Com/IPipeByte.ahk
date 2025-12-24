#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * Transfers data of the byte type (which is 8 bits wide).
 * @remarks
 * 
 * The <b>IPipeByte</b>, <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ipipedouble">IPipeDouble</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ipipelong">IPipeLong</a> interfaces are similar to the standard DCE/RPC pipes. However, the COM implementation of pipes offers more flexibility. With the COM implementation, the basic idea is that the pipe is simply another interface with two methods: <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ipipebyte-pull">Pull</a> and <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ipipebyte-push">Push</a>. This results in three main benefits:
 * 
 * <ul>
 * <li>A COM pipe is another interface, so it can be received as an out parameter from a method call and then either <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ipipebyte-pull">Pull</a> or <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ipipebyte-push">Push</a> can be called. </li>
 * <li>There are no restrictions on when to call the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ipipebyte-pull">Pull</a> and <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ipipebyte-push">Push</a> methods, so a pipe is in reality bidirectional.</li>
 * <li>Pipes are interfaces, so the method calls can be asynchronous and follow those rules.</li>
 * </ul>
 * For more information, see <a href="https://docs.microsoft.com/windows/desktop/Rpc/pipes">Pipes</a> in the RPC documentation.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//objidl/nn-objidl-ipipebyte
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class IPipeByte extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPipeByte
     * @type {Guid}
     */
    static IID => Guid("{db2f3aca-2f86-11d1-8e04-00c04fb9989a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Pull", "Push"]

    /**
     * Retrieves data of the byte type from the pipe source.
     * @param {Pointer<Integer>} buf A pointer to the memory buffer that receives the data. The buffer must be able to hold at least the number of bytes specified in <i>cRequest</i>.
     * @param {Integer} cRequest The number of bytes requested.
     * @param {Pointer<Integer>} pcReturned The actual number of bytes returned.
     * @returns {HRESULT} This method returns S_OK to indicate that the data was retrieved successfully.
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-ipipebyte-pull
     */
    Pull(buf, cRequest, pcReturned) {
        bufMarshal := buf is VarRef ? "char*" : "ptr"
        pcReturnedMarshal := pcReturned is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, bufMarshal, buf, "uint", cRequest, pcReturnedMarshal, pcReturned, "HRESULT")
        return result
    }

    /**
     * Sends data of the byte type to the pipe source.
     * @param {Pointer<Integer>} buf A pointer to the memory buffer that holds the data to be sent.
     * @param {Integer} cSent The number of bytes in the buffer.
     * @returns {HRESULT} This method returns S_OK to indicate that the data was sent successfully.
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-ipipebyte-push
     */
    Push(buf, cSent) {
        bufMarshal := buf is VarRef ? "char*" : "ptr"

        result := ComCall(4, this, bufMarshal, buf, "uint", cSent, "HRESULT")
        return result
    }
}
