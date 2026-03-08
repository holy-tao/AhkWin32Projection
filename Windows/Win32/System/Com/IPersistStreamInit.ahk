#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IPersist.ahk

/**
 * A replacement for IPersistStream that adds an initialization method.
 * @see https://learn.microsoft.com/windows/win32/api/ocidl/nn-ocidl-ipersiststreaminit
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class IPersistStreamInit extends IPersist{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPersistStreamInit
     * @type {Guid}
     */
    static IID => Guid("{7fd52380-4e07-101b-ae2d-08002b2ec713}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsDirty", "Load", "Save", "GetSizeMax", "InitNew"]

    /**
     * Determines whether an object has changed since it was last saved to its stream. (IPersistStreamInit.IsDirty)
     * @remarks
     * Use this method to determine whether an object should be saved before closing it. The dirty flag for an object is conditionally cleared in the <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-ipersiststreaminit-save">IPersistStreamInit::Save</a> method.
     * 
     * <h3><a id="Notes_to_Callers"></a><a id="notes_to_callers"></a><a id="NOTES_TO_CALLERS"></a>Notes to Callers</h3>
     * You should treat any error return codes as an indication that the object has changed. Unless this method explicitly returns S_FALSE, assume that the object must be saved.
     * 
     * Note that the OLE-provided implementations of the <b>IPersistStreamInit::IsDirty</b> method in the OLE-provided moniker interfaces always return S_FALSE because their internal state never changes.
     * @returns {HRESULT} This method returns S_OK to indicate that the object has changed. Otherwise, it returns S_FALSE.
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ipersiststreaminit-isdirty
     */
    IsDirty() {
        result := ComCall(4, this, "int")
        return result
    }

    /**
     * Initializes an object from the stream where it was saved previously. (IPersistStreamInit.Load)
     * @remarks
     * If the object has already been initialized with <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-ipersiststreaminit-initnew">IPersistStreamInit::InitNew</a>, then this method must return E_UNEXPECTED.
     * 
     * This method loads an object from its associated stream. The seek pointer is set as it was in the most recent <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-ipersiststreaminit-save">IPersistStreamInit::Save</a> method. This method can seek and read from the stream, but cannot write to it.
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
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ipersiststreaminit-load
     */
    Load(pStm) {
        result := ComCall(5, this, "ptr", pStm, "HRESULT")
        return result
    }

    /**
     * Saves an object to the specified stream. (IPersistStreamInit.Save)
     * @remarks
     * <b>IPersistStreamInit::Save</b> saves an object into the specified stream and indicates whether the object should reset its dirty flag.
     * 
     * The seek pointer is positioned at the location in the stream at which the object should begin writing its data. The object calls the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-isequentialstream-write">ISequentialStream::Write</a> method to write its data.
     * 
     * On exit, the seek pointer must be positioned immediately past the object data. The position of the seek pointer is undefined if an error returns.
     * 
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * The <b>IPersistStreamInit::Save</b> method does not write the CLSID to the stream. The caller is responsible for writing the CLSID.
     * 
     * The <b>IPersistStreamInit::Save</b> method can read from, write to, and seek in the stream; but it must not seek to a location in the stream before that of the seek pointer on entry.
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
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ipersiststreaminit-save
     */
    Save(pStm, fClearDirty) {
        result := ComCall(6, this, "ptr", pStm, "int", fClearDirty, "HRESULT")
        return result
    }

    /**
     * Retrieves the size of the stream needed to save the object. (IPersistStreamInit.GetSizeMax)
     * @remarks
     * This method returns the size needed to save an object. You can call this method to determine the size and set the necessary buffers before calling the <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-ipersiststreaminit-save">IPersistStreamInit::Save</a> method.
     * 
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * The <b>GetSizeMax</b> implementation should return a conservative estimate of the necessary size because the caller might call the <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-ipersiststreaminit-save">IPersistStreamInit::Save</a> method with a non-growable stream.
     * @returns {Integer} The size in bytes of the stream needed to save this object, in bytes.
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ipersiststreaminit-getsizemax
     */
    GetSizeMax() {
        result := ComCall(7, this, "uint*", &pCbSize := 0, "HRESULT")
        return pCbSize
    }

    /**
     * Initializes an object to a default state. This method is to be called instead of IPersistStreamInit::Load.
     * @remarks
     * If the object has already been initialized with <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-ipersiststreaminit-load">IPersistStreamInit::Load</a>, then this method must return E_UNEXPECTED.
     * @returns {HRESULT} This method can return the standard return valuesE_OUTOFMEMORY and E_UNEXPECTED, as well as the following values.
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
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The object requires no default initialization. This error code is allowed because an object may choose to implement <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nn-ocidl-ipersiststreaminit">IPersistStreamInit</a> simply for orthogonality or in anticipation of a future need for this method.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ipersiststreaminit-initnew
     */
    InitNew() {
        result := ComCall(8, this, "HRESULT")
        return result
    }
}
