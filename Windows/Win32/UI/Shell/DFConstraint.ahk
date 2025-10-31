#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class DFConstraint extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for DFConstraint
     * @type {Guid}
     */
    static IID => Guid("{4a3df050-23bd-11d2-939f-00a0c91eedba}")

    /**
     * The class identifier for DFConstraint
     * @type {Guid}
     */
    static CLSID => Guid("{4a3df050-23bd-11d2-939f-00a0c91eedba}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Name", "get_Value"]

    /**
     * 
     * @param {Pointer<BSTR>} pbs 
     * @returns {HRESULT} 
     */
    get_Name(pbs) {
        result := ComCall(7, this, "ptr", pbs, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pv 
     * @returns {HRESULT} 
     */
    get_Value(pv) {
        result := ComCall(8, this, "ptr", pv, "HRESULT")
        return result
    }
}
