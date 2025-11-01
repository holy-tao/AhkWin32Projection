#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 * @version v4.0.30319
 */
class IMsmDependencies extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMsmDependencies
     * @type {Guid}
     */
    static IID => Guid("{0adda82d-2c26-11d2-ad65-00a0c9af11a6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Item", "get_Count", "get__NewEnum"]

    /**
     * 
     * @param {Integer} Item 
     * @param {Pointer<IMsmDependency>} Return_R 
     * @returns {HRESULT} 
     */
    get_Item(Item, Return_R) {
        result := ComCall(7, this, "int", Item, "ptr*", Return_R, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Count 
     * @returns {HRESULT} 
     */
    get_Count(Count) {
        CountMarshal := Count is VarRef ? "int*" : "ptr"

        result := ComCall(8, this, CountMarshal, Count, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} NewEnum 
     * @returns {HRESULT} 
     */
    get__NewEnum(NewEnum) {
        result := ComCall(9, this, "ptr*", NewEnum, "HRESULT")
        return result
    }
}
