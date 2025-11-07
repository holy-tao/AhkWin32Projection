#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITaskTrigger.ahk
#Include ..\..\Foundation\SYSTEMTIME.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Provides the methods for managing specific work items.
 * @remarks
 * 
 * The <b>IScheduledWorkItem</b> interface is the base interface for the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/mstask/nn-mstask-itask">ITask</a> interface. All methods provided by 
 * <b>IScheduledWorkItem</b> are inherited by the 
 * <b>ITask</b> interface and are typically called through that interface.
 * 
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mstask/nn-mstask-ischeduledworkitem
 * @namespace Windows.Win32.System.TaskScheduler
 * @version v4.0.30319
 */
class IScheduledWorkItem extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IScheduledWorkItem
     * @type {Guid}
     */
    static IID => Guid("{a6b952f0-a4b1-11d0-997d-00aa006887ec}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateTrigger", "DeleteTrigger", "GetTriggerCount", "GetTrigger", "GetTriggerString", "GetRunTimes", "GetNextRunTime", "SetIdleWait", "GetIdleWait", "Run", "Terminate", "EditWorkItem", "GetMostRecentRunTime", "GetStatus", "GetExitCode", "SetComment", "GetComment", "SetCreator", "GetCreator", "SetWorkItemData", "GetWorkItemData", "SetErrorRetryCount", "GetErrorRetryCount", "SetErrorRetryInterval", "GetErrorRetryInterval", "SetFlags", "GetFlags", "SetAccountInformation", "GetAccountInformation"]

    /**
     * 
     * @param {Pointer<Integer>} piNewTrigger 
     * @param {Pointer<ITaskTrigger>} ppTrigger 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mstask/nf-mstask-ischeduledworkitem-createtrigger
     */
    CreateTrigger(piNewTrigger, ppTrigger) {
        piNewTriggerMarshal := piNewTrigger is VarRef ? "ushort*" : "ptr"

        result := ComCall(3, this, piNewTriggerMarshal, piNewTrigger, "ptr*", ppTrigger, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} iTrigger 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mstask/nf-mstask-ischeduledworkitem-deletetrigger
     */
    DeleteTrigger(iTrigger) {
        result := ComCall(4, this, "ushort", iTrigger, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mstask/nf-mstask-ischeduledworkitem-gettriggercount
     */
    GetTriggerCount() {
        result := ComCall(5, this, "ushort*", &pwCount := 0, "HRESULT")
        return pwCount
    }

    /**
     * 
     * @param {Integer} iTrigger 
     * @returns {ITaskTrigger} 
     * @see https://learn.microsoft.com/windows/win32/api/mstask/nf-mstask-ischeduledworkitem-gettrigger
     */
    GetTrigger(iTrigger) {
        result := ComCall(6, this, "ushort", iTrigger, "ptr*", &ppTrigger := 0, "HRESULT")
        return ITaskTrigger(ppTrigger)
    }

    /**
     * 
     * @param {Integer} iTrigger 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/mstask/nf-mstask-ischeduledworkitem-gettriggerstring
     */
    GetTriggerString(iTrigger) {
        result := ComCall(7, this, "ushort", iTrigger, "ptr*", &ppwszTrigger := 0, "HRESULT")
        return ppwszTrigger
    }

    /**
     * 
     * @param {Pointer<SYSTEMTIME>} pstBegin 
     * @param {Pointer<SYSTEMTIME>} pstEnd 
     * @param {Pointer<Integer>} pCount 
     * @returns {Pointer<SYSTEMTIME>} 
     * @see https://learn.microsoft.com/windows/win32/api/mstask/nf-mstask-ischeduledworkitem-getruntimes
     */
    GetRunTimes(pstBegin, pstEnd, pCount) {
        pCountMarshal := pCount is VarRef ? "ushort*" : "ptr"

        result := ComCall(8, this, "ptr", pstBegin, "ptr", pstEnd, pCountMarshal, pCount, "ptr*", &rgstTaskTimes := 0, "HRESULT")
        return rgstTaskTimes
    }

    /**
     * 
     * @param {Pointer<SYSTEMTIME>} pstNextRun 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mstask/nf-mstask-ischeduledworkitem-getnextruntime
     */
    GetNextRunTime(pstNextRun) {
        result := ComCall(9, this, "ptr", pstNextRun, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} wIdleMinutes 
     * @param {Integer} wDeadlineMinutes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mstask/nf-mstask-ischeduledworkitem-setidlewait
     */
    SetIdleWait(wIdleMinutes, wDeadlineMinutes) {
        result := ComCall(10, this, "ushort", wIdleMinutes, "ushort", wDeadlineMinutes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pwIdleMinutes 
     * @param {Pointer<Integer>} pwDeadlineMinutes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mstask/nf-mstask-ischeduledworkitem-getidlewait
     */
    GetIdleWait(pwIdleMinutes, pwDeadlineMinutes) {
        pwIdleMinutesMarshal := pwIdleMinutes is VarRef ? "ushort*" : "ptr"
        pwDeadlineMinutesMarshal := pwDeadlineMinutes is VarRef ? "ushort*" : "ptr"

        result := ComCall(11, this, pwIdleMinutesMarshal, pwIdleMinutes, pwDeadlineMinutesMarshal, pwDeadlineMinutes, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mstask/nf-mstask-ischeduledworkitem-run
     */
    Run() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mstask/nf-mstask-ischeduledworkitem-terminate
     */
    Terminate() {
        result := ComCall(13, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} hParent 
     * @param {Integer} dwReserved 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mstask/nf-mstask-ischeduledworkitem-editworkitem
     */
    EditWorkItem(hParent, dwReserved) {
        hParent := hParent is Win32Handle ? NumGet(hParent, "ptr") : hParent

        result := ComCall(14, this, "ptr", hParent, "uint", dwReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {SYSTEMTIME} 
     * @see https://learn.microsoft.com/windows/win32/api/mstask/nf-mstask-ischeduledworkitem-getmostrecentruntime
     */
    GetMostRecentRunTime() {
        pstLastRun := SYSTEMTIME()
        result := ComCall(15, this, "ptr", pstLastRun, "HRESULT")
        return pstLastRun
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mstask/nf-mstask-ischeduledworkitem-getstatus
     */
    GetStatus() {
        result := ComCall(16, this, "int*", &phrStatus := 0, "HRESULT")
        return phrStatus
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mstask/nf-mstask-ischeduledworkitem-getexitcode
     */
    GetExitCode() {
        result := ComCall(17, this, "uint*", &pdwExitCode := 0, "HRESULT")
        return pdwExitCode
    }

    /**
     * 
     * @param {PWSTR} pwszComment 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mstask/nf-mstask-ischeduledworkitem-setcomment
     */
    SetComment(pwszComment) {
        pwszComment := pwszComment is String ? StrPtr(pwszComment) : pwszComment

        result := ComCall(18, this, "ptr", pwszComment, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/mstask/nf-mstask-ischeduledworkitem-getcomment
     */
    GetComment() {
        result := ComCall(19, this, "ptr*", &ppwszComment := 0, "HRESULT")
        return ppwszComment
    }

    /**
     * 
     * @param {PWSTR} pwszCreator 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mstask/nf-mstask-ischeduledworkitem-setcreator
     */
    SetCreator(pwszCreator) {
        pwszCreator := pwszCreator is String ? StrPtr(pwszCreator) : pwszCreator

        result := ComCall(20, this, "ptr", pwszCreator, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/mstask/nf-mstask-ischeduledworkitem-getcreator
     */
    GetCreator() {
        result := ComCall(21, this, "ptr*", &ppwszCreator := 0, "HRESULT")
        return ppwszCreator
    }

    /**
     * 
     * @param {Integer} cbData 
     * @param {Pointer<Integer>} rgbData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mstask/nf-mstask-ischeduledworkitem-setworkitemdata
     */
    SetWorkItemData(cbData, rgbData) {
        rgbDataMarshal := rgbData is VarRef ? "char*" : "ptr"

        result := ComCall(22, this, "ushort", cbData, rgbDataMarshal, rgbData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pcbData 
     * @param {Pointer<Pointer<Integer>>} prgbData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mstask/nf-mstask-ischeduledworkitem-getworkitemdata
     */
    GetWorkItemData(pcbData, prgbData) {
        pcbDataMarshal := pcbData is VarRef ? "ushort*" : "ptr"
        prgbDataMarshal := prgbData is VarRef ? "ptr*" : "ptr"

        result := ComCall(23, this, pcbDataMarshal, pcbData, prgbDataMarshal, prgbData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} wRetryCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mstask/nf-mstask-ischeduledworkitem-seterrorretrycount
     */
    SetErrorRetryCount(wRetryCount) {
        result := ComCall(24, this, "ushort", wRetryCount, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mstask/nf-mstask-ischeduledworkitem-geterrorretrycount
     */
    GetErrorRetryCount() {
        result := ComCall(25, this, "ushort*", &pwRetryCount := 0, "HRESULT")
        return pwRetryCount
    }

    /**
     * 
     * @param {Integer} wRetryInterval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mstask/nf-mstask-ischeduledworkitem-seterrorretryinterval
     */
    SetErrorRetryInterval(wRetryInterval) {
        result := ComCall(26, this, "ushort", wRetryInterval, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mstask/nf-mstask-ischeduledworkitem-geterrorretryinterval
     */
    GetErrorRetryInterval() {
        result := ComCall(27, this, "ushort*", &pwRetryInterval := 0, "HRESULT")
        return pwRetryInterval
    }

    /**
     * Specifies how the recognizer interprets the ink and determines the result string.Call this function before processing the ink for the first time. Therefore, call the SetFlags function before calling the Process function.
     * @param {Integer} dwFlags The following table lists the flags that you may set to specify how the recognizer interprets the ink and determines the result string. Use the <b>OR</b> operator (|) to combine flags as appropriate.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Bit flag</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RECOFLAG_AUTOSPACE"></a><a id="recoflag_autospace"></a><dl>
     * <dt><b>RECOFLAG_AUTOSPACE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Recognizer uses smart spacing based on language model rules.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RECOFLAG_COERCE"></a><a id="recoflag_coerce"></a><dl>
     * <dt><b>RECOFLAG_COERCE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Recognizer coerces the result based on the factoid you specify for the context. For example, if you specify a phone number factoid and the user enters the word "hello", the recognizer may return a random phone number or an empty string. If you do not specify this flag, the recognizer returns "hello" as the result.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RECOFLAG_PREFIXOK"></a><a id="recoflag_prefixok"></a><dl>
     * <dt><b>RECOFLAG_PREFIXOK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Recognizer supports the recognition of any prefix part of the strings that are defined in the default or specified (factoid) language model.
     * 
     * For example, without this flag, the user writes "handw" and the recognizer returns suggestions (such as "hander" or "handed") that are words that exist in the recognizer lexicon. With the flag, the recognizer may return "handw" as one of the suggestions since it is a valid prefix of the word "handwriting" that exists in the recognizer lexicon.
     * 
     * The Tablet PC Input Panel sets this flag in most cases, except when the input scope is IS_DEFAULT (or no input scope) or when there is no user word list or regular expression.
     * 
     * Recognizers of East Asian characters should return E_INVALIDARG when a caller passes in this flag.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RECOFLAG_LINEMODE"></a><a id="recoflag_linemode"></a><dl>
     * <dt><b>RECOFLAG_LINEMODE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The recognizer does not split lines but must still do character and word separation. This is the same as lined mode, except that there is no guide, and all ink is assumed to be in a single line. When this flag is set, a guide, if set, is ignored.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RECOFLAG_SINGLESEG"></a><a id="recoflag_singleseg"></a><dl>
     * <dt><b>RECOFLAG_SINGLESEG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Disables multiple segmentation. By default, the recognizer returns multiple segmentations (alternates) for the ink.
     * 
     * For example, if you write "together" as separate strokes, the recognizer may segment the ink as "to get her", "to gather", or "together". Set this flag if you do not need multiple segmentations of the ink when you query for alternates. This improves performance and reduces memory usage.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RECOFLAG_WORDMODE"></a><a id="recoflag_wordmode"></a><dl>
     * <dt><b>RECOFLAG_WORDMODE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Recognizer treats the ink as a single word. For example, if the context contains "to get her", the recognizer returns "together".
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>HRESULT value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The flag is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The recognizer does not support this function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to allocate memory to complete the operation.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified error occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The context is invalid or one of the parameters is an invalid pointer.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//recapis/nf-recapis-setflags
     */
    SetFlags(dwFlags) {
        result := ComCall(28, this, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mstask/nf-mstask-ischeduledworkitem-getflags
     */
    GetFlags() {
        result := ComCall(29, this, "uint*", &pdwFlags := 0, "HRESULT")
        return pdwFlags
    }

    /**
     * 
     * @param {PWSTR} pwszAccountName 
     * @param {PWSTR} pwszPassword 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mstask/nf-mstask-ischeduledworkitem-setaccountinformation
     */
    SetAccountInformation(pwszAccountName, pwszPassword) {
        pwszAccountName := pwszAccountName is String ? StrPtr(pwszAccountName) : pwszAccountName
        pwszPassword := pwszPassword is String ? StrPtr(pwszPassword) : pwszPassword

        result := ComCall(30, this, "ptr", pwszAccountName, "ptr", pwszPassword, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/mstask/nf-mstask-ischeduledworkitem-getaccountinformation
     */
    GetAccountInformation() {
        result := ComCall(31, this, "ptr*", &ppwszAccountName := 0, "HRESULT")
        return ppwszAccountName
    }
}
