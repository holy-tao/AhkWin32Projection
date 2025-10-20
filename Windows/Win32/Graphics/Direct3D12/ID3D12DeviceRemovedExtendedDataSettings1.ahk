#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D12DeviceRemovedExtendedDataSettings.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12DeviceRemovedExtendedDataSettings1 extends ID3D12DeviceRemovedExtendedDataSettings{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12DeviceRemovedExtendedDataSettings1
     * @type {Guid}
     */
    static IID => Guid("{dbd5ae51-3317-4f0a-adf9-1d7cedcaae0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetBreadcrumbContextEnablement"]

    /**
     * 
     * @param {Integer} Enablement 
     * @returns {String} Nothing - always returns an empty string
     */
    SetBreadcrumbContextEnablement(Enablement) {
        ComCall(6, this, "int", Enablement)
    }
}
