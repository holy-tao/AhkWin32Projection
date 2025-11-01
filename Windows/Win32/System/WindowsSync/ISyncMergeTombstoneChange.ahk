#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class ISyncMergeTombstoneChange extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISyncMergeTombstoneChange
     * @type {Guid}
     */
    static IID => Guid("{6ec62597-0903-484c-ad61-36d6e938f47b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetWinnerItemId"]

    /**
     * 
     * @param {Pointer<Integer>} pbWinnerItemId 
     * @param {Pointer<Integer>} pcbIdSize 
     * @returns {HRESULT} 
     */
    GetWinnerItemId(pbWinnerItemId, pcbIdSize) {
        pbWinnerItemIdMarshal := pbWinnerItemId is VarRef ? "char*" : "ptr"
        pcbIdSizeMarshal := pcbIdSize is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pbWinnerItemIdMarshal, pbWinnerItemId, pcbIdSizeMarshal, pcbIdSize, "HRESULT")
        return result
    }
}
