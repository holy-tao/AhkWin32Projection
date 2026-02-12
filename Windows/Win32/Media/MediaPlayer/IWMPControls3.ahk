#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IWMPControls2.ahk

/**
 * The IWMPControls3 interface provides methods that supplement the IWMPControls2 interface.
 * @see https://learn.microsoft.com/windows/win32/api//content/wmp/nn-wmp-iwmpcontrols3
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPControls3 extends IWMPControls2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMPControls3
     * @type {Guid}
     */
    static IID => Guid("{a1d1110e-d545-476a-9a78-ac3e4cb1e6bd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 24

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_audioLanguageCount", "getAudioLanguageID", "getAudioLanguageDescription", "get_currentAudioLanguage", "put_currentAudioLanguage", "get_currentAudioLanguageIndex", "put_currentAudioLanguageIndex", "getLanguageName", "get_currentPositionTimecode", "put_currentPositionTimecode"]

    /**
     */
    audioLanguageCount {
        get => this.get_audioLanguageCount()
    }

    /**
     */
    currentAudioLanguage {
        get => this.get_currentAudioLanguage()
        set => this.put_currentAudioLanguage(value)
    }

    /**
     */
    currentAudioLanguageIndex {
        get => this.get_currentAudioLanguageIndex()
        set => this.put_currentAudioLanguageIndex(value)
    }

    /**
     */
    currentPositionTimecode {
        get => this.get_currentPositionTimecode()
        set => this.put_currentPositionTimecode(value)
    }

    /**
     * The get_audioLanguageCount method retrieves the count of supported audio languages.
     * @remarks
     * For Windows Media-based content, properties and methods related to language selection support only a single output.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This method always retrieves a <b>long</b> set to 1.
     * @param {Pointer<Integer>} plCount Pointer to a <b>long</b> containing the count.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/wmp/nf-wmp-iwmpcontrols3-get_audiolanguagecount
     */
    get_audioLanguageCount(plCount) {
        plCountMarshal := plCount is VarRef ? "int*" : "ptr"

        result := ComCall(24, this, plCountMarshal, plCount, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The getAudioLanguageID method retrieves the locale identifier (LCID) for a specified audio language index.
     * @remarks
     * An LCID uniquely identifies a particular language dialect, called a locale.
     * 
     * For Windows Media-based content, properties and methods related to language selection support only a single output.
     * 
     * Use the <b>get_audioLanguageCount</b> method to retrieve the number of supported audio languages, and then access an audio language individually by using a one-based index.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This method always retrieves a <b>long</b> set to 0 (the language-neutral LCID).
     * @param {Integer} lIndex <b>long</b> specifying the one-based index of the audio language.
     * @param {Pointer<Integer>} plLangID Pointer to a <b>long</b> containing the LCID.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/wmp/nf-wmp-iwmpcontrols3-getaudiolanguageid
     */
    getAudioLanguageID(lIndex, plLangID) {
        plLangIDMarshal := plLangID is VarRef ? "int*" : "ptr"

        result := ComCall(25, this, "int", lIndex, plLangIDMarshal, plLangID, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The getAudioLanguageDescription method retrieves the description for the audio language corresponding to the specified one-based index.
     * @remarks
     * For Windows Media-based content, properties and methods related to language selection support only a single output.
     * 
     * Use the <b>get_audioLanguageCount</b> method to retrieve the number of supported audio languages, and then access an audio language individually by using a one-based index.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This method is not supported.
     * @param {Integer} lIndex <b>long</b> specifying the one-based audio language index.
     * @param {Pointer<BSTR>} pbstrLangDesc Pointer to a <b>BSTR</b> containing the description.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/wmp/nf-wmp-iwmpcontrols3-getaudiolanguagedescription
     */
    getAudioLanguageDescription(lIndex, pbstrLangDesc) {
        result := ComCall(26, this, "int", lIndex, "ptr", pbstrLangDesc, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The get_currentAudioLanguage method retrieves the locale identifier (LCID) of the audio language for playback.
     * @remarks
     * An LCID uniquely identifies a particular language dialect, called a locale.
     * 
     * For Windows Media-based content, properties and methods related to language selection support only a single output.
     * 
     * When working with DVD content, specifying an LCID will cause the first available audio track having the specified language ID to be selected.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This method always retrieves a <b>long</b> set to 0 (the language-neutral LCID).
     * @param {Pointer<Integer>} plLangID Pointer to a <b>long</b> containing the LCID.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/wmp/nf-wmp-iwmpcontrols3-get_currentaudiolanguage
     */
    get_currentAudioLanguage(plLangID) {
        plLangIDMarshal := plLangID is VarRef ? "int*" : "ptr"

        result := ComCall(27, this, plLangIDMarshal, plLangID, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The put_currentAudioLanguage method specifies the locale identifier (LCID) of the audio language for playback.
     * @remarks
     * An LCID uniquely identifies a particular language dialect, called a locale.
     * 
     * For Windows Media-based content, properties and methods related to language selection support only a single output.
     * 
     * When working with DVD content, specifying an LCID will cause the first available audio track having the specified language ID to be selected.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This method only accepts a <b>long</b> set to 0 (the language-neutral LCID), otherwise an E_INVALIDARG <b>HRESULT</b> is returned.
     * @param {Integer} lLangID <b>long</b> containing the LCID.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/wmp/nf-wmp-iwmpcontrols3-put_currentaudiolanguage
     */
    put_currentAudioLanguage(lLangID) {
        result := ComCall(28, this, "int", lLangID, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The get_currentAudioLanguageIndex method retrieves the one-based index that corresponds to the audio language for playback.
     * @remarks
     * For Windows Media-based content, properties and methods related to language selection support only a single output.
     * 
     * Use the <b>get_audioLanguageCount</b> method to retrieve the number of supported audio languages.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This method always retrieves a <b>long</b> set to 0.
     * @param {Pointer<Integer>} plIndex Pointer to a <b>long</b> containing the one-based index.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/wmp/nf-wmp-iwmpcontrols3-get_currentaudiolanguageindex
     */
    get_currentAudioLanguageIndex(plIndex) {
        plIndexMarshal := plIndex is VarRef ? "int*" : "ptr"

        result := ComCall(29, this, plIndexMarshal, plIndex, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The put_currentAudioLanguageIndex method specifies the one-based index that corresponds to the audio language for playback.
     * @remarks
     * For Windows Media-based content, properties and methods related to language selection support only a single output.
     * 
     * Use the <b>get_audioLanguageCount</b> method to retrieve the number of supported audio languages.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This method only accepts a <b>long</b> set to 0, otherwise an E_INVALIDARG <b>HRESULT</b> is returned.
     * @param {Integer} lIndex <b>long</b> containing the one-based index.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/wmp/nf-wmp-iwmpcontrols3-put_currentaudiolanguageindex
     */
    put_currentAudioLanguageIndex(lIndex) {
        result := ComCall(30, this, "int", lIndex, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The getLanguageName method retrieves the name of the audio language with the specified locale identifier (LCID).
     * @remarks
     * An LCID uniquely identifies a particular language dialect, called a locale.
     * 
     * For Windows Media-based content, properties and methods related to language selection support only a single output.
     * @param {Integer} lLangID <b>long</b> specifying the LCID.
     * @param {Pointer<BSTR>} pbstrLangName Pointer to a <b>BSTR</b> containing the audio language name.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/wmp/nf-wmp-iwmpcontrols3-getlanguagename
     */
    getLanguageName(lLangID, pbstrLangName) {
        result := ComCall(31, this, "int", lLangID, "ptr", pbstrLangName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The get_currentPositionTimecode method retrieves the current position in the current media item using a time code format. This method currently supports SMPTE time code.
     * @remarks
     * SMPTE time code provides a standard way of identifying an individual video frame, which is useful for synchronizing playback. If a digital media file supports SMPTE time code, Windows Media Player can retrieve the current time code position information or seek to a video frame identified by a <b>BSTR</b> containing a particular time code.
     * 
     * SMPTE time code identifies a particular frame by the number of hours, minutes, seconds, and frames that separate it from a particular reference frame—the frame designated as time zero. Usually the time zero frame is the start of the file and a particular SMPTE time code value represents the elapsed time since the start of the file.
     * 
     * The time code is in the format [<i>range</i>]<i>hh</i>:<i>mm</i>:<i>ss</i>.<i>ff</i> where [<i>range</i>] represents the range, <i>hh</i> represents hours, <i>mm</i> represents minutes, <i>ss</i> represents seconds, and <i>ff</i> represents frames. When specifying a value for <b>IWMPControls3::put_currentPositionTimecode</b>, you must include all eight digits, using zeros as placeholders.
     * 
     * [<i>range</i>] corresponds to the <b>wRange</b> member of the Windows Media Format <b>WMT_TIMECODE_EXTENSION_DATA</b> structure. For more information about time code ranges, see the Windows Media Format SDK.
     * 
     * Specifying and retrieving values by using <b>put_currentPositionTimecode</b> and <b>get_currentPositionTimecode</b> are supported only for files that contain SMPTE time code information.
     * 
     * <b>Windows Media Player 10 Mobile: </b>When retrieving or specifying an SMPTE time code through the object model, the range and frames sections of the time code format are not supported.
     * @param {Pointer<BSTR>} bstrTimecode Pointer to a <b>BSTR</b> containing the time code.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/wmp/nf-wmp-iwmpcontrols3-get_currentpositiontimecode
     */
    get_currentPositionTimecode(bstrTimecode) {
        result := ComCall(32, this, "ptr", bstrTimecode, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The put_currentPositionTimecode method specifies the current position in the current media item using a time code format. This method currently supports SMPTE time code.
     * @remarks
     * SMPTE time code provides a standard way of identifying an individual video frame, which is useful for synchronizing playback. If a digital media file supports SMPTE time code, Windows Media Player can retrieve the current time code position information or seek to a video frame identified by a <b>BSTR</b> containing a particular time code.
     * 
     * SMPTE time code identifies a particular frame by the number of hours, minutes, seconds, and frames that separate it from a particular reference frame—the frame designated as time zero. Usually the time zero frame is the start of the file and a particular SMPTE time code value represents the elapsed time since the start of the file.
     * 
     * The time code is in the format [<i>range</i>]<i>hh</i>:<i>mm</i>:<i>ss</i>.<i>ff</i> where [<i>range</i>] represents the range, <i>hh</i> represents hours, <i>mm</i> represents minutes, <i>ss</i> represents seconds, and <i>ff</i> represents frames. When specifying a value for <b>put_currentPositionTimecode</b>, you must include all eight digits using zeros as placeholders.
     * 
     * [<i>range</i>] corresponds to the <b>wRange</b> member of the Windows Media Format <b>WMT_TIMECODE_EXTENSION_DATA</b> structure. For more information about time code ranges, see the Windows Media Format SDK.
     * 
     * Specifying and retrieving values using <b>put_currentPositionTimecode</b> and <b>get_currentPositionTimecode</b> are supported only for files that contain SMPTE time code information.
     * 
     * <b>Windows Media Player 10 Mobile: </b>When retrieving or specifying an SMPTE time code through the object model, the range and frames sections of the time code format are not supported.
     * @param {BSTR} bstrTimecode <b>BSTR</b> containing the time code.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/wmp/nf-wmp-iwmpcontrols3-put_currentpositiontimecode
     */
    put_currentPositionTimecode(bstrTimecode) {
        if(bstrTimecode is String) {
            pin := BSTR.Alloc(bstrTimecode)
            bstrTimecode := pin.Value
        }

        result := ComCall(33, this, "ptr", bstrTimecode, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
