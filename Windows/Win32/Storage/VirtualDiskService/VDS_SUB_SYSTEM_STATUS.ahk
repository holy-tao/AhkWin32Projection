#Requires AutoHotkey v2.0.0 64-bit

/**
 * The VDS_SUB_SYSTEM_STATUS enumeration (vdshwprv.h) defines the set of object status values for a subsystem.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdssubsystem-setstatus">IVdsSubSystem::SetStatus</a> method passes a <b>VDS_SUB_SYSTEM_STATUS</b> 
  *     value as an argument to set the status of a subsystem, and the 
  *     <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_sub_system_prop">VDS_SUB_SYSTEM_PROP</a> structure includes a <b>VDS_SUB_SYSTEM_STATUS</b> value 
  *     as a member to indicate the current status.
  * 
  * <div class="alert"><b>Note</b>  Additional constants might be added to the <b>VDS_SUB_SYSTEM_STATUS</b> enumeration in future Windows versions. For this reason, your application must be designed to gracefully handle an unrecognized <b>VDS_SUB_SYSTEM_STATUS</b> enumeration constant.</div>
  * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/ne-vdshwprv-vds_sub_system_status
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class VDS_SUB_SYSTEM_STATUS{

    /**
     * This value is reserved.
     * @type {Integer (Int32)}
     */
    static VDS_SSS_UNKNOWN => 0

    /**
     * The subsystem is working properly.
     * @type {Integer (Int32)}
     */
    static VDS_SSS_ONLINE => 1

    /**
     * The subsystem is initializing and not yet ready to work.
     * @type {Integer (Int32)}
     */
    static VDS_SSS_NOT_READY => 2

    /**
     * The subsystem is unavailable. This value indicates either that the subsystem is disconnected or that it has 
 *       failed so severely that it appears to be disconnected.
     * @type {Integer (Int32)}
     */
    static VDS_SSS_OFFLINE => 4

    /**
     * The subsystem has failed. This value indicates that the subsystem is not merely 
 *       disconnected but rather that it has failed.
     * @type {Integer (Int32)}
     */
    static VDS_SSS_FAILED => 5

    /**
     * The subsystem is operating in a degraded state. This means that one or more of the subsystem's subcomponents, such as  disk drives or controllers, are in a failed state.
 * 
 * <b>Windows Server 2008, Windows Vista and Windows Server 2003:  </b>This value is not supported.
     * @type {Integer (Int32)}
     */
    static VDS_SSS_PARTIALLY_MANAGED => 9
}
