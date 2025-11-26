#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * The IETFilter interface is exposed by the Encrypter/Tagger filter. Most applications will not have to use this interface.
 * @remarks
 * 
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IETFilter)</c>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//encdec/nn-encdec-ietfilter
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IETFilter extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IETFilter
     * @type {Guid}
     */
    static IID => Guid("{c4c4c4b1-0049-4e2b-98fb-9537f6ce516d}")

    /**
     * The class identifier for ETFilter
     * @type {Guid}
     */
    static CLSID => Guid("{c4c4c4f1-0049-4e2b-98fb-9537f6ce516d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_EvalRatObjOK", "GetCurrRating", "GetCurrLicenseExpDate", "GetLastErrorCode", "SetRecordingOn"]

    /**
     * @type {HRESULT} 
     */
    EvalRatObjOK {
        get => this.get_EvalRatObjOK()
    }

    /**
     * .
     * @returns {HRESULT} Receives an <b>HRESULT</b> value. The <b>HRESULT</b> is the value that was returned when the filter called <b>CoCreateInstance</b> to create the <b>EvalRat</b> object. If it equals S_OK, the <b>EvalRat</b> object was created successfully.
     * @see https://docs.microsoft.com/windows/win32/api//encdec/nf-encdec-ietfilter-get_evalratobjok
     */
    get_EvalRatObjOK() {
        result := ComCall(3, this, "int*", &pHrCoCreateRetVal := 0, "HRESULT")
        return pHrCoCreateRetVal
    }

    /**
     * The GetCurrRating method retrieves the current rating, based on the most recent media sample.
     * @param {Pointer<Integer>} pEnSystem Receives the rating system, as an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tvratings/ne-tvratings-entvrat_system">EnTvRat_System</a> enumeration type.
     * @param {Pointer<Integer>} pEnRating Receives the rating level, as an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tvratings/ne-tvratings-entvrat_genericlevel">EnTvRat_GenericLevel</a> enumeration type. The meaning of this value depends on the rating system.
     * @param {Pointer<Integer>} plbfEnAttr Receives a bitwise combination of flags from the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tvratings/ne-tvratings-bfentvrat_genericattributes">BfEnTvRat_GenericAttributes</a> enumeration. The flags specify content attributes, such as violence or adult language. Content attributes do not apply to all rating systems.
     * @returns {HRESULT} Returns S_OK if successful, or an error code otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//encdec/nf-encdec-ietfilter-getcurrrating
     */
    GetCurrRating(pEnSystem, pEnRating, plbfEnAttr) {
        pEnSystemMarshal := pEnSystem is VarRef ? "int*" : "ptr"
        pEnRatingMarshal := pEnRating is VarRef ? "int*" : "ptr"
        plbfEnAttrMarshal := plbfEnAttr is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, pEnSystemMarshal, pEnSystem, pEnRatingMarshal, pEnRating, plbfEnAttrMarshal, plbfEnAttr, "HRESULT")
        return result
    }

    /**
     * This method is currently not supported.
     * @param {Pointer<Integer>} protType Reserved.
     * @returns {Integer} Reserved.
     * @see https://docs.microsoft.com/windows/win32/api//encdec/nf-encdec-ietfilter-getcurrlicenseexpdate
     */
    GetCurrLicenseExpDate(protType) {
        protTypeMarshal := protType is VarRef ? "int*" : "ptr"

        result := ComCall(5, this, protTypeMarshal, protType, "int*", &lpDateTime := 0, "HRESULT")
        return lpDateTime
    }

    /**
     * Not implemented.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not implemented
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//encdec/nf-encdec-ietfilter-getlasterrorcode
     */
    GetLastErrorCode() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * The SetRecordingOn method signals to the Encrypter/Tagger filter that the Video Control is about to start or stop recording.
     * @param {BOOL} fRecState <b>TRUE</b> if recording is about to start, or <b>FALSE</b> if recording is about to stop.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//encdec/nf-encdec-ietfilter-setrecordingon
     */
    SetRecordingOn(fRecState) {
        result := ComCall(7, this, "int", fRecState, "HRESULT")
        return result
    }
}
