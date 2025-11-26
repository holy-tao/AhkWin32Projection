#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Implemented by containers and used by the container's Object Properties dialog box and by the Convert dialog box.
 * @remarks
 * 
 * > [!NOTE]
 * > The oledlg.h header defines IOleUIObjInfo as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * 
 * @see https://docs.microsoft.com/windows/win32/api//oledlg/nn-oledlg-ioleuiobjinfoa
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 * @charset ANSI
 */
class IOleUIObjInfoA extends IUnknown{

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetObjectInfo", "GetConvertInfo", "ConvertObject", "GetViewInfo", "SetViewInfo"]

    /**
     * Gets the size, type, name, and location information for an object.
     * @param {Integer} dwObject Unique identifier for the object.
     * @param {Pointer<Integer>} lpdwObjSize Pointer to the object's size, in bytes, on disk. This may be an approximate value.
     * @param {Pointer<PSTR>} lplpszLabel Address of a pointer variable that receives a pointer to the object's label string. This parameter may be <b>NULL</b> to indicate that the implementation should not return the label string.
     * @param {Pointer<PSTR>} lplpszType Address of a pointer variable that receives a pointer to the object's long type string. This parameter may be <b>NULL</b> to indicate that the implementation should not return the long type string.
     * @param {Pointer<PSTR>} lplpszShortType Address of a pointer variable that receives a pointer to the object's short type string. This parameter may be <b>NULL</b> to indicate that the implementation should not return the short type string.
     * @param {Pointer<PSTR>} lplpszLocation Address of a pointer variable that receives a pointer to the object's source location string. This parameter may be <b>NULL</b> to indicate that the implementation should not return the location string.
     * @returns {HRESULT} This method returns S_OK on success. Other possible return values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation failed.
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
     * The specified identifier is invalid.
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
     * There is insufficient memory available for this operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oledlg/nf-oledlg-ioleuiobjinfoa-getobjectinfo
     */
    GetObjectInfo(dwObject, lpdwObjSize, lplpszLabel, lplpszType, lplpszShortType, lplpszLocation) {
        lpdwObjSizeMarshal := lpdwObjSize is VarRef ? "uint*" : "ptr"
        lplpszLabelMarshal := lplpszLabel is VarRef ? "ptr*" : "ptr"
        lplpszTypeMarshal := lplpszType is VarRef ? "ptr*" : "ptr"
        lplpszShortTypeMarshal := lplpszShortType is VarRef ? "ptr*" : "ptr"
        lplpszLocationMarshal := lplpszLocation is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "uint", dwObject, lpdwObjSizeMarshal, lpdwObjSize, lplpszLabelMarshal, lplpszLabel, lplpszTypeMarshal, lplpszType, lplpszShortTypeMarshal, lplpszShortType, lplpszLocationMarshal, lplpszLocation, "HRESULT")
        return result
    }

    /**
     * Gets the conversion information associated with the specified object.
     * @param {Integer} dwObject Unique identifier for the object.
     * @param {Pointer<Guid>} lpClassID Pointer to the location to return the object's CLSID.
     * @param {Pointer<Integer>} lpwFormat Pointer to the clipboard format of the object.
     * @param {Pointer<Guid>} lpConvertDefaultClassID Pointer to the default class, selected from the UI, to convert the object to.
     * @param {Pointer<Pointer<Guid>>} lplpClsidExclude Address of a pointer variable that receives a pointer to an array of CLSIDs that should be excluded from the user interface for this object. If <i>lpcClsidExclude</i> is zero, then <i>lpClsidExclude</i> is set to <b>NULL</b>.
     * @param {Pointer<Integer>} lpcClsidExclude Address of an output variable that receives the number of CLSIDs in <i>lplpClsidExclude</i>. This parameter may be zero.
     * @returns {HRESULT} This method returns S_OK on success. Other possible return values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient access permissions.
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
     * The operation failed.
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
     * The specified identifier is invalid.
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
     * There is insufficient memory available for this operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oledlg/nf-oledlg-ioleuiobjinfoa-getconvertinfo
     */
    GetConvertInfo(dwObject, lpClassID, lpwFormat, lpConvertDefaultClassID, lplpClsidExclude, lpcClsidExclude) {
        lpwFormatMarshal := lpwFormat is VarRef ? "ushort*" : "ptr"
        lplpClsidExcludeMarshal := lplpClsidExclude is VarRef ? "ptr*" : "ptr"
        lpcClsidExcludeMarshal := lpcClsidExclude is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "uint", dwObject, "ptr", lpClassID, lpwFormatMarshal, lpwFormat, "ptr", lpConvertDefaultClassID, lplpClsidExcludeMarshal, lplpClsidExclude, lpcClsidExcludeMarshal, lpcClsidExclude, "HRESULT")
        return result
    }

    /**
     * Converts the object to the type of the specified CLSID.
     * @param {Integer} dwObject A unique identifier for the object.
     * @param {Pointer<Guid>} clsidNew The CLSID.
     * @returns {HRESULT} This method returns S_OK on success. Other possible return values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient access permissions.
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
     * The operation failed.
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
     * The specified identifier is not valid.
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
     * There is insufficient memory available for this operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oledlg/nf-oledlg-ioleuiobjinfoa-convertobject
     */
    ConvertObject(dwObject, clsidNew) {
        result := ComCall(5, this, "uint", dwObject, "ptr", clsidNew, "HRESULT")
        return result
    }

    /**
     * Gets the view information associated with the object.
     * @param {Integer} dwObject Unique  identifier for the object.
     * @param {Pointer<HGLOBAL>} phMetaPict Pointer to the object's current icon. This parameter can be <b>NULL</b>, indicating that the caller is not interested in the object's current presentation.
     * @param {Pointer<Integer>} pdvAspect Pointer to the object's current aspect. This parameter can be <b>NULL</b>, indicating that the caller is not interested in the object's current aspect, for example, DVASPECT_ICONIC or DVASPECT_CONTENT.
     * @param {Pointer<Integer>} pnCurrentScale Pointer to the object's current scale. This parameter can be <b>NULL</b>, indicating that the caller is not interested in the current scaling factor applied to the object in the container's view.
     * @returns {HRESULT} This method returns S_OK on success. Other possible return values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient access permissions.
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
     * The operation failed.
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
     * The specified identifier is not valid.
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
     * There is insufficient memory available for this operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oledlg/nf-oledlg-ioleuiobjinfoa-getviewinfo
     */
    GetViewInfo(dwObject, phMetaPict, pdvAspect, pnCurrentScale) {
        pdvAspectMarshal := pdvAspect is VarRef ? "uint*" : "ptr"
        pnCurrentScaleMarshal := pnCurrentScale is VarRef ? "int*" : "ptr"

        result := ComCall(6, this, "uint", dwObject, "ptr", phMetaPict, pdvAspectMarshal, pdvAspect, pnCurrentScaleMarshal, pnCurrentScale, "HRESULT")
        return result
    }

    /**
     * Sets the view information associated with the object.
     * @param {Integer} dwObject Unique identifier for the object.
     * @param {HGLOBAL} hMetaPict The new icon.
     * @param {Integer} dvAspect The new display aspect or view.
     * @param {Integer} nCurrentScale The new scale.
     * @param {BOOL} bRelativeToOrig The new scale of the object, relative to the origin. This value is <b>TRUE</b> if the scale should be relative to the original scale of the object. If <b>FALSE</b>, <i>nCurrentScale</i> applies to the object's current size.
     * @returns {HRESULT} This method returns S_OK on success. Other possible return values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient access permissions.
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
     * The operation failed.
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
     * The specified identifier is invalid.
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
     * There is insufficient memory available for this operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//oledlg/nf-oledlg-ioleuiobjinfoa-setviewinfo
     */
    SetViewInfo(dwObject, hMetaPict, dvAspect, nCurrentScale, bRelativeToOrig) {
        hMetaPict := hMetaPict is Win32Handle ? NumGet(hMetaPict, "ptr") : hMetaPict

        result := ComCall(7, this, "uint", dwObject, "ptr", hMetaPict, "uint", dvAspect, "int", nCurrentScale, "int", bRelativeToOrig, "HRESULT")
        return result
    }
}
