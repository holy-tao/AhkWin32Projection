#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Deprecated.
 * @remarks
 * 
  * In a direct inheritance scheme, these methods would be protected members. For that reason, it is recommended that this interface not be used directly by implementers. If it is used directly, existing data could be at risk.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//shdeprecated/nn-shdeprecated-ibrowserservice
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IBrowserService extends IUnknown{
    /**
     * The interface identifier for IBrowserService
     * @type {Guid}
     */
    static IID => Guid("{02ba3b52-0547-11d1-b833-00c04fc9b31f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IOleInPlaceSite>} ppipsite 
     * @returns {HRESULT} 
     */
    GetParentSite(ppipsite) {
        result := ComCall(3, this, "ptr", ppipsite, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IShellView>} psv 
     * @param {PWSTR} pszName 
     * @returns {HRESULT} 
     */
    SetTitle(psv, pszName) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(4, this, "ptr", psv, "ptr", pszName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IShellView>} psv 
     * @param {PWSTR} pszName 
     * @param {Integer} cchName 
     * @returns {HRESULT} 
     */
    GetTitle(psv, pszName, cchName) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(5, this, "ptr", psv, "ptr", pszName, "uint", cchName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IOleObject>} ppobjv 
     * @returns {HRESULT} 
     */
    GetOleObject(ppobjv) {
        result := ComCall(6, this, "ptr", ppobjv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITravelLog>} pptl 
     * @returns {HRESULT} 
     */
    GetTravelLog(pptl) {
        result := ComCall(7, this, "ptr", pptl, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} id 
     * @param {BOOL} fShow 
     * @returns {HRESULT} 
     */
    ShowControlWindow(id, fShow) {
        result := ComCall(8, this, "uint", id, "int", fShow, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} id 
     * @param {Pointer<BOOL>} pfShown 
     * @returns {HRESULT} 
     */
    IsControlWindowShown(id, pfShown) {
        result := ComCall(9, this, "uint", id, "ptr", pfShown, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITEMIDLIST>} pidl 
     * @param {PWSTR} pwszName 
     * @param {Integer} uFlags 
     * @returns {HRESULT} 
     */
    IEGetDisplayName(pidl, pwszName, uFlags) {
        pwszName := pwszName is String ? StrPtr(pwszName) : pwszName

        result := ComCall(10, this, "ptr", pidl, "ptr", pwszName, "uint", uFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} uiCP 
     * @param {PWSTR} pwszPath 
     * @param {Pointer<ITEMIDLIST>} ppidlOut 
     * @returns {HRESULT} 
     */
    IEParseDisplayName(uiCP, pwszPath, ppidlOut) {
        pwszPath := pwszPath is String ? StrPtr(pwszPath) : pwszPath

        result := ComCall(11, this, "uint", uiCP, "ptr", pwszPath, "ptr", ppidlOut, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HRESULT} hres 
     * @param {PWSTR} pwszPath 
     * @returns {HRESULT} 
     */
    DisplayParseError(hres, pwszPath) {
        pwszPath := pwszPath is String ? StrPtr(pwszPath) : pwszPath

        result := ComCall(12, this, "int", hres, "ptr", pwszPath, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITEMIDLIST>} pidl 
     * @param {Integer} grfHLNF 
     * @returns {HRESULT} 
     */
    NavigateToPidl(pidl, grfHLNF) {
        result := ComCall(13, this, "ptr", pidl, "uint", grfHLNF, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} bnstate 
     * @returns {HRESULT} 
     */
    SetNavigateState(bnstate) {
        result := ComCall(14, this, "int", bnstate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pbnstate 
     * @returns {HRESULT} 
     */
    GetNavigateState(pbnstate) {
        result := ComCall(15, this, "int*", pbnstate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IShellView>} psv 
     * @param {Pointer<ITEMIDLIST>} pidl 
     * @param {Pointer<BOOL>} pfDidBrowse 
     * @returns {HRESULT} 
     */
    NotifyRedirect(psv, pidl, pfDidBrowse) {
        result := ComCall(16, this, "ptr", psv, "ptr", pidl, "ptr", pfDidBrowse, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    UpdateWindowList() {
        result := ComCall(17, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    UpdateBackForwardState() {
        result := ComCall(18, this, "int")
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
     * @param {Integer} dwFlagMask 
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
    SetFlags(dwFlags, dwFlagMask) {
        result := ComCall(19, this, "uint", dwFlags, "uint", dwFlagMask, "int")
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
        result := ComCall(20, this, "uint*", pdwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    CanNavigateNow() {
        result := ComCall(21, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITEMIDLIST>} ppidl 
     * @returns {HRESULT} 
     */
    GetPidl(ppidl) {
        result := ComCall(22, this, "ptr", ppidl, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITEMIDLIST>} pidl 
     * @returns {HRESULT} 
     */
    SetReferrer(pidl) {
        result := ComCall(23, this, "ptr", pidl, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetBrowserIndex() {
        result := ComCall(24, this, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} dwID 
     * @param {Pointer<IUnknown>} ppunk 
     * @returns {HRESULT} 
     */
    GetBrowserByIndex(dwID, ppunk) {
        result := ComCall(25, this, "uint", dwID, "ptr", ppunk, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IOleObject>} ppole 
     * @param {Pointer<IStream>} pstm 
     * @param {Pointer<IBindCtx>} ppbc 
     * @returns {HRESULT} 
     */
    GetHistoryObject(ppole, pstm, ppbc) {
        result := ComCall(26, this, "ptr", ppole, "ptr", pstm, "ptr", ppbc, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IOleObject>} pole 
     * @param {BOOL} fIsLocalAnchor 
     * @returns {HRESULT} 
     */
    SetHistoryObject(pole, fIsLocalAnchor) {
        result := ComCall(27, this, "ptr", pole, "int", fIsLocalAnchor, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IOleObject>} pole 
     * @returns {HRESULT} 
     */
    CacheOLEServer(pole) {
        result := ComCall(28, this, "ptr", pole, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarIn 
     * @param {Pointer<VARIANT>} pvarOut 
     * @returns {HRESULT} 
     */
    GetSetCodePage(pvarIn, pvarOut) {
        result := ComCall(29, this, "ptr", pvarIn, "ptr", pvarOut, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IShellView>} psv 
     * @param {BOOL} fDone 
     * @param {Pointer<VARIANT>} pvarargIn 
     * @param {Pointer<VARIANT>} pvarargOut 
     * @returns {HRESULT} 
     */
    OnHttpEquiv(psv, fDone, pvarargIn, pvarargOut) {
        result := ComCall(30, this, "ptr", psv, "int", fDone, "ptr", pvarargIn, "ptr", pvarargOut, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<HPALETTE>} hpal 
     * @returns {HRESULT} 
     */
    GetPalette(hpal) {
        result := ComCall(31, this, "ptr", hpal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} fForceRegister 
     * @param {Integer} swc 
     * @returns {HRESULT} 
     */
    RegisterWindow(fForceRegister, swc) {
        result := ComCall(32, this, "int", fForceRegister, "int", swc, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
