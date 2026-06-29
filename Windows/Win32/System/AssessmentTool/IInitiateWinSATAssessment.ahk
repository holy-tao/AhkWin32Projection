#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IWinSATInitiateEvents.ahk" { IWinSATInitiateEvents }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Initiates an assessment.
 * @see https://learn.microsoft.com/windows/win32/api/winsatcominterfacei/nn-winsatcominterfacei-iinitiatewinsatassessment
 * @namespace Windows.Win32.System.AssessmentTool
 */
export default struct IInitiateWinSATAssessment extends IUnknown {
    /**
     * The interface identifier for IInitiateWinSATAssessment
     * @type {Guid}
     */
    static IID := Guid("{d983fc50-f5bf-49d5-b5ed-cccb18aa7fc1}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IInitiateWinSATAssessment interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        InitiateAssessment       : IntPtr
        InitiateFormalAssessment : IntPtr
        CancelAssessment         : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IInitiateWinSATAssessment.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Initiates an ad hoc assessment.
     * @remarks
     * You typically run an ad hoc assessment to assess one subcomponent of the computer, whereas a formal assessment assesses all subcomponents of the computer. To run a formal assessment, call the <a href="https://docs.microsoft.com/windows/desktop/api/winsatcominterfacei/nf-winsatcominterfacei-iinitiatewinsatassessment-initiateformalassessment">IInitiateWinSATAssessment::InitiateFormalAssessment</a> method.
     * 
     * Ad hoc assessments are not saved in the WinSAT data store; only formal assessments are saved in the data store (you cannot use the <a href="https://docs.microsoft.com/windows/desktop/api/winsatcominterfacei/nn-winsatcominterfacei-iqueryrecentwinsatassessment">IQueryRecentWinSATAssessment</a> interface to query the results). To get the results of an ad hoc assessment, include the <b>–xml</b><b> </b><i>FileName</i> argument, which  will save the results to an XML file that you can later parse.
     * 
     * WinSAT requires administrator privileges to run. If the user does not have administrator privileges, WinSAT will display a dialog box that asks for credentials.
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
     * WinSAT successfully started. To determine if the assessment ran successfully, implement the <a href="https://docs.microsoft.com/windows/desktop/api/winsatcominterfacei/nf-winsatcominterfacei-iwinsatinitiateevents-winsatcomplete">IWinSATInitiateEvents::WinSATComplete</a> method and check the value of the <i>hresult</i> parameter.
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
     * @see https://learn.microsoft.com/windows/win32/api/winsatcominterfacei/nf-winsatcominterfacei-iinitiatewinsatassessment-initiateassessment
     */
    InitiateAssessment(cmdLine, pCallbacks, callerHwnd) {
        cmdLine := cmdLine is String ? StrPtr(cmdLine) : cmdLine

        result := ComCall(3, this, "ptr", cmdLine, "ptr", pCallbacks, HWND, callerHwnd, "HRESULT")
        return result
    }

    /**
     * Initiates a formal assessment.
     * @remarks
     * You typically run a formal assessment to assess all subcomponents of the computer, whereas an ad hoc assessment assesses one subcomponent of the computer. To run an ad hoc assessment, call the <a href="https://docs.microsoft.com/windows/desktop/api/winsatcominterfacei/nf-winsatcominterfacei-iinitiatewinsatassessment-initiateassessment">IInitiateWinSATAssessment::InitiateAssessment</a> method.
     * 
     * To get the results of a formal assessment, use the <a href="https://docs.microsoft.com/windows/desktop/api/winsatcominterfacei/nn-winsatcominterfacei-iqueryrecentwinsatassessment">IQueryRecentWinSATAssessment</a> interface.  
     * 
     * If you call this function from a Windows application, implement the <a href="https://docs.microsoft.com/windows/desktop/api/winsatcominterfacei/nn-winsatcominterfacei-iwinsatinitiateevents">IWinSATInitiateEvents</a> interface so that you can display progress information and receive notification when the assessment is complete. For a Windows console application, showing progress is not necessary because WinSAT writes progress information to the console window.
     * 
     * Note that WinSAT requires administrator privileges to run. If the user does not have administrator privileges, WinSAT will display a dialog box that asks for credentials.
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
     * WinSAT successfully started. To determine if the assessment ran successfully, implement the <a href="https://docs.microsoft.com/windows/desktop/api/winsatcominterfacei/nf-winsatcominterfacei-iwinsatinitiateevents-winsatcomplete">IWinSATInitiateEvents::WinSATComplete</a> method and check the value of the <i>hresult</i> parameter.
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
     * @see https://learn.microsoft.com/windows/win32/api/winsatcominterfacei/nf-winsatcominterfacei-iinitiatewinsatassessment-initiateformalassessment
     */
    InitiateFormalAssessment(pCallbacks, callerHwnd) {
        result := ComCall(4, this, "ptr", pCallbacks, HWND, callerHwnd, "HRESULT")
        return result
    }

    /**
     * Cancels a currently running assessment.
     * @remarks
     * This method sends WinSAT a request to cancel the assessment. To determine if the cancel request succeeded, implement the <a href="https://docs.microsoft.com/windows/desktop/api/winsatcominterfacei/nf-winsatcominterfacei-iwinsatinitiateevents-winsatcomplete">IWinSATInitiateEvents::WinSATComplete</a> method and check the <i>hresult</i> parameter for a value of WINSAT_ERROR_WINSAT_CANCELED.
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
     * @see https://learn.microsoft.com/windows/win32/api/winsatcominterfacei/nf-winsatcominterfacei-iinitiatewinsatassessment-cancelassessment
     */
    CancelAssessment() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IInitiateWinSATAssessment.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.InitiateAssessment := CallbackCreate(GetMethod(implObj, "InitiateAssessment"), flags, 4)
        this.vtbl.InitiateFormalAssessment := CallbackCreate(GetMethod(implObj, "InitiateFormalAssessment"), flags, 3)
        this.vtbl.CancelAssessment := CallbackCreate(GetMethod(implObj, "CancelAssessment"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.InitiateAssessment)
        CallbackFree(this.vtbl.InitiateFormalAssessment)
        CallbackFree(this.vtbl.CancelAssessment)
    }
}
