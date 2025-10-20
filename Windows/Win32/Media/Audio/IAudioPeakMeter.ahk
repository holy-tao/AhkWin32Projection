#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IAudioPeakMeter interface provides access to a hardware peak-meter control.
 * @see https://docs.microsoft.com/windows/win32/api//devicetopology/nn-devicetopology-iaudiopeakmeter
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class IAudioPeakMeter extends IUnknown{
    /**
     * The interface identifier for IAudioPeakMeter
     * @type {Guid}
     */
    static IID => Guid("{dd79923c-0599-45e0-b8b6-c8df7db6e796}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<UInt32>} pcChannels 
     * @returns {HRESULT} 
     */
    GetChannelCount(pcChannels) {
        result := ComCall(3, this, "uint*", pcChannels, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} nChannel 
     * @param {Pointer<Single>} pfLevel 
     * @returns {HRESULT} 
     */
    GetLevel(nChannel, pfLevel) {
        result := ComCall(4, this, "uint", nChannel, "float*", pfLevel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
