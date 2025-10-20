#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12DeviceTools extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12DeviceTools
     * @type {Guid}
     */
    static IID => Guid("{2ea68e9c-19c3-4e47-a109-6cdadff0aca9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetNextAllocationAddress"]

    /**
     * 
     * @param {Integer} nextAllocationVirtualAddress 
     * @returns {String} Nothing - always returns an empty string
     */
    SetNextAllocationAddress(nextAllocationVirtualAddress) {
        ComCall(3, this, "uint", nextAllocationVirtualAddress)
    }
}
