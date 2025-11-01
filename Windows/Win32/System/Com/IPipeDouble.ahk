#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * Transfers data of the double type (which is 64 bits wide).
 * @remarks
 * 
  * The <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ipipebyte">IPipeByte</a>, <b>IPipeDouble</b>, and <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ipipelong">IPipeLong</a> interfaces are similar to the standard DCE/RPC pipes. However, the COM implementation of pipes offers more flexibility. With the COM implementation, the basic idea is that the pipe is simply another interface with two methods: <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ipipedouble-pull">Pull</a> and <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ipipedouble-push">Push</a>. This results in three main benefits: 
  * 
  * 
  * 
  * <ul>
  * <li>A COM pipe is another interface, so it can be received as an out parameter from a method call and then either <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ipipedouble-pull">Pull</a> or <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ipipedouble-push">Push</a> can be called. </li>
  * <li>There are no restrictions on when to call the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ipipedouble-pull">Pull</a> and <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ipipedouble-push">Push</a> methods, so a pipe is in reality bidirectional. 
  * </li>
  * <li>Pipes are interfaces, so the method calls can be asynchronous and follow those rules.</li>
  * </ul>
  * For more information, see <a href="https://docs.microsoft.com/windows/desktop/Rpc/pipes">Pipes</a> in the RPC documentation.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//objidl/nn-objidl-ipipedouble
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class IPipeDouble extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPipeDouble
     * @type {Guid}
     */
    static IID => Guid("{db2f3ace-2f86-11d1-8e04-00c04fb9989a}")

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
     * 
     * @param {Pointer<Float>} buf 
     * @param {Integer} cRequest 
     * @param {Pointer<Integer>} pcReturned 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nf-objidlbase-ipipedouble-pull
     */
    Pull(buf, cRequest, pcReturned) {
        result := ComCall(3, this, "double*", buf, "uint", cRequest, "uint*", pcReturned, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} buf 
     * @param {Integer} cSent 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nf-objidlbase-ipipedouble-push
     */
    Push(buf, cSent) {
        result := ComCall(4, this, "double*", buf, "uint", cSent, "HRESULT")
        return result
    }
}
