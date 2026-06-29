#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The IWMPClosedCaption interface provides a way to include captions with a digital media file. The captioning text is in a Synchronized Accessible Media Interchange (SAMI) file.
 * @see https://learn.microsoft.com/windows/win32/api/wmp/nn-wmp-iwmpclosedcaption
 * @namespace Windows.Win32.Media.MediaPlayer
 */
export default struct IWMPClosedCaption extends IDispatch {
    /**
     * The interface identifier for IWMPClosedCaption
     * @type {Guid}
     */
    static IID := Guid("{4f2df574-c588-11d3-9ed0-00c04fb6e937}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMPClosedCaption interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_SAMIStyle    : IntPtr
        put_SAMIStyle    : IntPtr
        get_SAMILang     : IntPtr
        put_SAMILang     : IntPtr
        get_SAMIFileName : IntPtr
        put_SAMIFileName : IntPtr
        get_captioningId : IntPtr
        put_captioningId : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMPClosedCaption.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    SAMIStyle {
        get => this.get_SAMIStyle()
        set => this.put_SAMIStyle(value)
    }

    /**
     * @type {BSTR} 
     */
    SAMILang {
        get => this.get_SAMILang()
        set => this.put_SAMILang(value)
    }

    /**
     * @type {BSTR} 
     */
    SAMIFileName {
        get => this.get_SAMIFileName()
        set => this.put_SAMIFileName(value)
    }

    /**
     * @type {BSTR} 
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
        result := ComCall(7, this, BSTR.Ptr, pbstrSAMIStyle, "HRESULT")
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

        result := ComCall(8, this, BSTR, bstrSAMIStyle, "HRESULT")
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
        result := ComCall(9, this, BSTR.Ptr, pbstrSAMILang, "HRESULT")
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

        result := ComCall(10, this, BSTR, bstrSAMILang, "HRESULT")
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
        result := ComCall(11, this, BSTR.Ptr, pbstrSAMIFileName, "HRESULT")
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

        result := ComCall(12, this, BSTR, bstrSAMIFileName, "HRESULT")
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
        result := ComCall(13, this, BSTR.Ptr, pbstrCaptioningID, "HRESULT")
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

        result := ComCall(14, this, BSTR, bstrCaptioningID, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWMPClosedCaption.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_SAMIStyle := CallbackCreate(GetMethod(implObj, "get_SAMIStyle"), flags, 2)
        this.vtbl.put_SAMIStyle := CallbackCreate(GetMethod(implObj, "put_SAMIStyle"), flags, 2)
        this.vtbl.get_SAMILang := CallbackCreate(GetMethod(implObj, "get_SAMILang"), flags, 2)
        this.vtbl.put_SAMILang := CallbackCreate(GetMethod(implObj, "put_SAMILang"), flags, 2)
        this.vtbl.get_SAMIFileName := CallbackCreate(GetMethod(implObj, "get_SAMIFileName"), flags, 2)
        this.vtbl.put_SAMIFileName := CallbackCreate(GetMethod(implObj, "put_SAMIFileName"), flags, 2)
        this.vtbl.get_captioningId := CallbackCreate(GetMethod(implObj, "get_captioningId"), flags, 2)
        this.vtbl.put_captioningId := CallbackCreate(GetMethod(implObj, "put_captioningId"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_SAMIStyle)
        CallbackFree(this.vtbl.put_SAMIStyle)
        CallbackFree(this.vtbl.get_SAMILang)
        CallbackFree(this.vtbl.put_SAMILang)
        CallbackFree(this.vtbl.get_SAMIFileName)
        CallbackFree(this.vtbl.put_SAMIFileName)
        CallbackFree(this.vtbl.get_captioningId)
        CallbackFree(this.vtbl.put_captioningId)
    }
}
