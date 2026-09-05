#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The CLUSPROP_PIFLAGS enumeration (msclus.h) represents disk partition information.
 * @remarks
 * For <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/physical-disk">Physical Disk</a> resources, the smallest NTFS partition 
 *      larger than 50 MB automatically receives the <b>CLUSPROP_PIFLAG_DEFAULT_QUORUM</b> flag.
 * @see https://learn.microsoft.com/windows/win32/api/msclus/ne-msclus-clusprop_piflags
 * @namespace Windows.Win32.Networking.Clustering
 */
class CLUSPROP_PIFLAGS extends Win32Enum {

    /**
     * The drive letter is sticky.
     * Native name: CLUSPROP_PIFLAG_STICKY
     * @type {Integer (Int32)}
     */
    static PIFLAG_STICKY => 1

    /**
     * The storage class resource is removable.
     * Native name: CLUSPROP_PIFLAG_REMOVABLE
     * @type {Integer (Int32)}
     */
    static PIFLAG_REMOVABLE => 2

    /**
     * The storage class resource is formatted with a file system that is usable by the 
     *       <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/cluster-service">Cluster service</a>.
     * Native name: CLUSPROP_PIFLAG_USABLE
     * @type {Integer (Int32)}
     */
    static PIFLAG_USABLE => 4

    /**
     * The partition should be used to store quorum files if no partition is specified in the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/clusapi/nf-clusapi-setclusterquorumresource">SetClusterQuorumResource</a> function.
     * Native name: CLUSPROP_PIFLAG_DEFAULT_QUORUM
     * @type {Integer (Int32)}
     */
    static PIFLAG_DEFAULT_QUORUM => 8

    /**
     * The partition can be used in a cluster shared volume (CSV).
     * 
     * <b>Windows Server 2008 R2 and Windows Server 2008:  </b>This value is supported starting with Windows Server 2012.
     * Native name: CLUSPROP_PIFLAG_USABLE_FOR_CSV
     * @type {Integer (Int32)}
     */
    static PIFLAG_USABLE_FOR_CSV => 16

    /**
     * The partition uses BitLocker encryption.
     * 
     * <b>Windows Server 2012 R2, Windows Server 2012, Windows Server 2008 R2 and Windows Server 2008:  </b>This value is supported starting with Windows Server 2016.
     * Native name: CLUSPROP_PIFLAG_ENCRYPTION_ENABLED
     * @type {Integer (Int32)}
     */
    static PIFLAG_ENCRYPTION_ENABLED => 32

    /**
     * Native name: CLUSPROP_PIFLAG_RAW
     * @type {Integer (Int32)}
     */
    static PIFLAG_RAW => 64

    /**
     * The partition uses an unknown file system type.
     * 
     * <b>Windows Server 2012 R2, Windows Server 2012, Windows Server 2008 R2 and Windows Server 2008:  </b>This value is supported starting with Windows Server 2012 R2 with KB 3093899.
     * Native name: CLUSPROP_PIFLAG_UNKNOWN
     * @type {Integer (Int32)}
     */
    static PIFLAG_UNKNOWN => -2147483648
}
