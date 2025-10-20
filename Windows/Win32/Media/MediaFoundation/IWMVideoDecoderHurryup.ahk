#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Controls the speed of the video decoder.
 * @see https://docs.microsoft.com/windows/win32/api//wmcodecdsp/nn-wmcodecdsp-iwmvideodecoderhurryup
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IWMVideoDecoderHurryup extends IUnknown{
    /**
     * The interface identifier for IWMVideoDecoderHurryup
     * @type {Guid}
     */
    static IID => Guid("{352bb3bd-2d4d-4323-9e71-dcdcfbd53ca6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} lHurryup 
     * @returns {HRESULT} 
     */
    SetHurryup(lHurryup) {
        result := ComCall(3, this, "int", lHurryup, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plHurryup 
     * @returns {HRESULT} 
     */
    GetHurryup(plHurryup) {
        result := ComCall(4, this, "int*", plHurryup, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
