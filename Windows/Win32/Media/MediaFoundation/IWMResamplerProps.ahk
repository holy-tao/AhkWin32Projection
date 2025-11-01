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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetHalfFilterLength", "SetUserChannelMtx"]

    /**
     * 
     * @param {Integer} lhalfFilterLen 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/nf-wmcodecdsp-iwmresamplerprops-sethalffilterlength
     */
    SetHalfFilterLength(lhalfFilterLen) {
        result := ComCall(3, this, "int", lhalfFilterLen, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} userChannelMtx 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/nf-wmcodecdsp-iwmresamplerprops-setuserchannelmtx
     */
    SetUserChannelMtx(userChannelMtx) {
        result := ComCall(4, this, "float*", userChannelMtx, "HRESULT")
        return result
    }
}
