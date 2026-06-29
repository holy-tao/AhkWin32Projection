#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Defines the reparse-point properties of a volume object.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsvolumemf-queryreparsepoints">IVdsVolumeMF::QueryReparsePoints</a> method returns this structure to report the reparse-point properties of a <a href="https://docs.microsoft.com/windows/desktop/VDS/volume-object">volume object</a>.
 * @see https://learn.microsoft.com/windows/win32/api/vds/ns-vds-vds_reparse_point_prop
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
export default struct VDS_REPARSE_POINT_PROP {
    #StructPack 8

    /**
     * The GUID of the volume object that contains the reparse point.
     */
    SourceVolumeId : Guid

    /**
     * A string for a path without a drive letter. For example, "\mount".
     */
    pwszPath : PWSTR

}
