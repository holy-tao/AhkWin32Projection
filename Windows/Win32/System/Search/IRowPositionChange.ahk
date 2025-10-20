#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IRowPositionChange extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRowPositionChange
     * @type {Guid}
     */
    static IID => Guid("{0997a571-126e-11d0-9f8a-00a0c9a0631e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnRowPositionChange"]

    /**
     * 
     * @param {Integer} eReason 
     * @param {Integer} ePhase 
     * @param {BOOL} fCantDeny 
     * @returns {HRESULT} 
     */
    OnRowPositionChange(eReason, ePhase, fCantDeny) {
        result := ComCall(3, this, "uint", eReason, "uint", ePhase, "int", fCantDeny, "HRESULT")
        return result
    }
}
