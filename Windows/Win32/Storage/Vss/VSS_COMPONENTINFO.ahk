#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\VSS_COMPONENT_TYPE.ahk

/**
 * Contains information about a given component.
 * @remarks
 * To obtain  <b>VSS_COMPONENTINFO</b> object for a given 
 *     component, a requester must first obtain the corresponding 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nl-vsbackup-ivsswmcomponent">IVssWMComponent</a> object through a call to 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssexaminewritermetadata-getcomponent">IVssExamineWriterMetadata::GetComponent</a>. 
 *     A call to 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivsswmcomponent-getcomponentinfo">IVssWMComponent::GetComponentInfo</a> then 
 *     allocates and returns a <b>VSS_COMPONENTINFO</b> 
 *     structure.
 * 
 * Because <b>VSS_COMPONENTINFO</b> is allocated and 
 *     returned by 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivsswmcomponent-getcomponentinfo">IVssWMComponent::GetComponentInfo</a>, 
 *     a requester should not free a <b>VSS_COMPONENTINFO</b> object 
 *     directly, but should use 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivsswmcomponent-freecomponentinfo">IVssWMComponent::FreeComponentInfo</a>.
 * @see https://learn.microsoft.com/windows/win32/api/vsbackup/ns-vsbackup-vss_componentinfo
 * @namespace Windows.Win32.Storage.Vss
 */
class VSS_COMPONENTINFO extends Win32Struct {
    static sizeof => 72

    static packingSize => 8

