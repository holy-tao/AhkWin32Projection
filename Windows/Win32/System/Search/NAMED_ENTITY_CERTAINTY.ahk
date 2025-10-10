#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the level of certainty for a named entity.
 * @see https://docs.microsoft.com/windows/win32/api//structuredquery/ne-structuredquery-named_entity_certainty
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class NAMED_ENTITY_CERTAINTY{

    /**
     * It could be this named entity but additional evidence is advisable.
     * @type {Integer (Int32)}
     */
    static NEC_LOW => 0

    /**
     * It quite likely is this named entity; it is okay to use it.
     * @type {Integer (Int32)}
     */
    static NEC_MEDIUM => 1

    /**
     * It almost certainly is this named entity; it should be okay to discard other possibilities.
     * @type {Integer (Int32)}
     */
    static NEC_HIGH => 2
}
