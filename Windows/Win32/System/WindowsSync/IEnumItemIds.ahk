#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class IEnumItemIds extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnumItemIds
     * @type {Guid}
     */
    static IID => Guid("{43aa3f61-4b2e-4b60-83df-b110d3e148f1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Next"]

    /**
     * 
     * @param {Pointer<Integer>} pbItemId 
     * @param {Pointer<Integer>} pcbItemIdSize 
     * @returns {HRESULT} 
     */
    Next(pbItemId, pcbItemIdSize) {
        pbItemIdMarshal := pbItemId is VarRef ? "char*" : "ptr"
        pcbItemIdSizeMarshal := pcbItemIdSize is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pbItemIdMarshal, pbItemId, pcbItemIdSizeMarshal, pcbItemIdSize, "HRESULT")
        return result
    }
}
