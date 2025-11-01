#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides a method for returning volume property information, including the volume GUIDs.
 * @see https://docs.microsoft.com/windows/win32/api//vds/nn-vds-ivdsvolume2
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class IVdsVolume2 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVdsVolume2
     * @type {Guid}
     */
    static IID => Guid("{72ae6713-dcbb-4a03-b36b-371f6ac6b53d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetProperties2"]

    /**
     * 
     * @param {Pointer<VDS_VOLUME_PROP2>} pVolumeProperties 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsvolume2-getproperties2
     */
    GetProperties2(pVolumeProperties) {
        result := ComCall(3, this, "ptr", pVolumeProperties, "HRESULT")
        return result
    }
}
