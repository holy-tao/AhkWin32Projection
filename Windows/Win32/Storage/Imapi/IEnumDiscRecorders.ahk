#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IEnumDiscRecorders.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Storage.Imapi
 * @version v4.0.30319
 */
class IEnumDiscRecorders extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnumDiscRecorders
     * @type {Guid}
     */
    static IID => Guid("{9b1921e1-54ac-11d3-9144-00104ba11c5e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Next", "Skip", "Reset", "Clone"]

    /**
     * 
     * @param {Integer} cRecorders 
     * @param {Pointer<IDiscRecorder>} ppRecorder 
     * @param {Pointer<Integer>} pcFetched 
     * @returns {HRESULT} 
     */
    Next(cRecorders, ppRecorder, pcFetched) {
        pcFetchedMarshal := pcFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", cRecorders, "ptr*", ppRecorder, pcFetchedMarshal, pcFetched, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cRecorders 
     * @returns {HRESULT} 
     */
    Skip(cRecorders) {
        result := ComCall(4, this, "uint", cRecorders, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IEnumDiscRecorders} 
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumDiscRecorders(ppEnum)
    }
}
