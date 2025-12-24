#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Implement this interface to receive notifications when an assessment is complete or making progress.
 * @see https://docs.microsoft.com/windows/win32/api//winsatcominterfacei/nn-winsatcominterfacei-iwinsatinitiateevents
 * @namespace Windows.Win32.System.AssessmentTool
 * @version v4.0.30319
 */
class IWinSATInitiateEvents extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWinSATInitiateEvents
     * @type {Guid}
     */
    static IID => Guid("{262a1918-ba0d-41d5-92c2-fab4633ee74f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["WinSATComplete", "WinSATUpdate"]

    /**
     * Receives notification when an assessment succeeds, fails, or is canceled.
     * @param {HRESULT} hresult The return value of the assessment. The following are the possible return values of the assessment.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WINSAT_STATUS_COMPLETED_SUCCESS"></a><a id="winsat_status_completed_success"></a><dl>
     * <dt><b>WINSAT_STATUS_COMPLETED_SUCCESS</b></dt>
     * <dt>0x40033</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The assessment completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WINSAT_ERROR_ASSESSMENT_INTERFERENCE"></a><a id="winsat_error_assessment_interference"></a><dl>
     * <dt><b>WINSAT_ERROR_ASSESSMENT_INTERFERENCE</b></dt>
     * <dt>0x80040034</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The assessment could not complete due to system activity.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WINSAT_ERROR_COMPLETED_ERROR"></a><a id="winsat_error_completed_error"></a><dl>
     * <dt><b>WINSAT_ERROR_COMPLETED_ERROR</b></dt>
     * <dt>0x80040035</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The assessment could not complete due to an internal or system error.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WINSAT_ERROR_WINSAT_CANCELED"></a><a id="winsat_error_winsat_canceled"></a><dl>
     * <dt><b>WINSAT_ERROR_WINSAT_CANCELED</b></dt>
     * <dt>0x80040036</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The assessment was canceled.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WINSAT_ERROR_COMMAND_LINE_INVALID"></a><a id="winsat_error_command_line_invalid"></a><dl>
     * <dt><b>WINSAT_ERROR_COMMAND_LINE_INVALID</b></dt>
     * <dt>0x80040037</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The command line passed to WinSAT was not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WINSAT_ERROR_ACCESS_DENIED"></a><a id="winsat_error_access_denied"></a><dl>
     * <dt><b>WINSAT_ERROR_ACCESS_DENIED</b></dt>
     * <dt>0x80040038</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user does not have sufficient privileges to run WinSAT. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WINSAT_ERROR_WINSAT_ALREADY_RUNNING"></a><a id="winsat_error_winsat_already_running"></a><dl>
     * <dt><b>WINSAT_ERROR_WINSAT_ALREADY_RUNNING</b></dt>
     * <dt>0x80040039</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Another copy of WinSAT.exe is already running; only one instance of WinSAT.exe can run on the computer at one time.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {PWSTR} strDescription The description of the completion status. This string is valid during the life of this callback. Copy the string if you need it after the callback returns.
     * @returns {HRESULT} This method should return  S_OK; the value is ignored.
     * @see https://docs.microsoft.com/windows/win32/api//winsatcominterfacei/nf-winsatcominterfacei-iwinsatinitiateevents-winsatcomplete
     */
    WinSATComplete(hresult, strDescription) {
        strDescription := strDescription is String ? StrPtr(strDescription) : strDescription

        result := ComCall(3, this, "int", hresult, "ptr", strDescription, "HRESULT")
        return result
    }

    /**
     * Receives notification when an assessment is making progress.
     * @param {Integer} uCurrentTick The current progress tick of the assessment.
     * @param {Integer} uTickTotal The total number of progress ticks for the assessment.
     * @param {PWSTR} strCurrentState A string that contains the current state of the assessment. This string is valid during the life of this callback. Copy the string if you need it after the callback returns.
     * @returns {HRESULT} This method should return  S_OK; the value is ignored.
     * @see https://docs.microsoft.com/windows/win32/api//winsatcominterfacei/nf-winsatcominterfacei-iwinsatinitiateevents-winsatupdate
     */
    WinSATUpdate(uCurrentTick, uTickTotal, strCurrentState) {
        strCurrentState := strCurrentState is String ? StrPtr(strCurrentState) : strCurrentState

        result := ComCall(4, this, "uint", uCurrentTick, "uint", uTickTotal, "ptr", strCurrentState, "HRESULT")
        return result
    }
}
