#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class ICanvasPixelArrayData extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICanvasPixelArrayData
     * @type {Guid}
     */
    static IID => Guid("{305107f9-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetBufferPointer"]

    /**
     * 
     * @param {Pointer<Pointer<Integer>>} ppBuffer 
     * @param {Pointer<Integer>} pBufferLength 
     * @returns {HRESULT} 
     */
    GetBufferPointer(ppBuffer, pBufferLength) {
        pBufferLengthMarshal := pBufferLength is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr*", ppBuffer, pBufferLengthMarshal, pBufferLength, "HRESULT")
        return result
    }
}
