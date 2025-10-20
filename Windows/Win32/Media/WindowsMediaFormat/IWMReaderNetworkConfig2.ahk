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
     * 
     * @param {Pointer<BOOL>} pfEnableContentCaching 
     * @returns {HRESULT} 
     */
    GetEnableContentCaching(pfEnableContentCaching) {
        result := ComCall(36, this, "ptr", pfEnableContentCaching, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} fEnableContentCaching 
     * @returns {HRESULT} 
     */
    SetEnableContentCaching(fEnableContentCaching) {
        result := ComCall(37, this, "int", fEnableContentCaching, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfEnableFastCache 
     * @returns {HRESULT} 
     */
    GetEnableFastCache(pfEnableFastCache) {
        result := ComCall(38, this, "ptr", pfEnableFastCache, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} fEnableFastCache 
     * @returns {HRESULT} 
     */
    SetEnableFastCache(fEnableFastCache) {
        result := ComCall(39, this, "int", fEnableFastCache, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt64>} pcnsAccelDuration 
     * @returns {HRESULT} 
     */
    GetAcceleratedStreamingDuration(pcnsAccelDuration) {
        result := ComCall(40, this, "uint*", pcnsAccelDuration, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cnsAccelDuration 
     * @returns {HRESULT} 
     */
    SetAcceleratedStreamingDuration(cnsAccelDuration) {
        result := ComCall(41, this, "uint", cnsAccelDuration, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwAutoReconnectLimit 
     * @returns {HRESULT} 
     */
    GetAutoReconnectLimit(pdwAutoReconnectLimit) {
        result := ComCall(42, this, "uint*", pdwAutoReconnectLimit, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwAutoReconnectLimit 
     * @returns {HRESULT} 
     */
    SetAutoReconnectLimit(dwAutoReconnectLimit) {
        result := ComCall(43, this, "uint", dwAutoReconnectLimit, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfEnableResends 
     * @returns {HRESULT} 
     */
    GetEnableResends(pfEnableResends) {
        result := ComCall(44, this, "ptr", pfEnableResends, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} fEnableResends 
     * @returns {HRESULT} 
     */
    SetEnableResends(fEnableResends) {
        result := ComCall(45, this, "int", fEnableResends, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfEnableThinning 
     * @returns {HRESULT} 
     */
    GetEnableThinning(pfEnableThinning) {
        result := ComCall(46, this, "ptr", pfEnableThinning, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} fEnableThinning 
     * @returns {HRESULT} 
     */
    SetEnableThinning(fEnableThinning) {
        result := ComCall(47, this, "int", fEnableThinning, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwMaxNetPacketSize 
     * @returns {HRESULT} 
     */
    GetMaxNetPacketSize(pdwMaxNetPacketSize) {
        result := ComCall(48, this, "uint*", pdwMaxNetPacketSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
