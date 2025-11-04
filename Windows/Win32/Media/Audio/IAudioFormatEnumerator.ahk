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
     * 
     * @param {Pointer<Integer>} count 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/spatialaudioclient/nf-spatialaudioclient-iaudioformatenumerator-getcount
     */
    GetCount(count) {
        countMarshal := count is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, countMarshal, count, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<Pointer<WAVEFORMATEX>>} format 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/spatialaudioclient/nf-spatialaudioclient-iaudioformatenumerator-getformat
     */
    GetFormat(index, format) {
        formatMarshal := format is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, "uint", index, formatMarshal, format, "HRESULT")
        return result
    }
}
