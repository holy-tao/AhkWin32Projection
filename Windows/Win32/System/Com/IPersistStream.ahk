#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IPersist.ahk

/**
 * Enables the saving and loading of objects that use a simple serial stream for their storage needs.
 * @remarks
 * 
 * One way in which this interface is used is to support OLE moniker implementations. Each of the OLE-provided moniker interfaces provides an <b>IPersistStream</b> implementation through which the moniker saves or loads itself. An instance of the OLE generic composite moniker class calls the <b>IPersistStream</b> methods of its component monikers to load or save the components in the proper sequence in a single stream.
 * 
 * <h3><a id="IPersistStream_URL_Moniker_Implementation"></a><a id="ipersiststream_url_moniker_implementation"></a><a id="IPERSISTSTREAM_URL_MONIKER_IMPLEMENTATION"></a>IPersistStream URL Moniker Implementation</h3>
 * The URL moniker implementation of <b>IPersistStream</b> is found on an URL moniker object, which supports <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>, <b>IAsyncMoniker</b>, and <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imoniker">IMoniker</a>. The <b>IMoniker</b> interface inherits its definition from <b>IPersistStream</b> and thus, the URL moniker also provides an implementation of <b>IPersistStream</b> as part of its implementation of <b>IMoniker</b>.
 * 
 * The <a href="https://docs.microsoft.com/previous-versions/ms775081(v=vs.85)">IAsyncMoniker</a> interface on an URL moniker is simply <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> (there are no additional methods); it is used to allow clients to determine if a moniker supports asynchronous binding. To get a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imoniker">IMoniker</a> interface on this object, call the <b>CreateURLMonikerEx</b> function. Then, to get a pointer to <b>IPersistStream</b>, call the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> method.
 * 
 * <b>IPersistStream</b>, in addition to inheriting its definition from <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>, also inherits the single method of <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ipersist">IPersist</a>, <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-ipersist-getclassid">GetClassID</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//objidl/nn-objidl-ipersiststream
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
     * Determines whether an object has changed since it was last saved to its stream.
     * @returns {HRESULT} This method returns S_OK to indicate that the object has changed. Otherwise, it returns S_FALSE.
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-ipersiststream-isdirty
     */
    IsDirty() {
        result := ComCall(4, this, "int")
        return result
    }

    /**
     * Initializes an object from the stream where it was saved previously.
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
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-ipersiststream-load
     */
    Load(pStm) {
        result := ComCall(5, this, "ptr", pStm, "HRESULT")
        return result
    }

    /**
     * Saves an object to the specified stream.
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
     * The object could not save itself to the stream. This error could indicate, for example, that the object contains another object that is not serializable to a stream or that an <a href="/windows/desktop/api/objidl/nf-objidl-isequentialstream-write">ISequentialStream::Write</a> call returned STG_E_CANTSAVE.
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
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-ipersiststream-save
     */
    Save(pStm, fClearDirty) {
        result := ComCall(6, this, "ptr", pStm, "int", fClearDirty, "HRESULT")
        return result
    }

    /**
     * Retrieves the size of the stream needed to save the object.
     * @returns {Integer} The size in bytes of the stream needed to save this object, in bytes.
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-ipersiststream-getsizemax
     */
    GetSizeMax() {
        result := ComCall(7, this, "uint*", &pcbSize := 0, "HRESULT")
        return pcbSize
    }
}
