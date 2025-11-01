#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.NetworkDiagnosticsFramework
 * @version v4.0.30319
 */
class INetDiagExtensibleHelper extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INetDiagExtensibleHelper
     * @type {Guid}
     */
    static IID => Guid("{c0b35748-ebf5-11d8-bbe9-505054503030}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ResolveAttributes"]

    /**
     * 
     * @param {Integer} celt 
     * @param {Pointer<HELPER_ATTRIBUTE>} rgKeyAttributes 
     * @param {Pointer<Integer>} pcelt 
     * @param {Pointer<Pointer<HELPER_ATTRIBUTE>>} prgMatchValues 
     * @returns {HRESULT} 
     */
    ResolveAttributes(celt, rgKeyAttributes, pcelt, prgMatchValues) {
        pceltMarshal := pcelt is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", celt, "ptr", rgKeyAttributes, pceltMarshal, pcelt, "ptr*", prgMatchValues, "HRESULT")
        return result
    }
}
