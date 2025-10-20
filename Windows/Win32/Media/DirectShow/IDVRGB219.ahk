#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IDVRGB219 interface controls the dynamic range in the DV Video Encoder and DV Video Decoder filters.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-idvrgb219
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IDVRGB219 extends IUnknown{
    /**
     * The interface identifier for IDVRGB219
     * @type {Guid}
     */
    static IID => Guid("{58473a19-2bc8-4663-8012-25f81babddd1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {BOOL} bState 
     * @returns {HRESULT} 
     */
    SetRGB219(bState) {
        result := ComCall(3, this, "int", bState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
