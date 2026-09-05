#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
class CLUSTERSET_OBJECT_TYPE extends Win32Enum {

    /**
     * Native name: CLUSTERSET_OBJECT_TYPE_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * Native name: CLUSTERSET_OBJECT_TYPE_MEMBER
     * @type {Integer (Int32)}
     */
    static MEMBER => 1

    /**
     * Native name: CLUSTERSET_OBJECT_TYPE_WORKLOAD
     * @type {Integer (Int32)}
     */
    static WORKLOAD => 2

    /**
     * Native name: CLUSTERSET_OBJECT_TYPE_DATABASE
     * @type {Integer (Int32)}
     */
    static DATABASE => 3
}
