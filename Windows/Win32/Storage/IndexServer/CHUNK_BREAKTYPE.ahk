#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Describes the type of break that separates the current chunk from the previous chunk.
 * @remarks
 * A change in attributes implies a word, sentence, paragraph, or chapter break.
 * @see https://learn.microsoft.com/windows/win32/api/filter/ne-filter-chunk_breaktype
 * @namespace Windows.Win32.Storage.IndexServer
 * @version v4.0.30319
 */
class CHUNK_BREAKTYPE extends Win32Enum{

    /**
     * No break is placed between the current chunk and the previous chunk. The chunks are glued together.
     * @type {Integer (Int32)}
     */
    static CHUNK_NO_BREAK => 0

    /**
     * A word break is placed between this chunk and the previous chunk that had the same attribute. Use of CHUNK_EOW should be minimized because the choice of word breaks is language-dependent, so determining word breaks is best left to the search engine.
     * @type {Integer (Int32)}
     */
    static CHUNK_EOW => 1

    /**
     * A sentence break is placed between this chunk and the previous chunk that had the same attribute.
     * @type {Integer (Int32)}
     */
    static CHUNK_EOS => 2

    /**
     * A paragraph break is placed between this chunk and the previous chunk that had the same attribute.
     * @type {Integer (Int32)}
     */
    static CHUNK_EOP => 3

    /**
     * A chapter break is placed between this chunk and the previous chunk that had the same attribute.
     * @type {Integer (Int32)}
     */
    static CHUNK_EOC => 4
}
