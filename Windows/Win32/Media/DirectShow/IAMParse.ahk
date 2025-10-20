#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IAMParse interface sets and retrieves the parse time for an MPEG-2 stream.
 * @see https://docs.microsoft.com/windows/win32/api//amparse/nn-amparse-iamparse
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IAMParse extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAMParse
     * @type {Guid}
     */
    static IID => Guid("{c47a3420-005c-11d2-9038-00a0c9697298}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetParseTime", "SetParseTime", "Flush"]

    /**
     * 
     * @param {Pointer<Integer>} prtCurrent 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/amparse/nf-amparse-iamparse-getparsetime
     */
    GetParseTime(prtCurrent) {
        result := ComCall(3, this, "int64*", prtCurrent, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} rtCurrent 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/amparse/nf-amparse-iamparse-setparsetime
     */
    SetParseTime(rtCurrent) {
        result := ComCall(4, this, "int64", rtCurrent, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/amparse/nf-amparse-iamparse-flush
     */
    Flush() {
        result := ComCall(5, this, "HRESULT")
        return result
    }
}
