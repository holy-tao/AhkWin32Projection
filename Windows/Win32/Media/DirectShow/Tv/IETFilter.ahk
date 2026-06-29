#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\EnTvRat_GenericLevel.ahk" { EnTvRat_GenericLevel }
#Import ".\ProtType.ahk" { ProtType }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\EnTvRat_System.ahk" { EnTvRat_System }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IETFilter interface is exposed by the Encrypter/Tagger filter. Most applications will not have to use this interface.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IETFilter)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/encdec/nn-encdec-ietfilter
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IETFilter extends IUnknown {
    /**
     * The interface identifier for IETFilter
     * @type {Guid}
     */
    static IID := Guid("{c4c4c4b1-0049-4e2b-98fb-9537f6ce516d}")

    /**
     * The class identifier for ETFilter
     * @type {Guid}
     */
    static CLSID := Guid("{c4c4c4f1-0049-4e2b-98fb-9537f6ce516d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IETFilter interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        get_EvalRatObjOK      : IntPtr
        GetCurrRating         : IntPtr
        GetCurrLicenseExpDate : IntPtr
        GetLastErrorCode      : IntPtr
        SetRecordingOn        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IETFilter.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {HRESULT} 
     */
    EvalRatObjOK {
        get => this.get_EvalRatObjOK()
    }

    /**
     * .
     * @returns {HRESULT} Receives an <b>HRESULT</b> value. The <b>HRESULT</b> is the value that was returned when the filter called <b>CoCreateInstance</b> to create the <b>EvalRat</b> object. If it equals S_OK, the <b>EvalRat</b> object was created successfully.
     * @see https://learn.microsoft.com/windows/win32/api/encdec/nf-encdec-ietfilter-get_evalratobjok
     */
    get_EvalRatObjOK() {
        result := ComCall(3, this, "int*", &pHrCoCreateRetVal := 0, "HRESULT")
        return pHrCoCreateRetVal
    }

    /**
     * The GetCurrRating method retrieves the current rating, based on the most recent media sample.
     * @param {Pointer<EnTvRat_System>} pEnSystem Receives the rating system, as an <a href="https://docs.microsoft.com/previous-versions/dd375612(v=vs.85)">EnTvRat_System</a> enumeration type.
     * @param {Pointer<EnTvRat_GenericLevel>} pEnRating Receives the rating level, as an <a href="https://docs.microsoft.com/previous-versions/dd375610(v=vs.85)">EnTvRat_GenericLevel</a> enumeration type. The meaning of this value depends on the rating system.
     * @param {Pointer<Integer>} plbfEnAttr Receives a bitwise combination of flags from the <a href="https://docs.microsoft.com/previous-versions/dd318226(v=vs.85)">BfEnTvRat_GenericAttributes</a> enumeration. The flags specify content attributes, such as violence or adult language. Content attributes do not apply to all rating systems.
     * @returns {HRESULT} Returns S_OK if successful, or an error code otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/encdec/nf-encdec-ietfilter-getcurrrating
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
     * @param {Pointer<ProtType>} _protType Reserved.
     * @returns {Integer} Reserved.
     * @see https://learn.microsoft.com/windows/win32/api/encdec/nf-encdec-ietfilter-getcurrlicenseexpdate
     */
    GetCurrLicenseExpDate(_protType) {
        _protTypeMarshal := _protType is VarRef ? "int*" : "ptr"

        result := ComCall(5, this, _protTypeMarshal, _protType, "int*", &lpDateTime := 0, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/encdec/nf-encdec-ietfilter-getlasterrorcode
     */
    GetLastErrorCode() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * The SetRecordingOn method signals to the Encrypter/Tagger filter that the Video Control is about to start or stop recording.
     * @remarks
     * The <b>SetRecordingOn</b> method enables the Video Control to enforce copy protection in the television broadcast signal. When the Video Control uses the Stream Buffer Engine to play television content, the Encrypter/Tagger filter is located in the Stream Buffer Sink graph. The Encrypter/Tagger sends data to the Stream Buffer Sink for both playback and recording. When <b>SetRecordingOn</b> is called with the value <b>TRUE</b>, the Encrypter/Tagger watches the video stream for the copy protection flags and sends a broadcast event if they change. The Video Control listens for the event and disallows the recording if indicated by the copy protection flag.
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
     * @see https://learn.microsoft.com/windows/win32/api/encdec/nf-encdec-ietfilter-setrecordingon
     */
    SetRecordingOn(fRecState) {
        result := ComCall(7, this, BOOL, fRecState, "HRESULT")
        return result
    }

    Query(iid) {
        if (IETFilter.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_EvalRatObjOK := CallbackCreate(GetMethod(implObj, "get_EvalRatObjOK"), flags, 2)
        this.vtbl.GetCurrRating := CallbackCreate(GetMethod(implObj, "GetCurrRating"), flags, 4)
        this.vtbl.GetCurrLicenseExpDate := CallbackCreate(GetMethod(implObj, "GetCurrLicenseExpDate"), flags, 3)
        this.vtbl.GetLastErrorCode := CallbackCreate(GetMethod(implObj, "GetLastErrorCode"), flags, 1)
        this.vtbl.SetRecordingOn := CallbackCreate(GetMethod(implObj, "SetRecordingOn"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_EvalRatObjOK)
        CallbackFree(this.vtbl.GetCurrRating)
        CallbackFree(this.vtbl.GetCurrLicenseExpDate)
        CallbackFree(this.vtbl.GetLastErrorCode)
        CallbackFree(this.vtbl.SetRecordingOn)
    }
}
