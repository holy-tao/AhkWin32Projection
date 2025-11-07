#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMReaderNetworkConfig.ahk

/**
 * The IWMReaderNetworkConfig2 interface provides advanced networking functionality.An IWMReaderNetworkConfig2 interface exists for every reader object.
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmreadernetworkconfig2
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMReaderNetworkConfig2 extends IWMReaderNetworkConfig{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMReaderNetworkConfig2
     * @type {Guid}
     */
    static IID => Guid("{d979a853-042b-4050-8387-c939db22013f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 36

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetEnableContentCaching", "SetEnableContentCaching", "GetEnableFastCache", "SetEnableFastCache", "GetAcceleratedStreamingDuration", "SetAcceleratedStreamingDuration", "GetAutoReconnectLimit", "SetAutoReconnectLimit", "GetEnableResends", "SetEnableResends", "GetEnableThinning", "SetEnableThinning", "GetMaxNetPacketSize"]

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreadernetworkconfig2-getenablecontentcaching
     */
    GetEnableContentCaching() {
        result := ComCall(36, this, "int*", &pfEnableContentCaching := 0, "HRESULT")
        return pfEnableContentCaching
    }

    /**
     * 
     * @param {BOOL} fEnableContentCaching 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreadernetworkconfig2-setenablecontentcaching
     */
    SetEnableContentCaching(fEnableContentCaching) {
        result := ComCall(37, this, "int", fEnableContentCaching, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreadernetworkconfig2-getenablefastcache
     */
    GetEnableFastCache() {
        result := ComCall(38, this, "int*", &pfEnableFastCache := 0, "HRESULT")
        return pfEnableFastCache
    }

    /**
     * 
     * @param {BOOL} fEnableFastCache 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreadernetworkconfig2-setenablefastcache
     */
    SetEnableFastCache(fEnableFastCache) {
        result := ComCall(39, this, "int", fEnableFastCache, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreadernetworkconfig2-getacceleratedstreamingduration
     */
    GetAcceleratedStreamingDuration() {
        result := ComCall(40, this, "uint*", &pcnsAccelDuration := 0, "HRESULT")
        return pcnsAccelDuration
    }

    /**
     * 
     * @param {Integer} cnsAccelDuration 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreadernetworkconfig2-setacceleratedstreamingduration
     */
    SetAcceleratedStreamingDuration(cnsAccelDuration) {
        result := ComCall(41, this, "uint", cnsAccelDuration, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreadernetworkconfig2-getautoreconnectlimit
     */
    GetAutoReconnectLimit() {
        result := ComCall(42, this, "uint*", &pdwAutoReconnectLimit := 0, "HRESULT")
        return pdwAutoReconnectLimit
    }

    /**
     * 
     * @param {Integer} dwAutoReconnectLimit 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreadernetworkconfig2-setautoreconnectlimit
     */
    SetAutoReconnectLimit(dwAutoReconnectLimit) {
        result := ComCall(43, this, "uint", dwAutoReconnectLimit, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreadernetworkconfig2-getenableresends
     */
    GetEnableResends() {
        result := ComCall(44, this, "int*", &pfEnableResends := 0, "HRESULT")
        return pfEnableResends
    }

    /**
     * 
     * @param {BOOL} fEnableResends 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreadernetworkconfig2-setenableresends
     */
    SetEnableResends(fEnableResends) {
        result := ComCall(45, this, "int", fEnableResends, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreadernetworkconfig2-getenablethinning
     */
    GetEnableThinning() {
        result := ComCall(46, this, "int*", &pfEnableThinning := 0, "HRESULT")
        return pfEnableThinning
    }

    /**
     * 
     * @param {BOOL} fEnableThinning 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreadernetworkconfig2-setenablethinning
     */
    SetEnableThinning(fEnableThinning) {
        result := ComCall(47, this, "int", fEnableThinning, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreadernetworkconfig2-getmaxnetpacketsize
     */
    GetMaxNetPacketSize() {
        result := ComCall(48, this, "uint*", &pdwMaxNetPacketSize := 0, "HRESULT")
        return pdwMaxNetPacketSize
    }
}
