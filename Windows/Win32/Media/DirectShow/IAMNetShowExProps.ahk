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
     * 
     * @param {Pointer<Int32>} pSourceProtocol 
     * @returns {HRESULT} 
     */
    get_SourceProtocol(pSourceProtocol) {
        result := ComCall(7, this, "int*", pSourceProtocol, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pBandwidth 
     * @returns {HRESULT} 
     */
    get_Bandwidth(pBandwidth) {
        result := ComCall(8, this, "int*", pBandwidth, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrErrorCorrection 
     * @returns {HRESULT} 
     */
    get_ErrorCorrection(pbstrErrorCorrection) {
        result := ComCall(9, this, "ptr", pbstrErrorCorrection, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pCodecCount 
     * @returns {HRESULT} 
     */
    get_CodecCount(pCodecCount) {
        result := ComCall(10, this, "int*", pCodecCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} CodecNum 
     * @param {Pointer<VARIANT_BOOL>} pCodecInstalled 
     * @returns {HRESULT} 
     */
    GetCodecInstalled(CodecNum, pCodecInstalled) {
        result := ComCall(11, this, "int", CodecNum, "ptr", pCodecInstalled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} CodecNum 
     * @param {Pointer<BSTR>} pbstrCodecDescription 
     * @returns {HRESULT} 
     */
    GetCodecDescription(CodecNum, pbstrCodecDescription) {
        result := ComCall(12, this, "int", CodecNum, "ptr", pbstrCodecDescription, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} CodecNum 
     * @param {Pointer<BSTR>} pbstrCodecURL 
     * @returns {HRESULT} 
     */
    GetCodecURL(CodecNum, pbstrCodecURL) {
        result := ComCall(13, this, "int", CodecNum, "ptr", pbstrCodecURL, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Double>} pCreationDate 
     * @returns {HRESULT} 
     */
    get_CreationDate(pCreationDate) {
        result := ComCall(14, this, "double*", pCreationDate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrSourceLink 
     * @returns {HRESULT} 
     */
    get_SourceLink(pbstrSourceLink) {
        result := ComCall(15, this, "ptr", pbstrSourceLink, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
