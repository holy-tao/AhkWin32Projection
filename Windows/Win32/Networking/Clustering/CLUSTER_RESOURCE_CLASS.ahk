#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the class of a resource.
 * @see https://docs.microsoft.com/windows/win32/api//msclus/ne-msclus-cluster_resource_class
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUSTER_RESOURCE_CLASS{

    /**
     * Resource class is unknown.
     * @type {Integer (Int32)}
     */
    static CLUS_RESCLASS_UNKNOWN => 0

    /**
     * Resource is a storage device, such as a 
     *            <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/p-gly">Physical Disk resource</a>.
     * @type {Integer (Int32)}
     */
    static CLUS_RESCLASS_STORAGE => 1

    /**
     * Resource is a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/n-gly">network</a> device.
     * @type {Integer (Int32)}
     */
    static CLUS_RESCLASS_NETWORK => 2

    /**
     * Resource classes beginning at this value are user-defined.
     * @type {Integer (Int32)}
     */
    static CLUS_RESCLASS_USER => 32768
}
