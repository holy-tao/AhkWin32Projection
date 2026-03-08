#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * The IPipeDouble (objidlbase.h) interface transfers data of the double type (which is 64 bits wide).
 * @remarks
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
 * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nn-objidlbase-ipipedouble
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
     * The IPipeDouble::Pull (objidlbase.h) method retrieves data of the double integer type from the pipe source.
     * @remarks
     * When the <b>Pull</b> method is called, data is requested from the provider of the pipe. The caller must provide a buffer that will hold at least the number of double integers specified in the <i>cRequest</i> parameter. The proxy will unmarshal the data into the provided buffer and set the number of double integers actually provided in <i>pcReturned</i>. The <i>pcReturned</i> parameter can be less than or equal to <i>cRequest</i>, but it will never be greater. When <i>pcReturned</i> is 0, it indicates that there is no more data.
     * @param {Pointer<Float>} buf A pointer to the memory buffer that receives the data. The buffer must be able to hold at least the number of double integers specified in <i>cRequest</i>.
     * @param {Integer} cRequest The number of double integers requested.
     * @param {Pointer<Integer>} pcReturned The actual number of double integers returned.
     * @returns {HRESULT} This method returns S_OK to indicate that the data was retrieved successfully.
     * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nf-objidlbase-ipipedouble-pull
     */
    Pull(buf, cRequest, pcReturned) {
        bufMarshal := buf is VarRef ? "double*" : "ptr"
        pcReturnedMarshal := pcReturned is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, bufMarshal, buf, "uint", cRequest, pcReturnedMarshal, pcReturned, "HRESULT")
        return result
    }

    /**
     * The IPipeDouble::Push (objidlbase.h) method sends data of the double integer type to the pipe source.
     * @remarks
     * When the <b>Push</b> method is called, the data is being sent to the provider of the pipe. The caller fills the buffer with the data and then calls <b>Push</b>. The number of double integers being sent is specified in the <i>cSent</i> parameter. The caller is responsible for ensuring that the buffer is valid for the duration of the call.
     * 
     * When the last of the data has been pushed, the caller must do one last push of <i>cSent</i> equal to 0 to indicate that the data transfer is complete.
     * @param {Pointer<Float>} buf A pointer to the memory buffer that holds the data to be sent.
     * @param {Integer} cSent The number of double integers in the buffer.
     * @returns {HRESULT} This method returns S_OK to indicate that the data was sent successfully.
     * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nf-objidlbase-ipipedouble-push
     */
    Push(buf, cSent) {
        bufMarshal := buf is VarRef ? "double*" : "ptr"

        result := ComCall(4, this, bufMarshal, buf, "uint", cSent, "HRESULT")
        return result
    }
}
