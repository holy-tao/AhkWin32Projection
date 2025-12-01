#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * CLUSTER_QUORUM_VALUE (msclus.h) enumerates values returned by the ClusterControl function with two specific control codes.
 * @see https://learn.microsoft.com/windows/win32/api/msclus/ne-msclus-cluster_quorum_value
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUSTER_QUORUM_VALUE extends Win32Enum{

    /**
     * The quorum will be maintained.
     * @type {Integer (Int32)}
     */
    static CLUSTER_QUORUM_MAINTAINED => 0

    /**
     * The quorum will be lost.
     * @type {Integer (Int32)}
     */
    static CLUSTER_QUORUM_LOST => 1
}
