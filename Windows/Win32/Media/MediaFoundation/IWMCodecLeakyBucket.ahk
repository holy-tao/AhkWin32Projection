#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Configures the &quot;leaky bucket&quot; parameters on a video encoder.
 * @see https://docs.microsoft.com/windows/win32/api//wmcodecdsp/nn-wmcodecdsp-iwmcodecleakybucket
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IWMCodecLeakyBucket extends IUnknown{
    /**
     * The interface identifier for IWMCodecLeakyBucket
     * @type {Guid}
     */
    static IID => Guid("{a81ba647-6227-43b7-b231-c7b15135dd7d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} ulBufferSize 
     * @returns {HRESULT} 
     */
    SetBufferSizeBits(ulBufferSize) {
        result := ComCall(3, this, "uint", ulBufferSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pulBufferSize 
     * @returns {HRESULT} 
     */
    GetBufferSizeBits(pulBufferSize) {
        result := ComCall(4, this, "uint*", pulBufferSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulBufferFullness 
     * @returns {HRESULT} 
     */
    SetBufferFullnessBits(ulBufferFullness) {
        result := ComCall(5, this, "uint", ulBufferFullness, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pulBufferFullness 
     * @returns {HRESULT} 
     */
    GetBufferFullnessBits(pulBufferFullness) {
        result := ComCall(6, this, "uint*", pulBufferFullness, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
