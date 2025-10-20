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
     * 
     * @param {Pointer<Int64>} prtCurrent 
     * @returns {HRESULT} 
     */
    GetParseTime(prtCurrent) {
        result := ComCall(3, this, "int64*", prtCurrent, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} rtCurrent 
     * @returns {HRESULT} 
     */
    SetParseTime(rtCurrent) {
        result := ComCall(4, this, "int64", rtCurrent, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Flush() {
        result := ComCall(5, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
