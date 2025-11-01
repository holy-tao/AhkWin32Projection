#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IAudioClock interface enables a client to monitor a stream's data rate and the current position in the stream.
 * @see https://docs.microsoft.com/windows/win32/api//audioclient/nn-audioclient-iaudioclock
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class IAudioClock extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAudioClock
     * @type {Guid}
     */
    static IID => Guid("{cd63314f-3fba-4a1b-812c-ef96358728e7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetFrequency", "GetPosition", "GetCharacteristics"]

    /**
     * 
     * @param {Pointer<Integer>} pu64Frequency 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/audioclient/nf-audioclient-iaudioclock-getfrequency
     */
    GetFrequency(pu64Frequency) {
        pu64FrequencyMarshal := pu64Frequency is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pu64FrequencyMarshal, pu64Frequency, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pu64Position 
     * @param {Pointer<Integer>} pu64QPCPosition 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/audioclient/nf-audioclient-iaudioclock-getposition
     */
    GetPosition(pu64Position, pu64QPCPosition) {
        pu64PositionMarshal := pu64Position is VarRef ? "uint*" : "ptr"
        pu64QPCPositionMarshal := pu64QPCPosition is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, pu64PositionMarshal, pu64Position, pu64QPCPositionMarshal, pu64QPCPosition, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwCharacteristics 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/audioclient/nf-audioclient-iaudioclock-getcharacteristics
     */
    GetCharacteristics(pdwCharacteristics) {
        pdwCharacteristicsMarshal := pdwCharacteristics is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, pdwCharacteristicsMarshal, pdwCharacteristics, "HRESULT")
        return result
    }
}
