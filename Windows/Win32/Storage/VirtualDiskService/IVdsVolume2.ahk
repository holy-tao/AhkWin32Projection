#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\VDS_VOLUME_PROP2.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides a method for returning volume property information, including the volume GUIDs.
 * @see https://learn.microsoft.com/windows/win32/api//content/vds/nn-vds-ivdsvolume2
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
     * Returns property information for the current volume. This method is identical to the IVdsVolume::GetProperties method, except that it returns a VDS_VOLUME_PROP2 structure instead of a VDS_VOLUME_PROP structure.
     * @remarks
     * This method retrieves the unique volume identifier for a volume. The structure that contains that identifier is <a href="https://docs.microsoft.com/windows/desktop/api/vds/ns-vds-vds_volume_prop2">VDS_VOLUME_PROP2</a>, not <a href="https://docs.microsoft.com/windows/desktop/api/vds/ns-vds-vds_volume_prop">VDS_VOLUME_PROP</a>.
     * 
     * Note that a unique volume identifier is not the same as a volume GUID path. To find the volume GUID paths for a volume, use the <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsvolumemf3-queryvolumeguidpathnames">IVdsVolumeMF3::QueryVolumeGuidPathnames</a> method.
     * @returns {VDS_VOLUME_PROP2} The address of the <a href="https://docs.microsoft.com/windows/desktop/api/vds/ns-vds-vds_volume_prop">VDS_VOLUME_PROP2</a> structure 
     *       allocated and passed in by the caller. VDS allocates memory for the <b>pwszName</b> member 
     *       string. Callers must free the string by using the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function.
     * @see https://learn.microsoft.com/windows/win32/api//content/vds/nf-vds-ivdsvolume2-getproperties2
     */
    GetProperties2() {
        pVolumeProperties := VDS_VOLUME_PROP2()
        result := ComCall(3, this, "ptr", pVolumeProperties, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pVolumeProperties
    }
}
