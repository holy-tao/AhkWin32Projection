#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\VSS_OBJECT_UNION.ahk" { VSS_OBJECT_UNION }
#Import ".\VSS_SNAPSHOT_STATE.ahk" { VSS_SNAPSHOT_STATE }
#Import ".\VSS_PROVIDER_TYPE.ahk" { VSS_PROVIDER_TYPE }
#Import ".\VSS_PROVIDER_PROP.ahk" { VSS_PROVIDER_PROP }
#Import ".\VSS_SNAPSHOT_PROP.ahk" { VSS_SNAPSHOT_PROP }
#Import ".\VSS_OBJECT_TYPE.ahk" { VSS_OBJECT_TYPE }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Defines the properties of a provider, volume, shadow copy, or shadow copy set.
 * @remarks
 * A requester obtains <b>VSS_OBJECT_PROP</b> structures by 
 *     using <a href="https://docs.microsoft.com/windows/desktop/api/vss/nf-vss-ivssenumobject-next">IVssEnumObject::Next</a> to iterate over the list 
 *     of objects returned by a call to 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-query">IVssBackupComponents::Query</a>.
 * 
 * As its members are filled by a COM interface, prior to deleting the property structures 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/vss/ns-vss-vss_snapshot_prop">VSS_SNAPSHOT_PROP</a> and 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/vss/ns-vss-vss_provider_prop">VSS_PROVIDER_PROP</a>, the memory they contain must be 
 *     released by calling <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> for every string and 
 *     byte array value contained in each structure.
 * 
 * In the case of <a href="https://docs.microsoft.com/windows/desktop/api/vss/ns-vss-vss_snapshot_prop">VSS_SNAPSHOT_PROP</a>, this can be done 
 *     manually, or the utility function 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-vssfreesnapshotproperties">VssFreeSnapshotProperties</a> can be used.
 * @see https://learn.microsoft.com/windows/win32/api/vss/ns-vss-vss_object_prop
 * @namespace Windows.Win32.Storage.Vss
 */
export default struct VSS_OBJECT_PROP {
    #StructPack 8

    /**
     * Object type. Refer to <a href="https://docs.microsoft.com/windows/desktop/api/vss/ne-vss-vss_object_type">VSS_OBJECT_TYPE</a>.
     */
    Type : VSS_OBJECT_TYPE

    /**
     * Object properties: a union of <a href="https://docs.microsoft.com/windows/desktop/api/vss/ns-vss-vss_snapshot_prop">VSS_SNAPSHOT_PROP</a> 
     *       and <a href="https://docs.microsoft.com/windows/desktop/api/vss/ns-vss-vss_provider_prop">VSS_PROVIDER_PROP</a> structures. (See 
     *       <a href="https://docs.microsoft.com/openspecs/windows_protocols/ms-scmp/f63af19f-bc5c-4a20-afaf-4f6e0f7c1045">VSS_OBJECT_UNION</a>.) 
     *      
     * 
     * It contains information for an object of the type specified by the <b>Type</b> member of 
     *       the <b>VSS_OBJECT_PROP</b> structure. Objects can be 
     *       providers, volumes, shadow copies, or shadow copy sets.
     */
    Obj : VSS_OBJECT_UNION

}
