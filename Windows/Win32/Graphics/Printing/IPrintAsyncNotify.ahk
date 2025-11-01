#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IPrintAsyncNotify extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrintAsyncNotify
     * @type {Guid}
     */
    static IID => Guid("{532818f7-921b-4fb2-bff8-2f4fd52ebebf}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreatePrintAsyncNotifyChannel", "CreatePrintAsyncNotifyRegistration"]

    /**
     * Creates a communication channel between a Print Spooler-hosted printing component, such as a print driver or port monitor, and an application that receives notifications from the component.
     * @param {Integer} param0 
     * @param {Pointer<Guid>} param1 
     * @param {Integer} param2 
     * @param {Integer} param3 
     * @param {IPrintAsyncNotifyCallback} param4 
     * @param {Pointer<IPrintAsyncNotifyChannel>} param5 
     * @returns {HRESULT} <table>
     * <tr>
     * <th>HRESULT</th>
     * <th>Severity</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>S_OK</td>
     * <td>SUCCESS</td>
     * <td>The function completed successfully.</td>
     * </tr>
     * <tr>
     * <td>CHANNEL_ALREADY_OPENED</td>
     * <td>ERROR</td>
     * <td>The channel has already been opened.</td>
     * </tr>
     * <tr>
     * <td>MAX_CHANNEL_COUNT_EXCEEDED</td>
     * <td>ERROR</td>
     * <td>The maximum number of listening applications have already registered for the specified type of notification with the specified queue or print server. The default maximum is 10,000.</td>
     * </tr>
     * </table>
     *  
     * 
     * The return values are COM error codes. Because this function might complete the operation successfully yet return an <b>HRESULT</b> other than S_OK you should use the SUCCEEDED or FAILED macro to determine the success of the call. To get the specific <b>HRESULT</b> that was returned by the function, use the HRESULT_CODE macro.
     * 
     * The following code example shows how these macros can be used to evaluate the return value.
     * 
     * 
     * ```cpp
     * if (SUCCEEDED(hr)){
     *   //Call was successful 
     * }
     * 
     * if (FAILED(hr)) {
     *   // Call failed 
     * }
     * 
     * if (FAILED(hr)) {
     *   // Call failed 
     *   switch (HRESULT_CODE(hr)){
     *     case CHANNEL_ALREADY_OPENED:
     *       // Some action 
     *       break;
     *     case MAX_CHANNEL_COUNT_EXCEEDED:
     *       // Some action 
     *       break;
     *     default:
     *       //Default action 
     *       break;
     *   }
     * } else {
     *   //call succeeded 
     * }
     * 
     * ```
     * 
     * 
     * For more information about COM error codes, see <a href="/windows/desktop/SetupApi/error-handling">Error Handling</a>.
     * 
     * See <a href="/windows/desktop/api/prnasnot/ne-prnasnot-printasyncnotifyerror">PrintAsyncNotifyError</a> for other possible return values.
     * @see https://docs.microsoft.com/windows/win32/api//prnasnot/nf-prnasnot-createprintasyncnotifychannel
     */
    CreatePrintAsyncNotifyChannel(param0, param1, param2, param3, param4, param5) {
        result := ComCall(3, this, "uint", param0, "ptr", param1, "int", param2, "int", param3, "ptr", param4, "ptr*", param5, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} param0 
     * @param {Integer} param1 
     * @param {Integer} param2 
     * @param {IPrintAsyncNotifyCallback} param3 
     * @param {Pointer<IPrintAsyncNotifyRegistration>} param4 
     * @returns {HRESULT} 
     */
    CreatePrintAsyncNotifyRegistration(param0, param1, param2, param3, param4) {
        result := ComCall(4, this, "ptr", param0, "int", param1, "int", param2, "ptr", param3, "ptr*", param4, "HRESULT")
        return result
    }
}
