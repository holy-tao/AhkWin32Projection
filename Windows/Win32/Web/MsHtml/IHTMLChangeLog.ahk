#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLChangeLog extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLChangeLog
     * @type {Guid}
     */
    static IID => Guid("{3050f649-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetNextChange"]

    /**
     * 
     * @param {Pointer<Integer>} pbBuffer 
     * @param {Integer} nBufferSize 
     * @param {Pointer<Integer>} pnRecordLength 
     * @returns {HRESULT} 
     */
    GetNextChange(pbBuffer, nBufferSize, pnRecordLength) {
        result := ComCall(3, this, "char*", pbBuffer, "int", nBufferSize, "int*", pnRecordLength, "HRESULT")
        return result
    }
}
