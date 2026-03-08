#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IPersist.ahk

/**
 * Enables the saving and loading of objects that use a simple serial stream for their storage needs.
 * @remarks
 * One way in which this interface is used is to support OLE moniker implementations. Each of the OLE-provided moniker interfaces provides an <b>IPersistStream</b> implementation through which the moniker saves or loads itself. An instance of the OLE generic composite moniker class calls the <b>IPersistStream</b> methods of its component monikers to load or save the components in the proper sequence in a single stream.
 * 
 * <h3><a id="IPersistStream_URL_Moniker_Implementation"></a><a id="ipersiststream_url_moniker_implementation"></a><a id="IPERSISTSTREAM_URL_MONIKER_IMPLEMENTATION"></a>IPersistStream URL Moniker Implementation</h3>
 * The URL moniker implementation of <b>IPersistStream</b> is found on an URL moniker object, which supports <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>, <b>IAsyncMoniker</b>, and <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imoniker">IMoniker</a>. The <b>IMoniker</b> interface inherits its definition from <b>IPersistStream</b> and thus, the URL moniker also provides an implementation of <b>IPersistStream</b> as part of its implementation of <b>IMoniker</b>.
 * 
 * The <a href="https://docs.microsoft.com/previous-versions/ms775081(v=vs.85)">IAsyncMoniker</a> interface on an URL moniker is simply <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> (there are no additional methods); it is used to allow clients to determine if a moniker supports asynchronous binding. To get a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imoniker">IMoniker</a> interface on this object, call the <b>CreateURLMonikerEx</b> function. Then, to get a pointer to <b>IPersistStream</b>, call the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> method.
 * 
 * <b>IPersistStream</b>, in addition to inheriting its definition from <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>, also inherits the single method of <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ipersist">IPersist</a>, <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ipersist-getclassid">GetClassID</a>.
 * @see https://learn.microsoft.com/windows/win32/api/objidl/nn-objidl-ipersiststream
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class IPersistStream extends IPersist{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPersistStream
     * @type {Guid}
     */
    static IID => Guid("{00000109-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsDirty", "Load", "Save", "GetSizeMax"]

    /**
     * Determines whether an object has changed since it was last saved to its stream. (IPersistStream.IsDirty)
     * @remarks
     * Use this method to determine whether an object should be saved before closing it. The dirty flag for an object is conditionally cleared in the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ipersiststream-save">IPersistStream::Save</a> method.
     * 
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * You should treat any error return codes as an indication that the object has changed. Unless this method explicitly returns S_FALSE, assume that the object must be saved.
     * 
     * Note that the OLE-provided implementations of the <b>IPersistStream::IsDirty</b> method in the OLE-provided moniker interfaces always return S_FALSE because their internal state never changes.
     * @returns {HRESULT} This method returns S_OK to indicate that the object has changed. Otherwise, it returns S_FALSE.
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-ipersiststream-isdirty
     */
    IsDirty() {
        result := ComCall(4, this, "int")
        return result
    }

    /**
     * Initializes an object from the stream where it was saved previously. (IPersistStream.Load)
     * @remarks
     * This method loads an object from its associated stream. The seek pointer is set as it was in the most recent <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ipersiststream-save">IPersistStream::Save</a> method. This method can seek and read from the stream, but cannot write to it.
     * 
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * Rather than calling <b>IPersistStream::Load</b> directly, you typically call the <a href="https://docs.microsoft.com/windows/desktop/api/ole/nf-ole-oleloadfromstream">OleLoadFromStream</a> function does the following:
     * 
     * <ol>
     * <li>Calls the <a href="https://docs.microsoft.com/windows/desktop/api/coml2api/nf-coml2api-readclassstm">ReadClassStm</a> function to get the class identifier from the stream.</li>
     * <li>Calls the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cocreateinstance">CoCreateInstance</a> function to create an instance of the object.</li>
     * <li>Queries the instance for <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ipersiststream">IPersistStream</a>.</li>
     * <li>Calls <b>IPersistStream::Load</b>.</li>
     * </ol>
     * The <a href="https://docs.microsoft.com/windows/desktop/api/ole/nf-ole-oleloadfromstream">OleLoadFromStream</a> function assumes that objects are stored in the stream with a class identifier followed by the object data. This storage pattern is used by the generic, composite-moniker implementation provided by OLE.
     * 
     * If the objects are not stored using this pattern, you must call the methods separately yourself.
     * 
     * 
     * <h3><a id="URL_Moniker_Notes"></a><a id="url_moniker_notes"></a><a id="URL_MONIKER_NOTES"></a>URL Moniker Notes</h3>
     * Initializes an URL moniker from data within a stream, usually stored there previously using its <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ipersiststream-save">IPersistStream::Save</a> (using <a href="https://docs.microsoft.com/windows/desktop/api/ole/nf-ole-olesavetostream">OleSaveToStream</a>). The binary format of the URL moniker is its URL string in Unicode (may be a full or partial URL string, see <a href="https://docs.microsoft.com/previous-versions/windows/internet-explorer/ie-developer/platform-apis/ms775103(v=vs.85)">CreateURLMonikerEx</a> for details). This is represented as a <b>ULONG</b> count of characters followed by that many Unicode characters.
     * @param {IStream} pStm An <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a> pointer to the stream from which the object should be loaded.
     * @returns {HRESULT} This method can return the following values.
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
     * The method completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The object was not loaded due to lack of memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The object was not loaded due to some reason other than a lack of memory.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-ipersiststream-load
     */
    Load(pStm) {
        result := ComCall(5, this, "ptr", pStm, "HRESULT")
        return result
    }

    /**
     * Saves an object to the specified stream. (IPersistStream.Save)
     * @remarks
     * <b>IPersistStream::Save</b> saves an object into the specified stream and indicates whether the object should reset its dirty flag.
     * 
     * The seek pointer is positioned at the location in the stream at which the object should begin writing its data. The object calls the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-isequentialstream-write">ISequentialStream::Write</a> method to write its data.
     * 
     * On exit, the seek pointer must be positioned immediately past the object data. The position of the seek pointer is undefined if an error returns.
     * 
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * Rather than calling <b>IPersistStream::Save</b> directly, you typically call the <a href="https://docs.microsoft.com/windows/desktop/api/ole/nf-ole-olesavetostream">OleSaveToStream</a> helper function which does the following: 
     * 
     * <ol>
     * <li>Calls <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ipersist-getclassid">GetClassID</a> to get the object's CLSID.</li>
     * <li>Calls the <a href="https://docs.microsoft.com/windows/desktop/api/coml2api/nf-coml2api-writeclassstm">WriteClassStm</a> function to write the object's CLSID to the stream.</li>
     * <li>Calls <b>IPersistStream::Save</b>.</li>
     * </ol>
     * If you call these methods directly, you can write other data into the stream after the CLSID before calling <b>IPersistStream::Save</b>.
     * 
     * The OLE-provided implementation of <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ipersiststream">IPersistStream</a> follows this same pattern.
     * 
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * The <b>IPersistStream::Save</b> method does not write the CLSID to the stream. The caller is responsible for writing the CLSID.
     * 
     * The <b>IPersistStream::Save</b> method can read from, write to, and seek in the stream; but it must not seek to a location in the stream before that of the seek pointer on entry.
     * 
     * <h3><a id="URL_Moniker_Notes"></a><a id="url_moniker_notes"></a><a id="URL_MONIKER_NOTES"></a>URL Moniker Notes</h3>
     * Saves an URL moniker to a stream. The binary format of URL moniker is its URL string in Unicode (may be a full or partial URL string, see <a href="https://docs.microsoft.com/previous-versions/windows/internet-explorer/ie-developer/platform-apis/ms775103(v=vs.85)">CreateURLMonikerEx</a> for details). This is represented as a <b>ULONG</b> count of characters followed by that many Unicode characters.
     * @param {IStream} pStm An <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a> pointer to the stream into which the object should be saved.
     * @param {BOOL} fClearDirty Indicates whether to clear the dirty flag after the save is complete. If <b>TRUE</b>, the flag should be cleared. If <b>FALSE</b>, the flag should be left unchanged.
     * @returns {HRESULT} This method can return the following values.
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
     * The method completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STG_E_CANTSAVE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The object could not save itself to the stream. This error could indicate, for example, that the object contains another object that is not serializable to a stream or that an <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-isequentialstream-write">ISequentialStream::Write</a> call returned STG_E_CANTSAVE.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STG_E_MEDIUMFULL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The object could not be saved because there is no space left on the storage device.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-ipersiststream-save
     */
    Save(pStm, fClearDirty) {
        result := ComCall(6, this, "ptr", pStm, "int", fClearDirty, "HRESULT")
        return result
    }

    /**
     * Retrieves the size of the stream needed to save the object. (IPersistStream.GetSizeMax)
     * @remarks
     * This method returns the size needed to save an object. You can call this method to determine the size and set the necessary buffers before calling the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ipersiststream-save">IPersistStream::Save</a> method.
     * 
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * The <b>GetSizeMax</b> implementation should return a conservative estimate of the necessary size because the caller might call the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ipersiststream-save">IPersistStream::Save</a> method with a non-growable stream.
     * 
     * <h3><a id="URL_Moniker_Notes"></a><a id="url_moniker_notes"></a><a id="URL_MONIKER_NOTES"></a>URL Moniker Notes</h3>
     * This method retrieves the maximum number of bytes in the stream that will be required by a subsequent call to <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ipersiststream-save">IPersistStream::Save</a>. This value is sizeof(ULONG)==4 plus sizeof(WCHAR)*n where n is the length of the full or partial URL string, including the NULL terminator.
     * @returns {Integer} The size in bytes of the stream needed to save this object, in bytes.
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-ipersiststream-getsizemax
     */
    GetSizeMax() {
        result := ComCall(7, this, "uint*", &pcbSize := 0, "HRESULT")
        return pcbSize
    }
}
