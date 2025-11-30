#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The type of quorum resource to be created.
 * @see https://docs.microsoft.com/windows/win32/api//msclus/ne-msclus-cluster_quorum_type
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUSTER_QUORUM_TYPE extends Win32Enum{

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static OperationalQuorum => 0

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static ModifyQuorum => 1
}
