#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IAMNetShowExProps interface configures the legacy Windows Media Player 6.4 source filter. The Windows Media Source filter implements this interface.
 * @remarks
 * 
 * To define the interface identifier, include the header file Initguid.h before Qnetwork.h, but after Dshow.h and other header files:
 * 
 * <pre class="syntax" xml:space="preserve"><code>#include &lt;dshow.h&gt;
 * 
 * @see https://docs.microsoft.com/windows/win32/api//qnetwork/nn-qnetwork-iamnetshowexprops
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IAMNetShowExProps extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAMNetShowExProps
     * @type {Guid}
     */
    static IID => Guid("{fa2aa8f5-8b62-11d0-a520-000000000000}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SourceProtocol", "get_Bandwidth", "get_ErrorCorrection", "get_CodecCount", "GetCodecInstalled", "GetCodecDescription", "GetCodecURL", "get_CreationDate", "get_SourceLink"]

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
     * @see https://docs.microsoft.com/windows/win32/api//qnetwork/nf-qnetwork-iamnetshowexprops-get_sourceprotocol
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
     * @see https://docs.microsoft.com/windows/win32/api//qnetwork/nf-qnetwork-iamnetshowexprops-get_bandwidth
     */
    get_Bandwidth(pBandwidth) {
        pBandwidthMarshal := pBandwidth is VarRef ? "int*" : "ptr"

        result := ComCall(8, this, pBandwidthMarshal, pBandwidth, "HRESULT")
        return result
    }

    /**
     * The get_ErrorCorrection method retrieves the current error correction method.
     * @param {Pointer<BSTR>} pbstrErrorCorrection Pointer to a variable that receives a string describing the error correction method.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//qnetwork/nf-qnetwork-iamnetshowexprops-get_errorcorrection
     */
    get_ErrorCorrection(pbstrErrorCorrection) {
        result := ComCall(9, this, "ptr", pbstrErrorCorrection, "HRESULT")
        return result
    }

    /**
     * The get_CodecCount method retrieves the number codecs needed to play the file.
     * @param {Pointer<Integer>} pCodecCount Pointer to a variable that receives the number of codecs.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//qnetwork/nf-qnetwork-iamnetshowexprops-get_codeccount
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
     * @see https://docs.microsoft.com/windows/win32/api//qnetwork/nf-qnetwork-iamnetshowexprops-getcodecinstalled
     */
    GetCodecInstalled(CodecNum, pCodecInstalled) {
        pCodecInstalledMarshal := pCodecInstalled is VarRef ? "short*" : "ptr"

        result := ComCall(11, this, "int", CodecNum, pCodecInstalledMarshal, pCodecInstalled, "HRESULT")
        return result
    }

    /**
     * The GetCodecDescription method retrieves a user-friendly description of a specified codec.
     * @param {Integer} CodecNum Specifies the codec to query, indexed from zero. Call <b>get_CodecCount</b> to obtain the number of codecs.
     * @param {Pointer<BSTR>} pbstrCodecDescription Pointer to a variable that receives the description.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//qnetwork/nf-qnetwork-iamnetshowexprops-getcodecdescription
     */
    GetCodecDescription(CodecNum, pbstrCodecDescription) {
        result := ComCall(12, this, "int", CodecNum, "ptr", pbstrCodecDescription, "HRESULT")
        return result
    }

    /**
     * The GetCodecURL method retrieves the URL where the codec may be downloaded.
     * @param {Integer} CodecNum Specifies the codec to query, indexed from zero. Call <b>get_CodecCount</b> to obtain the number of codecs.
     * @param {Pointer<BSTR>} pbstrCodecURL Pointer that receives the URL.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//qnetwork/nf-qnetwork-iamnetshowexprops-getcodecurl
     */
    GetCodecURL(CodecNum, pbstrCodecURL) {
        result := ComCall(13, this, "int", CodecNum, "ptr", pbstrCodecURL, "HRESULT")
        return result
    }

    /**
     * The get_CreationDate method retrieves the creation date of the source file.
     * @param {Pointer<Float>} pCreationDate Pointer to a variable that receives the date.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//qnetwork/nf-qnetwork-iamnetshowexprops-get_creationdate
     */
    get_CreationDate(pCreationDate) {
        pCreationDateMarshal := pCreationDate is VarRef ? "double*" : "ptr"

        result := ComCall(14, this, pCreationDateMarshal, pCreationDate, "HRESULT")
        return result
    }

    /**
     * The get_SourceLink method retrieves the source link.
     * @param {Pointer<BSTR>} pbstrSourceLink Pointer to a variable that receives the source link.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//qnetwork/nf-qnetwork-iamnetshowexprops-get_sourcelink
     */
    get_SourceLink(pbstrSourceLink) {
        result := ComCall(15, this, "ptr", pbstrSourceLink, "HRESULT")
        return result
    }
}
