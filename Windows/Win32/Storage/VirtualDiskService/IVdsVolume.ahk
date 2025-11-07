#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\VDS_VOLUME_PROP.ahk
#Include .\IVdsPack.ahk
#Include .\IEnumVdsObject.ahk
#Include .\IVdsAsync.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides methods to manage volumes.
 * @see https://docs.microsoft.com/windows/win32/api//vds/nn-vds-ivdsvolume
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class IVdsVolume extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVdsVolume
     * @type {Guid}
     */
    static IID => Guid("{88306bb2-e71f-478c-86a2-79da200a0f11}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetProperties", "GetPack", "QueryPlexes", "Extend", "Shrink", "AddPlex", "BreakPlex", "RemovePlex", "Delete", "SetFlags", "ClearFlags"]

    /**
     * 
     * @returns {VDS_VOLUME_PROP} 
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsvolume-getproperties
     */
    GetProperties() {
        pVolumeProperties := VDS_VOLUME_PROP()
        result := ComCall(3, this, "ptr", pVolumeProperties, "HRESULT")
        return pVolumeProperties
    }

    /**
     * 
     * @returns {IVdsPack} 
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsvolume-getpack
     */
    GetPack() {
        result := ComCall(4, this, "ptr*", &ppPack := 0, "HRESULT")
        return IVdsPack(ppPack)
    }

    /**
     * 
     * @returns {IEnumVdsObject} 
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsvolume-queryplexes
     */
    QueryPlexes() {
        result := ComCall(5, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumVdsObject(ppEnum)
    }

    /**
     * 
     * @param {Pointer<VDS_INPUT_DISK>} pInputDiskArray 
     * @param {Integer} lNumberOfDisks 
     * @returns {IVdsAsync} 
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsvolume-extend
     */
    Extend(pInputDiskArray, lNumberOfDisks) {
        result := ComCall(6, this, "ptr", pInputDiskArray, "int", lNumberOfDisks, "ptr*", &ppAsync := 0, "HRESULT")
        return IVdsAsync(ppAsync)
    }

    /**
     * 
     * @param {Integer} ullNumberOfBytesToRemove 
     * @returns {IVdsAsync} 
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsvolume-shrink
     */
    Shrink(ullNumberOfBytesToRemove) {
        result := ComCall(7, this, "uint", ullNumberOfBytesToRemove, "ptr*", &ppAsync := 0, "HRESULT")
        return IVdsAsync(ppAsync)
    }

    /**
     * 
     * @param {Guid} VolumeId 
     * @returns {IVdsAsync} 
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsvolume-addplex
     */
    AddPlex(VolumeId) {
        result := ComCall(8, this, "ptr", VolumeId, "ptr*", &ppAsync := 0, "HRESULT")
        return IVdsAsync(ppAsync)
    }

    /**
     * 
     * @param {Guid} plexId 
     * @returns {IVdsAsync} 
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsvolume-breakplex
     */
    BreakPlex(plexId) {
        result := ComCall(9, this, "ptr", plexId, "ptr*", &ppAsync := 0, "HRESULT")
        return IVdsAsync(ppAsync)
    }

    /**
     * 
     * @param {Guid} plexId 
     * @returns {IVdsAsync} 
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsvolume-removeplex
     */
    RemovePlex(plexId) {
        result := ComCall(10, this, "ptr", plexId, "ptr*", &ppAsync := 0, "HRESULT")
        return IVdsAsync(ppAsync)
    }

    /**
     * 
     * @param {BOOL} bForce 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsvolume-delete
     */
    Delete(bForce) {
        result := ComCall(11, this, "int", bForce, "HRESULT")
        return result
    }

    /**
     * Specifies how the recognizer interprets the ink and determines the result string.Call this function before processing the ink for the first time. Therefore, call the SetFlags function before calling the Process function.
     * @param {Integer} ulFlags 
     * @param {BOOL} bRevertOnClose 
     * @returns {HRESULT} This function can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>HRESULT value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The flag is invalid.
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
     * The recognizer does not support this function.
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
     * Unable to allocate memory to complete the operation.
     * 
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
     * An unspecified error occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The context is invalid or one of the parameters is an invalid pointer.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//recapis/nf-recapis-setflags
     */
    SetFlags(ulFlags, bRevertOnClose) {
        result := ComCall(12, this, "uint", ulFlags, "int", bRevertOnClose, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsvolume-clearflags
     */
    ClearFlags(ulFlags) {
        result := ComCall(13, this, "uint", ulFlags, "HRESULT")
        return result
    }
}
