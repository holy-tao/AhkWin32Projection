#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUSTERSET_OBJECT_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static CLUSTERSET_OBJECT_TYPE_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static CLUSTERSET_OBJECT_TYPE_MEMBER => 1

    /**
     * @type {Integer (Int32)}
     */
    static CLUSTERSET_OBJECT_TYPE_WORKLOAD => 2

    /**
     * @type {Integer (Int32)}
     */
    static CLUSTERSET_OBJECT_TYPE_DATABASE => 3
}
