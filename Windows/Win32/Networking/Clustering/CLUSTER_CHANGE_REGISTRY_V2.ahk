#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The CLUSTER_CHANGE_REGISTRY_V2 enumeration (msclus.h) defines the notifications that are generated for a registry key.
 * @remarks
 * Protocol version 2.0 servers do not support this enumeration.
 * @see https://learn.microsoft.com/windows/win32/api/msclus/ne-msclus-cluster_change_registry_v2
 * @namespace Windows.Win32.Networking.Clustering
 */
class CLUSTER_CHANGE_REGISTRY_V2 extends Win32Enum {

    /**
     * Indicates that the registry attributes changed.
     * Native name: CLUSTER_CHANGE_REGISTRY_ATTRIBUTES_V2
     * @type {Integer (Int32)}
     */
    static ATTRIBUTES_V2 => 1

    /**
     * Indicates that the registry key name has changed.
     * Native name: CLUSTER_CHANGE_REGISTRY_NAME_V2
     * @type {Integer (Int32)}
     */
    static NAME_V2 => 2

    /**
     * Indicates that the registry subtree has changed.
     * Native name: CLUSTER_CHANGE_REGISTRY_SUBTREE_V2
     * @type {Integer (Int32)}
     */
    static SUBTREE_V2 => 4

    /**
     * Indicates that the registry value has changed.
     * Native name: CLUSTER_CHANGE_REGISTRY_VALUE_V2
     * @type {Integer (Int32)}
     */
    static VALUE_V2 => 8

    /**
     * Indicates that the registry's context handle was closed.
     * Native name: CLUSTER_CHANGE_REGISTRY_HANDLE_CLOSE_V2
     * @type {Integer (Int32)}
     */
    static HANDLE_CLOSE_V2 => 16

    /**
     * Indicates all V2 registry notifications.
     * Native name: CLUSTER_CHANGE_REGISTRY_ALL_V2
     * @type {Integer (Int32)}
     */
    static ALL_V2 => 31
}
