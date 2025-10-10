#Requires AutoHotkey v2.0.0 64-bit

/**
 * Indicates whether or how a property can be indexed.
 * @remarks
 * 
  * Windows Search builds indexes for the values found in the property store to efficiently support filtering, sorting, and grouping over indexed properties. There are two kinds of indexes: an individual value index that indexes an item by single values, and a vector index that indexes all the vector values of a row as a single index entry.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//propsys/ne-propsys-propdesc_columnindex_type
 * @namespace Windows.Win32.UI.Shell.PropertiesSystem
 * @version v4.0.30319
 */
class PROPDESC_COLUMNINDEX_TYPE{

    /**
     * Never generate any index on this property.
     * @type {Integer (Int32)}
     */
    static PDCIT_NONE => 0

    /**
     * Always build the individual value index, but build the vector index only on demand.
     * @type {Integer (Int32)}
     */
    static PDCIT_ONDISK => 1

    /**
     * Obsolete.
     * @type {Integer (Int32)}
     */
    static PDCIT_INMEMORY => 2

    /**
     * <b>Windows 7 and later</b>. Build the individual value index or vector index the first time the index is used in a query to filter, group, or sort. After being generated the first time, the index is maintained for future queries. Most property indexes should be built on demand, because building and maintaining indexes is expensive and they should be built only if they will be used.
     * @type {Integer (Int32)}
     */
    static PDCIT_ONDEMAND => 3

    /**
     * <b>Windows 7 and later</b>. Always build both the individual value index and the vector index.
     * @type {Integer (Int32)}
     */
    static PDCIT_ONDISKALL => 4

    /**
     * <b>Windows 7 and later</b>. Always build the vector index, but build the value index only on demand.
     * @type {Integer (Int32)}
     */
    static PDCIT_ONDISKVECTOR => 5
}
