#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Controls the preferred and blocked filter lists.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-iamplugincontrol
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IAMPluginControl extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAMPluginControl
     * @type {Guid}
     */
    static IID => Guid("{0e26a181-f40c-4635-8786-976284b52981}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetPreferredClsid", "GetPreferredClsidByIndex", "SetPreferredClsid", "IsDisabled", "GetDisabledByIndex", "SetDisabled", "IsLegacyDisabled"]

    /**
     * Searches the preferred list for a class identifier (CLSID) that matches a specified subtype.
     * @param {Pointer<Guid>} subType A media subtype GUID to match.
     * @returns {Guid} Receives a CLSID from the preferred list.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamplugincontrol-getpreferredclsid
     */
    GetPreferredClsid(subType) {
        clsid := Guid()
        result := ComCall(3, this, "ptr", subType, "ptr", clsid, "HRESULT")
        return clsid
    }

    /**
     * Gets a class identifier (CLSID) from the preferred list, specified by index value.
     * @param {Integer} index The zero-based index of the CLSID to retrieve.
     * @param {Pointer<Guid>} subType Receives the subtype GUID associated with the CLSID.
     * @param {Pointer<Guid>} clsid Receives the CLSID at the specified index.
     * @returns {HRESULT} This method can return one of these values.
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
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_NO_MORE_ITEMS)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>index</i> parameter is out of range.
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamplugincontrol-getpreferredclsidbyindex
     */
    GetPreferredClsidByIndex(index, subType, clsid) {
        result := ComCall(4, this, "uint", index, "ptr", subType, "ptr", clsid, "HRESULT")
        return result
    }

    /**
     * Adds a class identifier (CLSID) to the preferred list or removes a CLSID from the list.
     * @param {Pointer<Guid>} subType A media subtype GUID to associate with the CLSID.
     * @param {Pointer<Guid>} clsid Pointer to the CLSID to add to the list. If this parameter is <b>NULL</b>, the entry associated with <i>subType</i> is removed from the list
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamplugincontrol-setpreferredclsid
     */
    SetPreferredClsid(subType, clsid) {
        result := ComCall(5, this, "ptr", subType, "ptr", clsid, "HRESULT")
        return result
    }

    /**
     * Queries whether a class identifier (CLSID) appears in the blocked list.
     * @param {Pointer<Guid>} clsid The CLSID to search for.
     * @returns {HRESULT} This method can return one of these values.
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
     * The specified CLSID appears in the blocked list.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_NOT_FOUND)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified CLSID is not in the blocked list.
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamplugincontrol-isdisabled
     */
    IsDisabled(clsid) {
        result := ComCall(6, this, "ptr", clsid, "HRESULT")
        return result
    }

    /**
     * Gets a class identifier (CLSID) from the blocked list.
     * @param {Integer} index The zero-based index of the CLSID to retrieve.
     * @returns {Guid} Receives the CLSID at the specified index.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamplugincontrol-getdisabledbyindex
     */
    GetDisabledByIndex(index) {
        clsid := Guid()
        result := ComCall(7, this, "uint", index, "ptr", clsid, "HRESULT")
        return clsid
    }

    /**
     * Adds a class identifier (CLSID) to the blocked list, or removes a CLSID from the list.
     * @param {Pointer<Guid>} clsid The CLSID to add or remove.
     * @param {BOOL} disabled Specifies whether to add or remove the CSLID. If the value is <b>TRUE</b>, the method adds the CLSID to the blocked list. Otherwise, the method removes it from the list.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamplugincontrol-setdisabled
     */
    SetDisabled(clsid, disabled) {
        result := ComCall(8, this, "ptr", clsid, "int", disabled, "HRESULT")
        return result
    }

    /**
     * Queries whether an Audio Compression Manager (ACM) or Video Compression Manager (VCM) codec appears in the blocked list.
     * @param {PWSTR} dllName The name of the DLL that implements the codec.
     * @returns {HRESULT} This method can return one of these values.
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
     * The specified DLL appears in the blocked list.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_FILE_NOT_FOUND)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified DLL is not in the blocked list.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamplugincontrol-islegacydisabled
     */
    IsLegacyDisabled(dllName) {
        dllName := dllName is String ? StrPtr(dllName) : dllName

        result := ComCall(9, this, "ptr", dllName, "HRESULT")
        return result
    }
}
