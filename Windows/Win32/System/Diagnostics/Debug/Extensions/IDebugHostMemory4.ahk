#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\Location.ahk
#Include .\IDebugHostMemory3.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDebugHostMemory4 extends IDebugHostMemory3{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDebugHostMemory4
     * @type {Guid}
     */
    static IID => Guid("{fe6b3658-da4b-44e3-8a58-6201322280e6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 10

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetPhysicalAddressLocation", "IsPhysicalAddressLocation"]

    /**
     * 
     * @param {Integer} physAddr 
     * @returns {Location} 
     */
    GetPhysicalAddressLocation(physAddr) {
        pPhysicalAddressLocation := Location()
        result := ComCall(10, this, "uint", physAddr, "ptr", pPhysicalAddressLocation, "HRESULT")
        return pPhysicalAddressLocation
    }

    /**
     * 
     * @param {Pointer<Location>} pLocation 
     * @returns {Boolean} 
     */
    IsPhysicalAddressLocation(pLocation) {
        result := ComCall(11, this, "ptr", pLocation, "int")
        return result
    }
}
