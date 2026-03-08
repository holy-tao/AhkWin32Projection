#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IWMPClosedCaption interface provides a way to include captions with a digital media file. The captioning text is in a Synchronized Accessible Media Interchange (SAMI) file.
 * @see https://learn.microsoft.com/windows/win32/api/wmp/nn-wmp-iwmpclosedcaption
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPClosedCaption extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMPClosedCaption
     * @type {Guid}
     */
    static IID => Guid("{4f2df574-c588-11d3-9ed0-00c04fb6e937}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SAMIStyle", "put_SAMIStyle", "get_SAMILang", "put_SAMILang", "get_SAMIFileName", "put_SAMIFileName", "get_captioningId", "put_captioningId"]

    /**
     */
    SAMIStyle {
        get => this.get_SAMIStyle()
        set => this.put_SAMIStyle(value)
    }

    /**
     */
    SAMILang {
        get => this.get_SAMILang()
        set => this.put_SAMILang(value)
    }

    /**
     */
    SAMIFileName {
        get => this.get_SAMIFileName()
        set => this.put_SAMIFileName(value)
    }

    /**
     */
    captioningId {
        get => this.get_captioningId()
        set => this.put_captioningId(value)
    }

    /**
     * The get_SAMIStyle method retrieves the closed captioning style.
     * @remarks
     * A SAMI file can contain several format style definitions. SAMI styles are defined between the &lt;STYLE&gt; and &lt;/STYLE&gt; tags in the SAMI file. A style is defined with a text string preceded by a # character. For example, the following code specifies text formatting to be used for a style.
     * 
     * 
     * ```
     * @param {Pointer<BSTR>} pbstrSAMIStyle Pointer to a <b>BSTR</b> containing the SAMI style.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpclosedcaption-get_samistyle
     */
    get_SAMIStyle(pbstrSAMIStyle) {
        result := ComCall(7, this, "ptr", pbstrSAMIStyle, "HRESULT")
        return result
    }

    /**
     * The put_SAMIStyle method specifies the closed captioning style.
     * @remarks
     * A SAMI file can contain several format style definitions. SAMI styles are defined between the &lt;STYLE&gt; and &lt;/STYLE&gt; tags in the SAMI file. A style is defined with a text string preceded by a # character. For example, the following code specifies text formatting to be used for a style.
     * 
     * 
     * ```
     * @param {BSTR} bstrSAMIStyle <b>BSTR</b> containing the SAMI style.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpclosedcaption-put_samistyle
     */
    put_SAMIStyle(bstrSAMIStyle) {
        bstrSAMIStyle := bstrSAMIStyle is String ? BSTR.Alloc(bstrSAMIStyle).Value : bstrSAMIStyle

        result := ComCall(8, this, "ptr", bstrSAMIStyle, "HRESULT")
        return result
    }

    /**
     * The get_SAMILang method retrieves the language displayed for closed captioning.
     * @remarks
     * A SAMI file can contain text for one or many languages. The languages available for closed captioning are defined between the &lt;STYLE&gt; and &lt;/STYLE&gt; tags in the SAMI file. A language identifier is specified by a unique alphanumeric string that is preceded by a period (.). The name specified for a language can be any string. For example, the following could be used to define US English:
     * 
     * 
     * ```
     * 
     * .ENUSCC {Name:'English Captions' lang: en-US; SAMIType:CC;}
     * 
     * ```
     * 
     * 
     * If no SAMI language is specified, the first language defined in the SAMI file is used by default.
     * 
     * The value you specify using <b>put_SAMILang</b> must match the <b>Name</b> attribute in the language specifier.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This method always retrieves a <b>BSTR</b> containing an empty string.
     * @param {Pointer<BSTR>} pbstrSAMILang Pointer to a <b>BSTR</b> containing the language.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpclosedcaption-get_samilang
     */
    get_SAMILang(pbstrSAMILang) {
        result := ComCall(9, this, "ptr", pbstrSAMILang, "HRESULT")
        return result
    }

    /**
     * The put_SAMILang method specifies the language displayed for closed captioning.
     * @remarks
     * A SAMI file can contain text for one or many languages. The languages available for closed captioning are defined between the &lt;STYLE&gt; and &lt;/STYLE&gt; tags in the SAMI file. A language identifier is specified with a unique alphanumeric string that is preceded by a period (.). The name specified for a language can be any string. For example, the following could be used to define US English:
     * 
     * 
     * ```
     * .ENUSCC {Name:'English Captions' lang: en-US; SAMIType:CC;}
     * ```
     * 
     * 
     * If no SAMI language is specified, the first language defined in the SAMI file is used by default.
     * 
     * The value you specify using <b>put_SAMILang</b> must match the <b>Name</b> attribute in the language specifier.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This method always returns E_INVALIDARG.
     * @param {BSTR} bstrSAMILang Pointer to a <b>BSTR</b> containing the language.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpclosedcaption-put_samilang
     */
    put_SAMILang(bstrSAMILang) {
        bstrSAMILang := bstrSAMILang is String ? BSTR.Alloc(bstrSAMILang).Value : bstrSAMILang

        result := ComCall(10, this, "ptr", bstrSAMILang, "HRESULT")
        return result
    }

    /**
     * The get_SAMIFileName method retrieves the name of the file containing the information needed for closed captioning.
     * @remarks
     * The SAMI file must use an .smi or .sami file name extension.
     * 
     * If you do not specify a value by using <b>IWMPClosedCaption::put_SAMIFileName</b>, the <b>get_SAMIFileName</b> method retrieves a <b>BSTR</b> containing the default file or URL associated with the current media item. This association can occur when a SAMI file is specified by using the <i>sami</i> URL parameter, or automatically when the SAMI file has the same name as the digital media file (except for the file name extension). If there is no default SAMI file associated with the current media, <b>get_SAMIFileName</b> retrieves an empty string ("").
     * 
     * If you want Windows Media Player to use the default SAMI file associated with a particular media item, call <b>IWMPClosedCaption::put_SAMIFileName</b> using an empty string ("") before you play the next media item.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This method always retrieves a <b>BSTR</b> containing an empty string.
     * @param {Pointer<BSTR>} pbstrSAMIFileName Pointer to a <b>BSTR</b> containing the name of the Synchronized Accessible Media Interchange (SAMI) file.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpclosedcaption-get_samifilename
     */
    get_SAMIFileName(pbstrSAMIFileName) {
        result := ComCall(11, this, "ptr", pbstrSAMIFileName, "HRESULT")
        return result
    }

    /**
     * The put_SAMIFileName method specifies the name of the file containing the information needed for closed captioning.
     * @remarks
     * The SAMI file must use an .smi or .sami file name extension.
     * 
     * Once you specify a value using <b>put_SAMIFileName</b>, that value persists until you specify a new value (or until a new media item is opened by using the <i>sami</i> URL parameter). Therefore, you must specify a new value with this method before you play each new media item. The new value will take effect when the next media item is opened (or when <b>IWMPCore::close</b> is called). Specifying a new value by using <b>put_SAMIFileName</b> has no effect on the current media item.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This method always returns E_INVALIDARG.
     * @param {BSTR} bstrSAMIFileName <b>BSTR</b> containing the SAMI file name.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpclosedcaption-put_samifilename
     */
    put_SAMIFileName(bstrSAMIFileName) {
        bstrSAMIFileName := bstrSAMIFileName is String ? BSTR.Alloc(bstrSAMIFileName).Value : bstrSAMIFileName

        result := ComCall(12, this, "ptr", bstrSAMIFileName, "HRESULT")
        return result
    }

    /**
     * The get_captioningId method retrieves the name of the element displaying the captioning.
     * @remarks
     * The element name specified can be any HTML element in the webpage as long as it supports the <b>innerHTML</b> attribute. If the webpage contains multiple frames, the element name can only refer to an element in the same frame as the Windows Media Player control.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This method always retrieves a <b>BSTR</b> containing an empty string.
     * @param {Pointer<BSTR>} pbstrCaptioningID Pointer to a <b>BSTR</b> containing the captioning ID.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpclosedcaption-get_captioningid
     */
    get_captioningId(pbstrCaptioningID) {
        result := ComCall(13, this, "ptr", pbstrCaptioningID, "HRESULT")
        return result
    }

    /**
     * The put_captioningId method specifies the name of the element displaying the captioning.
     * @remarks
     * The element name specified can be any HTML element in the webpage as long as it supports the <b>innerHTML</b> attribute. If the webpage contains multiple frames, the element name can only refer to an element in the same frame as the Windows Media Player control.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This method always returns E_INVALIDARG.
     * @param {BSTR} bstrCaptioningID <b>BSTR</b> containing the captioning ID.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpclosedcaption-put_captioningid
     */
    put_captioningId(bstrCaptioningID) {
        bstrCaptioningID := bstrCaptioningID is String ? BSTR.Alloc(bstrCaptioningID).Value : bstrCaptioningID

        result := ComCall(14, this, "ptr", bstrCaptioningID, "HRESULT")
        return result
    }
}
