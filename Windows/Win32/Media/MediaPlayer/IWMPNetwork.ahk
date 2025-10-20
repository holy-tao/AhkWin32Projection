#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IWMPNetwork interface provides methods relating to the network connection used by Windows Media Player.
 * @see https://docs.microsoft.com/windows/win32/api//wmp/nn-wmp-iwmpnetwork
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPNetwork extends IDispatch{
    /**
     * The interface identifier for IWMPNetwork
     * @type {Guid}
     */
    static IID => Guid("{ec21b779-edef-462d-bba4-ad9dde2b29a7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<Int32>} plBandwidth 
     * @returns {HRESULT} 
     */
    get_bandWidth(plBandwidth) {
        result := ComCall(7, this, "int*", plBandwidth, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plRecoveredPackets 
     * @returns {HRESULT} 
     */
    get_recoveredPackets(plRecoveredPackets) {
        result := ComCall(8, this, "int*", plRecoveredPackets, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrSourceProtocol 
     * @returns {HRESULT} 
     */
    get_sourceProtocol(pbstrSourceProtocol) {
        result := ComCall(9, this, "ptr", pbstrSourceProtocol, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plReceivedPackets 
     * @returns {HRESULT} 
     */
    get_receivedPackets(plReceivedPackets) {
        result := ComCall(10, this, "int*", plReceivedPackets, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plLostPackets 
     * @returns {HRESULT} 
     */
    get_lostPackets(plLostPackets) {
        result := ComCall(11, this, "int*", plLostPackets, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plReceptionQuality 
     * @returns {HRESULT} 
     */
    get_receptionQuality(plReceptionQuality) {
        result := ComCall(12, this, "int*", plReceptionQuality, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plBufferingCount 
     * @returns {HRESULT} 
     */
    get_bufferingCount(plBufferingCount) {
        result := ComCall(13, this, "int*", plBufferingCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plBufferingProgress 
     * @returns {HRESULT} 
     */
    get_bufferingProgress(plBufferingProgress) {
        result := ComCall(14, this, "int*", plBufferingProgress, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plBufferingTime 
     * @returns {HRESULT} 
     */
    get_bufferingTime(plBufferingTime) {
        result := ComCall(15, this, "int*", plBufferingTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lBufferingTime 
     * @returns {HRESULT} 
     */
    put_bufferingTime(lBufferingTime) {
        result := ComCall(16, this, "int", lBufferingTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plFrameRate 
     * @returns {HRESULT} 
     */
    get_frameRate(plFrameRate) {
        result := ComCall(17, this, "int*", plFrameRate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plBitRate 
     * @returns {HRESULT} 
     */
    get_maxBitRate(plBitRate) {
        result := ComCall(18, this, "int*", plBitRate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plBitRate 
     * @returns {HRESULT} 
     */
    get_bitRate(plBitRate) {
        result := ComCall(19, this, "int*", plBitRate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrProtocol 
     * @param {Pointer<Int32>} plProxySetting 
     * @returns {HRESULT} 
     */
    getProxySettings(bstrProtocol, plProxySetting) {
        bstrProtocol := bstrProtocol is String ? BSTR.Alloc(bstrProtocol).Value : bstrProtocol

        result := ComCall(20, this, "ptr", bstrProtocol, "int*", plProxySetting, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrProtocol 
     * @param {Integer} lProxySetting 
     * @returns {HRESULT} 
     */
    setProxySettings(bstrProtocol, lProxySetting) {
        bstrProtocol := bstrProtocol is String ? BSTR.Alloc(bstrProtocol).Value : bstrProtocol

        result := ComCall(21, this, "ptr", bstrProtocol, "int", lProxySetting, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrProtocol 
     * @param {Pointer<BSTR>} pbstrProxyName 
     * @returns {HRESULT} 
     */
    getProxyName(bstrProtocol, pbstrProxyName) {
        bstrProtocol := bstrProtocol is String ? BSTR.Alloc(bstrProtocol).Value : bstrProtocol

        result := ComCall(22, this, "ptr", bstrProtocol, "ptr", pbstrProxyName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrProtocol 
     * @param {BSTR} bstrProxyName 
     * @returns {HRESULT} 
     */
    setProxyName(bstrProtocol, bstrProxyName) {
        bstrProtocol := bstrProtocol is String ? BSTR.Alloc(bstrProtocol).Value : bstrProtocol
        bstrProxyName := bstrProxyName is String ? BSTR.Alloc(bstrProxyName).Value : bstrProxyName

        result := ComCall(23, this, "ptr", bstrProtocol, "ptr", bstrProxyName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrProtocol 
     * @param {Pointer<Int32>} lProxyPort 
     * @returns {HRESULT} 
     */
    getProxyPort(bstrProtocol, lProxyPort) {
        bstrProtocol := bstrProtocol is String ? BSTR.Alloc(bstrProtocol).Value : bstrProtocol

        result := ComCall(24, this, "ptr", bstrProtocol, "int*", lProxyPort, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrProtocol 
     * @param {Integer} lProxyPort 
     * @returns {HRESULT} 
     */
    setProxyPort(bstrProtocol, lProxyPort) {
        bstrProtocol := bstrProtocol is String ? BSTR.Alloc(bstrProtocol).Value : bstrProtocol

        result := ComCall(25, this, "ptr", bstrProtocol, "int", lProxyPort, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrProtocol 
     * @param {Pointer<BSTR>} pbstrExceptionList 
     * @returns {HRESULT} 
     */
    getProxyExceptionList(bstrProtocol, pbstrExceptionList) {
        bstrProtocol := bstrProtocol is String ? BSTR.Alloc(bstrProtocol).Value : bstrProtocol

        result := ComCall(26, this, "ptr", bstrProtocol, "ptr", pbstrExceptionList, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrProtocol 
     * @param {BSTR} pbstrExceptionList 
     * @returns {HRESULT} 
     */
    setProxyExceptionList(bstrProtocol, pbstrExceptionList) {
        bstrProtocol := bstrProtocol is String ? BSTR.Alloc(bstrProtocol).Value : bstrProtocol
        pbstrExceptionList := pbstrExceptionList is String ? BSTR.Alloc(pbstrExceptionList).Value : pbstrExceptionList

        result := ComCall(27, this, "ptr", bstrProtocol, "ptr", pbstrExceptionList, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrProtocol 
     * @param {Pointer<VARIANT_BOOL>} pfBypassForLocal 
     * @returns {HRESULT} 
     */
    getProxyBypassForLocal(bstrProtocol, pfBypassForLocal) {
        bstrProtocol := bstrProtocol is String ? BSTR.Alloc(bstrProtocol).Value : bstrProtocol

        result := ComCall(28, this, "ptr", bstrProtocol, "ptr", pfBypassForLocal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrProtocol 
     * @param {VARIANT_BOOL} fBypassForLocal 
     * @returns {HRESULT} 
     */
    setProxyBypassForLocal(bstrProtocol, fBypassForLocal) {
        bstrProtocol := bstrProtocol is String ? BSTR.Alloc(bstrProtocol).Value : bstrProtocol

        result := ComCall(29, this, "ptr", bstrProtocol, "short", fBypassForLocal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} lMaxBandwidth 
     * @returns {HRESULT} 
     */
    get_maxBandwidth(lMaxBandwidth) {
        result := ComCall(30, this, "int*", lMaxBandwidth, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lMaxBandwidth 
     * @returns {HRESULT} 
     */
    put_maxBandwidth(lMaxBandwidth) {
        result := ComCall(31, this, "int", lMaxBandwidth, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plDownloadProgress 
     * @returns {HRESULT} 
     */
    get_downloadProgress(plDownloadProgress) {
        result := ComCall(32, this, "int*", plDownloadProgress, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plFrameRate 
     * @returns {HRESULT} 
     */
    get_encodedFrameRate(plFrameRate) {
        result := ComCall(33, this, "int*", plFrameRate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plFrames 
     * @returns {HRESULT} 
     */
    get_framesSkipped(plFrames) {
        result := ComCall(34, this, "int*", plFrames, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
