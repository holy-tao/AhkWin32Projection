#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines the reparse-point properties of a volume object.
 * @remarks
 * 
  * The <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsvolumemf-queryreparsepoints">IVdsVolumeMF::QueryReparsePoints</a>method returns this structure to report the reparse-point properties of a <a href="https://docs.microsoft.com/windows/desktop/VDS/volume-object">volume object</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//vds/ns-vds-vds_reparse_point_prop
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class VDS_REPARSE_POINT_PROP extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The GUID of the volume object that contains the reparse point.
     * @type {Pointer<Guid>}
     */
    SourceVolumeId {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * A string for a path without a drive letter. For example, "\mount".
     * @type {Pointer<Char>}
     */
    pwszPath {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
