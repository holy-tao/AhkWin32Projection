#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The CLUSTER_CONTROL_OBJECT (msclus.h) is the 8-bit object component of a control code that indicates the cluster object type to which the control code applies.
 * @see https://learn.microsoft.com/windows/win32/api/msclus/ne-msclus-cluster_control_object
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUSTER_CONTROL_OBJECT extends Win32Enum{

    /**
     * Zero is not a valid object code value.
     * @type {Integer (Int32)}
     */
    static CLUS_OBJECT_INVALID => 0

    /**
     * Object code part of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/resource-control-codes">resource control codes</a> 
     *        that identifies cluster <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/resources">resources</a> as the target.
     * @type {Integer (Int32)}
     */
    static CLUS_OBJECT_RESOURCE => 1

    /**
     * Object code part of 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/resource-type-control-codes">resource type control codes</a> that identifies 
     *        cluster <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/resource-types">resource types</a> as the target.
     * @type {Integer (Int32)}
     */
    static CLUS_OBJECT_RESOURCE_TYPE => 2

    /**
     * Object code part of 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/group-control-codes">group control codes</a> that identifies cluster 
     *         <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/groups">groups</a> as the target.
     * @type {Integer (Int32)}
     */
    static CLUS_OBJECT_GROUP => 3

    /**
     * Object code part of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/node-control-codes">node control codes</a> that 
     *        identifies cluster <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/nodes">nodes</a> as the target.
     * @type {Integer (Int32)}
     */
    static CLUS_OBJECT_NODE => 4

    /**
     * Object code part of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/network-control-codes">network control codes</a> that 
     *        identifies cluster <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/networks">networks</a> as the target.
     * @type {Integer (Int32)}
     */
    static CLUS_OBJECT_NETWORK => 5

    /**
     * Object code part of 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/network-interface-control-codes">network interface control codes</a> that 
     *        identifies cluster <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/network-interfaces">network interfaces</a> as the 
     *        target.
     * @type {Integer (Int32)}
     */
    static CLUS_OBJECT_NETINTERFACE => 6

    /**
     * Object code part of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/cluster-control-codes">cluster control codes</a> that 
     *        identifies a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/c-gly">cluster</a> as the target.
     * @type {Integer (Int32)}
     */
    static CLUS_OBJECT_CLUSTER => 7

    /**
     * Object code part of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/cluster-control-codes">cluster control codes</a> that 
     *        identifies a groupset as the target.
     * 
     * <b>Windows Server 2012 R2 and Windows Server 2012:  </b>This constant is not supported prior to Windows Server 2016.
     * @type {Integer (Int32)}
     */
    static CLUS_OBJECT_GROUPSET => 8

    /**
     * @type {Integer (Int32)}
     */
    static CLUS_OBJECT_AFFINITYRULE => 9

    /**
     * Object code part of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/control-codes">control codes</a> that identifies 
     *        cluster object types not defined by Windows Clustering.
     * @type {Integer (Int32)}
     */
    static CLUS_OBJECT_USER => 128
}
