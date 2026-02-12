#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * The EditStreamCallback function is an application defined callback function used with the EM_STREAMIN and EM_STREAMOUT messages.
 * @remarks
 * When you send the <a href="https://msdn.microsoft.com/b8d3a108-b415-4f5e-99e7-0e0e7a82a778">EM_STREAMIN</a> or <a href="https://msdn.microsoft.com/3f14aaac-4b17-47af-8f2b-503390631a88">EM_STREAMOUT</a> message to a rich edit control, the 
 * 				<i>pfnCallback</i> member of the <a href="https://docs.microsoft.com/windows/win32/api/richedit/ns-richedit-editstream">EDITSTREAM</a> structure specifies a pointer to an <i>EditStreamCallback</i> function. The rich edit control repeatedly calls the function to transfer a stream of data into or out of the control. 
 * 
 * When you send the <a href="https://msdn.microsoft.com/b8d3a108-b415-4f5e-99e7-0e0e7a82a778">EM_STREAMIN</a> or <a href="https://msdn.microsoft.com/3f14aaac-4b17-47af-8f2b-503390631a88">EM_STREAMOUT</a> message, you specify a value for the 
 * 				<i>dwCookie</i> member of the <a href="https://docs.microsoft.com/windows/win32/api/richedit/ns-richedit-editstream">EDITSTREAM</a> structure. The rich edit control uses the 
 * 				<i>dwCookie</i> parameter to pass this value to your <i>EditStreamCallback</i> function. For example, you might use 
 * 				<i>dwCookie</i> to pass a handle to an open file. The callback function can then use the 
 * 				<i>dwCookie</i> handle to read from or write to the file. 
 * 
 * The control calls the callback function repeatedly, transferring a portion of the data with each call. The control continues to call the callback function until one of the following conditions occurs: 
 * 
 * <ul>
 * <li>The callback function returns a nonzero value. </li>
 * <li>The callback function returns zero in the *
 * 						<i>pcb</i> parameter. </li>
 * <li>An error occurs that prevents the rich edit control from transferring data into or out of itself. Examples are out-of-memory situations, failure of a system function, or an invalid character in the read buffer. </li>
 * <li>For a stream-in operation, the RTF code contains data specifying the end of an RTF block. </li>
 * <li>For a stream-in operation on a single-line edit control, the callback reads in an end-of-paragraph character (CR, LF, VT, LS, or PS). </li>
 * </ul>
 * @see https://learn.microsoft.com/windows/win32/api//content/richedit/nc-richedit-editstreamcallback
 * @namespace Windows.Win32.UI.Controls.RichEdit
 * @version v4.0.30319
 */
class EDITSTREAMCALLBACK extends IUnknown {

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
     * @param {Pointer} dwCookie 
     * @param {Pointer<Integer>} pbBuff 
     * @param {Integer} cb 
     * @param {Pointer<Integer>} pcb 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(dwCookie, pbBuff, cb, pcb) {
        pbBuffMarshal := pbBuff is VarRef ? "char*" : "ptr"
        pcbMarshal := pcb is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, "ptr", dwCookie, pbBuffMarshal, pbBuff, "int", cb, pcbMarshal, pcb, "uint")
        return result
    }
}
