#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 * @version v4.0.30319
 */
class IRTCCollection extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRTCCollection
     * @type {Guid}
     */
    static IID => Guid("{ec7c8096-b918-4044-94f1-e4fba0361d5c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Count", "get_Item", "get__NewEnum"]

    /**
     * 
     * @param {Pointer<Integer>} lCount 
     * @returns {HRESULT} 
     */
    get_Count(lCount) {
        lCountMarshal := lCount is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, lCountMarshal, lCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {Pointer<VARIANT>} pVariant 
     * @returns {HRESULT} 
     */
    get_Item(Index, pVariant) {
        result := ComCall(8, this, "int", Index, "ptr", pVariant, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} ppNewEnum 
     * @returns {HRESULT} 
     */
    get__NewEnum(ppNewEnum) {
        result := ComCall(9, this, "ptr*", ppNewEnum, "HRESULT")
        return result
    }
}
