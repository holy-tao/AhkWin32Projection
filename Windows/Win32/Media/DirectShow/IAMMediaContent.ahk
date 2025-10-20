#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IAMMediaContent interface retrieves metadata from a stream.
 * @remarks
 * 
  * To define the interface identifier, include the header file Initguid.h before Qnetwork.h, but after Dshow.h and other header files:
  * 
  * <pre class="syntax" xml:space="preserve"><code>#include &lt;dshow.h&gt;
  * 
 * @see https://docs.microsoft.com/windows/win32/api//qnetwork/nn-qnetwork-iammediacontent
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IAMMediaContent extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAMMediaContent
     * @type {Guid}
     */
    static IID => Guid("{fa2aa8f4-8b62-11d0-a520-000000000000}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AuthorName", "get_Title", "get_Rating", "get_Description", "get_Copyright", "get_BaseURL", "get_LogoURL", "get_LogoIconURL", "get_WatermarkURL", "get_MoreInfoURL", "get_MoreInfoBannerImage", "get_MoreInfoBannerURL", "get_MoreInfoText"]

    /**
     * 
     * @param {Pointer<BSTR>} pbstrAuthorName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iammediacontent-get_authorname
     */
    get_AuthorName(pbstrAuthorName) {
        result := ComCall(7, this, "ptr", pbstrAuthorName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrTitle 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iammediacontent-get_title
     */
    get_Title(pbstrTitle) {
        result := ComCall(8, this, "ptr", pbstrTitle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrRating 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iammediacontent-get_rating
     */
    get_Rating(pbstrRating) {
        result := ComCall(9, this, "ptr", pbstrRating, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrDescription 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iammediacontent-get_description
     */
    get_Description(pbstrDescription) {
        result := ComCall(10, this, "ptr", pbstrDescription, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrCopyright 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iammediacontent-get_copyright
     */
    get_Copyright(pbstrCopyright) {
        result := ComCall(11, this, "ptr", pbstrCopyright, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrBaseURL 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iammediacontent-get_baseurl
     */
    get_BaseURL(pbstrBaseURL) {
        result := ComCall(12, this, "ptr", pbstrBaseURL, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrLogoURL 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iammediacontent-get_logourl
     */
    get_LogoURL(pbstrLogoURL) {
        result := ComCall(13, this, "ptr", pbstrLogoURL, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrLogoURL 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iammediacontent-get_logoiconurl
     */
    get_LogoIconURL(pbstrLogoURL) {
        result := ComCall(14, this, "ptr", pbstrLogoURL, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrWatermarkURL 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iammediacontent-get_watermarkurl
     */
    get_WatermarkURL(pbstrWatermarkURL) {
        result := ComCall(15, this, "ptr", pbstrWatermarkURL, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrMoreInfoURL 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iammediacontent-get_moreinfourl
     */
    get_MoreInfoURL(pbstrMoreInfoURL) {
        result := ComCall(16, this, "ptr", pbstrMoreInfoURL, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrMoreInfoBannerImage 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iammediacontent-get_moreinfobannerimage
     */
    get_MoreInfoBannerImage(pbstrMoreInfoBannerImage) {
        result := ComCall(17, this, "ptr", pbstrMoreInfoBannerImage, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrMoreInfoBannerURL 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iammediacontent-get_moreinfobannerurl
     */
    get_MoreInfoBannerURL(pbstrMoreInfoBannerURL) {
        result := ComCall(18, this, "ptr", pbstrMoreInfoBannerURL, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrMoreInfoText 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iammediacontent-get_moreinfotext
     */
    get_MoreInfoText(pbstrMoreInfoText) {
        result := ComCall(19, this, "ptr", pbstrMoreInfoText, "HRESULT")
        return result
    }
}
