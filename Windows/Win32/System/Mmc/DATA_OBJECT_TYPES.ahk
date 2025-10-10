#Requires AutoHotkey v2.0.0 64-bit

/**
 * The DATA_OBJECT_TYPES enumeration is used by the type parameter of IComponentData::QueryDataObject and IComponent::QueryDataObject to obtain context information about a specified cookie.
 * @see https://docs.microsoft.com/windows/win32/api//mmc/ne-mmc-data_object_types
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class DATA_OBJECT_TYPES{

    /**
     * Data object for scope pane context.
     * @type {Integer (Int32)}
     */
    static CCT_SCOPE => 32768

    /**
     * Data object for result pane context.
     * @type {Integer (Int32)}
     */
    static CCT_RESULT => 32769

    /**
     * Data object for Snap-in Manager context.
     * @type {Integer (Int32)}
     */
    static CCT_SNAPIN_MANAGER => 32770

    /**
     * Data object has an invalid type.
     * @type {Integer (Int32)}
     */
    static CCT_UNINITIALIZED => 65535
}
