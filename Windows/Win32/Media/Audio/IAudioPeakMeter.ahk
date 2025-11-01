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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetChannelCount", "GetLevel"]

    /**
     * 
     * @param {Pointer<Integer>} pcChannels 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nf-devicetopology-iaudiopeakmeter-getchannelcount
     */
    GetChannelCount(pcChannels) {
        pcChannelsMarshal := pcChannels is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pcChannelsMarshal, pcChannels, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} nChannel 
     * @param {Pointer<Float>} pfLevel 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nf-devicetopology-iaudiopeakmeter-getlevel
     */
    GetLevel(nChannel, pfLevel) {
        pfLevelMarshal := pfLevel is VarRef ? "float*" : "ptr"

        result := ComCall(4, this, "uint", nChannel, pfLevelMarshal, pfLevel, "HRESULT")
        return result
    }
}