    /**
     * Component type. See <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/ne-vswriter-vss_component_type">VSS_COMPONENT_TYPE</a>.
     * @type {VSS_COMPONENT_TYPE}
     */
    type {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * A string containing the logical path of the component. 
     *       
     * 
     * A logical path can be <b>NULL</b>.
     * 
     * There are no restrictions on the characters that can appear in a non-<b>NULL</b> logical path.
     * @type {BSTR}
     */
    bstrLogicalPath {
        get {
            if(!this.HasProp("__bstrLogicalPath"))
                this.__bstrLogicalPath := BSTR(8, this)
            return this.__bstrLogicalPath
        }
    }

    /**
     * A string containing the name of the component. A component name string cannot be <b>NULL</b>.
     * @type {BSTR}
     */
    bstrComponentName {
        get {
            if(!this.HasProp("__bstrComponentName"))
                this.__bstrComponentName := BSTR(16, this)
            return this.__bstrComponentName
        }
    }

    /**
     * A string containing the description of the component. A caption string can be <b>NULL</b>.
     * @type {BSTR}
     */
    bstrCaption {
        get {
            if(!this.HasProp("__bstrCaption"))
                this.__bstrCaption := BSTR(24, this)
            return this.__bstrCaption
        }
    }

    /**
     * Pointer to a buffer containing the binary data for a displayable icon representing the component. The 
     *       buffer contents should use the same format as the standard icon (.ico) files. The size, in bytes, of the buffer 
     *       is specified by <b>cbIcon</b>.
     *       
     * 
     * If the writer that created the component did not choose to specify an icon, <b>pbIcon</b> 
     *        is <b>NULL</b>.
     * @type {Pointer<Integer>}
     */
    pbIcon {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * The size, in bytes, of the displayable icon (<b>pbIcon</b>) representing the component. 
     *       If <b>pbIcon</b> is <b>NULL</b>, <b>cbIcon</b> should 
     *       be zero.
     * @type {Integer}
     */
    cbIcon {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * Boolean that indicates whether there is private metadata associated with the restoration of the component. 
     *       The Boolean is <b>true</b> if there is metadata and <b>false</b> if there 
     *       is not.
     *       
     * 
     * A writer indicates whether a component supports private metadata by setting this value when a component is 
     *        added with 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/nf-vswriter-ivsscreatewritermetadata-addcomponent">IVssCreateWriterMetadata::AddComponent</a>. 
     *        Writers later add restore metadata with 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/nf-vswriter-ivsscomponent-setrestoremetadata">IVssComponent::SetRestoreMetadata</a>.
     *        Requesters retrieve the information using 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/nf-vswriter-ivsscomponent-getrestoremetadata">IVssComponent::GetRestoreMetadata</a>.
     * @type {Integer}
     */
    bRestoreMetadata {
        get => NumGet(this, 44, "char")
        set => NumPut("char", value, this, 44)
    }

    /**
     * Reserved for future use. The value of this parameter should always be set to 
     *       <b>false</b>.
     * @type {Integer}
     */
    bNotifyOnBackupComplete {
        get => NumGet(this, 45, "char")
        set => NumPut("char", value, this, 45)
    }

    /**
     * Boolean that indicates (for component mode operations) if the component is selectable for backup. The value 
     *       of <b>bSelectable</b> helps determine whether a requester has the option of including or 
     *       excluding a given component in backup operations. The Boolean is <b>true</b> if the component 
     *       is selectable for backup and <b>false</b> if it is not.
     *       
     * 
     * There is no default value for a component's selectability for backup. A writer must always explicitly set the 
     *        value when it adds the component to its Writer Metadata Document using 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/nf-vswriter-ivsscreatewritermetadata-addcomponent">IVssCreateWriterMetadata::AddComponent</a>.
     * 
     * In addition, the value of <b>bSelectable</b>, the component's logical path, and the 
     *        component's relationship to other components as expressed in that path determine when and how a component is 
     *        included in a backup operation:
     * 
     * <ul>
     * <li>For a nonselectable for backup component (<b>bSelectable</b> is 
     *         <b>false</b>) with no selectable for backup ancestors in the hierarchy of its logical path, 
     *         inclusion in the backup set is always mandatory and always implicit. 
     *         A requester explicitly adds the component to the backup set in the Backup Components Document with 
     *          <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-addcomponent">IVssBackupComponents::AddComponent</a>.
     * 
     * </li>
     * <li>For a selectable for backup component (<b>bSelectable</b> is 
     *         <b>true</b>) with no selectable for backup ancestor in the hierarchy of its logical paths, 
     *         inclusion in the backup set is always optional and always explicit. 
     *         A requester explicitly adds the component to the backup set in the Backup Components Document with 
     *          <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-addcomponent">IVssBackupComponents::AddComponent</a>.
     * 
     * If such a component is included as an ancestor in the logical path of other components, both those that are 
     *          selectable for backup and those that are not, it defines a component set containing these other components as 
     *          subcomponents. If a selectable for backup component is explicitly included in a backup, these subcomponents 
     *          are implicitly included in the backup.
     * 
     * </li>
     * <li>For a nonselectable for backup component (<b>bSelectable</b> is 
     *         <b>false</b>) that has a selectable for backup ancestor in the hierarchy of its logical 
     *         paths (and are therefore part of a component set defined by that ancestor), inclusion in the backup set is 
     *         always implicit and contingent on the inclusion of a selectable for backup ancestor. 
     *         A requester never explicitly adds the component to the backup set in the Backup Components Document; 
     *          instead, it adds the selectable for backup ancestor to the document using 
     *          <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-addcomponent">IVssBackupComponents::AddComponent</a>.
     * 
     * </li>
     * <li>For a selectable for backup component (<b>bSelectable</b> is 
     *         <b>true</b>) that has a selectable for backup ancestor in the hierarchy of its logical 
     *         paths (and is therefore part of a component set defined by that ancestor), inclusion in the backup set can be 
     *         either optional and explicit, or if the component is not explicitly selected, its inclusion may be implicit 
     *         and contingent on the inclusion of a selectable for backup ancestor. 
     *         If the inclusion of the component is explicit, a requester explicitly adds the components to the backup set 
     *          in the Backup Components Document with 
     *          <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-addcomponent">IVssBackupComponents::AddComponent</a>.
     * 
     * If the inclusion is implicit, a requester does not add these components to a backup set in the Backup 
     *          Components Document.
     * 
     * If the inclusion of the component is explicit and the component defines a component set, the members of 
     *          that component set are implicitly selected.
     * 
     * A writer sets a component's selectability for backup (<b>bSelectable</b>) when adding 
     *          the component to the Writer Metadata Document by using 
     *          <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/nf-vswriter-ivsscreatewritermetadata-addcomponent">IVssCreateWriterMetadata::AddComponent</a>.
     * 
     * See <a href="https://docs.microsoft.com/windows/desktop/VSS/working-with-selectability-and-logical-paths">Working with Selectability 
     *          and Logical Paths</a> for more information.
     * 
     * </li>
     * </ul>
     * @type {Integer}
     */
    bSelectable {
        get => NumGet(this, 46, "char")
        set => NumPut("char", value, this, 46)
    }

    /**
     * Boolean that indicates (for component-mode operations) whether the component is selectable for restore. 
     *       <b>bSelectableForRestore</b> allows the requester to determine whether this component can be 
     *       individually selected for restore if it had earlier been 
     *       <a href="https://docs.microsoft.com/windows/desktop/VSS/vssgloss-i">implicitly included</a> in the 
     *       backup. The Boolean is <b>true</b> if the component is selectable for restore and 
     *       <b>false</b> if it is not.
     *       
     * 
     * By default, a component's selectability for restore is <b>false</b>. A writer can override 
     *        this default when it adds the component to its Writer Metadata Document using 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/nf-vswriter-ivsscreatewritermetadata-addcomponent">IVssCreateWriterMetadata::AddComponent</a>.
     * 
     * If a component is explicitly added to the backup document (see [explicit component inclusion](/windows/win32/vss/vssgloss-e)), then it can always be individually selected for restore; so this flag then has no meaning. If a component is implicitly added to the backup document, then the 
     *        <b>bSelectableForRestore</b> flag determines whether the component can be individually 
     *        restored using 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-addrestoresubcomponent">IVssBackupComponents::AddRestoreSubcomponent</a>.
     * 
     * See <a href="https://docs.microsoft.com/windows/desktop/VSS/working-with-selectability-and-logical-paths">Working with Selectability 
     *        and Logical Paths</a> for more information.
     * @type {Integer}
     */
    bSelectableForRestore {
        get => NumGet(this, 47, "char")
        set => NumPut("char", value, this, 47)
    }

    /**
     * A bit mask (or bitwise OR) of values of the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/ne-vswriter-vss_component_flags">VSS_COMPONENT_FLAGS</a> enumeration, indicating the 
     *       features this component supports.
     * 
     * <b>Windows Server 2003 and Windows XP:  </b>Before Windows Server 2003 with SP1, this member is reserved for system use.
     * @type {Integer}
     */
    dwComponentFlags {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * If the component is a file group, the number of file descriptors for files in the group. Otherwise, this 
     *       value is zero.
     * @type {Integer}
     */
    cFileCount {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * If the component is a database, the number of database file descriptors. Otherwise, this value is 
     *       zero.
     * @type {Integer}
     */
    cDatabases {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * If the component is a database, the number of database log file descriptors. Otherwise, the value of this 
     *       parameter is zero.
     * @type {Integer}
     */
    cLogFiles {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * The number of explicit writer-component dependencies of the current component. This value is incremented 
     *       when 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/nf-vswriter-ivsscreatewritermetadata-addcomponentdependency">IVssCreateWriterMetadata::AddComponentDependency</a> 
     *       is called by a writer.
     * @type {Integer}
     */
    cDependencies {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }
}
