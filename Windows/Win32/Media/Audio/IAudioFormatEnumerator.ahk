#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides a list of supported audio formats. The most preferred format is first in the list. Get a reference to this interface by calling ISpatialAudioClient::GetSupportedAudioObjectFormatEnumerator.
 * @see https://docs.microsoft.com/windows/win32/api//spatialaudioclient/nn-spatialaudioclient-iaudioformatenumerator
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class IAudioFormatEnumerator extends IUnknown{
    /**
     * The interface identifier for IAudioFormatEnumerator
     * @type {Guid}
     */
    static IID => Guid("{dcdaa858-895a-4a22-a5eb-67bda506096d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<UInt32>} count 
     * @returns {HRESULT} 
     */
    GetCount(count) {
        result := ComCall(3, this, "uint*", count, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<WAVEFORMATEX>} format 
     * @returns {HRESULT} 
     */
    GetFormat(index, format) {
        result := ComCall(4, this, "uint", index, "ptr", format, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
