#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Scans documents for text and properties (also called attributes).
 * @remarks
 * <b>IFilter</b> components for Indexing Service run in the Local Security context and should be written to manage buffers and to stack correctly. All string copies must have explicit checks to guard against buffer overruns. You should always verify the allocated size of the buffer and test the size of the data against the size of the buffer.
 * @see https://learn.microsoft.com/windows/win32/api//content/filter/nn-filter-ifilter
 * @namespace Windows.Win32.Storage.IndexServer
 * @version v4.0.30319
 */
class IFilter extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFilter
     * @type {Guid}
     */
    static IID => Guid("{89bcb740-6119-101a-bcb7-00dd010655af}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Init", "GetChunk", "GetText", "GetValue", "BindRegion"]

    /**
     * Initializes a filtering session.
     * @remarks
     * The <b>Init</b> method sets the state of the filter object. The content filter positions at the beginning of the object and the object state is frozen until the object is released. You can pass the filter object the set of properties you would like returned by setting up their property set and property identifier (ID) descriptions in the <i>aAttributes</i> array. For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/indexsrv/filtering-file-properties">Filtering File Properties</a>.
     * 
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * Call the <b>Init</b> method before calling all other <a href="https://docs.microsoft.com/windows/desktop/api/filter/nn-filter-ifilter">IFilter</a> methods.
     * 
     * 
     * 
     * <h3><a id="Notes_to_Implementers_"></a><a id="notes_to_implementers_"></a><a id="NOTES_TO_IMPLEMENTERS_"></a>Notes to Implementers
     * </h3>
     * Chunk IDs must remain consistent across multiple calls to the <b>Init</b> method with the same parameters. 
     * 
     * For some implementations of the <a href="https://docs.microsoft.com/windows/desktop/api/filter/nn-filter-ifilter">IFilter</a> interface, detection of failure to access a document may not be possible (or may be computationally expensive) until the <b>Init</b> method has been called, or possibly even later.
     * @param {Integer} grfFlags Values from the <a href="https://docs.microsoft.com/windows/desktop/api/filter/ne-filter-ifilter_init">IFILTER_INIT</a> enumeration for controlling text standardization, property output, embedding scope, and <a href="https://docs.microsoft.com/windows/desktop/api/filter/nn-filter-ifilter">IFilter</a> access patterns.
     * @param {Integer} cAttributes The size of the attributes array. When nonzero, <i>cAttributes</i> takes precedence over attributes specified in <i>grfFlags</i>. If no attribute flags are specified and <i>cAttributes</i> is zero, the default is given by the PSGUID_STORAGE storage property set, which contains the date and time of the last write to the file, size, and so on; and by the PID_STG_CONTENTS 'contents' property, which maps to the main contents of the file. For more information about properties and property sets, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/indexsrv/property-sets">Property Sets</a>.
     * @param {Pointer<FULLPROPSPEC>} aAttributes Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/filter/ns-filter-fullpropspec">FULLPROPSPEC</a> structures for the requested properties. When <i>cAttributes</i> is nonzero, only the properties in <i>aAttributes</i> are returned.
     * @param {Pointer<Integer>} pFlags Information about additional properties available to the caller; from the <a href="https://docs.microsoft.com/windows/desktop/api/filter/ne-filter-ifilter_flags">IFILTER_FLAGS</a> enumeration.
     * @returns {Integer} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL 
     * </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * File to filter was not previously loaded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Count and contents of attributes do not agree.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FILTER_E_PASSWORD </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Access has been denied because of password protection or similar security measures.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FILTER_E_ACCESS </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * General access failures
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/filter/nf-filter-ifilter-init
     */
    Init(grfFlags, cAttributes, aAttributes, pFlags) {
        pFlagsMarshal := pFlags is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", grfFlags, "uint", cAttributes, "ptr", aAttributes, pFlagsMarshal, pFlags, "int")
        return result
    }

    /**
     * Positions the filter at the beginning of the next chunk, or at the first chunk if this is the first call to the GetChunk method, and returns a description of the current chunk.
     * @remarks
     * If upon return <i>pStat</i> points to a <a href="https://docs.microsoft.com/windows/desktop/api/filter/ns-filter-stat_chunk">STAT_CHUNK</a> structure with the <b>breakType</b> member equal to CHUNK_NO_BREAK, only the <b>idChunk</b> member will be updated with the new chunk identifier (ID) value. The other members of the <b>STAT_CHUNK</b> structure remain unchanged. 
     * 
     * 
     * 
     * Internal value-type properties (chunks with a <a href="https://docs.microsoft.com/windows/desktop/api/filter/ne-filter-chunkstate">CHUNKSTATE</a> enumeration value of CHUNK_VALUE) cannot be concatenated using CHUNK_NO_BREAK. A single word cannot span more than two glued chunks. 
     * 
     * 
     * 
     * Chunk ID zero is invalid.
     * 
     * 
     * 
     * Before the <b>GetChunk</b> method is called for the first time, there is no current chunk. After an error return code of anything other than FILTER_E_END_OF_CHUNKS the next call to the <b>GetChunk</b> method nevertheless retrieves the next chunk after the unavailable one.
     * 
     * 
     * 
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * When the <b>GetChunk</b> method finishes, the chunk described in *<i>pStat</i> is the current chunk. The chunk descriptor is owned by the routine calling the <b>GetChunk</b> method, but the property name pointer, which can be set in the property specification, is owned by the <b>GetChunk</b> method and should not be freed. 
     * 
     * 
     * 
     * <h3><a id="Notes_to_Implementers_"></a><a id="notes_to_implementers_"></a><a id="NOTES_TO_IMPLEMENTERS_"></a>Notes to Implementers
     * </h3>
     * If a call to the <b>GetChunk</b> method of the content filter of a linked or embedded object returns FILTER_E_END_OF_CHUNKS, the implementation should return the next chunk of the linking or embedding object. For example, if a document has two embedded objects and the first has returned FILTER_E_END_OF_CHUNKS, then the outer content filter must call the <b>GetChunk</b> method of the content filter for the embedded object.
     * 
     * 
     * 
     * Before returning the results of a call to the <b>GetChunk</b> method on an embedded or linked object, check to make sure that the chunk ID is unique. If not, the implementer must renumber the chunk and keep a mapping of the new chunk ID.
     * @param {Pointer<STAT_CHUNK>} pStat A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/filter/ns-filter-stat_chunk">STAT_CHUNK</a> structure containing a description of the current chunk.
     * @returns {Integer} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FILTER_E_END_OF_CHUNKS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The previous chunk is the last chunk.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FILTER_E_EMBEDDING_UNAVAILABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The next chunk is an embedding and no content filter is available.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FILTER_E_LINK_UNAVAILABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The next chunk is a link and no content filter is available.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FILTER_E_PASSWORD</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Password or other security-related access failure. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FILTER_E_ACCESS </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * General access failure.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/filter/nf-filter-ifilter-getchunk
     */
    GetChunk(pStat) {
        result := ComCall(4, this, "ptr", pStat, "int")
        return result
    }

    /**
     * Retrieves text (text-type properties) from the current chunk, which must have a CHUNKSTATE enumeration value of CHUNK_TEXT.
     * @remarks
     * If the current chunk is too large for the <i>awcBuffer</i> array, more than one call to the <b>GetText</b> method can be required to retrieve all the text in the current chunk. Each call to the <b>GetText</b> method retrieves text that immediately follows the text from the last call to the <b>GetText</b> method. The last character from one call can be in the middle of a word, and the first character in the next call would continue that word. Search engines must handle this situation.
     * @param {Pointer<Integer>} pcwcBuffer On entry, the size of <i>awcBuffer</i> array in wide/Unicode characters. On exit, the number of Unicode characters written to <i>awcBuffer</i>.
     * @param {PWSTR} awcBuffer Text retrieved from the current chunk. Do not terminate the buffer with a character. Use a null-terminated string. The null-terminated string should not exceed the size of the destination buffer.
     * @returns {Integer} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FILTER_E_NO_TEXT 
     * </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>flags</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/filter/ns-filter-stat_chunk">STAT_CHUNK</a> structure for the current chunk does not have a value of CHUNK_TEXT. 
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FILTER_E_NO_MORE_TEXT </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * All the text in the current chunk has been returned. Additional calls to the <a href="https://docs.microsoft.com/windows/desktop/api/filter/nf-filter-ifilter-gettext">GetText</a> method should return this error until the <a href="https://docs.microsoft.com/windows/desktop/api/filter/nf-filter-ifilter-getchunk">IFilter::GetChunk</a> method has been called successfully. 
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FILTER_S_LAST_TEXT </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * As an optimization, the last call that returns text can return FILTER_S_LAST_TEXT, indicating that the next call to the <a href="https://docs.microsoft.com/windows/desktop/api/filter/nf-filter-ifilter-gettext">GetText</a> method will return FILTER_E_NO_MORE_TEXT. This optimization can save time by eliminating unnecessary calls to <b>GetText</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/filter/nf-filter-ifilter-gettext
     */
    GetText(pcwcBuffer, awcBuffer) {
        awcBuffer := awcBuffer is String ? StrPtr(awcBuffer) : awcBuffer

        pcwcBufferMarshal := pcwcBuffer is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, pcwcBufferMarshal, pcwcBuffer, "ptr", awcBuffer, "int")
        return result
    }

    /**
     * Retrieves a value (internal value-type property) from a chunk, which must have a CHUNKSTATE enumeration value of CHUNK_VALUE.
     * @remarks
     * Call the <b>GetValue</b> method only once per chunk. 
     * 
     * 
     * 
     * Note that the effect of producing the same value from more than one chunk is undefined. Only the last setting of the value is valid.
     * 
     * 
     * 
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * Allocate the <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure with <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemalloc">CoTaskMemAlloc</a>. Some <b>PROPVARIANT</b> structures contain pointers, which can be freed by calling the <a href="https://docs.microsoft.com/windows/desktop/api/propidl/nf-propidl-propvariantclear">PropVariantClear</a> function. It is up to the caller of the <b>GetValue</b> method to call <b>PropVariantClear</b>.
     * @param {Pointer<Pointer<PROPVARIANT>>} ppPropValue A pointer to an output variable that receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a> structure that contains the value-type property.
     * @returns {Integer} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FILTER_E_NO_MORE_VALUES </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <a href="https://docs.microsoft.com/windows/desktop/api/filter/nf-filter-ifilter-getvalue">GetValue</a> method has already been called on this chunk; this value should be returned until the <a href="https://docs.microsoft.com/windows/desktop/api/filter/nf-filter-ifilter-getchunk">IFilter::GetChunk</a> method has been called successfully and has advanced to the next chunk.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FILTER_E_NO_VALUES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The current chunk does not have a <a href="https://docs.microsoft.com/windows/desktop/api/filter/ne-filter-chunkstate">CHUNKSTATE</a> enumeration value of CHUNK_VALUE. 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/filter/nf-filter-ifilter-getvalue
     */
    GetValue(ppPropValue) {
        ppPropValueMarshal := ppPropValue is VarRef ? "ptr*" : "ptr"

        result := ComCall(6, this, ppPropValueMarshal, ppPropValue, "int")
        return result
    }

    /**
     * Retrieves an interface representing the specified portion of object. Currently reserved for future use.
     * @remarks
     * If it is impossible for the <b>BindRegion</b> method to bind an interface to the specified region, return FILTER_W_REGION_CLIPPED. This situation can occur when the next such chunk is in a linked object or an embedded object. 
     * 
     * 
     * 
     * Not all filters are capable of supporting the <b>BindRegion</b> method in a rational way. Filters that are implemented by viewing applications will benefit the most from this method. The method is intended to be a way to pass cookies through the search engine and back to the <a href="https://docs.microsoft.com/windows/desktop/api/filter/nn-filter-ifilter">IFilter</a> interface implementation. 
     * 
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * This method is currently reserved for future use. Always return E_NOTIMPL.
     * @param {FILTERREGION} origPos A <a href="https://docs.microsoft.com/windows/desktop/api/filter/ns-filter-filterregion">FILTERREGION</a> structure that contains the position of the text.
     * @param {Pointer<Guid>} riid A reference to the requested interface identifier.
     * @param {Pointer<Pointer<Void>>} ppunk A pointer to a variable that receives the interface pointer requested in <i>riid</i>. Upon successful return, *<i>ppunk</i> contains the requested interface pointer.
     * @returns {Integer} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This method is not currently implemented.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FILTER_W_REGION_CLIPPED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The filter could not bind the entire region.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/filter/nf-filter-ifilter-bindregion
     */
    BindRegion(origPos, riid, ppunk) {
        ppunkMarshal := ppunk is VarRef ? "ptr*" : "ptr"

        result := ComCall(7, this, "ptr", origPos, "ptr", riid, ppunkMarshal, ppunk, "int")
        return result
    }
}
