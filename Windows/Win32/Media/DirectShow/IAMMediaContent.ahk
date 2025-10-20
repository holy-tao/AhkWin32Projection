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
     * 
     * @param {Pointer<BSTR>} pbstrAuthorName 
     * @returns {HRESULT} 
     */
    get_AuthorName(pbstrAuthorName) {
        result := ComCall(7, this, "ptr", pbstrAuthorName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrTitle 
     * @returns {HRESULT} 
     */
    get_Title(pbstrTitle) {
        result := ComCall(8, this, "ptr", pbstrTitle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrRating 
     * @returns {HRESULT} 
     */
    get_Rating(pbstrRating) {
        result := ComCall(9, this, "ptr", pbstrRating, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrDescription 
     * @returns {HRESULT} 
     */
    get_Description(pbstrDescription) {
        result := ComCall(10, this, "ptr", pbstrDescription, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrCopyright 
     * @returns {HRESULT} 
     */
    get_Copyright(pbstrCopyright) {
        result := ComCall(11, this, "ptr", pbstrCopyright, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrBaseURL 
     * @returns {HRESULT} 
     */
    get_BaseURL(pbstrBaseURL) {
        result := ComCall(12, this, "ptr", pbstrBaseURL, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrLogoURL 
     * @returns {HRESULT} 
     */
    get_LogoURL(pbstrLogoURL) {
        result := ComCall(13, this, "ptr", pbstrLogoURL, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrLogoURL 
     * @returns {HRESULT} 
     */
    get_LogoIconURL(pbstrLogoURL) {
        result := ComCall(14, this, "ptr", pbstrLogoURL, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrWatermarkURL 
     * @returns {HRESULT} 
     */
    get_WatermarkURL(pbstrWatermarkURL) {
        result := ComCall(15, this, "ptr", pbstrWatermarkURL, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrMoreInfoURL 
     * @returns {HRESULT} 
     */
    get_MoreInfoURL(pbstrMoreInfoURL) {
        result := ComCall(16, this, "ptr", pbstrMoreInfoURL, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrMoreInfoBannerImage 
     * @returns {HRESULT} 
     */
    get_MoreInfoBannerImage(pbstrMoreInfoBannerImage) {
        result := ComCall(17, this, "ptr", pbstrMoreInfoBannerImage, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrMoreInfoBannerURL 
     * @returns {HRESULT} 
     */
    get_MoreInfoBannerURL(pbstrMoreInfoBannerURL) {
        result := ComCall(18, this, "ptr", pbstrMoreInfoBannerURL, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrMoreInfoText 
     * @returns {HRESULT} 
     */
    get_MoreInfoText(pbstrMoreInfoText) {
        result := ComCall(19, this, "ptr", pbstrMoreInfoText, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
