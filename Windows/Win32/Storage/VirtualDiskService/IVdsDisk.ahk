#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides methods to query and configure basic and dynamic disks.
 * @see https://docs.microsoft.com/windows/win32/api//vds/nn-vds-ivdsdisk
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class IVdsDisk extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVdsDisk
     * @type {Guid}
     */
    static IID => Guid("{07e5c822-f00c-47a1-8fce-b244da56fd06}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetProperties", "GetPack", "GetIdentificationData", "QueryExtents", "ConvertStyle", "SetFlags", "ClearFlags"]

    /**
     * 
     * @param {Pointer<VDS_DISK_PROP>} pDiskProperties 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsdisk-getproperties
     */
    GetProperties(pDiskProperties) {
        result := ComCall(3, this, "ptr", pDiskProperties, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IVdsPack>} ppPack 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsdisk-getpack
     */
    GetPack(ppPack) {
        result := ComCall(4, this, "ptr*", ppPack, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VDS_LUN_INFORMATION>} pLunInfo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsdisk-getidentificationdata
     */
    GetIdentificationData(pLunInfo) {
        result := ComCall(5, this, "ptr", pLunInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<VDS_DISK_EXTENT>>} ppExtentArray 
     * @param {Pointer<Integer>} plNumberOfExtents 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsdisk-queryextents
     */
    QueryExtents(ppExtentArray, plNumberOfExtents) {
        ppExtentArrayMarshal := ppExtentArray is VarRef ? "ptr*" : "ptr"
        plNumberOfExtentsMarshal := plNumberOfExtents is VarRef ? "int*" : "ptr"

        result := ComCall(6, this, ppExtentArrayMarshal, ppExtentArray, plNumberOfExtentsMarshal, plNumberOfExtents, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} NewStyle 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsdisk-convertstyle
     */
    ConvertStyle(NewStyle) {
        result := ComCall(7, this, "int", NewStyle, "HRESULT")
        return result
    }

    /**
     * Specifies how the recognizer interprets the ink and determines the result string.Call this function before processing the ink for the first time. Therefore, call the SetFlags function before calling the Process function.
     * @param {Integer} ulFlags 
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
    SetFlags(ulFlags) {
        result := ComCall(8, this, "uint", ulFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsdisk-clearflags
     */
    ClearFlags(ulFlags) {
        result := ComCall(9, this, "uint", ulFlags, "HRESULT")
        return result
    }
}
