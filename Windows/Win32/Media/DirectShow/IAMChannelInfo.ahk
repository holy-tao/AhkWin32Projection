#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IAMChannelInfo interface gets and sets channel information for Windows Media Station (.nsc) files.This interface is exposed by the Windows Media Source filter only when the filter is reading Windows Media Station (.nsc) files.
 * @remarks
 * 
  * To define the interface identifier, include the header file Initguid.h before Qnetwork.h, but after Dshow.h and other header files:
  * 
  * <pre class="syntax" xml:space="preserve"><code>#include &lt;dshow.h&gt;
  * 
 * @see https://docs.microsoft.com/windows/win32/api//qnetwork/nn-qnetwork-iamchannelinfo
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IAMChannelInfo extends IDispatch{
    /**
     * The interface identifier for IAMChannelInfo
     * @type {Guid}
     */
    static IID => Guid("{fa2aa8f2-8b62-11d0-a520-000000000000}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<BSTR>} pbstrChannelName 
     * @returns {HRESULT} 
     */
    get_ChannelName(pbstrChannelName) {
        result := ComCall(7, this, "ptr", pbstrChannelName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrChannelDescription 
     * @returns {HRESULT} 
     */
    get_ChannelDescription(pbstrChannelDescription) {
        result := ComCall(8, this, "ptr", pbstrChannelDescription, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrChannelURL 
     * @returns {HRESULT} 
     */
    get_ChannelURL(pbstrChannelURL) {
        result := ComCall(9, this, "ptr", pbstrChannelURL, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrContactAddress 
     * @returns {HRESULT} 
     */
    get_ContactAddress(pbstrContactAddress) {
        result := ComCall(10, this, "ptr", pbstrContactAddress, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrContactPhone 
     * @returns {HRESULT} 
     */
    get_ContactPhone(pbstrContactPhone) {
        result := ComCall(11, this, "ptr", pbstrContactPhone, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrContactEmail 
     * @returns {HRESULT} 
     */
    get_ContactEmail(pbstrContactEmail) {
        result := ComCall(12, this, "ptr", pbstrContactEmail, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
