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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCount", "GetFormat"]

    /**
     * Gets the number of supported audio formats in the list.
     * @returns {Integer} The number of supported audio formats in the list.
     * @see https://docs.microsoft.com/windows/win32/api//spatialaudioclient/nf-spatialaudioclient-iaudioformatenumerator-getcount
     */
    GetCount() {
        result := ComCall(3, this, "uint*", &count := 0, "HRESULT")
        return count
    }

    /**
     * Gets the format with the specified index in the list. The formats are listed in order of importance. The most preferable format is first in the list.
     * @param {Integer} index The index of the item in the list to retrieve.
     * @returns {Pointer<WAVEFORMATEX>} Pointer to a pointer to a <b>WAVEFORMATEX</b> structure describing a supported audio format.
     * @see https://docs.microsoft.com/windows/win32/api//spatialaudioclient/nf-spatialaudioclient-iaudioformatenumerator-getformat
     */
    GetFormat(index) {
        result := ComCall(4, this, "uint", index, "ptr*", &format := 0, "HRESULT")
        return format
    }
}
