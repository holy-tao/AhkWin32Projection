#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IAudioClockAdjustment interface is used to adjust the sample rate of a stream.
 * @see https://docs.microsoft.com/windows/win32/api//audioclient/nn-audioclient-iaudioclockadjustment
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class IAudioClockAdjustment extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAudioClockAdjustment
     * @type {Guid}
     */
    static IID => Guid("{f6e4c0a0-46d9-4fb8-be21-57a3ef2b626c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetSampleRate"]

    /**
     * 
     * @param {Float} flSampleRate 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/audioclient/nf-audioclient-iaudioclockadjustment-setsamplerate
     */
    SetSampleRate(flSampleRate) {
        result := ComCall(3, this, "float", flSampleRate, "HRESULT")
        return result
    }
}
