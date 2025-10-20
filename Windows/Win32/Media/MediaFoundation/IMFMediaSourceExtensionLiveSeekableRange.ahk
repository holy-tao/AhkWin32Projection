#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFMediaSourceExtensionLiveSeekableRange extends IUnknown{
    /**
     * The interface identifier for IMFMediaSourceExtensionLiveSeekableRange
     * @type {Guid}
     */
    static IID => Guid("{5d1abfd6-450a-4d92-9efc-d6b6cbc1f4da}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Float} start 
     * @param {Float} end 
     * @returns {HRESULT} 
     */
    SetLiveSeekableRange(start, end) {
        result := ComCall(3, this, "double", start, "double", end, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ClearLiveSeekableRange() {
        result := ComCall(4, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
