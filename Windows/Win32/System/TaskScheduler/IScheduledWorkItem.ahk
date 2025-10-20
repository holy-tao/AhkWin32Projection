#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Pointer<UInt16>} piNewTrigger 
     * @param {Pointer<ITaskTrigger>} ppTrigger 
     * @returns {HRESULT} 
     */
    CreateTrigger(piNewTrigger, ppTrigger) {
        result := ComCall(3, this, "ushort*", piNewTrigger, "ptr", ppTrigger, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} iTrigger 
     * @returns {HRESULT} 
     */
    DeleteTrigger(iTrigger) {
        result := ComCall(4, this, "ushort", iTrigger, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt16>} pwCount 
     * @returns {HRESULT} 
     */
    GetTriggerCount(pwCount) {
        result := ComCall(5, this, "ushort*", pwCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} iTrigger 
     * @param {Pointer<ITaskTrigger>} ppTrigger 
     * @returns {HRESULT} 
     */
    GetTrigger(iTrigger, ppTrigger) {
        result := ComCall(6, this, "ushort", iTrigger, "ptr", ppTrigger, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} iTrigger 
     * @param {Pointer<PWSTR>} ppwszTrigger 
     * @returns {HRESULT} 
     */
    GetTriggerString(iTrigger, ppwszTrigger) {
        result := ComCall(7, this, "ushort", iTrigger, "ptr", ppwszTrigger, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SYSTEMTIME>} pstBegin 
     * @param {Pointer<SYSTEMTIME>} pstEnd 
     * @param {Pointer<UInt16>} pCount 
     * @param {Pointer<SYSTEMTIME>} rgstTaskTimes 
     * @returns {HRESULT} 
     */
    GetRunTimes(pstBegin, pstEnd, pCount, rgstTaskTimes) {
        result := ComCall(8, this, "ptr", pstBegin, "ptr", pstEnd, "ushort*", pCount, "ptr", rgstTaskTimes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SYSTEMTIME>} pstNextRun 
     * @returns {HRESULT} 
     */
    GetNextRunTime(pstNextRun) {
        result := ComCall(9, this, "ptr", pstNextRun, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} wIdleMinutes 
     * @param {Integer} wDeadlineMinutes 
     * @returns {HRESULT} 
     */
    SetIdleWait(wIdleMinutes, wDeadlineMinutes) {
        result := ComCall(10, this, "ushort", wIdleMinutes, "ushort", wDeadlineMinutes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt16>} pwIdleMinutes 
     * @param {Pointer<UInt16>} pwDeadlineMinutes 
     * @returns {HRESULT} 
     */
    GetIdleWait(pwIdleMinutes, pwDeadlineMinutes) {
        result := ComCall(11, this, "ushort*", pwIdleMinutes, "ushort*", pwDeadlineMinutes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Run() {
        result := ComCall(12, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Terminate() {
        result := ComCall(13, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HWND} hParent 
     * @param {Integer} dwReserved 
     * @returns {HRESULT} 
     */
    EditWorkItem(hParent, dwReserved) {
        hParent := hParent is Win32Handle ? NumGet(hParent, "ptr") : hParent

        result := ComCall(14, this, "ptr", hParent, "uint", dwReserved, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SYSTEMTIME>} pstLastRun 
     * @returns {HRESULT} 
     */
    GetMostRecentRunTime(pstLastRun) {
        result := ComCall(15, this, "ptr", pstLastRun, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<HRESULT>} phrStatus 
     * @returns {HRESULT} 
     */
    GetStatus(phrStatus) {
        result := ComCall(16, this, "ptr", phrStatus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwExitCode 
     * @returns {HRESULT} 
     */
    GetExitCode(pdwExitCode) {
        result := ComCall(17, this, "uint*", pdwExitCode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwszComment 
     * @returns {HRESULT} 
     */
    SetComment(pwszComment) {
        pwszComment := pwszComment is String ? StrPtr(pwszComment) : pwszComment

        result := ComCall(18, this, "ptr", pwszComment, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppwszComment 
     * @returns {HRESULT} 
     */
    GetComment(ppwszComment) {
        result := ComCall(19, this, "ptr", ppwszComment, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwszCreator 
     * @returns {HRESULT} 
     */
    SetCreator(pwszCreator) {
        pwszCreator := pwszCreator is String ? StrPtr(pwszCreator) : pwszCreator

        result := ComCall(20, this, "ptr", pwszCreator, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppwszCreator 
     * @returns {HRESULT} 
     */
    GetCreator(ppwszCreator) {
        result := ComCall(21, this, "ptr", ppwszCreator, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cbData 
     * @param {Pointer<Byte>} rgbData 
     * @returns {HRESULT} 
     */
    SetWorkItemData(cbData, rgbData) {
        result := ComCall(22, this, "ushort", cbData, "char*", rgbData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt16>} pcbData 
     * @param {Pointer<Byte>} prgbData 
     * @returns {HRESULT} 
     */
    GetWorkItemData(pcbData, prgbData) {
        result := ComCall(23, this, "ushort*", pcbData, "char*", prgbData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} wRetryCount 
     * @returns {HRESULT} 
     */
    SetErrorRetryCount(wRetryCount) {
        result := ComCall(24, this, "ushort", wRetryCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt16>} pwRetryCount 
     * @returns {HRESULT} 
     */
    GetErrorRetryCount(pwRetryCount) {
        result := ComCall(25, this, "ushort*", pwRetryCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} wRetryInterval 
     * @returns {HRESULT} 
     */
    SetErrorRetryInterval(wRetryInterval) {
        result := ComCall(26, this, "ushort", wRetryInterval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt16>} pwRetryInterval 
     * @returns {HRESULT} 
     */
    GetErrorRetryInterval(pwRetryInterval) {
        result := ComCall(27, this, "ushort*", pwRetryInterval, "int")
        if(result != 0)
            throw OSError(result)

        return result
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
        result := ComCall(28, this, "uint", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwFlags 
     * @returns {HRESULT} 
     */
    GetFlags(pdwFlags) {
        result := ComCall(29, this, "uint*", pdwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwszAccountName 
     * @param {PWSTR} pwszPassword 
     * @returns {HRESULT} 
     */
    SetAccountInformation(pwszAccountName, pwszPassword) {
        pwszAccountName := pwszAccountName is String ? StrPtr(pwszAccountName) : pwszAccountName
        pwszPassword := pwszPassword is String ? StrPtr(pwszPassword) : pwszPassword

        result := ComCall(30, this, "ptr", pwszAccountName, "ptr", pwszPassword, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppwszAccountName 
     * @returns {HRESULT} 
     */
    GetAccountInformation(ppwszAccountName) {
        result := ComCall(31, this, "ptr", ppwszAccountName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
