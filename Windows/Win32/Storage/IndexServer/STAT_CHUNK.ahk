#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\System\Com\StructuredStorage\PROPSPEC.ahk
#Include .\FULLPROPSPEC.ahk

/**
 * Describes the characteristics of a chunk.
 * @remarks
 * 
  * The final three members (<b>idChunkSource</b>, <b>cwcStartSource</b>, and <b>cwcLenSource</b>) are used to describe the source of a derived chunk; that is, one that can be mapped back to a section of text. For example, the heading of a chapter can be both a text-type property and an internal value-type property ? a heading. The value-type property "heading" would be a derived chunk. If the text of the current value-type chunk (from an internal value-type property) is derived from some text-type chunk, then it must be emitted more than once.
  * 
  * The following segment is an example of how this might happen in a book.
  * 
  * The small detective exclaimed, "C'est fini!"
  * 
  * <b>Confessions</b>
  * 
  * The room was silent for several minutes. After thinking very hard about it, the young woman asked, "But how did you know?"
  * 
  * This segment might be broken into chunks in the following way.
  * 
  * <table>
  * <tr>
  * <th>ID</th>
  * <th>Text</th>
  * <th>BreakType</th>
  * <th>Flags</th>
  * <th>Locale</th>
  * <th>Attribute</th>
  * </tr>
  * <tr>
  * <td>1</td>
  * <td>The small dete</td>
  * <td>N/A</td>
  * <td>CHUNK_TEXT</td>
  * <td>ENGLISH_UK</td>
  * <td>CONTENT</td>
  * </tr>
  * <tr>
  * <td>2</td>
  * <td>ctive exclaimed,</td>
  * <td>CHUNK_NO_BREAK</td>
  * <td>N/A</td>
  * <td>N/A</td>
  * <td>N/A</td>
  * </tr>
  * <tr>
  * <td>3</td>
  * <td>"C'est fini!"</td>
  * <td>CHUNK_EOW</td>
  * <td>CHUNK_TEXT</td>
  * <td>FRENCH_BELGIAN</td>
  * <td>CONTENT</td>
  * </tr>
  * <tr>
  * <td>4</td>
  * <td>Confessions</td>
  * <td>CHUNK_EOC</td>
  * <td>CHUNK_TEXT</td>
  * <td>ENGLISH_UK</td>
  * <td>CHAPTER_NAMES</td>
  * </tr>
  * <tr>
  * <td>5</td>
  * <td>Confessions</td>
  * <td>CHUNK_EOP</td>
  * <td>CHUNK_TEXT</td>
  * <td>ENGLISH_UK</td>
  * <td>CONTENT</td>
  * </tr>
  * <tr>
  * <td>6</td>
  * <td>The room was silent for several minutes.</td>
  * <td>CHUNK_EOP</td>
  * <td>CHUNK_TEXT</td>
  * <td>ENGLISH_UK</td>
  * <td>CONTENT</td>
  * </tr>
  * <tr>
  * <td>7</td>
  * <td>After thinking very hard about it, the young woman asked, "But how did you know?"</td>
  * <td>CHUNK_EOS</td>
  * <td>CHUNK_TEXT</td>
  * <td>ENGLISH_UK</td>
  * <td>CONTENT</td>
  * </tr>
  * </table>
  *  
  * 
  * Information provided by <b>idChunkSource</b>, <b>cwcStartSource</b>, and <b>cwcLenSource</b> is useful for a search engine that highlights hits. If the query is done for an internal value-type property, the search engine will highlight the original text from which the text of the internal value-type property has been derived. For instance, in a C++ code filter, the browser, when searching for MyFunction in internal value-type property "function definitions," will highlight the function header in the file.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//filter/ns-filter-stat_chunk
 * @namespace Windows.Win32.Storage.IndexServer
 * @version v4.0.30319
 */
class STAT_CHUNK extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * The chunk identifier. Chunk identifiers must be unique for the current instance of the <a href="https://docs.microsoft.com/windows/desktop/api/filter/nn-filter-ifilter">IFilter</a> interface. Chunk identifiers must be in ascending order. The order in which chunks are numbered should correspond to the order in which they appear in the source document. Some search engines can take advantage of the proximity of chunks of various properties. If so, the order in which chunks with different properties are emitted will be important to the search engine.
     * @type {Integer}
     */
    idChunk {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The type of break that separates the previous chunk from the current chunk. Values are from the <a href="https://docs.microsoft.com/windows/desktop/api/filter/ne-filter-chunk_breaktype">CHUNK_BREAKTYPE</a> enumeration.
     * @type {Integer}
     */
    breakType {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Indicates whether this chunk contains a text-type or a value-type property. Flag values are taken from the <a href="https://docs.microsoft.com/windows/desktop/api/filter/ne-filter-chunkstate">CHUNKSTATE</a> enumeration. If the CHUNK_TEXT flag is set, <a href="https://docs.microsoft.com/windows/desktop/api/filter/nf-filter-ifilter-gettext">IFilter::GetText</a> should be used to retrieve the contents of the chunk as a series of words. If the CHUNK_VALUE flag is set, <a href="https://docs.microsoft.com/windows/desktop/api/filter/nf-filter-ifilter-getvalue">IFilter::GetValue</a> should be used to retrieve the value and treat it as a single property value. If the filter dictates that the same content be treated as both text and as a value, the chunk should be emitted twice in two different chunks, each with one flag set.
     * @type {Integer}
     */
    flags {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * The language and sublanguage associated with a chunk of text. Chunk locale is used by document indexers to perform proper word breaking of text. If the chunk is neither text-type nor a value-type with data type VT_LPWSTR, VT_LPSTR or VT_BSTR, this field is ignored.
     * @type {Integer}
     */
    locale {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * The property to be applied to the chunk. See <a href="https://docs.microsoft.com/windows/desktop/api/filter/ns-filter-fullpropspec">FULLPROPSPEC</a>. If a filter requires that the same text have more than one property, it needs to emit the text once for each property in separate chunks.
     * @type {FULLPROPSPEC}
     */
    attribute{
        get {
            if(!this.HasProp("__attribute"))
                this.__attribute := FULLPROPSPEC(this.ptr + 16)
            return this.__attribute
        }
    }

    /**
     * The ID of the source of a chunk. The value of the <b>idChunkSource</b> member depends on the nature of the chunk: 
     * 
     * <ul>
     * <li>If the chunk is a text-type property, the value of the <b>idChunkSource</b> member must be the same as the value of the <b>idChunk</b> member.</li>
     * <li>If the chunk is an internal value-type property derived from textual content, the value of the <b>idChunkSource</b> member is the chunk ID for the text-type chunk from which it is derived.</li>
     * <li>If the filter attributes specify to return only internal value-type properties, there is no content chunk from which to derive the current internal value-type property. In this case, the value of the <b>idChunkSource</b> member must be set to zero, which is an invalid chunk.</li>
     * </ul>
     * @type {Integer}
     */
    idChunkSource {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * The offset from which the source text for a derived chunk starts in the source chunk.
     * @type {Integer}
     */
    cwcStartSource {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * The length in characters of the source text from which the current chunk was derived. A zero value signifies character-by-character correspondence between the source text and the derived text. A nonzero value means that no such direct correspondence exists.
     * @type {Integer}
     */
    cwcLenSource {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }
}
