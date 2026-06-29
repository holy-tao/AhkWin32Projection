#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The IAMChannelInfo interface gets and sets channel information for Windows Media Station (.nsc) files.This interface is exposed by the Windows Media Source filter only when the filter is reading Windows Media Station (.nsc) files.
 * @remarks
 * To define the interface identifier, include the header file Initguid.h before Qnetwork.h, but after Dshow.h and other header files:
 * 
 * <pre class="syntax" xml:space="preserve"><code>#include &lt;dshow.h&gt;
 * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nn-qnetwork-iamchannelinfo
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IAMChannelInfo extends IDispatch {
    /**
     * The interface identifier for IAMChannelInfo
     * @type {Guid}
     */
    static IID := Guid("{fa2aa8f2-8b62-11d0-a520-000000000000}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAMChannelInfo interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_ChannelName        : IntPtr
        get_ChannelDescription : IntPtr
        get_ChannelURL         : IntPtr
        get_ContactAddress     : IntPtr
        get_ContactPhone       : IntPtr
        get_ContactEmail       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAMChannelInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @remarks
     * The caller must release the returned <b>BSTR</b> by calling <b>SysFreeString</b>.
     * @param {Pointer<BSTR>} pbstrChannelName Pointer to a variable that receives a string containing the channel name.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iamchannelinfo-get_channelname
     */
    get_ChannelName(pbstrChannelName) {
        result := ComCall(7, this, BSTR.Ptr, pbstrChannelName, "HRESULT")
        return result
    }

    /**
     * The get_ChannelDescription method retrieves the description of the channel.
     * @remarks
     * The caller must release the returned <b>BSTR</b> by calling <b>SysFreeString</b>.
     * @param {Pointer<BSTR>} pbstrChannelDescription Receives the channel description.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iamchannelinfo-get_channeldescription
     */
    get_ChannelDescription(pbstrChannelDescription) {
        result := ComCall(8, this, BSTR.Ptr, pbstrChannelDescription, "HRESULT")
        return result
    }

    /**
     * The get_ChannelURL method retrieves the channel URL.
     * @remarks
     * The caller must release the returned <b>BSTR</b> by calling <b>SysFreeString</b>.
     * @param {Pointer<BSTR>} pbstrChannelURL Pointer to a variable that receives the URL.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iamchannelinfo-get_channelurl
     */
    get_ChannelURL(pbstrChannelURL) {
        result := ComCall(9, this, BSTR.Ptr, pbstrChannelURL, "HRESULT")
        return result
    }

    /**
     * The get_ContactAddress method retrieves the contact address.
     * @remarks
     * The caller must release the returned <b>BSTR</b> by calling <b>SysFreeString</b>.
     * @param {Pointer<BSTR>} pbstrContactAddress Pointer to a variable that receives the contact address.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iamchannelinfo-get_contactaddress
     */
    get_ContactAddress(pbstrContactAddress) {
        result := ComCall(10, this, BSTR.Ptr, pbstrContactAddress, "HRESULT")
        return result
    }

    /**
     * The get_ContactPhone method retrieves the phone number of the contact.
     * @remarks
     * The caller must release the returned <b>BSTR</b> by calling <b>SysFreeString</b>.
     * @param {Pointer<BSTR>} pbstrContactPhone Pointer to a variable that receives the contact's phone number.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iamchannelinfo-get_contactphone
     */
    get_ContactPhone(pbstrContactPhone) {
        result := ComCall(11, this, BSTR.Ptr, pbstrContactPhone, "HRESULT")
        return result
    }

    /**
     * The get_ContactEmail method gets the email address of the contact.
     * @remarks
     * The caller must release the returned <b>BSTR</b> by calling <b>SysFreeString</b>.
     * @param {Pointer<BSTR>} pbstrContactEmail Receives the contact email.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iamchannelinfo-get_contactemail
     */
    get_ContactEmail(pbstrContactEmail) {
        result := ComCall(12, this, BSTR.Ptr, pbstrContactEmail, "HRESULT")
        return result
    }

    Query(iid) {
        if (IAMChannelInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_ChannelName := CallbackCreate(GetMethod(implObj, "get_ChannelName"), flags, 2)
        this.vtbl.get_ChannelDescription := CallbackCreate(GetMethod(implObj, "get_ChannelDescription"), flags, 2)
        this.vtbl.get_ChannelURL := CallbackCreate(GetMethod(implObj, "get_ChannelURL"), flags, 2)
        this.vtbl.get_ContactAddress := CallbackCreate(GetMethod(implObj, "get_ContactAddress"), flags, 2)
        this.vtbl.get_ContactPhone := CallbackCreate(GetMethod(implObj, "get_ContactPhone"), flags, 2)
        this.vtbl.get_ContactEmail := CallbackCreate(GetMethod(implObj, "get_ContactEmail"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_ChannelName)
        CallbackFree(this.vtbl.get_ChannelDescription)
        CallbackFree(this.vtbl.get_ChannelURL)
        CallbackFree(this.vtbl.get_ContactAddress)
        CallbackFree(this.vtbl.get_ContactPhone)
        CallbackFree(this.vtbl.get_ContactEmail)
    }
}
