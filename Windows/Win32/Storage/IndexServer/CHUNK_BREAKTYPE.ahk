#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Describes the type of break that separates the current chunk from the previous chunk.
 * @remarks
 * A change in attributes implies a word, sentence, paragraph, or chapter break.
 * @see https://learn.microsoft.com/windows/win32/api/filter/ne-filter-chunk_breaktype
 * @namespace Windows.Win32.Storage.IndexServer
 */
class CHUNK_BREAKTYPE extends Win32Enum {

    /**
     * No break is placed between the current chunk and the previous chunk. The chunks are glued together.
     * Native name: CHUNK_NO_BREAK
     * @type {Integer (Int32)}
     */
    static NO_BREAK => 0

    /**
     * A word break is placed between this chunk and the previous chunk that had the same attribute. Use of CHUNK_EOW should be minimized because the choice of word breaks is language-dependent, so determining word breaks is best left to the search engine.
     * Native name: CHUNK_EOW
     * @type {Integer (Int32)}
     */
    static EOW => 1

    /**
     * A sentence break is placed between this chunk and the previous chunk that had the same attribute.
     * Native name: CHUNK_EOS
     * @type {Integer (Int32)}
     */
    static EOS => 2

    /**
     * A paragraph break is placed between this chunk and the previous chunk that had the same attribute.
     * Native name: CHUNK_EOP
     * @type {Integer (Int32)}
     */
    static EOP => 3

    /**
     * A chapter break is placed between this chunk and the previous chunk that had the same attribute.
     * Native name: CHUNK_EOC
     * @type {Integer (Int32)}
     */
    static EOC => 4
}
