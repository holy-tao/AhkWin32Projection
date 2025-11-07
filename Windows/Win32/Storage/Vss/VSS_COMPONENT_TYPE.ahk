#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specify the type of component being used with a shadow copy backup operation.
 * @remarks
 * 
 * A writer sets a component's type when it adds the component to its Writer Metadata Document using 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/nf-vswriter-ivsscreatewritermetadata-addcomponent">IVssCreateWriterMetadata::AddComponent</a>.
 * 
 * Writers and requesters can find the type information of components selected for inclusion in a Backup 
 *     Components Document through calls to 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/nf-vswriter-ivsscomponent-getcomponenttype">IVssComponent::GetComponentType</a> to return 
 *     a component type directly.
 * 
 * A requester can obtain the type of any component in a given writer's Writer Metadata Document by doing the 
 *     following:
 * 
 * <ol>
 * <li>Using 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssexaminewritermetadata-getcomponent">IVssExamineWriterMetadata::GetComponent</a> 
 *       to obtain a <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nl-vsbackup-ivsswmcomponent">IVssWMComponent</a> interface</li>
 * <li>Using 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivsswmcomponent-getcomponentinfo">IVssWMComponent::GetComponentInfo</a> to 
 *       return a <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/ns-vsbackup-vss_componentinfo">VSS_COMPONENTINFO</a> structure</li>
 * <li>Examining the <b>Type</b> member of the 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/ns-vsbackup-vss_componentinfo">VSS_COMPONENTINFO</a> object</li>
 * </ol>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//vswriter/ne-vswriter-vss_component_type
 * @namespace Windows.Win32.Storage.Vss
 * @version v4.0.30319
 */
class VSS_COMPONENT_TYPE{

    /**
     * Undefined component type. 
 *       
 * 
 * This value indicates an application error.
     * @type {Integer (Int32)}
     */
    static VSS_CT_UNDEFINED => 0

    /**
     * Database component.
     * @type {Integer (Int32)}
     */
    static VSS_CT_DATABASE => 1

    /**
     * File group component. This is any component other than a database.
     * @type {Integer (Int32)}
     */
    static VSS_CT_FILEGROUP => 2
}
