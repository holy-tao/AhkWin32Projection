#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies whether the current chunk is a text-type property or a value-type property.
 * @see https://learn.microsoft.com/windows/win32/api/filter/ne-filter-chunkstate
 * @namespace Windows.Win32.Storage.IndexServer
 * @version v4.0.30319
 */
class CHUNKSTATE{

    /**
     * The current chunk is a text-type property.
     * @type {Integer (Int32)}
     */
    static CHUNK_TEXT => 1

    /**
     * The current chunk is a value-type property.
     * @type {Integer (Int32)}
     */
    static CHUNK_VALUE => 2

    /**
     * Reserved.
     * @type {Integer (Int32)}
     */
    static CHUNK_FILTER_OWNED_VALUE => 4

    /**
     * @type {Integer (Int32)}
     */
    static CHUNK_IMAGE => 8
}
