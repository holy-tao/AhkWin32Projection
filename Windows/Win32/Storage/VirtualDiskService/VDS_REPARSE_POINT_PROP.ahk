#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Defines the reparse-point properties of a volume object.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsvolumemf-queryreparsepoints">IVdsVolumeMF::QueryReparsePoints</a> method returns this structure to report the reparse-point properties of a <a href="https://docs.microsoft.com/windows/desktop/VDS/volume-object">volume object</a>.
 * @see https://learn.microsoft.com/windows/win32/api/vds/ns-vds-vds_reparse_point_prop
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
class VDS_REPARSE_POINT_PROP extends Win32Struct {
    static sizeof => 24

    static packingSize => 8

    /**
     * The GUID of the volume object that contains the reparse point.
     * @type {Guid}
     */
    SourceVolumeId {
        get {
            if(!this.HasProp("__SourceVolumeId"))
                this.__SourceVolumeId := Guid(0, this)
            return this.__SourceVolumeId
        }
    }

    /**
     * A string for a path without a drive letter. For example, "\mount".
     * @type {PWSTR}
     */
    pwszPath {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
