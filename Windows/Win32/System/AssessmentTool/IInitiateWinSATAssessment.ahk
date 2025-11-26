#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Initiates an assessment.
 * @see https://docs.microsoft.com/windows/win32/api//winsatcominterfacei/nn-winsatcominterfacei-iinitiatewinsatassessment
 * @namespace Windows.Win32.System.AssessmentTool
 * @version v4.0.30319
 */
class IInitiateWinSATAssessment extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInitiateWinSATAssessment
     * @type {Guid}
     */
    static IID => Guid("{d983fc50-f5bf-49d5-b5ed-cccb18aa7fc1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InitiateAssessment", "InitiateFormalAssessment", "CancelAssessment"]

    /**
     * Initiates an ad hoc assessment.
     * @param {PWSTR} cmdLine Command-line arguments to pass to WinSAT. The command line cannot be empty. For command line usage, see <a href="https://docs.microsoft.com/previous-versions/windows/it-pro/windows-server-2012-R2-and-2012/cc770542(v=ws.11)">WinSAT Command Reference</a> on Microsoft TechNet.
     * @param {IWinSATInitiateEvents} pCallbacks An <a href="https://docs.microsoft.com/windows/desktop/api/winsatcominterfacei/nn-winsatcominterfacei-iwinsatinitiateevents">IWinSATInitiateEvents</a> interface that you implement to receive notification when the assessment finishes or makes progress. Can be <b>NULL</b> if you do not want to receive notifications.
     * @param {HWND} callerHwnd The window handle of your client. The handle is used to center the WinSAT dialog boxes. If <b>NULL</b>, the dialog boxes are centered on the desktop.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * 
     * This following table lists some of the HRESULT values that this method returns.
     * 
     * 
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * WinSAT successfully started. To determine if the assessment ran successfully, implement the <a href="/windows/desktop/api/winsatcominterfacei/nf-winsatcominterfacei-iwinsatinitiateevents-winsatcomplete">IWinSATInitiateEvents::WinSATComplete</a> method and check the value of the <i>hresult</i> parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WINSAT_ERROR_COMMAND_LINE_EMPTY</b></dt>
     * <dt>0x80040009</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The command line cannot be empty; you must provide command-line arguments.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WINSAT_ERROR_COMMAND_LINE_TOO_LONG</b></dt>
     * <dt>0x8004000A</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The command line is too long.  The maximum length is 30,720 bytes.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WINSAT_ERROR_WINSAT_DOES_NOT_EXIST</b></dt>
     * <dt>0x80040011</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Could not find the WinSAT program where expected.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsatcominterfacei/nf-winsatcominterfacei-iinitiatewinsatassessment-initiateassessment
     */
    InitiateAssessment(cmdLine, pCallbacks, callerHwnd) {
        cmdLine := cmdLine is String ? StrPtr(cmdLine) : cmdLine
        callerHwnd := callerHwnd is Win32Handle ? NumGet(callerHwnd, "ptr") : callerHwnd

        result := ComCall(3, this, "ptr", cmdLine, "ptr", pCallbacks, "ptr", callerHwnd, "HRESULT")
        return result
    }

    /**
     * Initiates a formal assessment.
     * @param {IWinSATInitiateEvents} pCallbacks An <a href="https://docs.microsoft.com/windows/desktop/api/winsatcominterfacei/nn-winsatcominterfacei-iwinsatinitiateevents">IWinSATInitiateEvents</a> interface that you implement to receive notification when the assessment finishes or makes progress. Can be <b>NULL</b> if you do not want to receive notifications.
     * @param {HWND} callerHwnd The window handle of your client. The handle is used to center the WinSAT dialog boxes. If <b>NULL</b>, the dialog boxes are centered on the desktop.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * 
     * This following table lists some of the HRESULT values that this method returns.
     * 
     * 
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * WinSAT successfully started. To determine if the assessment ran successfully, implement the <a href="/windows/desktop/api/winsatcominterfacei/nf-winsatcominterfacei-iwinsatinitiateevents-winsatcomplete">IWinSATInitiateEvents::WinSATComplete</a> method and check the value of the <i>hresult</i> parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WINSAT_ERROR_WINSAT_DOES_NOT_EXIST</b></dt>
     * <dt>0x80040011</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Could not find the WinSAT program where expected.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsatcominterfacei/nf-winsatcominterfacei-iinitiatewinsatassessment-initiateformalassessment
     */
    InitiateFormalAssessment(pCallbacks, callerHwnd) {
        callerHwnd := callerHwnd is Win32Handle ? NumGet(callerHwnd, "ptr") : callerHwnd

        result := ComCall(4, this, "ptr", pCallbacks, "ptr", callerHwnd, "HRESULT")
        return result
    }

    /**
     * Cancels a currently running assessment.
     * @returns {HRESULT} Returns S_OK if successful; otherwise, the method returns the following error code or a Win32 error code returned as an HRESULT.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WINSAT_ERROR_WINSAT_NOT_RUNNING</b></dt>
     * <dt>0x80040006</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is no running assessment to cancel.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsatcominterfacei/nf-winsatcominterfacei-iinitiatewinsatassessment-cancelassessment
     */
    CancelAssessment() {
        result := ComCall(5, this, "HRESULT")
        return result
    }
}
