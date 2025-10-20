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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_bandWidth", "get_recoveredPackets", "get_sourceProtocol", "get_receivedPackets", "get_lostPackets", "get_receptionQuality", "get_bufferingCount", "get_bufferingProgress", "get_bufferingTime", "put_bufferingTime", "get_frameRate", "get_maxBitRate", "get_bitRate", "getProxySettings", "setProxySettings", "getProxyName", "setProxyName", "getProxyPort", "setProxyPort", "getProxyExceptionList", "setProxyExceptionList", "getProxyBypassForLocal", "setProxyBypassForLocal", "get_maxBandwidth", "put_maxBandwidth", "get_downloadProgress", "get_encodedFrameRate", "get_framesSkipped"]

    /**
     * 
     * @param {Pointer<Integer>} plBandwidth 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpnetwork-get_bandwidth
     */
    get_bandWidth(plBandwidth) {
        result := ComCall(7, this, "int*", plBandwidth, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plRecoveredPackets 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpnetwork-get_recoveredpackets
     */
    get_recoveredPackets(plRecoveredPackets) {
        result := ComCall(8, this, "int*", plRecoveredPackets, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrSourceProtocol 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpnetwork-get_sourceprotocol
     */
    get_sourceProtocol(pbstrSourceProtocol) {
        result := ComCall(9, this, "ptr", pbstrSourceProtocol, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plReceivedPackets 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpnetwork-get_receivedpackets
     */
    get_receivedPackets(plReceivedPackets) {
        result := ComCall(10, this, "int*", plReceivedPackets, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plLostPackets 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpnetwork-get_lostpackets
     */
    get_lostPackets(plLostPackets) {
        result := ComCall(11, this, "int*", plLostPackets, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plReceptionQuality 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpnetwork-get_receptionquality
     */
    get_receptionQuality(plReceptionQuality) {
        result := ComCall(12, this, "int*", plReceptionQuality, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plBufferingCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpnetwork-get_bufferingcount
     */
    get_bufferingCount(plBufferingCount) {
        result := ComCall(13, this, "int*", plBufferingCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plBufferingProgress 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpnetwork-get_bufferingprogress
     */
    get_bufferingProgress(plBufferingProgress) {
        result := ComCall(14, this, "int*", plBufferingProgress, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plBufferingTime 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpnetwork-get_bufferingtime
     */
    get_bufferingTime(plBufferingTime) {
        result := ComCall(15, this, "int*", plBufferingTime, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lBufferingTime 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpnetwork-put_bufferingtime
     */
    put_bufferingTime(lBufferingTime) {
        result := ComCall(16, this, "int", lBufferingTime, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plFrameRate 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpnetwork-get_framerate
     */
    get_frameRate(plFrameRate) {
        result := ComCall(17, this, "int*", plFrameRate, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plBitRate 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpnetwork-get_maxbitrate
     */
    get_maxBitRate(plBitRate) {
        result := ComCall(18, this, "int*", plBitRate, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plBitRate 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpnetwork-get_bitrate
     */
    get_bitRate(plBitRate) {
        result := ComCall(19, this, "int*", plBitRate, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrProtocol 
     * @param {Pointer<Integer>} plProxySetting 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpnetwork-getproxysettings
     */
    getProxySettings(bstrProtocol, plProxySetting) {
        bstrProtocol := bstrProtocol is String ? BSTR.Alloc(bstrProtocol).Value : bstrProtocol

        result := ComCall(20, this, "ptr", bstrProtocol, "int*", plProxySetting, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrProtocol 
     * @param {Integer} lProxySetting 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpnetwork-setproxysettings
     */
    setProxySettings(bstrProtocol, lProxySetting) {
        bstrProtocol := bstrProtocol is String ? BSTR.Alloc(bstrProtocol).Value : bstrProtocol

        result := ComCall(21, this, "ptr", bstrProtocol, "int", lProxySetting, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrProtocol 
     * @param {Pointer<BSTR>} pbstrProxyName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpnetwork-getproxyname
     */
    getProxyName(bstrProtocol, pbstrProxyName) {
        bstrProtocol := bstrProtocol is String ? BSTR.Alloc(bstrProtocol).Value : bstrProtocol

        result := ComCall(22, this, "ptr", bstrProtocol, "ptr", pbstrProxyName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrProtocol 
     * @param {BSTR} bstrProxyName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpnetwork-setproxyname
     */
    setProxyName(bstrProtocol, bstrProxyName) {
        bstrProtocol := bstrProtocol is String ? BSTR.Alloc(bstrProtocol).Value : bstrProtocol
        bstrProxyName := bstrProxyName is String ? BSTR.Alloc(bstrProxyName).Value : bstrProxyName

        result := ComCall(23, this, "ptr", bstrProtocol, "ptr", bstrProxyName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrProtocol 
     * @param {Pointer<Integer>} lProxyPort 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpnetwork-getproxyport
     */
    getProxyPort(bstrProtocol, lProxyPort) {
        bstrProtocol := bstrProtocol is String ? BSTR.Alloc(bstrProtocol).Value : bstrProtocol

        result := ComCall(24, this, "ptr", bstrProtocol, "int*", lProxyPort, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrProtocol 
     * @param {Integer} lProxyPort 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpnetwork-setproxyport
     */
    setProxyPort(bstrProtocol, lProxyPort) {
        bstrProtocol := bstrProtocol is String ? BSTR.Alloc(bstrProtocol).Value : bstrProtocol

        result := ComCall(25, this, "ptr", bstrProtocol, "int", lProxyPort, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrProtocol 
     * @param {Pointer<BSTR>} pbstrExceptionList 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpnetwork-getproxyexceptionlist
     */
    getProxyExceptionList(bstrProtocol, pbstrExceptionList) {
        bstrProtocol := bstrProtocol is String ? BSTR.Alloc(bstrProtocol).Value : bstrProtocol

        result := ComCall(26, this, "ptr", bstrProtocol, "ptr", pbstrExceptionList, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrProtocol 
     * @param {BSTR} pbstrExceptionList 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpnetwork-setproxyexceptionlist
     */
    setProxyExceptionList(bstrProtocol, pbstrExceptionList) {
        bstrProtocol := bstrProtocol is String ? BSTR.Alloc(bstrProtocol).Value : bstrProtocol
        pbstrExceptionList := pbstrExceptionList is String ? BSTR.Alloc(pbstrExceptionList).Value : pbstrExceptionList

        result := ComCall(27, this, "ptr", bstrProtocol, "ptr", pbstrExceptionList, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrProtocol 
     * @param {Pointer<VARIANT_BOOL>} pfBypassForLocal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpnetwork-getproxybypassforlocal
     */
    getProxyBypassForLocal(bstrProtocol, pfBypassForLocal) {
        bstrProtocol := bstrProtocol is String ? BSTR.Alloc(bstrProtocol).Value : bstrProtocol

        result := ComCall(28, this, "ptr", bstrProtocol, "ptr", pfBypassForLocal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrProtocol 
     * @param {VARIANT_BOOL} fBypassForLocal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpnetwork-setproxybypassforlocal
     */
    setProxyBypassForLocal(bstrProtocol, fBypassForLocal) {
        bstrProtocol := bstrProtocol is String ? BSTR.Alloc(bstrProtocol).Value : bstrProtocol

        result := ComCall(29, this, "ptr", bstrProtocol, "short", fBypassForLocal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} lMaxBandwidth 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpnetwork-get_maxbandwidth
     */
    get_maxBandwidth(lMaxBandwidth) {
        result := ComCall(30, this, "int*", lMaxBandwidth, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lMaxBandwidth 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpnetwork-put_maxbandwidth
     */
    put_maxBandwidth(lMaxBandwidth) {
        result := ComCall(31, this, "int", lMaxBandwidth, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plDownloadProgress 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpnetwork-get_downloadprogress
     */
    get_downloadProgress(plDownloadProgress) {
        result := ComCall(32, this, "int*", plDownloadProgress, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plFrameRate 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpnetwork-get_encodedframerate
     */
    get_encodedFrameRate(plFrameRate) {
        result := ComCall(33, this, "int*", plFrameRate, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plFrames 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpnetwork-get_framesskipped
     */
    get_framesSkipped(plFrames) {
        result := ComCall(34, this, "int*", plFrames, "HRESULT")
        return result
    }
}
