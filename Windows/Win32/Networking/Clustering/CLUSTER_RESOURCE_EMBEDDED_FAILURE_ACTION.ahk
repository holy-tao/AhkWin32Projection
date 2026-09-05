#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The CLUSTER_RESOURCE_EMBEDDED_FAILURE_ACTION enumeration (msclus.h) specifies the various actions that can be performed when a resource has an embedded failure.
 * @see https://learn.microsoft.com/windows/win32/api/msclus/ne-msclus-cluster_resource_embedded_failure_action
 * @namespace Windows.Win32.Networking.Clustering
 */
class CLUSTER_RESOURCE_EMBEDDED_FAILURE_ACTION extends Win32Enum {

    /**
     * Indicates that no action is to be taken.
     * Native name: ClusterResourceEmbeddedFailureActionNone
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Indicates that the failure is to be logged.
     * Native name: ClusterResourceEmbeddedFailureActionLogOnly
     * @type {Integer (Int32)}
     */
    static LogOnly => 1

    /**
     * Indicates that the resource is to be recovered.
     * Native name: ClusterResourceEmbeddedFailureActionRecover
     * @type {Integer (Int32)}
     */
    static Recover => 2
}
