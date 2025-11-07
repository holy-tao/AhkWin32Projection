#Requires AutoHotkey v2.0.0 64-bit

/**
 * Represents disk partition information. The enumeration flags identify certain properties of a disk partition, which is a storage class resource.
 * @remarks
 * 
 * For <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/physical-disk">Physical Disk</a> resources, the smallest NTFS partition 
 *      larger than 50 MB automatically receives the <b>CLUSPROP_PIFLAG_DEFAULT_QUORUM</b> flag.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//msclus/ne-msclus-clusprop_piflags
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUSPROP_PIFLAGS{

    /**
     * The drive letter is sticky.
     * @type {Integer (Int32)}
     */
    static CLUSPROP_PIFLAG_STICKY => 1

    /**
     * The storage class resource is removable.
     * @type {Integer (Int32)}
     */
    static CLUSPROP_PIFLAG_REMOVABLE => 2

    /**
     * The storage class resource is formatted with a file system that is usable by the 
     *       <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/cluster-service">Cluster service</a>.
     * @type {Integer (Int32)}
     */
    static CLUSPROP_PIFLAG_USABLE => 4

    /**
     * The partition should be used to store quorum files if no partition is specified in the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/nf-clusapi-setclusterquorumresource">SetClusterQuorumResource</a> function.
     * @type {Integer (Int32)}
     */
    static CLUSPROP_PIFLAG_DEFAULT_QUORUM => 8

    /**
     * The partition can be used in a cluster shared volume (CSV).
     * 
     * <b>Windows Server 2008 R2 and Windows Server 2008:  </b>This value is supported starting with Windows Server 2012.
     * @type {Integer (Int32)}
     */
    static CLUSPROP_PIFLAG_USABLE_FOR_CSV => 16

    /**
     * The partition uses BitLocker encryption.
     * 
     * <b>Windows Server 2012 R2, Windows Server 2012, Windows Server 2008 R2 and Windows Server 2008:  </b>This value is supported starting with Windows Server 2016.
     * @type {Integer (Int32)}
     */
    static CLUSPROP_PIFLAG_ENCRYPTION_ENABLED => 32

    /**
     * @type {Integer (Int32)}
     */
    static CLUSPROP_PIFLAG_RAW => 64

    /**
     * The partition uses an unknown file system type.
     * 
     * <b>Windows Server 2012 R2, Windows Server 2012, Windows Server 2008 R2 and Windows Server 2008:  </b>This value is supported starting with Windows Server 2012 R2 with KB 3093899.
     * @type {Integer (Int32)}
     */
    static CLUSPROP_PIFLAG_UNKNOWN => -2147483648
}
