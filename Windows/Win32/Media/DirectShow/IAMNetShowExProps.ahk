#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * The IAMNetShowExProps interface configures the legacy Windows Media Player 6.4 source filter. The Windows Media Source filter implements this interface.
 * @remarks
 * To define the interface identifier, include the header file Initguid.h before Qnetwork.h, but after Dshow.h and other header files:
 * 
 * <pre class="syntax" xml:space="preserve"><code>#include &lt;dshow.h&gt;
 * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nn-qnetwork-iamnetshowexprops
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IAMNetShowExProps extends IDispatch {
    /**
     * The interface identifier for IAMNetShowExProps
     * @type {Guid}
     */
    static IID := Guid("{fa2aa8f5-8b62-11d0-a520-000000000000}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAMNetShowExProps interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_SourceProtocol  : IntPtr
        get_Bandwidth       : IntPtr
        get_ErrorCorrection : IntPtr
        get_CodecCount      : IntPtr
        GetCodecInstalled   : IntPtr
        GetCodecDescription : IntPtr
        GetCodecURL         : IntPtr
        get_CreationDate    : IntPtr
        get_SourceLink      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAMNetShowExProps.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     */
    SourceProtocol {
        get => this.get_SourceProtocol()
    }

    /**
     */
    Bandwidth {
        get => this.get_Bandwidth()
    }

    /**
     */
    ErrorCorrection {
        get => this.get_ErrorCorrection()
    }

    /**
     */
    CodecCount {
        get => this.get_CodecCount()
    }

    /**
     */
    CreationDate {
        get => this.get_CreationDate()
    }

    /**
     */
    SourceLink {
        get => this.get_SourceLink()
    }

    /**
     * The get_SourceProtocol method retrieves the source protocol.
     * @param {Pointer<Integer>} pSourceProtocol 
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iamnetshowexprops-get_sourceprotocol
     */
    get_SourceProtocol(pSourceProtocol) {
        pSourceProtocolMarshal := pSourceProtocol is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, pSourceProtocolMarshal, pSourceProtocol, "HRESULT")
        return result
    }

    /**
     * The get_Bandwidth method retrieves the bandwidth.
     * @param {Pointer<Integer>} pBandwidth Pointer to a variable that receives the bandwidth.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iamnetshowexprops-get_bandwidth
     */
    get_Bandwidth(pBandwidth) {
        pBandwidthMarshal := pBandwidth is VarRef ? "int*" : "ptr"

        result := ComCall(8, this, pBandwidthMarshal, pBandwidth, "HRESULT")
        return result
    }

    /**
     * The get_ErrorCorrection method retrieves the current error correction method.
     * @remarks
     * The caller must release the returned <b>BSTR</b>, by calling <b>SysFreeString</b>.
     * @param {Pointer<BSTR>} pbstrErrorCorrection Pointer to a variable that receives a string describing the error correction method.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iamnetshowexprops-get_errorcorrection
     */
    get_ErrorCorrection(pbstrErrorCorrection) {
        result := ComCall(9, this, BSTR.Ptr, pbstrErrorCorrection, "HRESULT")
        return result
    }

    /**
     * The get_CodecCount method retrieves the number codecs needed to play the file.
     * @param {Pointer<Integer>} pCodecCount Pointer to a variable that receives the number of codecs.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iamnetshowexprops-get_codeccount
     */
    get_CodecCount(pCodecCount) {
        pCodecCountMarshal := pCodecCount is VarRef ? "int*" : "ptr"

        result := ComCall(10, this, pCodecCountMarshal, pCodecCount, "HRESULT")
        return result
    }

    /**
     * The GetCodecInstalled method queries whether a specified codec is installed on the local system.
     * @param {Integer} CodecNum Specifies the codec to query, indexed from zero. Call <b>get_CodecCount</b> to obtain the number of codecs.
     * @param {Pointer<VARIANT_BOOL>} pCodecInstalled Pointer that receives a Boolean value.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iamnetshowexprops-getcodecinstalled
     */
    GetCodecInstalled(CodecNum, pCodecInstalled) {
        pCodecInstalledMarshal := pCodecInstalled is VarRef ? "short*" : "ptr"

        result := ComCall(11, this, "int", CodecNum, pCodecInstalledMarshal, pCodecInstalled, "HRESULT")
        return result
    }

    /**
     * The GetCodecDescription method retrieves a user-friendly description of a specified codec.
     * @remarks
     * The caller must release the returned <b>BSTR</b>, by calling <b>SysFreeString</b>.
     * @param {Integer} CodecNum Specifies the codec to query, indexed from zero. Call <b>get_CodecCount</b> to obtain the number of codecs.
     * @param {Pointer<BSTR>} pbstrCodecDescription Pointer to a variable that receives the description.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iamnetshowexprops-getcodecdescription
     */
    GetCodecDescription(CodecNum, pbstrCodecDescription) {
        result := ComCall(12, this, "int", CodecNum, BSTR.Ptr, pbstrCodecDescription, "HRESULT")
        return result
    }

    /**
     * The GetCodecURL method retrieves the URL where the codec may be downloaded.
     * @remarks
     * The caller must release the returned <b>BSTR</b>, by calling <b>SysFreeString</b>.
     * @param {Integer} CodecNum Specifies the codec to query, indexed from zero. Call <b>get_CodecCount</b> to obtain the number of codecs.
     * @param {Pointer<BSTR>} pbstrCodecURL Pointer that receives the URL.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iamnetshowexprops-getcodecurl
     */
    GetCodecURL(CodecNum, pbstrCodecURL) {
        result := ComCall(13, this, "int", CodecNum, BSTR.Ptr, pbstrCodecURL, "HRESULT")
        return result
    }

    /**
     * The get_CreationDate method retrieves the creation date of the source file.
     * @param {Pointer<Float>} pCreationDate Pointer to a variable that receives the date.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iamnetshowexprops-get_creationdate
     */
    get_CreationDate(pCreationDate) {
        pCreationDateMarshal := pCreationDate is VarRef ? "double*" : "ptr"

        result := ComCall(14, this, pCreationDateMarshal, pCreationDate, "HRESULT")
        return result
    }

    /**
     * The get_SourceLink method retrieves the source link.
     * @remarks
     * The caller must release the returned <b>BSTR</b>, by calling <b>SysFreeString</b>.
     * @param {Pointer<BSTR>} pbstrSourceLink Pointer to a variable that receives the source link.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iamnetshowexprops-get_sourcelink
     */
    get_SourceLink(pbstrSourceLink) {
        result := ComCall(15, this, BSTR.Ptr, pbstrSourceLink, "HRESULT")
        return result
    }

    Query(iid) {
        if (IAMNetShowExProps.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_SourceProtocol := CallbackCreate(GetMethod(implObj, "get_SourceProtocol"), flags, 2)
        this.vtbl.get_Bandwidth := CallbackCreate(GetMethod(implObj, "get_Bandwidth"), flags, 2)
        this.vtbl.get_ErrorCorrection := CallbackCreate(GetMethod(implObj, "get_ErrorCorrection"), flags, 2)
        this.vtbl.get_CodecCount := CallbackCreate(GetMethod(implObj, "get_CodecCount"), flags, 2)
        this.vtbl.GetCodecInstalled := CallbackCreate(GetMethod(implObj, "GetCodecInstalled"), flags, 3)
        this.vtbl.GetCodecDescription := CallbackCreate(GetMethod(implObj, "GetCodecDescription"), flags, 3)
        this.vtbl.GetCodecURL := CallbackCreate(GetMethod(implObj, "GetCodecURL"), flags, 3)
        this.vtbl.get_CreationDate := CallbackCreate(GetMethod(implObj, "get_CreationDate"), flags, 2)
        this.vtbl.get_SourceLink := CallbackCreate(GetMethod(implObj, "get_SourceLink"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_SourceProtocol)
        CallbackFree(this.vtbl.get_Bandwidth)
        CallbackFree(this.vtbl.get_ErrorCorrection)
        CallbackFree(this.vtbl.get_CodecCount)
        CallbackFree(this.vtbl.GetCodecInstalled)
        CallbackFree(this.vtbl.GetCodecDescription)
        CallbackFree(this.vtbl.GetCodecURL)
        CallbackFree(this.vtbl.get_CreationDate)
        CallbackFree(this.vtbl.get_SourceLink)
    }
}
