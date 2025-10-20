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
     * 
     * @param {Pointer<Byte>} buf 
     * @param {Integer} cRequest 
     * @param {Pointer<UInt32>} pcReturned 
     * @returns {HRESULT} 
     */
    Pull(buf, cRequest, pcReturned) {
        result := ComCall(3, this, "char*", buf, "uint", cRequest, "uint*", pcReturned, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} buf 
     * @param {Integer} cSent 
     * @returns {HRESULT} 
     */
    Push(buf, cSent) {
        result := ComCall(4, this, "char*", buf, "uint", cSent, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
