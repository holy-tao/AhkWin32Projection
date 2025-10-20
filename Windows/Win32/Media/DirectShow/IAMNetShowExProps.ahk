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
     * 
     * @param {Pointer<Integer>} pSourceProtocol 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iamnetshowexprops-get_sourceprotocol
     */
    get_SourceProtocol(pSourceProtocol) {
        result := ComCall(7, this, "int*", pSourceProtocol, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pBandwidth 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iamnetshowexprops-get_bandwidth
     */
    get_Bandwidth(pBandwidth) {
        result := ComCall(8, this, "int*", pBandwidth, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrErrorCorrection 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iamnetshowexprops-get_errorcorrection
     */
    get_ErrorCorrection(pbstrErrorCorrection) {
        result := ComCall(9, this, "ptr", pbstrErrorCorrection, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pCodecCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iamnetshowexprops-get_codeccount
     */
    get_CodecCount(pCodecCount) {
        result := ComCall(10, this, "int*", pCodecCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} CodecNum 
     * @param {Pointer<VARIANT_BOOL>} pCodecInstalled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iamnetshowexprops-getcodecinstalled
     */
    GetCodecInstalled(CodecNum, pCodecInstalled) {
        result := ComCall(11, this, "int", CodecNum, "ptr", pCodecInstalled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} CodecNum 
     * @param {Pointer<BSTR>} pbstrCodecDescription 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iamnetshowexprops-getcodecdescription
     */
    GetCodecDescription(CodecNum, pbstrCodecDescription) {
        result := ComCall(12, this, "int", CodecNum, "ptr", pbstrCodecDescription, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} CodecNum 
     * @param {Pointer<BSTR>} pbstrCodecURL 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iamnetshowexprops-getcodecurl
     */
    GetCodecURL(CodecNum, pbstrCodecURL) {
        result := ComCall(13, this, "int", CodecNum, "ptr", pbstrCodecURL, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} pCreationDate 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iamnetshowexprops-get_creationdate
     */
    get_CreationDate(pCreationDate) {
        result := ComCall(14, this, "double*", pCreationDate, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrSourceLink 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iamnetshowexprops-get_sourcelink
     */
    get_SourceLink(pbstrSourceLink) {
        result := ComCall(15, this, "ptr", pbstrSourceLink, "HRESULT")
        return result
    }
}
