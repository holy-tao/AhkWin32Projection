#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IAMClockAdjust interface adjusts the reference clock. The System Reference Clock exposes this interface.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-iamclockadjust
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IAMClockAdjust extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAMClockAdjust
     * @type {Guid}
     */
    static IID => Guid("{4d5466b0-a49c-11d1-abe8-00a0c905f375}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetClockDelta"]

    /**
     * The SetClockDelta method adjusts the clock time.
     * @param {Integer} rtDelta Specifies the amount by which to adjust the clock, as a <a href="https://docs.microsoft.com/windows/desktop/DirectShow/reference-time">REFERENCE_TIME</a> value. A positive value moves the clock forward, and a negative value moves the clock backward.
     * @returns {HRESULT} Returns S_OK or an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamclockadjust-setclockdelta
     */
    SetClockDelta(rtDelta) {
        result := ComCall(3, this, "int64", rtDelta, "HRESULT")
        return result
    }
}
