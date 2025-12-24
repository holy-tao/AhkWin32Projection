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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ChannelName", "get_ChannelDescription", "get_ChannelURL", "get_ContactAddress", "get_ContactPhone", "get_ContactEmail"]

    /**
     */
    ChannelName {
        get => this.get_ChannelName()
    }

    /**
     */
    ChannelDescription {
        get => this.get_ChannelDescription()
    }

    /**
     */
    ChannelURL {
        get => this.get_ChannelURL()
    }

    /**
     */
    ContactAddress {
        get => this.get_ContactAddress()
    }

    /**
     */
    ContactPhone {
        get => this.get_ContactPhone()
    }

    /**
     */
    ContactEmail {
        get => this.get_ContactEmail()
    }

    /**
     * The get_ChannelName method retrieves the channel name.
     * @param {Pointer<BSTR>} pbstrChannelName Pointer to a variable that receives a string containing the channel name.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//qnetwork/nf-qnetwork-iamchannelinfo-get_channelname
     */
    get_ChannelName(pbstrChannelName) {
        result := ComCall(7, this, "ptr", pbstrChannelName, "HRESULT")
        return result
    }

    /**
     * The get_ChannelDescription method retrieves the description of the channel.
     * @param {Pointer<BSTR>} pbstrChannelDescription Receives the channel description.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//qnetwork/nf-qnetwork-iamchannelinfo-get_channeldescription
     */
    get_ChannelDescription(pbstrChannelDescription) {
        result := ComCall(8, this, "ptr", pbstrChannelDescription, "HRESULT")
        return result
    }

    /**
     * The get_ChannelURL method retrieves the channel URL.
     * @param {Pointer<BSTR>} pbstrChannelURL Pointer to a variable that receives the URL.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//qnetwork/nf-qnetwork-iamchannelinfo-get_channelurl
     */
    get_ChannelURL(pbstrChannelURL) {
        result := ComCall(9, this, "ptr", pbstrChannelURL, "HRESULT")
        return result
    }

    /**
     * The get_ContactAddress method retrieves the contact address.
     * @param {Pointer<BSTR>} pbstrContactAddress Pointer to a variable that receives the contact address.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//qnetwork/nf-qnetwork-iamchannelinfo-get_contactaddress
     */
    get_ContactAddress(pbstrContactAddress) {
        result := ComCall(10, this, "ptr", pbstrContactAddress, "HRESULT")
        return result
    }

    /**
     * The get_ContactPhone method retrieves the phone number of the contact.
     * @param {Pointer<BSTR>} pbstrContactPhone Pointer to a variable that receives the contact's phone number.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//qnetwork/nf-qnetwork-iamchannelinfo-get_contactphone
     */
    get_ContactPhone(pbstrContactPhone) {
        result := ComCall(11, this, "ptr", pbstrContactPhone, "HRESULT")
        return result
    }

    /**
     * The get_ContactEmail method gets the email address of the contact.
     * @param {Pointer<BSTR>} pbstrContactEmail Receives the contact email.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//qnetwork/nf-qnetwork-iamchannelinfo-get_contactemail
     */
    get_ContactEmail(pbstrContactEmail) {
        result := ComCall(12, this, "ptr", pbstrContactEmail, "HRESULT")
        return result
    }
}
