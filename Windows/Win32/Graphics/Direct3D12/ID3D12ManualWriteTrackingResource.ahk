#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12ManualWriteTrackingResource extends IUnknown{
    /**
     * The interface identifier for ID3D12ManualWriteTrackingResource
     * @type {Guid}
     */
    static IID => Guid("{86ca3b85-49ad-4b6e-aed5-eddb18540f41}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} Subresource 
     * @param {Pointer<D3D12_RANGE>} pWrittenRange 
     * @returns {String} Nothing - always returns an empty string
     */
    TrackWrite(Subresource, pWrittenRange) {
        ComCall(3, this, "uint", Subresource, "ptr", pWrittenRange)
        return result
    }
}
