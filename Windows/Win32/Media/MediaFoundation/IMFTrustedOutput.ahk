#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IMFOutputTrustAuthority.ahk" { IMFOutputTrustAuthority }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Implemented by components that provide output trust authorities (OTAs).
 * @remarks
 * If an MFT supports <b>IMFTrustedOutput</b>, it must expose the interface through <b>QueryInterface</b>. The interface applies to all of the input streams on the MFT. (There is no mechanism to return a separate <b>IMFTrustedOutput</b> pointer for each stream.) The MFT must apply the  output policies to all of its input streams. If the MFT sends different streams to separate connectors, it must report all of the connector attributes.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nn-mfidl-imftrustedoutput
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFTrustedOutput extends IUnknown {
    /**
     * The interface identifier for IMFTrustedOutput
     * @type {Guid}
     */
    static IID := Guid("{d19f8e95-b126-4446-890c-5dcb7ad71453}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFTrustedOutput interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetOutputTrustAuthorityCount   : IntPtr
        GetOutputTrustAuthorityByIndex : IntPtr
        IsFinal                        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFTrustedOutput.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the number of output trust authorities (OTAs) provided by this trusted output. Each OTA reports a single action.
     * @returns {Integer} Receives the number of OTAs.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imftrustedoutput-getoutputtrustauthoritycount
     */
    GetOutputTrustAuthorityCount() {
        result := ComCall(3, this, "uint*", &pcOutputTrustAuthorities := 0, "HRESULT")
        return pcOutputTrustAuthorities
    }

    /**
     * Gets an output trust authority (OTA), specified by index.
     * @param {Integer} dwIndex Zero-based index of the OTA to retrieve. To get the number of OTAs provided by this object, call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imftrustedoutput-getoutputtrustauthoritycount">IMFTrustedOutput::GetOutputTrustAuthorityCount</a>.
     * @returns {IMFOutputTrustAuthority} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfoutputtrustauthority">IMFOutputTrustAuthority</a> interface of the OTA. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imftrustedoutput-getoutputtrustauthoritybyindex
     */
    GetOutputTrustAuthorityByIndex(dwIndex) {
        result := ComCall(4, this, "uint", dwIndex, "ptr*", &ppauthority := 0, "HRESULT")
        return IMFOutputTrustAuthority(ppauthority)
    }

    /**
     * Queries whether this output is a policy sink, meaning it handles the rights and restrictions required by the input trust authority (ITA).
     * @remarks
     * A trusted output is generally considered to be a policy sink if it does not pass the media content that it receives anywhere else; or, if it does pass the media content elsewhere, either it protects the content using some proprietary method such as encryption, or it sufficiently devalues the content so as not to require protection.
     * @returns {BOOL} Receives a Boolean value. If <b>TRUE</b>, this object is a policy sink. If <b>FALSE</b>, the policy must be enforced further downstream.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imftrustedoutput-isfinal
     */
    IsFinal() {
        result := ComCall(5, this, BOOL.Ptr, &pfIsFinal := 0, "HRESULT")
        return pfIsFinal
    }

    Query(iid) {
        if (IMFTrustedOutput.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetOutputTrustAuthorityCount := CallbackCreate(GetMethod(implObj, "GetOutputTrustAuthorityCount"), flags, 2)
        this.vtbl.GetOutputTrustAuthorityByIndex := CallbackCreate(GetMethod(implObj, "GetOutputTrustAuthorityByIndex"), flags, 3)
        this.vtbl.IsFinal := CallbackCreate(GetMethod(implObj, "IsFinal"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetOutputTrustAuthorityCount)
        CallbackFree(this.vtbl.GetOutputTrustAuthorityByIndex)
        CallbackFree(this.vtbl.IsFinal)
    }
}
