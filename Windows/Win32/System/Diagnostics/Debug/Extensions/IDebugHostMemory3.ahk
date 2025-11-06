#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\Location.ahk
#Include .\IDebugHostMemory2.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDebugHostMemory3 extends IDebugHostMemory2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDebugHostMemory3
     * @type {Guid}
     */
    static IID => Guid("{a515ed09-2bf3-4499-bb03-553790079f84}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 9

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CanonicalizeLocation"]

    /**
     * 
     * @param {IDebugHostContext} context 
     * @param {Location} location 
     * @returns {Location} 
     */
    CanonicalizeLocation(context, location) {
        pCanonicalizedLocation := Location()
        result := ComCall(9, this, "ptr", context, "ptr", location, "ptr", pCanonicalizedLocation, "HRESULT")
        return pCanonicalizedLocation
    }
}
