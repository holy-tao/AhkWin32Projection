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
     * 
     * @param {Pointer<UInt64>} pu64Frequency 
     * @returns {HRESULT} 
     */
    GetFrequency(pu64Frequency) {
        result := ComCall(3, this, "uint*", pu64Frequency, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt64>} pu64Position 
     * @param {Pointer<UInt64>} pu64QPCPosition 
     * @returns {HRESULT} 
     */
    GetPosition(pu64Position, pu64QPCPosition) {
        result := ComCall(4, this, "uint*", pu64Position, "uint*", pu64QPCPosition, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwCharacteristics 
     * @returns {HRESULT} 
     */
    GetCharacteristics(pdwCharacteristics) {
        result := ComCall(5, this, "uint*", pdwCharacteristics, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
