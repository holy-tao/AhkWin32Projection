#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates the type of objects to be enumerated.
 * @see https://learn.microsoft.com/windows/win32/api/oleidl/ne-oleidl-olecontf
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class OLECONTF extends Win32Enum{

    /**
     * Enumerates the embedded objects in the container.
     * @type {Integer (Int32)}
     */
    static OLECONTF_EMBEDDINGS => 1

    /**
     * Enumerates the linked objects in the container.
     * @type {Integer (Int32)}
     */
    static OLECONTF_LINKS => 2

    /**
     * Enumerates all objects in the container that are not OLE compound document objects (i.e., objects other than 
     *        linked or embedded objects). Use this flag to enumerate the container's pseudo-objects.
     * @type {Integer (Int32)}
     */
    static OLECONTF_OTHERS => 4

    /**
     * Enumerates only those objects the user is aware of. For example, hidden named-ranges in Microsoft Excel would 
     *        not be enumerated using this value.
     * @type {Integer (Int32)}
     */
    static OLECONTF_ONLYUSER => 8

    /**
     * Enumerates only those linked or embedded objects that are currently in the running state for this 
     *        container.
     * @type {Integer (Int32)}
     */
    static OLECONTF_ONLYIFRUNNING => 16
}
