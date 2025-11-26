#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * The IFEDictionary interface allows clients to access a Microsoft IME user dictionary.
 * @remarks
 * 
 * Create an instance of this interface with the <a href="https://docs.microsoft.com/windows/desktop/api/msime/nf-msime-createifedictionaryinstance">CreateIFEDictionaryInstance</a> function.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//msime/nn-msime-ifedictionary
 * @namespace Windows.Win32.UI.Input.Ime
 * @version v4.0.30319
 */
class IFEDictionary extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFEDictionary
     * @type {Guid}
     */
    static IID => Guid("{019f7153-e6db-11d0-83c3-00c04fddb82e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Open", "Close", "GetHeader", "DisplayProperty", "GetPosTable", "GetWords", "NextWords", "Create", "SetHeader", "ExistWord", "ExistDependency", "RegisterWord", "RegisterDependency", "GetDependencies", "NextDependencies", "ConvertFromOldMSIME", "ConvertFromUserToSys"]

    /**
     * Opens a dictionary file.
     * @param {PSTR} pchDictPath Points to a <b>NULL</b>-terminated file name string to be opened. If <i>pchDictPath</i> is <b>NULL</b> or an empty string, the user dictionary opened by the IME kernel will be used. If <i>pchDictPath</i> is an empty string, the name of user dictionary will be copied into <i>pchDictPath</i>, in which case the size of <i>pchDictPath</i> must be <b>MAX_PATH</b>.
     * @param {Pointer<IMESHF>} pshf The <a href="https://docs.microsoft.com/windows/desktop/api/msime/ns-msime-imeshf">IMESHF</a> header of the opened file. Can be <b>NULL</b>.
     * @returns {HRESULT} One of the following:
     * 
     * <ul>
     * <li><b>S_OK</b></li>
     * <li><b>JDIC_S_EMPTY_DICTIONARY</b></li>
     * <li><b>IFED_E_NOT_FOUND</b></li>
     * <li><b>IFED_E_INVALID_FORMAT</b></li>
     * <li><b>IFED_E_OPEN_FAILED</b></li>
     * <li><b>E_FAIL</b></li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//msime/nf-msime-ifedictionary-open
     */
    Open(pchDictPath, pshf) {
        pchDictPath := pchDictPath is String ? StrPtr(pchDictPath) : pchDictPath

        result := ComCall(3, this, "ptr", pchDictPath, "ptr", pshf, "HRESULT")
        return result
    }

    /**
     * Closes a dictionary file.
     * @returns {HRESULT} <b>S_OK</b> if successful, otherwise <b>E_FAIL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//msime/nf-msime-ifedictionary-close
     */
    Close() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * Gets a dictionary header from a dictionary file without opening the dictionary.
     * @param {PSTR} pchDictPath A <b>NULL</b>-terminated string containing the path and name of the dictionary file.
     * @param {Pointer<IMESHF>} pshf The <a href="https://docs.microsoft.com/windows/desktop/api/msime/ns-msime-imeshf">IMESHF</a> header of the file. Can be <b>NULL</b>.
     * @param {Pointer<Integer>} pjfmt 
     * @param {Pointer<Integer>} pulType The dictionary type. This is a combination of one or more of the following flags:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IFED_TYPE_NONE"></a><a id="ifed_type_none"></a><dl>
     * <dt><b>IFED_TYPE_NONE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Undefined.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IFED_TYPE_GENERAL"></a><a id="ifed_type_general"></a><dl>
     * <dt><b>IFED_TYPE_GENERAL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * General dictionary.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IFED_TYPE_NAMEPLACE"></a><a id="ifed_type_nameplace"></a><dl>
     * <dt><b>IFED_TYPE_NAMEPLACE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Name/place dictionary.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IFED_TYPE_SPEECH"></a><a id="ifed_type_speech"></a><dl>
     * <dt><b>IFED_TYPE_SPEECH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Speech dictionary.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IFED_TYPE_REVERSE"></a><a id="ifed_type_reverse"></a><dl>
     * <dt><b>IFED_TYPE_REVERSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Reverse dictionary.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IFED_TYPE_ENGLISH"></a><a id="ifed_type_english"></a><dl>
     * <dt><b>IFED_TYPE_ENGLISH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * English dictionary.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="IFED_TYPE_ALL"></a><a id="ifed_type_all"></a><dl>
     * <dt><b>IFED_TYPE_ALL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * All of the above types.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {HRESULT} One of the following:
     * 
     * <ul>
     * <li><b>S_OK</b></li>
     * <li><b>IFED_E_INVALID_FORMAT</b></li>
     * <li><b>E_FAIL</b></li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//msime/nf-msime-ifedictionary-getheader
     */
    GetHeader(pchDictPath, pshf, pjfmt, pulType) {
        pchDictPath := pchDictPath is String ? StrPtr(pchDictPath) : pchDictPath

        pjfmtMarshal := pjfmt is VarRef ? "int*" : "ptr"
        pulTypeMarshal := pulType is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "ptr", pchDictPath, "ptr", pshf, pjfmtMarshal, pjfmt, pulTypeMarshal, pulType, "HRESULT")
        return result
    }

    /**
     * This method is obsolete starting with Windows 8, and is no longer supported.
     * @param {HWND} hwnd The parent window handle.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//msime/nf-msime-ifedictionary-displayproperty
     */
    DisplayProperty(hwnd) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(6, this, "ptr", hwnd, "HRESULT")
        return result
    }

    /**
     * Obtains the public POS (Part of Speech) table.
     * @param {Pointer<Pointer<POSTBL>>} prgPosTbl Pointer to the array of <a href="https://docs.microsoft.com/windows/desktop/api/msime/ns-msime-postbl">POSTBL</a> structures.
     * @param {Pointer<Integer>} pcPosTbl Pointer to the number of <a href="https://docs.microsoft.com/windows/desktop/api/msime/ns-msime-postbl">POSTBL</a> structures in the returned array. Can be <b>NULL</b>.
     * @returns {HRESULT} <b>S_OK</b> if successful, otherwise <b>E_FAIL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//msime/nf-msime-ifedictionary-getpostable
     */
    GetPosTable(prgPosTbl, pcPosTbl) {
        prgPosTblMarshal := prgPosTbl is VarRef ? "ptr*" : "ptr"
        pcPosTblMarshal := pcPosTbl is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, prgPosTblMarshal, prgPosTbl, pcPosTblMarshal, pcPosTbl, "HRESULT")
        return result
    }

    /**
     * Gets word entries from a dictionary.
     * @param {PWSTR} pwchFirst A text string against which <a href="https://docs.microsoft.com/windows/desktop/api/msime/nn-msime-ifedictionary">IFEDictionary</a> entries are matched; the value must be one of the following:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NULL"></a><a id="null"></a><dl>
     * <dt><b>NULL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Low-value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"></td>
     * <td width="60%">
     * Hiragana string (full text to be retrieved).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"></td>
     * <td width="60%">
     * Hiragana string ending in "*" (specifying only leading characters of text).
     * 
     * This can be an initial text string when a range of words is to be retrieved, in which case a wildcard must not be used.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {PWSTR} pwchLast A text string that is used to end a text string. This must contain the same value as <b>pwchReading</b> in the <a href="https://docs.microsoft.com/windows/desktop/api/msime/ns-msime-imewrd">IMEWRD</a> structure when a retrieval is performed by a single value; that is, not by a range value. The value must be one of the following:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NULL"></a><a id="null"></a><dl>
     * <dt><b>NULL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * High-value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"></td>
     * <td width="60%">
     * Hiragana string (full text to be retrieved).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"></td>
     * <td width="60%">
     * Hiragana string ending in "*" (specifying only leading characters of text).
     * 
     * </td>
     * </tr>
     * </table>
     * @param {PWSTR} pwchDisplay A display string against which <a href="https://docs.microsoft.com/windows/desktop/api/msime/nn-msime-ifedictionary">IFEDictionary</a> entries are matched; the value must be one of the following:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="NULL"></a><a id="null"></a><dl>
     * <dt><b>NULL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Means "*".
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"></td>
     * <td width="60%">
     * Any Japanese string.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"></td>
     * <td width="60%">
     * Japanese string ending in "*".
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} ulPos Filter(s) on the Microsoft IME public Parts of Speech. This is a combination of one or more of the following flags:
     * 
     * <a id="IFED_POS_NONE"></a>
     * <a id="ifed_pos_none"></a>
     * @param {Integer} ulSelect Specifies the query output of a word. This is a combination of one or more of the following flags:
     * 
     * <a id="IFED_SELECT_NONE"></a>
     * <a id="ifed_select_none"></a>
     * @param {Integer} ulWordSrc Specifies the word source. When the <a href="https://docs.microsoft.com/windows/desktop/api/msime/nn-msime-ifedictionary">IFEDictionary</a> is a user dictionary, this is a combination of one or more of the following flags:
     * 
     * <a id="IFED_REG_NONE"></a>
     * <a id="ifed_reg_none"></a>
     * @param {Pointer<Integer>} pchBuffer Buffer provided by the caller to receive the data.
     * @param {Integer} cbBuffer The size of <i>pchBuffer</i>.
     * @param {Pointer<Integer>} pcWrd The number of <a href="https://docs.microsoft.com/windows/desktop/api/msime/ns-msime-imewrd">IMEWRD</a> structures returned in <i>pchBuffer</i>. If more entries are found than <i>pchBuffer</i> can store, <b>IFED_S_MORE_ENTRIES</b> will be returned.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IFED_S_MORE_ENTRIES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The client must call <a href="/windows/desktop/api/msime/nf-msime-ifedictionary-nextwords">NextWords</a> to get additional <a href="/windows/desktop/api/msime/ns-msime-imewrd">IMEWRD</a> structures.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IFED_E_NO_ENTRY</b></dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msime/nf-msime-ifedictionary-getwords
     */
    GetWords(pwchFirst, pwchLast, pwchDisplay, ulPos, ulSelect, ulWordSrc, pchBuffer, cbBuffer, pcWrd) {
        pwchFirst := pwchFirst is String ? StrPtr(pwchFirst) : pwchFirst
        pwchLast := pwchLast is String ? StrPtr(pwchLast) : pwchLast
        pwchDisplay := pwchDisplay is String ? StrPtr(pwchDisplay) : pwchDisplay

        pchBufferMarshal := pchBuffer is VarRef ? "char*" : "ptr"
        pcWrdMarshal := pcWrd is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, "ptr", pwchFirst, "ptr", pwchLast, "ptr", pwchDisplay, "uint", ulPos, "uint", ulSelect, "uint", ulWordSrc, pchBufferMarshal, pchBuffer, "uint", cbBuffer, pcWrdMarshal, pcWrd, "HRESULT")
        return result
    }

    /**
     * Gets the next word entry from a dictionary.
     * @param {Pointer<Integer>} pchBuffer Buffer provided by the caller to receive the data.
     * @param {Integer} cbBuffer The size of <i>pchBuffer</i>.
     * @param {Pointer<Integer>} pcWrd The number of <a href="https://docs.microsoft.com/windows/desktop/api/msime/ns-msime-imewrd">IMEWRD</a> structures returned in <i>pchBuffer</i>. If more entries are found than <i>pchBuffer</i> can store, <b>IFED_S_MORE_ENTRIES</b> will be returned.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IFED_S_MORE_ENTRIES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The client must call <a href="/windows/desktop/api/msime/nf-msime-ifedictionary-nextwords">NextWords</a> to get additional <a href="/windows/desktop/api/msime/ns-msime-imewrd">IMEWRD</a> structures.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msime/nf-msime-ifedictionary-nextwords
     */
    NextWords(pchBuffer, cbBuffer, pcWrd) {
        pchBufferMarshal := pchBuffer is VarRef ? "char*" : "ptr"
        pcWrdMarshal := pcWrd is VarRef ? "uint*" : "ptr"

        result := ComCall(9, this, pchBufferMarshal, pchBuffer, "uint", cbBuffer, pcWrdMarshal, pcWrd, "HRESULT")
        return result
    }

    /**
     * Creates a new dictionary file.
     * @param {PSTR} pchDictPath A <b>NULL</b>-terminated string containing the path and name for the new dictionary file to be created.
     * @param {Pointer<IMESHF>} pshf The <a href="https://docs.microsoft.com/windows/desktop/api/msime/ns-msime-imeshf">IMESHF</a> header for the new dictionary.
     * @returns {HRESULT} One of the following:
     * 
     * <ul>
     * <li><b>S_OK</b></li>
     * <li><b>IFED_S_EMPTY_DICTIONARY</b></li>
     * <li><b>E_OUTOFMEMORY</b></li>
     * <li><b>E_FAIL</b></li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//msime/nf-msime-ifedictionary-create
     */
    Create(pchDictPath, pshf) {
        pchDictPath := pchDictPath is String ? StrPtr(pchDictPath) : pchDictPath

        result := ComCall(10, this, "ptr", pchDictPath, "ptr", pshf, "HRESULT")
        return result
    }

    /**
     * Sets a dictionary header in a dictionary file.
     * @param {Pointer<IMESHF>} pshf The <a href="https://docs.microsoft.com/windows/desktop/api/msime/ns-msime-imeshf">IMESHF</a> header to set.
     * @returns {HRESULT} <b>S_OK</b> if successful, otherwise <b>E_FAIL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//msime/nf-msime-ifedictionary-setheader
     */
    SetHeader(pshf) {
        result := ComCall(11, this, "ptr", pshf, "HRESULT")
        return result
    }

    /**
     * Determines if the specified word exists in IFEDictionary.
     * @param {Pointer<IMEWRD>} pwrd An <a href="https://docs.microsoft.com/windows/desktop/api/msime/ns-msime-imewrd">IMEWRD</a> structure specifying the word to check.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The word exists.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The word does not exist.
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
     * An unexpected error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msime/nf-msime-ifedictionary-existword
     */
    ExistWord(pwrd) {
        result := ComCall(12, this, "ptr", pwrd, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<IMEDP>} pdp 
     * @returns {HRESULT} 
     */
    ExistDependency(pdp) {
        result := ComCall(13, this, "ptr", pdp, "HRESULT")
        return result
    }

    /**
     * Registers a new word or deletes an existing word in the IFEDictionary.
     * @param {Integer} reg 
     * @param {Pointer<IMEWRD>} pwrd An <a href="https://docs.microsoft.com/windows/desktop/api/msime/ns-msime-imewrd">IMEWRD</a> structure specifying the word to register or delete.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method was successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IFED_E_NOT_USER_DIC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This <a href="/windows/desktop/api/msime/nn-msime-ifedictionary">IFEDictionary</a> object is not a user dictionary.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IFED_S_WORD_EXISTS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The word is already registered.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IFED_E_USER_COMMENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failed to insert the user comment.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failed to register or delete the word.
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
     * An unexpected error.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msime/nf-msime-ifedictionary-registerword
     */
    RegisterWord(reg, pwrd) {
        result := ComCall(14, this, "int", reg, "ptr", pwrd, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} reg 
     * @param {Pointer<IMEDP>} pdp 
     * @returns {HRESULT} 
     */
    RegisterDependency(reg, pdp) {
        result := ComCall(15, this, "int", reg, "ptr", pdp, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwchKakariReading 
     * @param {PWSTR} pwchKakariDisplay 
     * @param {Integer} ulKakariPos 
     * @param {PWSTR} pwchUkeReading 
     * @param {PWSTR} pwchUkeDisplay 
     * @param {Integer} ulUkePos 
     * @param {Integer} jrel 
     * @param {Integer} ulWordSrc 
     * @param {Pointer<Integer>} pchBuffer 
     * @param {Integer} cbBuffer 
     * @param {Pointer<Integer>} pcdp 
     * @returns {HRESULT} 
     */
    GetDependencies(pwchKakariReading, pwchKakariDisplay, ulKakariPos, pwchUkeReading, pwchUkeDisplay, ulUkePos, jrel, ulWordSrc, pchBuffer, cbBuffer, pcdp) {
        pwchKakariReading := pwchKakariReading is String ? StrPtr(pwchKakariReading) : pwchKakariReading
        pwchKakariDisplay := pwchKakariDisplay is String ? StrPtr(pwchKakariDisplay) : pwchKakariDisplay
        pwchUkeReading := pwchUkeReading is String ? StrPtr(pwchUkeReading) : pwchUkeReading
        pwchUkeDisplay := pwchUkeDisplay is String ? StrPtr(pwchUkeDisplay) : pwchUkeDisplay

        pchBufferMarshal := pchBuffer is VarRef ? "char*" : "ptr"
        pcdpMarshal := pcdp is VarRef ? "uint*" : "ptr"

        result := ComCall(16, this, "ptr", pwchKakariReading, "ptr", pwchKakariDisplay, "uint", ulKakariPos, "ptr", pwchUkeReading, "ptr", pwchUkeDisplay, "uint", ulUkePos, "int", jrel, "uint", ulWordSrc, pchBufferMarshal, pchBuffer, "uint", cbBuffer, pcdpMarshal, pcdp, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pchBuffer 
     * @param {Integer} cbBuffer 
     * @param {Pointer<Integer>} pcDp 
     * @returns {HRESULT} 
     */
    NextDependencies(pchBuffer, cbBuffer, pcDp) {
        pchBufferMarshal := pchBuffer is VarRef ? "char*" : "ptr"
        pcDpMarshal := pcDp is VarRef ? "uint*" : "ptr"

        result := ComCall(17, this, pchBufferMarshal, pchBuffer, "uint", cbBuffer, pcDpMarshal, pcDp, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PSTR} pchDic 
     * @param {Pointer<PFNLOG>} pfnLog 
     * @param {Integer} reg 
     * @returns {HRESULT} 
     */
    ConvertFromOldMSIME(pchDic, pfnLog, reg) {
        pchDic := pchDic is String ? StrPtr(pchDic) : pchDic

        result := ComCall(18, this, "ptr", pchDic, "ptr", pfnLog, "int", reg, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ConvertFromUserToSys() {
        result := ComCall(19, this, "HRESULT")
        return result
    }
}
