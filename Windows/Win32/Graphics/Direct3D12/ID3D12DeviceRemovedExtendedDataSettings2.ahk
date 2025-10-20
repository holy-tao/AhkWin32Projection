#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D12DeviceRemovedExtendedDataSettings1.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12DeviceRemovedExtendedDataSettings2 extends ID3D12DeviceRemovedExtendedDataSettings1{
    /**
     * The interface identifier for ID3D12DeviceRemovedExtendedDataSettings2
     * @type {Guid}
     */
    static IID => Guid("{61552388-01ab-4008-a436-83db189566ea}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {BOOL} MarkersOnly 
     * @returns {String} Nothing - always returns an empty string
     */
    UseMarkersOnlyAutoBreadcrumbs(MarkersOnly) {
        ComCall(7, this, "int", MarkersOnly)
        return result
    }
}
