#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class ISequenceNumber extends IUnknown{
    /**
     * The interface identifier for ISequenceNumber
     * @type {Guid}
     */
    static IID => Guid("{3050f6c1-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} nCurrent 
     * @param {Pointer<Int32>} pnNew 
     * @returns {HRESULT} 
     */
    GetSequenceNumber(nCurrent, pnNew) {
        result := ComCall(3, this, "int", nCurrent, "int*", pnNew, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
