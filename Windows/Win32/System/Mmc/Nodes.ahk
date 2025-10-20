#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class Nodes extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for Nodes
     * @type {Guid}
     */
    static IID => Guid("{313b01df-b22f-4d42-b1b8-483cdcf51d35}")

    /**
     * The class identifier for Nodes
     * @type {Guid}
     */
    static CLSID => Guid("{313b01df-b22f-4d42-b1b8-483cdcf51d35}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get__NewEnum", "Item", "get_Count"]

    /**
     * 
     * @param {Pointer<IUnknown>} retval 
     * @returns {HRESULT} 
     */
    get__NewEnum(retval) {
        result := ComCall(7, this, "ptr*", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {Pointer<Node>} Node 
     * @returns {HRESULT} 
     */
    Item(Index, Node) {
        result := ComCall(8, this, "int", Index, "ptr*", Node, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Count 
     * @returns {HRESULT} 
     */
    get_Count(Count) {
        result := ComCall(9, this, "int*", Count, "HRESULT")
        return result
    }
}
