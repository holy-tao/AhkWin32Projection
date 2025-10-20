#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\IDebugHostMemory2.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDebugHostMemory3 extends IDebugHostMemory2{
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
     * 
     * @param {Pointer<IDebugHostContext>} context 
     * @param {Location} location 
     * @param {Pointer<Location>} pCanonicalizedLocation 
     * @returns {HRESULT} 
     */
    CanonicalizeLocation(context, location, pCanonicalizedLocation) {
        result := ComCall(9, this, "ptr", context, "ptr", location, "ptr", pCanonicalizedLocation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
