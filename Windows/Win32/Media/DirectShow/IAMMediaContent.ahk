#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The IAMMediaContent interface retrieves metadata from a stream.
 * @remarks
 * To define the interface identifier, include the header file Initguid.h before Qnetwork.h, but after Dshow.h and other header files:
 * 
 * <pre class="syntax" xml:space="preserve"><code>#include &lt;dshow.h&gt;
 * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nn-qnetwork-iammediacontent
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IAMMediaContent extends IDispatch {
    /**
     * The interface identifier for IAMMediaContent
     * @type {Guid}
     */
    static IID := Guid("{fa2aa8f4-8b62-11d0-a520-000000000000}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAMMediaContent interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_AuthorName          : IntPtr
        get_Title               : IntPtr
        get_Rating              : IntPtr
        get_Description         : IntPtr
        get_Copyright           : IntPtr
        get_BaseURL             : IntPtr
        get_LogoURL             : IntPtr
        get_LogoIconURL         : IntPtr
        get_WatermarkURL        : IntPtr
        get_MoreInfoURL         : IntPtr
        get_MoreInfoBannerImage : IntPtr
        get_MoreInfoBannerURL   : IntPtr
        get_MoreInfoText        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAMMediaContent.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     */
    AuthorName {
        get => this.get_AuthorName()
    }

    /**
     */
    Title {
        get => this.get_Title()
    }

    /**
     */
    Rating {
        get => this.get_Rating()
    }

    /**
     */
    Description {
        get => this.get_Description()
    }

    /**
     */
    Copyright {
        get => this.get_Copyright()
    }

    /**
     */
    BaseURL {
        get => this.get_BaseURL()
    }

    /**
     */
    LogoURL {
        get => this.get_LogoURL()
    }

    /**
     */
    LogoIconURL {
        get => this.get_LogoIconURL()
    }

    /**
     */
    WatermarkURL {
        get => this.get_WatermarkURL()
    }

    /**
     */
    MoreInfoURL {
        get => this.get_MoreInfoURL()
    }

    /**
     */
    MoreInfoBannerImage {
        get => this.get_MoreInfoBannerImage()
    }

    /**
     */
    MoreInfoBannerURL {
        get => this.get_MoreInfoBannerURL()
    }

    /**
     */
    MoreInfoText {
        get => this.get_MoreInfoText()
    }

    /**
     * The get_AuthorName method retrieves the author name.
     * @remarks
     * If the method succeeds, the caller must free the returned <b>BSTR</b> by calling the <b>SysFreeString</b> function.
     * @param {Pointer<BSTR>} pbstrAuthorName Pointer to a variable that receives a <b>BSTR</b> with the information.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include those shown in the following table.
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
     * Success.
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
     * Not implemented.
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
     * Insufficient memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Item not found.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iammediacontent-get_authorname
     */
    get_AuthorName(pbstrAuthorName) {
        result := ComCall(7, this, BSTR.Ptr, pbstrAuthorName, "HRESULT")
        return result
    }

    /**
     * The get_Title method retrieves the title.
     * @remarks
     * If the method succeeds, the caller must free the returned <b>BSTR</b> by calling the <b>SysFreeString</b> function.
     * @param {Pointer<BSTR>} pbstrTitle Pointer to a variable that receives a <b>BSTR</b> with the information.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include those shown in the following table.
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
     * Success.
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
     * Not implemented.
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
     * Insufficient memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Item not found.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iammediacontent-get_title
     */
    get_Title(pbstrTitle) {
        result := ComCall(8, this, BSTR.Ptr, pbstrTitle, "HRESULT")
        return result
    }

    /**
     * The get_Rating method retrieves the rating.
     * @remarks
     * If the method succeeds, the caller must free the returned <b>BSTR</b> by calling the <b>SysFreeString</b> function.
     * @param {Pointer<BSTR>} pbstrRating Pointer to a variable that receives a <b>BSTR</b> with the information.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include those shown in the following table.
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
     * Success.
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
     * Not implemented.
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
     * Insufficient memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Item not found.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iammediacontent-get_rating
     */
    get_Rating(pbstrRating) {
        result := ComCall(9, this, BSTR.Ptr, pbstrRating, "HRESULT")
        return result
    }

    /**
     * The get_Description method retrieves a description of the content.
     * @remarks
     * If the method succeeds, the caller must free the returned <b>BSTR</b> by calling the <b>SysFreeString</b> function.
     * @param {Pointer<BSTR>} pbstrDescription Pointer to a variable that receives a <b>BSTR</b> with the information.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include those shown in the following table.
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
     * Success.
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
     * Not implemented.
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
     * Insufficient memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Item not found.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iammediacontent-get_description
     */
    get_Description(pbstrDescription) {
        result := ComCall(10, this, BSTR.Ptr, pbstrDescription, "HRESULT")
        return result
    }

    /**
     * The get_Copyright method retrieves copyright information.
     * @remarks
     * If the method succeeds, the caller must free the returned <b>BSTR</b> by calling the <b>SysFreeString</b> function.
     * @param {Pointer<BSTR>} pbstrCopyright Pointer to a variable that receives a <b>BSTR</b> with the information.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include those shown in the following table.
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
     * Success.
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
     * Not implemented.
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
     * Insufficient memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Item not found.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iammediacontent-get_copyright
     */
    get_Copyright(pbstrCopyright) {
        result := ComCall(11, this, BSTR.Ptr, pbstrCopyright, "HRESULT")
        return result
    }

    /**
     * The get_BaseURL method gets a base URL for the related web content.
     * @remarks
     * If the method succeeds, the caller must free the returned <b>BSTR</b> by calling the <b>SysFreeString</b> function.
     * @param {Pointer<BSTR>} pbstrBaseURL Receives a <b>BSTR</b> with the information.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include those shown in the following table.
     *           
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
     * Success.
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
     * Not implemented.
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
     * Insufficient memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Item not found.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iammediacontent-get_baseurl
     */
    get_BaseURL(pbstrBaseURL) {
        result := ComCall(12, this, BSTR.Ptr, pbstrBaseURL, "HRESULT")
        return result
    }

    /**
     * The get_LogoURL method retrieves a URL for the logo.
     * @remarks
     * If the method succeeds, the caller must free the returned <b>BSTR</b> by calling the <b>SysFreeString</b> function.
     * @param {Pointer<BSTR>} pbstrLogoURL Pointer to a variable that receives a <b>BSTR</b> with the information.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include those shown in the following table.
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
     * Success.
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
     * Not implemented.
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
     * Insufficient memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Item not found.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iammediacontent-get_logourl
     */
    get_LogoURL(pbstrLogoURL) {
        result := ComCall(13, this, BSTR.Ptr, pbstrLogoURL, "HRESULT")
        return result
    }

    /**
     * The get_LogoIconURL method retrieves a URL for the logo icon.
     * @remarks
     * If the method succeeds, the caller must free the returned <b>BSTR</b> by calling the <b>SysFreeString</b> function.
     * @param {Pointer<BSTR>} pbstrLogoURL Pointer to a variable that receives a <b>BSTR</b> with the information.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include those shown in the following table.
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
     * Success.
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
     * Not implemented.
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
     * Insufficient memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Item not found.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iammediacontent-get_logoiconurl
     */
    get_LogoIconURL(pbstrLogoURL) {
        result := ComCall(14, this, BSTR.Ptr, pbstrLogoURL, "HRESULT")
        return result
    }

    /**
     * The get_WatermarkURL method retrieves a URL for the watermark.
     * @remarks
     * If the method succeeds, the caller must free the returned <b>BSTR</b> by calling the <b>SysFreeString</b> function.
     * @param {Pointer<BSTR>} pbstrWatermarkURL Pointer to a variable that receives a <b>BSTR</b> with the information.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include those shown in the following table.
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
     * Success.
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
     * Not implemented.
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
     * Insufficient memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Item not found.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iammediacontent-get_watermarkurl
     */
    get_WatermarkURL(pbstrWatermarkURL) {
        result := ComCall(15, this, BSTR.Ptr, pbstrWatermarkURL, "HRESULT")
        return result
    }

    /**
     * The get_MoreInfoURL method retrieves a URL for additional information about the content.
     * @remarks
     * If the method succeeds, the caller must free the returned <b>BSTR</b> by calling the <b>SysFreeString</b> function.
     * @param {Pointer<BSTR>} pbstrMoreInfoURL Pointer to a variable that receives a <b>BSTR</b> with the information.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include those shown in the following table.
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
     * Success.
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
     * Not implemented.
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
     * Insufficient memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Item not found.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iammediacontent-get_moreinfourl
     */
    get_MoreInfoURL(pbstrMoreInfoURL) {
        result := ComCall(16, this, BSTR.Ptr, pbstrMoreInfoURL, "HRESULT")
        return result
    }

    /**
     * The get_MoreInfoBannerImage method retrieves an image for a related-information banner.
     * @remarks
     * If the method succeeds, the caller must free the returned <b>BSTR</b> by calling the <b>SysFreeString</b> function.
     * @param {Pointer<BSTR>} pbstrMoreInfoBannerImage Pointer to a variable that receives a <b>BSTR</b> with the information.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include those shown in the following table.
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
     * Success.
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
     * Not implemented.
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
     * Insufficient memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Item not found.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iammediacontent-get_moreinfobannerimage
     */
    get_MoreInfoBannerImage(pbstrMoreInfoBannerImage) {
        result := ComCall(17, this, BSTR.Ptr, pbstrMoreInfoBannerImage, "HRESULT")
        return result
    }

    /**
     * The get_MoreInfoBannerURL method retrieves a URL for a related-information banner.
     * @remarks
     * If the method succeeds, the caller must free the returned <b>BSTR</b> by calling the <b>SysFreeString</b> function.
     * @param {Pointer<BSTR>} pbstrMoreInfoBannerURL Pointer to a variable that receives a <b>BSTR</b> with the information.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include those shown in the following table.
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
     * Success.
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
     * Not implemented.
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
     * Insufficient memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Item not found.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iammediacontent-get_moreinfobannerurl
     */
    get_MoreInfoBannerURL(pbstrMoreInfoBannerURL) {
        result := ComCall(18, this, BSTR.Ptr, pbstrMoreInfoBannerURL, "HRESULT")
        return result
    }

    /**
     * The get_MoreInfoText method retrieves additional information as text.
     * @remarks
     * If the method succeeds, the caller must free the returned <b>BSTR</b> by calling the <b>SysFreeString</b> function.
     * @param {Pointer<BSTR>} pbstrMoreInfoText Pointer to a variable that receives a <b>BSTR</b> with the information.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include those shown in the following table.
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
     * Success.
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
     * Not implemented.
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
     * Insufficient memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Item not found.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iammediacontent-get_moreinfotext
     */
    get_MoreInfoText(pbstrMoreInfoText) {
        result := ComCall(19, this, BSTR.Ptr, pbstrMoreInfoText, "HRESULT")
        return result
    }

    Query(iid) {
        if (IAMMediaContent.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_AuthorName := CallbackCreate(GetMethod(implObj, "get_AuthorName"), flags, 2)
        this.vtbl.get_Title := CallbackCreate(GetMethod(implObj, "get_Title"), flags, 2)
        this.vtbl.get_Rating := CallbackCreate(GetMethod(implObj, "get_Rating"), flags, 2)
        this.vtbl.get_Description := CallbackCreate(GetMethod(implObj, "get_Description"), flags, 2)
        this.vtbl.get_Copyright := CallbackCreate(GetMethod(implObj, "get_Copyright"), flags, 2)
        this.vtbl.get_BaseURL := CallbackCreate(GetMethod(implObj, "get_BaseURL"), flags, 2)
        this.vtbl.get_LogoURL := CallbackCreate(GetMethod(implObj, "get_LogoURL"), flags, 2)
        this.vtbl.get_LogoIconURL := CallbackCreate(GetMethod(implObj, "get_LogoIconURL"), flags, 2)
        this.vtbl.get_WatermarkURL := CallbackCreate(GetMethod(implObj, "get_WatermarkURL"), flags, 2)
        this.vtbl.get_MoreInfoURL := CallbackCreate(GetMethod(implObj, "get_MoreInfoURL"), flags, 2)
        this.vtbl.get_MoreInfoBannerImage := CallbackCreate(GetMethod(implObj, "get_MoreInfoBannerImage"), flags, 2)
        this.vtbl.get_MoreInfoBannerURL := CallbackCreate(GetMethod(implObj, "get_MoreInfoBannerURL"), flags, 2)
        this.vtbl.get_MoreInfoText := CallbackCreate(GetMethod(implObj, "get_MoreInfoText"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_AuthorName)
        CallbackFree(this.vtbl.get_Title)
        CallbackFree(this.vtbl.get_Rating)
        CallbackFree(this.vtbl.get_Description)
        CallbackFree(this.vtbl.get_Copyright)
        CallbackFree(this.vtbl.get_BaseURL)
        CallbackFree(this.vtbl.get_LogoURL)
        CallbackFree(this.vtbl.get_LogoIconURL)
        CallbackFree(this.vtbl.get_WatermarkURL)
        CallbackFree(this.vtbl.get_MoreInfoURL)
        CallbackFree(this.vtbl.get_MoreInfoBannerImage)
        CallbackFree(this.vtbl.get_MoreInfoBannerURL)
        CallbackFree(this.vtbl.get_MoreInfoText)
    }
}
