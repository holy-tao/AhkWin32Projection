#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\IDebugHostMemory.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDebugHostMemory2 extends IDebugHostMemory{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDebugHostMemory2
     * @type {Guid}
     */
    static IID => Guid("{eea033de-38f6-416b-a251-1d3771001270}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["LinearizeLocation"]

    /**
     * 
     * @param {IDebugHostContext} context 
     * @param {Location} location 
     * @param {Pointer<Location>} pLinearizedLocation 
     * @returns {HRESULT} 
     */
    LinearizeLocation(context, location, pLinearizedLocation) {
        result := ComCall(8, this, "ptr", context, "ptr", location, "ptr", pLinearizedLocation, "HRESULT")
        return result
    }
}
