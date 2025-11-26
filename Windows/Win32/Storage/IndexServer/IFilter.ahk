#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Scans documents for text and properties (also called attributes).
 * @remarks
 * 
 * <b>IFilter</b> components for Indexing Service run in the Local Security context and should be written to manage buffers and to stack correctly. All string copies must have explicit checks to guard against buffer overruns. You should always verify the allocated size of the buffer and test the size of the data against the size of the buffer.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//filter/nn-filter-ifilter
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
     * @see https://docs.microsoft.com/windows/win32/api//filter/nf-filter-ifilter-init
     */
    Init(grfFlags, cAttributes, aAttributes, pFlags) {
        pFlagsMarshal := pFlags is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", grfFlags, "uint", cAttributes, "ptr", aAttributes, pFlagsMarshal, pFlags, "int")
        return result
    }

    /**
     * Positions the filter at the beginning of the next chunk, or at the first chunk if this is the first call to the GetChunk method, and returns a description of the current chunk.
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
     * @see https://docs.microsoft.com/windows/win32/api//filter/nf-filter-ifilter-getchunk
     */
    GetChunk(pStat) {
        result := ComCall(4, this, "ptr", pStat, "int")
        return result
    }

    /**
     * Retrieves text (text-type properties) from the current chunk, which must have a CHUNKSTATE enumeration value of CHUNK_TEXT.
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
     * The <b>flags</b> member of the <a href="/windows/desktop/api/filter/ns-filter-stat_chunk">STAT_CHUNK</a> structure for the current chunk does not have a value of CHUNK_TEXT. 
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
     * All the text in the current chunk has been returned. Additional calls to the <a href="/windows/desktop/api/filter/nf-filter-ifilter-gettext">GetText</a> method should return this error until the <a href="/windows/desktop/api/filter/nf-filter-ifilter-getchunk">IFilter::GetChunk</a> method has been called successfully. 
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
     * As an optimization, the last call that returns text can return FILTER_S_LAST_TEXT, indicating that the next call to the <a href="/windows/desktop/api/filter/nf-filter-ifilter-gettext">GetText</a> method will return FILTER_E_NO_MORE_TEXT. This optimization can save time by eliminating unnecessary calls to <b>GetText</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//filter/nf-filter-ifilter-gettext
     */
    GetText(pcwcBuffer, awcBuffer) {
        awcBuffer := awcBuffer is String ? StrPtr(awcBuffer) : awcBuffer

        pcwcBufferMarshal := pcwcBuffer is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, pcwcBufferMarshal, pcwcBuffer, "ptr", awcBuffer, "int")
        return result
    }

    /**
     * Retrieves a value (internal value-type property) from a chunk, which must have a CHUNKSTATE enumeration value of CHUNK_VALUE.
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
     * The <a href="/windows/desktop/api/filter/nf-filter-ifilter-getvalue">GetValue</a> method has already been called on this chunk; this value should be returned until the <a href="/windows/desktop/api/filter/nf-filter-ifilter-getchunk">IFilter::GetChunk</a> method has been called successfully and has advanced to the next chunk.
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
     * The current chunk does not have a <a href="/windows/desktop/api/filter/ne-filter-chunkstate">CHUNKSTATE</a> enumeration value of CHUNK_VALUE. 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//filter/nf-filter-ifilter-getvalue
     */
    GetValue(ppPropValue) {
        ppPropValueMarshal := ppPropValue is VarRef ? "ptr*" : "ptr"

        result := ComCall(6, this, ppPropValueMarshal, ppPropValue, "int")
        return result
    }

    /**
     * Retrieves an interface representing the specified portion of object. Currently reserved for future use.
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
     * @see https://docs.microsoft.com/windows/win32/api//filter/nf-filter-ifilter-bindregion
     */
    BindRegion(origPos, riid, ppunk) {
        ppunkMarshal := ppunk is VarRef ? "ptr*" : "ptr"

        result := ComCall(7, this, "ptr", origPos, "ptr", riid, ppunkMarshal, ppunk, "int")
        return result
    }
}
