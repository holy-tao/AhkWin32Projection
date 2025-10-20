#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Sets properties on the audio resampler DSP.
 * @see https://docs.microsoft.com/windows/win32/api//wmcodecdsp/nn-wmcodecdsp-iwmresamplerprops
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IWMResamplerProps extends IUnknown{
    /**
     * The interface identifier for IWMResamplerProps
     * @type {Guid}
     */
    static IID => Guid("{e7e9984f-f09f-4da4-903f-6e2e0efe56b5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} lhalfFilterLen 
     * @returns {HRESULT} 
     */
    SetHalfFilterLength(lhalfFilterLen) {
        result := ComCall(3, this, "int", lhalfFilterLen, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Single>} userChannelMtx 
     * @returns {HRESULT} 
     */
    SetUserChannelMtx(userChannelMtx) {
        result := ComCall(4, this, "float*", userChannelMtx, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
