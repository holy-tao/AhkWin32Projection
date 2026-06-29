#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\EnTvRat_GenericLevel.ahk" { EnTvRat_GenericLevel }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\EnTvRat_System.ahk" { EnTvRat_System }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IDTFilter interface is exposed by the Decrypter/Detagger filter. Applications can use this interface to set the ratings permissions.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IDTFilter)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/encdec/nn-encdec-idtfilter
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IDTFilter extends IUnknown {
    /**
     * The interface identifier for IDTFilter
     * @type {Guid}
     */
    static IID := Guid("{c4c4c4b2-0049-4e2b-98fb-9537f6ce516d}")

    /**
     * The class identifier for DTFilter
     * @type {Guid}
     */
    static CLSID := Guid("{c4c4c4f2-0049-4e2b-98fb-9537f6ce516d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDTFilter interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        get_EvalRatObjOK            : IntPtr
        GetCurrRating               : IntPtr
        get_BlockedRatingAttributes : IntPtr
        put_BlockedRatingAttributes : IntPtr
        get_BlockUnRated            : IntPtr
        put_BlockUnRated            : IntPtr
        get_BlockUnRatedDelay       : IntPtr
        put_BlockUnRatedDelay       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDTFilter.Vtbl()
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
     * @type {BOOL} 
     */
    BlockUnRated {
        get => this.get_BlockUnRated()
        set => this.put_BlockUnRated(value)
    }

    /**
     * @type {Integer} 
     */
    BlockUnRatedDelay {
        get => this.get_BlockUnRatedDelay()
        set => this.put_BlockUnRatedDelay(value)
    }

    /**
     * The get_EvalRatObjOK method queries whether the EvalRat object was created successfully.
     * @returns {HRESULT} Receives an <b>HRESULT</b> value. The <b>HRESULT</b> is the value that was returned when the filter called <b>CoCreateInstance</b> to create the <b>EvalRat</b> object. If it equals S_OK, the <b>EvalRat</b> object was created successfully.
     * @see https://learn.microsoft.com/windows/win32/api/encdec/nf-encdec-idtfilter-get_evalratobjok
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
     * @see https://learn.microsoft.com/windows/win32/api/encdec/nf-encdec-idtfilter-getcurrrating
     */
    GetCurrRating(pEnSystem, pEnRating, plbfEnAttr) {
        pEnSystemMarshal := pEnSystem is VarRef ? "int*" : "ptr"
        pEnRatingMarshal := pEnRating is VarRef ? "int*" : "ptr"
        plbfEnAttrMarshal := plbfEnAttr is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, pEnSystemMarshal, pEnSystem, pEnRatingMarshal, pEnRating, plbfEnAttrMarshal, plbfEnAttr, "HRESULT")
        return result
    }

    /**
     * The get_BlockedRatingAttributes method determines whether content is blocked for a given rating system and rating level.
     * @remarks
     * The filter passes this call through to the <b>EvalRat</b> object. For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tvratings/nf-tvratings-ievalrat-get_blockedratingattributes">IEvalRat::get_BlockedRatingAttributes</a>.
     * @param {EnTvRat_System} enSystem Specifies the rating system as an <a href="https://docs.microsoft.com/previous-versions/dd375612(v=vs.85)">EnTvRat_System</a> enumeration type.
     * @param {EnTvRat_GenericLevel} enLevel Specifies the rating level as an <a href="https://docs.microsoft.com/previous-versions/dd375610(v=vs.85)">EnTvRat_GenericLevel</a> enumeration type.
     * @returns {Integer} Receives a bitwise combination of flags from the <a href="https://docs.microsoft.com/previous-versions/dd318226(v=vs.85)">BfEnTvRat_GenericAttributes</a> enumeration.
     * @see https://learn.microsoft.com/windows/win32/api/encdec/nf-encdec-idtfilter-get_blockedratingattributes
     */
    get_BlockedRatingAttributes(enSystem, enLevel) {
        result := ComCall(5, this, EnTvRat_System, enSystem, EnTvRat_GenericLevel, enLevel, "int*", &plbfEnAttr := 0, "HRESULT")
        return plbfEnAttr
    }

    /**
     * The put_BlockedRatingAttributes method specifies whether to block content that has a specified rating.
     * @remarks
     * The filter passes this call through to the <b>EvalRat</b> object. For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tvratings/nf-tvratings-ievalrat-put_blockedratingattributes">IEvalRat::put_BlockedRatingAttributes</a>.
     * @param {EnTvRat_System} enSystem Specifies the rating system, as an <a href="https://docs.microsoft.com/previous-versions/dd375612(v=vs.85)">EnTvRat_System</a> enumeration type.
     * @param {EnTvRat_GenericLevel} enLevel Specifies the rating level, as an <a href="https://docs.microsoft.com/previous-versions/dd375610(v=vs.85)">EnTvRat_GenericLevel</a> enumeration type.
     * @param {Integer} lbfAttrs Bitwise combination of zero or more flags from the <a href="https://docs.microsoft.com/previous-versions/dd318226(v=vs.85)">BfEnTvRat_GenericAttributes</a> enumeration.
     * @returns {HRESULT} Returns an <b>HRESULT</b>. Possible values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOINTERFACE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>EvalRat</b> object was not successfully created.
     * 
     * </td>
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
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/encdec/nf-encdec-idtfilter-put_blockedratingattributes
     */
    put_BlockedRatingAttributes(enSystem, enLevel, lbfAttrs) {
        result := ComCall(6, this, EnTvRat_System, enSystem, EnTvRat_GenericLevel, enLevel, "int", lbfAttrs, "HRESULT")
        return result
    }

    /**
     * The get_BlockUnRated method indicates whether a program without rating information is blocked.
     * @remarks
     * The filter passes this call through to the <b>EvalRat</b> object. For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tvratings/nf-tvratings-ievalrat-get_blockunrated">IEvalRat::get_BlockUnRated</a>.
     * @returns {BOOL} Receives a Boolean value. If the value is <b>TRUE</b>, unrated shows are blocked. Otherwise, they are not blocked.
     * @see https://learn.microsoft.com/windows/win32/api/encdec/nf-encdec-idtfilter-get_blockunrated
     */
    get_BlockUnRated() {
        result := ComCall(7, this, BOOL.Ptr, &pfBlockUnRatedShows := 0, "HRESULT")
        return pfBlockUnRatedShows
    }

    /**
     * The put_BlockUnRated method specifies whether to block a program for which rating information has not been obtained.
     * @remarks
     * The filter passes this call through to the <b>EvalRat</b> object. For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tvratings/nf-tvratings-ievalrat-put_blockunrated">IEvalRat::put_BlockUnRated</a>.
     * @param {BOOL} fBlockUnRatedShows Boolean value. Specify <b>TRUE</b> to block unrated programs, or specify <b>FALSE</b> not to block unrated programs.
     * @returns {HRESULT} Returns an <b>HRESULT</b>. Possible values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOINTERFACE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>EvalRat</b> object was not successfully created.
     * 
     * </td>
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
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/encdec/nf-encdec-idtfilter-put_blockunrated
     */
    put_BlockUnRated(fBlockUnRatedShows) {
        result := ComCall(8, this, BOOL, fBlockUnRatedShows, "HRESULT")
        return result
    }

    /**
     * The get_BlockUnRatedDelay method retrieves that length of time the filter waits before it blocks unrated content.
     * @remarks
     * Regardless of the value of this property, the filter does not block unrated content unless the <b>BlockUnRated</b> property is <b>TRUE</b>.
     * @returns {Integer} Receives the delay, in milliseconds.
     * @see https://learn.microsoft.com/windows/win32/api/encdec/nf-encdec-idtfilter-get_blockunrateddelay
     */
    get_BlockUnRatedDelay() {
        result := ComCall(9, this, "int*", &pmsecsDelayBeforeBlock := 0, "HRESULT")
        return pmsecsDelayBeforeBlock
    }

    /**
     * The put_BlockUnRatedDelay method sets the length of time the filter waits before it blocks unrated content.
     * @remarks
     * Regardless of the value of this property, the filter does not block unrated content unless the <b>BlockUnRated</b> property is <b>TRUE</b>.
     * @param {Integer} msecsDelayBeforeBlock Specifies the delay, in milliseconds. The value must be from 0 to 60000 (60 seconds).
     * @returns {HRESULT} Returns an <b>HRESULT</b>. Possible values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid argument
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/encdec/nf-encdec-idtfilter-put_blockunrateddelay
     */
    put_BlockUnRatedDelay(msecsDelayBeforeBlock) {
        result := ComCall(10, this, "int", msecsDelayBeforeBlock, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDTFilter.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_EvalRatObjOK := CallbackCreate(GetMethod(implObj, "get_EvalRatObjOK"), flags, 2)
        this.vtbl.GetCurrRating := CallbackCreate(GetMethod(implObj, "GetCurrRating"), flags, 4)
        this.vtbl.get_BlockedRatingAttributes := CallbackCreate(GetMethod(implObj, "get_BlockedRatingAttributes"), flags, 4)
        this.vtbl.put_BlockedRatingAttributes := CallbackCreate(GetMethod(implObj, "put_BlockedRatingAttributes"), flags, 4)
        this.vtbl.get_BlockUnRated := CallbackCreate(GetMethod(implObj, "get_BlockUnRated"), flags, 2)
        this.vtbl.put_BlockUnRated := CallbackCreate(GetMethod(implObj, "put_BlockUnRated"), flags, 2)
        this.vtbl.get_BlockUnRatedDelay := CallbackCreate(GetMethod(implObj, "get_BlockUnRatedDelay"), flags, 2)
        this.vtbl.put_BlockUnRatedDelay := CallbackCreate(GetMethod(implObj, "put_BlockUnRatedDelay"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_EvalRatObjOK)
        CallbackFree(this.vtbl.GetCurrRating)
        CallbackFree(this.vtbl.get_BlockedRatingAttributes)
        CallbackFree(this.vtbl.put_BlockedRatingAttributes)
        CallbackFree(this.vtbl.get_BlockUnRated)
        CallbackFree(this.vtbl.put_BlockUnRated)
        CallbackFree(this.vtbl.get_BlockUnRatedDelay)
        CallbackFree(this.vtbl.put_BlockUnRatedDelay)
    }
}
