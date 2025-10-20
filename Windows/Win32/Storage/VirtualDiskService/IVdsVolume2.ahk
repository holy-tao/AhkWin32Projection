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
     * 
     * @param {Pointer<VDS_VOLUME_PROP2>} pVolumeProperties 
     * @returns {HRESULT} 
     */
    GetProperties2(pVolumeProperties) {
        result := ComCall(3, this, "ptr", pVolumeProperties, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
