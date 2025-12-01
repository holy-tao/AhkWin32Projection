#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Used by writers to indicate support for auto-recovery.
 * @see https://learn.microsoft.com/windows/win32/api/vswriter/ne-vswriter-vss_component_flags
 * @namespace Windows.Win32.Storage.Vss
 * @version v4.0.30319
 */
class VSS_COMPONENT_FLAGS extends Win32Enum{

    /**
     * The writer will need write access to this component after the shadow copy has been created.
     *       
     * 
     * This flag can be used together with the <b>VSS_VOLSNAP_ATTR_TRANSPORTABLE</b> value of the <a href="https://docs.microsoft.com/windows/desktop/api/vss/ne-vss-vss_volume_snapshot_attributes">_VSS_VOLUME_SNAPSHOT_ATTRIBUTES</a> enumeration if the VSS hardware provider supports LUN masking.<b>Windows Vista and Windows Server 2003 with SP1:  </b>This flag is incompatible with <b>VSS_VOLSNAP_ATTR_TRANSPORTABLE</b>.
     * 
     * 
     * 
     * This flag is not supported for express writers.
     * @type {Integer (Int32)}
     */
    static VSS_CF_BACKUP_RECOVERY => 1

    /**
     * If this is a rollback shadow copy 
     *       (see the <b>VSS_VOLSNAP_ATTR_ROLLBACK_RECOVERY</b> value of the <a href="https://docs.microsoft.com/windows/desktop/api/vss/ne-vss-vss_volume_snapshot_attributes">_VSS_VOLUME_SNAPSHOT_ATTRIBUTES</a> enumeration), the writer for this 
     *       component will need write access to this component after the shadow copy has been created.
     *       
     * 
     * This flag can be used together with the <b>VSS_VOLSNAP_ATTR_TRANSPORTABLE</b> value of the <a href="https://docs.microsoft.com/windows/desktop/api/vss/ne-vss-vss_volume_snapshot_attributes">_VSS_VOLUME_SNAPSHOT_ATTRIBUTES</a> enumeration if the VSS hardware provider supports LUN masking.<b>Windows Vista and Windows Server 2003 with SP1:  </b>This flag is incompatible with <b>VSS_VOLSNAP_ATTR_TRANSPORTABLE</b>.
     * 
     * 
     * 
     * This flag is not supported for express writers.
     * @type {Integer (Int32)}
     */
    static VSS_CF_APP_ROLLBACK_RECOVERY => 2

    /**
     * This component is not part of system state.
     * 
     * <b>Windows Server 2003 with SP1:  </b>This value is not supported until Windows Vista.
     * @type {Integer (Int32)}
     */
    static VSS_CF_NOT_SYSTEM_STATE => 4
}
