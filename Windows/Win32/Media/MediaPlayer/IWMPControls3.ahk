#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IWMPControls2.ahk

/**
 * The IWMPControls3 interface provides methods that supplement the IWMPControls2 interface.
 * @see https://docs.microsoft.com/windows/win32/api//wmp/nn-wmp-iwmpcontrols3
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
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpcontrols3-get_audiolanguagecount
     */
    get_audioLanguageCount(plCount) {
        plCountMarshal := plCount is VarRef ? "int*" : "ptr"

        result := ComCall(24, this, plCountMarshal, plCount, "HRESULT")
        return result
    }

    /**
     * The getAudioLanguageID method retrieves the locale identifier (LCID) for a specified audio language index.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpcontrols3-getaudiolanguageid
     */
    getAudioLanguageID(lIndex, plLangID) {
        plLangIDMarshal := plLangID is VarRef ? "int*" : "ptr"

        result := ComCall(25, this, "int", lIndex, plLangIDMarshal, plLangID, "HRESULT")
        return result
    }

    /**
     * The getAudioLanguageDescription method retrieves the description for the audio language corresponding to the specified one-based index.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpcontrols3-getaudiolanguagedescription
     */
    getAudioLanguageDescription(lIndex, pbstrLangDesc) {
        result := ComCall(26, this, "int", lIndex, "ptr", pbstrLangDesc, "HRESULT")
        return result
    }

    /**
     * The get_currentAudioLanguage method retrieves the locale identifier (LCID) of the audio language for playback.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpcontrols3-get_currentaudiolanguage
     */
    get_currentAudioLanguage(plLangID) {
        plLangIDMarshal := plLangID is VarRef ? "int*" : "ptr"

        result := ComCall(27, this, plLangIDMarshal, plLangID, "HRESULT")
        return result
    }

    /**
     * The put_currentAudioLanguage method specifies the locale identifier (LCID) of the audio language for playback.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpcontrols3-put_currentaudiolanguage
     */
    put_currentAudioLanguage(lLangID) {
        result := ComCall(28, this, "int", lLangID, "HRESULT")
        return result
    }

    /**
     * The get_currentAudioLanguageIndex method retrieves the one-based index that corresponds to the audio language for playback.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpcontrols3-get_currentaudiolanguageindex
     */
    get_currentAudioLanguageIndex(plIndex) {
        plIndexMarshal := plIndex is VarRef ? "int*" : "ptr"

        result := ComCall(29, this, plIndexMarshal, plIndex, "HRESULT")
        return result
    }

    /**
     * The put_currentAudioLanguageIndex method specifies the one-based index that corresponds to the audio language for playback.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpcontrols3-put_currentaudiolanguageindex
     */
    put_currentAudioLanguageIndex(lIndex) {
        result := ComCall(30, this, "int", lIndex, "HRESULT")
        return result
    }

    /**
     * The getLanguageName method retrieves the name of the audio language with the specified locale identifier (LCID).
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
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpcontrols3-getlanguagename
     */
    getLanguageName(lLangID, pbstrLangName) {
        result := ComCall(31, this, "int", lLangID, "ptr", pbstrLangName, "HRESULT")
        return result
    }

    /**
     * The get_currentPositionTimecode method retrieves the current position in the current media item using a time code format. This method currently supports SMPTE time code.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpcontrols3-get_currentpositiontimecode
     */
    get_currentPositionTimecode(bstrTimecode) {
        result := ComCall(32, this, "ptr", bstrTimecode, "HRESULT")
        return result
    }

    /**
     * The put_currentPositionTimecode method specifies the current position in the current media item using a time code format. This method currently supports SMPTE time code.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpcontrols3-put_currentpositiontimecode
     */
    put_currentPositionTimecode(bstrTimecode) {
        bstrTimecode := bstrTimecode is String ? BSTR.Alloc(bstrTimecode).Value : bstrTimecode

        result := ComCall(33, this, "ptr", bstrTimecode, "HRESULT")
        return result
    }
}
