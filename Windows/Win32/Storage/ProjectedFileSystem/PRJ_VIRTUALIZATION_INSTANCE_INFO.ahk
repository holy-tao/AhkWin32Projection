#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Information about a virtualization instance.
 * @see https://learn.microsoft.com/windows/win32/api/projectedfslib/ns-projectedfslib-prj_virtualization_instance_info
 * @namespace Windows.Win32.Storage.ProjectedFileSystem
 */
export default struct PRJ_VIRTUALIZATION_INSTANCE_INFO {
    #StructPack 4

    /**
     * An ID corresponding to a specific virtualization instance.
     */
    InstanceID : Guid

    /**
     * The value used for the byteOffset and length parameters of <a href="https://docs.microsoft.com/windows/desktop/api/projectedfslib/nf-projectedfslib-prjwritefiledata">PrjWriteFileData</a>.
     */
    WriteAlignment : UInt32

}
