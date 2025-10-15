#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * Contains the automagic hints for a LUN in a storage pool.
 * @remarks
 * 
  * The <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdshwproviderstoragepools-createluninstoragepool">IVdsHwProviderStoragePools::CreateLunInStoragePool</a> method passes 
  *     this structure as a parameter to provide hints for creating a LUN in a storage pool. It is passed as a parameter in the 
  *     <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdslun2-applyhints2">IVdsLun2::ApplyHints2</a> method to apply a new set of hints to a 
  *     LUN. Further, it is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdslun2-queryhints2">IVdsLun2::QueryHints2</a> method  to report hints currently applied 
  *     to a LUN or LUN plex, respectively.
  *     
  * 
  * Hints are not directives to implementers. While implementers are in general expected to do their best to take hints into consideration, 
  *      they are not obligated to follow them. Implementers can opt for alternatives when unable to follow specified hints for
  *      technical reasons or when following them can result in a poor configuration.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//vds/ns-vds-vds_hints2
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class VDS_HINTS2 extends Win32Struct
{
    static sizeof => 136

    static packingSize => 8

    /**
     * The LUN hint mask. Each of the <b>BOOL</b> members of this structure has a corresponding hint flag that can be set in the mask. If the 
     *       hint flag is set, the corresponding hint is considered. If the hint flag is not set, the hint is ignored. The 
     *       hint flags are described in the following table.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VDS_HINT_FASTCRASHRECOVERYREQUIRED"></a><a id="vds_hint_fastcrashrecoveryrequired"></a><dl>
     * <dt><b>VDS_HINT_FASTCRASHRECOVERYREQUIRED</b></dt>
     * <dt>0x0000000000000001L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The provider limits the time that is required for recovery. To support fast recovery, the provider uses a change log that enables the provider to recover the LUN without comparing the entire contents of the LUN.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VDS_HINT_MOSTLYREADS"></a><a id="vds_hint_mostlyreads"></a><dl>
     * <dt><b>VDS_HINT_MOSTLYREADS</b></dt>
     * <dt>0x0000000000000002L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The provider optimizes the LUN for a read-mostly usage pattern, typically by using mirroring rather than parity striping.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VDS_HINT_OPTIMIZEFORSEQUENTIALREADS"></a><a id="vds_hint_optimizeforsequentialreads"></a><dl>
     * <dt><b>VDS_HINT_OPTIMIZEFORSEQUENTIALREADS</b></dt>
     * <dt>0x0000000000000004L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The provider optimizes the LUN for a sequential-read usage pattern. If this flag is not set and VDS_HINT_OPTIMIZEFORSEQUENTIALWRITES is also not set, the LUN is optimized for random I/O.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VDS_HINT_OPTIMIZEFORSEQUENTIALWRITES"></a><a id="vds_hint_optimizeforsequentialwrites"></a><dl>
     * <dt><b>VDS_HINT_OPTIMIZEFORSEQUENTIALWRITES</b></dt>
     * <dt>0x0000000000000008L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The provider optimizes the LUN for a sequential-write usage pattern. If this flag is not set and VDS_HINT_OPTIMIZEFORSEQUENTIALREADS is also not set, the LUN is optimized for random I/O.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VDS_HINT_READBACKVERIFYENABLED"></a><a id="vds_hint_readbackverifyenabled"></a><dl>
     * <dt><b>VDS_HINT_READBACKVERIFYENABLED</b></dt>
     * <dt>0x0000000000000010L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The provider verifies the writes to the LUN by using readback.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VDS_HINT_REMAPENABLED"></a><a id="vds_hint_remapenabled"></a><dl>
     * <dt><b>VDS_HINT_REMAPENABLED</b></dt>
     * <dt>0x0000000000000020L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The mapping of LUN extents to drive extents is created and updated automatically by the provider. If this flag is not set, the mapping remains fixed after configuration, except when proactive actions are taken to avoid drive failures.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VDS_HINT_WRITETHROUGHCACHINGENABLED"></a><a id="vds_hint_writethroughcachingenabled"></a><dl>
     * <dt><b>VDS_HINT_WRITETHROUGHCACHINGENABLED</b></dt>
     * <dt>0x0000000000000040L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The provider enables the write-through caching policy on the LUN.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VDS_HINT_HARDWARECHECKSUMENABLED"></a><a id="vds_hint_hardwarechecksumenabled"></a><dl>
     * <dt><b>VDS_HINT_HARDWARECHECKSUMENABLED</b></dt>
     * <dt>0x0000000000000080L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The provider enables a hardware checksum on the LUN.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VDS_HINT_ISYANKABLE"></a><a id="vds_hint_isyankable"></a><dl>
     * <dt><b>VDS_HINT_ISYANKABLE</b></dt>
     * <dt>0x0000000000000100L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The provider configures the LUN so that the drives that contribute to it can be physically removed with minimal system disruption. This is normally accomplished by ensuring that the LUN occupies as few drives as possible.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VDS_HINT_ALLOCATEHOTSPARE"></a><a id="vds_hint_allocatehotspare"></a><dl>
     * <dt><b>VDS_HINT_ALLOCATEHOTSPARE</b></dt>
     * <dt>0x0000000000000200L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The provider allocates a hot spare for the LUN. For more information, see <a href="https://docs.microsoft.com/windows/desktop/VDS/hot-sparing">Hot Sparing</a>, <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_drive_flag">VDS_DRIVE_FLAG</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/vds/ne-vds-vds_disk_flag">VDS_DISK_FLAG</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VDS_HINT_BUSTYPE"></a><a id="vds_hint_bustype"></a><dl>
     * <dt><b>VDS_HINT_BUSTYPE</b></dt>
     * <dt>0x0000000000000400L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The provider uses the specified bus type on the LUN. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/vdslun/ne-vdslun-vds_storage_bus_type">VDS_STORAGE_BUS_TYPE</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VDS_HINT_USEMIRROREDCACHE"></a><a id="vds_hint_usemirroredcache"></a><dl>
     * <dt><b>VDS_HINT_USEMIRROREDCACHE</b></dt>
     * <dt>0x0000000000000800L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The provider uses a mirrored cache on the LUN. See the <b>VDS_SF_SUPPORTS_MIRRORED_CACHE</b>  value of the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_sub_system_flag">VDS_SUB_SYSTEM_FLAG</a> enumeration.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VDS_HINT_READCACHINGENABLED"></a><a id="vds_hint_readcachingenabled"></a><dl>
     * <dt><b>VDS_HINT_READCACHINGENABLED</b></dt>
     * <dt>0x0000000000001000L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The provider enables read caching on the LUN. See the <b>VDS_LF_READ_CACHE_ENABLED</b> value of the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_lun_flag">VDS_LUN_FLAG</a>  enumeration and the <b>VDS_SF_READ_CACHING_CAPABLE</b> value of the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_sub_system_flag">VDS_SUB_SYSTEM_FLAG</a> enumeration.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VDS_HINT_WRITECACHINGENABLED"></a><a id="vds_hint_writecachingenabled"></a><dl>
     * <dt><b>VDS_HINT_WRITECACHINGENABLED</b></dt>
     * <dt>0x0000000000002000L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The provider enables write caching on the LUN. See the <b>VDS_LF_WRITE_CACHE_ENABLED</b> value of the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_lun_flag">VDS_LUN_FLAG</a>  enumeration and the <b>VDS_SF_WRITE_CACHING_CAPABLE</b> value of the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_sub_system_flag">VDS_SUB_SYSTEM_FLAG</a> enumeration.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VDS_HINT_MEDIASCANENABLED"></a><a id="vds_hint_mediascanenabled"></a><dl>
     * <dt><b>VDS_HINT_MEDIASCANENABLED</b></dt>
     * <dt>0x0000000000004000L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The provider enables media scanning on the LUN. See the <b>VDS_LF_MEDIA_SCAN_ENABLED</b> value of the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_lun_flag">VDS_LUN_FLAG</a>  enumeration and the <b>VDS_SF_MEDIA_SCAN_CAPABLE</b> value of the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_sub_system_flag">VDS_SUB_SYSTEM_FLAG</a> enumeration.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VDS_HINT_CONSISTENCYCHECKENABLED"></a><a id="vds_hint_consistencycheckenabled"></a><dl>
     * <dt><b>VDS_HINT_CONSISTENCYCHECKENABLED</b></dt>
     * <dt>0x0000000000008000L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The provider enables consistency checking on the LUN. See the <b>VDS_LF_CONSISTENCY_CHECK_ENABLED</b> value of the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_lun_flag">VDS_LUN_FLAG</a>  enumeration and the <b>VDS_SF_CONSISTENCY_CHECK_CAPABLE</b> value of the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_sub_system_flag">VDS_SUB_SYSTEM_FLAG</a> enumeration.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    ullHintMask {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The maximum size to which the LUN is expected to grow, in bytes. The value can be equal to, greater than, or 
     *       less than the value specified in the <i>ullSizeInBytes</i> parameter when the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nf-vdshwprv-ivdshwproviderstoragepools-createluninstoragepool">IVdsHwProviderStoragePools::CreateLunInStoragePool</a> method is called.
     *       Some providers use this value to reserve space for the LUN. Providers that are unable to reserve space 
     *       typically ignore this parameter.
     * @type {Integer}
     */
    ullExpectedMaximumSize {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The optimal read size for the LUN, in bytes. Zero indicates no optimal read size.
     * @type {Integer}
     */
    ulOptimalReadSize {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The optimal read alignment with respect to the first logical block of the LUN. Zero indicates no optimal read 
     *       alignment.
     * @type {Integer}
     */
    ulOptimalReadAlignment {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * The optimal write size for the LUN, in bytes. Zero indicates no optimal write size.
     * @type {Integer}
     */
    ulOptimalWriteSize {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * The optimal write alignment with respect to the first logical block of the LUN. Zero indicates no optimal 
     *       write alignment.
     * @type {Integer}
     */
    ulOptimalWriteAlignment {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * The maximum number of drives to contribute to the LUN. Zero indicates no maximum drive count. This value can be 
     *       used to limit the number of stripe interleaves in a stripe set.
     * @type {Integer}
     */
    ulMaximumDriveCount {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * The mirror or parity stripe interleave size, in bytes. Zero leaves the stripe size unspecified.
     * @type {Integer}
     */
    ulStripeSize {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * This member is reserved for future use. Do not use.
     * @type {Integer}
     */
    ulReserved1 {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * This member is reserved for future use. Do not use.
     * @type {Integer}
     */
    ulReserved2 {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * This member is reserved for future use. Do not use.
     * @type {Integer}
     */
    ulReserved3 {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * If this member is <b>TRUE</b>, the recovery time is limited. Set the <b>VDS_HINT_FASTCRASHRECOVERYREQUIRED</b> 
     *       flag in the <b>ullHintMask</b> member to indicate interest in this member.
     * @type {BOOL}
     */
    bFastCrashRecoveryRequired{
        get {
            if(!this.HasProp("__bFastCrashRecoveryRequired"))
                this.__bFastCrashRecoveryRequired := BOOL(this.ptr + 52)
            return this.__bFastCrashRecoveryRequired
        }
    }

    /**
     * To optimize for a mostly-reads usage pattern (for example, through mirroring rather than parity striping), set 
     *       this member to <b>TRUE</b>. Otherwise, set it to <b>FALSE</b>. Set the <b>VDS_HINT_MOSTLYREADS</b> flag in 
     *       the <b>ullHintMask</b> member to indicate interest in this member.
     * @type {BOOL}
     */
    bMostlyReads{
        get {
            if(!this.HasProp("__bMostlyReads"))
                this.__bMostlyReads := BOOL(this.ptr + 56)
            return this.__bMostlyReads
        }
    }

    /**
     * To optimize for a sequential-reads usage pattern, set this member to <b>TRUE</b>. Otherwise, set it to <b>FALSE</b>. Setting the 
     *       <b>bOptimizeForSequentialReads</b> and 
     *       <b>bOptimizeForSequentialWrites</b> members both to <b>FALSE</b> optimizes for random I/O. Set the 
     *       <b>VDS_HINT_OPTIMIZEFORSEQUENTIALREADS</b> flag in 
     *       the <b>ullHintMask</b> member to indicate interest in this member.
     * @type {BOOL}
     */
    bOptimizeForSequentialReads{
        get {
            if(!this.HasProp("__bOptimizeForSequentialReads"))
                this.__bOptimizeForSequentialReads := BOOL(this.ptr + 60)
            return this.__bOptimizeForSequentialReads
        }
    }

    /**
     * To optimize for a sequential-writes usage pattern, set this member to <b>TRUE</b>. Otherwise, set it to <b>FALSE</b>. Setting the 
     *       <b>bOptimizeForSequentialReads</b> and 
     *       <b>bOptimizeForSequentialWrites</b> members both to <b>FALSE</b> optimizes for random I/O. Set the 
     *       <b>VDS_HINT_OPTIMIZEFORSEQUENTIALWRITES</b> flag in 
     *       the <b>ullHintMask</b> member to indicate interest in this member.
     * @type {BOOL}
     */
    bOptimizeForSequentialWrites{
        get {
            if(!this.HasProp("__bOptimizeForSequentialWrites"))
                this.__bOptimizeForSequentialWrites := BOOL(this.ptr + 64)
            return this.__bOptimizeForSequentialWrites
        }
    }

    /**
     * If this member is <b>TRUE</b>, the provider remaps LUN extents to drive extents automatically. If it is <b>FALSE</b>, the mapping of LUN extents 
     *       to drive extents remains fixed after LUN configuration unless extents are explicitly remapped to avoid 
     *       corrupted blocks. Set the <b>VDS_HINT_REMAPENABLED</b> flag in 
     *       the <b>ullHintMask</b> member to indicate interest in this member.
     * @type {BOOL}
     */
    bRemapEnabled{
        get {
            if(!this.HasProp("__bRemapEnabled"))
                this.__bRemapEnabled := BOOL(this.ptr + 68)
            return this.__bRemapEnabled
        }
    }

    /**
     * If this member is <b>TRUE</b>, the provider verifies the writes to the LUN by readback. If it is <b>FALSE</b>, the provider does not verify writes. 
     *       Set the <b>VDS_HINT_READBACKVERIFYENABLED</b> flag in the 
     *       <b>ullHintMask</b> member to indicate interest in this member.
     * @type {BOOL}
     */
    bReadBackVerifyEnabled{
        get {
            if(!this.HasProp("__bReadBackVerifyEnabled"))
                this.__bReadBackVerifyEnabled := BOOL(this.ptr + 72)
            return this.__bReadBackVerifyEnabled
        }
    }

    /**
     * If this member is <b>TRUE</b>, the provider enables write-through caching on the LUN; if it is <b>FALSE</b>, the provider does not enable
     *       write-through caching. Set the <b>VDS_HINT_WRITETHROUGHCACHINGENABLED</b> flag in 
     *       the <b>ullHintMask</b> member to indicate interest in this member.
     * @type {BOOL}
     */
    bWriteThroughCachingEnabled{
        get {
            if(!this.HasProp("__bWriteThroughCachingEnabled"))
                this.__bWriteThroughCachingEnabled := BOOL(this.ptr + 76)
            return this.__bWriteThroughCachingEnabled
        }
    }

    /**
     * If this member is <b>TRUE</b>, the provider enables a checksum on the LUN. Set the 
     *       <b>VDS_HINT_HARDWARECHECKSUMENABLED</b> flag in 
     *       the <b>ullHintMask</b> member to indicate interest in this member.
     * @type {BOOL}
     */
    bHardwareChecksumEnabled{
        get {
            if(!this.HasProp("__bHardwareChecksumEnabled"))
                this.__bHardwareChecksumEnabled := BOOL(this.ptr + 80)
            return this.__bHardwareChecksumEnabled
        }
    }

    /**
     * If this member is <b>TRUE</b>, the drives that contribute to the LUN can be physically removed without significant disruption to the 
     *       system (this is typically true when the LUN is composed of extents from only a few drives). If it is <b>FALSE</b>, the LUN
     *       cannot be removed without significant disruption to the system. Set the 
     *       <b>VDS_HINT_ISYANKABLE</b> flag in the <b>ullHintMask</b> member to indicate 
     *       interest in this member.
     * @type {BOOL}
     */
    bIsYankable{
        get {
            if(!this.HasProp("__bIsYankable"))
                this.__bIsYankable := BOOL(this.ptr + 84)
            return this.__bIsYankable
        }
    }

    /**
     * <b>TRUE</b> if the client wants to allocate a hot spare drive for this LUN, or <b>FALSE</b> otherwise. Set the 
     *       <b>VDS_HINT_ALLOCATEHOTSPARE</b> flag in the <b>ullHintMask</b> member to indicate 
     *       interest in this member.
     * @type {BOOL}
     */
    bAllocateHotSpare{
        get {
            if(!this.HasProp("__bAllocateHotSpare"))
                this.__bAllocateHotSpare := BOOL(this.ptr + 88)
            return this.__bAllocateHotSpare
        }
    }

    /**
     * <b>TRUE</b> if the client wants this LUN to use a mirrored cache, or <b>FALSE</b> otherwise. Set the 
     *       <b>VDS_HINT_USEMIRROREDCACHE</b> flag in the <b>ullHintMask</b> member to indicate 
     *       interest in this member.
     * @type {BOOL}
     */
    bUseMirroredCache{
        get {
            if(!this.HasProp("__bUseMirroredCache"))
                this.__bUseMirroredCache := BOOL(this.ptr + 92)
            return this.__bUseMirroredCache
        }
    }

    /**
     * <b>TRUE</b> if the client wants the LUN to use read caching, or <b>FALSE</b> otherwise. Set the 
     *       <b>VDS_HINT_READCACHINGENABLED</b> flag in the <b>ullHintMask</b> member to indicate 
     *       interest in this member.
     * @type {BOOL}
     */
    bReadCachingEnabled{
        get {
            if(!this.HasProp("__bReadCachingEnabled"))
                this.__bReadCachingEnabled := BOOL(this.ptr + 96)
            return this.__bReadCachingEnabled
        }
    }

    /**
     * <b>TRUE</b> if the client wants the LUN to use write caching, or <b>FALSE</b> otherwise. Set the 
     *       <b>VDS_HINT_WRITECACHINGENABLED</b> flag in the <b>ullHintMask</b> member to indicate 
     *       interest in this member.
     * @type {BOOL}
     */
    bWriteCachingEnabled{
        get {
            if(!this.HasProp("__bWriteCachingEnabled"))
                this.__bWriteCachingEnabled := BOOL(this.ptr + 100)
            return this.__bWriteCachingEnabled
        }
    }

    /**
     * <b>TRUE</b> if the client wants to enable media scanning for this LUN, or <b>FALSE</b> otherwise. Set the 
     *       <b>VDS_HINT_MEDIASCANENABLED</b> flag in the <b>ullHintMask</b> member to indicate 
     *       interest in this member.
     * @type {BOOL}
     */
    bMediaScanEnabled{
        get {
            if(!this.HasProp("__bMediaScanEnabled"))
                this.__bMediaScanEnabled := BOOL(this.ptr + 104)
            return this.__bMediaScanEnabled
        }
    }

    /**
     * <b>TRUE</b> if the client wants to enable consistency checking for this LUN, or <b>FALSE</b> otherwise. Set the 
     *       <b>VDS_HINT_CONSISTENCYCHECKENABLED</b> flag in the <b>ullHintMask</b> member to indicate 
     *       interest in this member.
     * @type {BOOL}
     */
    bConsistencyCheckEnabled{
        get {
            if(!this.HasProp("__bConsistencyCheckEnabled"))
                this.__bConsistencyCheckEnabled := BOOL(this.ptr + 108)
            return this.__bConsistencyCheckEnabled
        }
    }

    /**
     * A 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vdslun/ne-vdslun-vds_storage_bus_type">VDS_STORAGE_BUS_TYPE</a> enumeration value that specifies the bus type for the LUN. Set the 
     *       <b>VDS_HINT_BUSTYPE</b> flag in the <b>ullHintMask</b> member to indicate 
     *       interest in this member.
     * @type {Integer}
     */
    BusType {
        get => NumGet(this, 112, "int")
        set => NumPut("int", value, this, 112)
    }

    /**
     * This member is reserved for future use. Do not use.
     * @type {BOOL}
     */
    bReserved1{
        get {
            if(!this.HasProp("__bReserved1"))
                this.__bReserved1 := BOOL(this.ptr + 116)
            return this.__bReserved1
        }
    }

    /**
     * This member is reserved for future use. Do not use.
     * @type {BOOL}
     */
    bReserved2{
        get {
            if(!this.HasProp("__bReserved2"))
                this.__bReserved2 := BOOL(this.ptr + 120)
            return this.__bReserved2
        }
    }

    /**
     * This member is reserved for future use. Do not use.
     * @type {BOOL}
     */
    bReserved3{
        get {
            if(!this.HasProp("__bReserved3"))
                this.__bReserved3 := BOOL(this.ptr + 124)
            return this.__bReserved3
        }
    }

    /**
     * The rebuild priority for the LUN. The value can range from 0 (lowest priority) through 15 (highest priority).
     * @type {Integer}
     */
    sRebuildPriority {
        get => NumGet(this, 128, "short")
        set => NumPut("short", value, this, 128)
    }
}
