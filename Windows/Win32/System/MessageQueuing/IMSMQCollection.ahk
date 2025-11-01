#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.MessageQueuing
 * @version v4.0.30319
 */
class IMSMQCollection extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMSMQCollection
     * @type {Guid}
     */
    static IID => Guid("{0188ac2f-ecb3-4173-9779-635ca2039c72}")

    /**
     * The class identifier for MSMQCollection
     * @type {Guid}
     */
    static CLSID => Guid("{f72b9031-2f0c-43e8-924e-e6052cdc493f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Item", "get_Count", "_NewEnum"]

    /**
     * 
     * @param {Pointer<VARIANT>} Index 
     * @param {Pointer<VARIANT>} pvarRet 
     * @returns {HRESULT} 
     */
    Item(Index, pvarRet) {
        result := ComCall(7, this, "ptr", Index, "ptr", pvarRet, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pCount 
     * @returns {HRESULT} 
     */
    get_Count(pCount) {
        pCountMarshal := pCount is VarRef ? "int*" : "ptr"

        result := ComCall(8, this, pCountMarshal, pCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} ppunk 
     * @returns {HRESULT} 
     */
    _NewEnum(ppunk) {
        result := ComCall(9, this, "ptr*", ppunk, "HRESULT")
        return result
    }
}
