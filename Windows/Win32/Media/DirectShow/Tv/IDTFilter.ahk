#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * The IDTFilter interface is exposed by the Decrypter/Detagger filter. Applications can use this interface to set the ratings permissions.
 * @remarks
 * 
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IDTFilter)</c>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//encdec/nn-encdec-idtfilter
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IDTFilter extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDTFilter
     * @type {Guid}
     */
    static IID => Guid("{c4c4c4b2-0049-4e2b-98fb-9537f6ce516d}")

    /**
     * The class identifier for DTFilter
     * @type {Guid}
     */
    static CLSID => Guid("{c4c4c4f2-0049-4e2b-98fb-9537f6ce516d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_EvalRatObjOK", "GetCurrRating", "get_BlockedRatingAttributes", "put_BlockedRatingAttributes", "get_BlockUnRated", "put_BlockUnRated", "get_BlockUnRatedDelay", "put_BlockUnRatedDelay"]

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
     * @see https://docs.microsoft.com/windows/win32/api//encdec/nf-encdec-idtfilter-get_evalratobjok
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
     * @see https://docs.microsoft.com/windows/win32/api//encdec/nf-encdec-idtfilter-getcurrrating
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
     * @param {Integer} enSystem Specifies the rating system as an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tvratings/ne-tvratings-entvrat_system">EnTvRat_System</a> enumeration type.
     * @param {Integer} enLevel Specifies the rating level as an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tvratings/ne-tvratings-entvrat_genericlevel">EnTvRat_GenericLevel</a> enumeration type.
     * @returns {Integer} Receives a bitwise combination of flags from the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tvratings/ne-tvratings-bfentvrat_genericattributes">BfEnTvRat_GenericAttributes</a> enumeration.
     * @see https://docs.microsoft.com/windows/win32/api//encdec/nf-encdec-idtfilter-get_blockedratingattributes
     */
    get_BlockedRatingAttributes(enSystem, enLevel) {
        result := ComCall(5, this, "int", enSystem, "int", enLevel, "int*", &plbfEnAttr := 0, "HRESULT")
        return plbfEnAttr
    }

    /**
     * The put_BlockedRatingAttributes method specifies whether to block content that has a specified rating.
     * @param {Integer} enSystem Specifies the rating system, as an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tvratings/ne-tvratings-entvrat_system">EnTvRat_System</a> enumeration type.
     * @param {Integer} enLevel Specifies the rating level, as an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tvratings/ne-tvratings-entvrat_genericlevel">EnTvRat_GenericLevel</a> enumeration type.
     * @param {Integer} lbfAttrs Bitwise combination of zero or more flags from the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tvratings/ne-tvratings-bfentvrat_genericattributes">BfEnTvRat_GenericAttributes</a> enumeration.
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
     * @see https://docs.microsoft.com/windows/win32/api//encdec/nf-encdec-idtfilter-put_blockedratingattributes
     */
    put_BlockedRatingAttributes(enSystem, enLevel, lbfAttrs) {
        result := ComCall(6, this, "int", enSystem, "int", enLevel, "int", lbfAttrs, "HRESULT")
        return result
    }

    /**
     * The get_BlockUnRated method indicates whether a program without rating information is blocked.
     * @returns {BOOL} Receives a Boolean value. If the value is <b>TRUE</b>, unrated shows are blocked. Otherwise, they are not blocked.
     * @see https://docs.microsoft.com/windows/win32/api//encdec/nf-encdec-idtfilter-get_blockunrated
     */
    get_BlockUnRated() {
        result := ComCall(7, this, "int*", &pfBlockUnRatedShows := 0, "HRESULT")
        return pfBlockUnRatedShows
    }

    /**
     * The put_BlockUnRated method specifies whether to block a program for which rating information has not been obtained.
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
     * @see https://docs.microsoft.com/windows/win32/api//encdec/nf-encdec-idtfilter-put_blockunrated
     */
    put_BlockUnRated(fBlockUnRatedShows) {
        result := ComCall(8, this, "int", fBlockUnRatedShows, "HRESULT")
        return result
    }

    /**
     * The get_BlockUnRatedDelay method retrieves that length of time the filter waits before it blocks unrated content.
     * @returns {Integer} Receives the delay, in milliseconds.
     * @see https://docs.microsoft.com/windows/win32/api//encdec/nf-encdec-idtfilter-get_blockunrateddelay
     */
    get_BlockUnRatedDelay() {
        result := ComCall(9, this, "int*", &pmsecsDelayBeforeBlock := 0, "HRESULT")
        return pmsecsDelayBeforeBlock
    }

    /**
     * The put_BlockUnRatedDelay method sets the length of time the filter waits before it blocks unrated content.
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
     * @see https://docs.microsoft.com/windows/win32/api//encdec/nf-encdec-idtfilter-put_blockunrateddelay
     */
    put_BlockUnRatedDelay(msecsDelayBeforeBlock) {
        result := ComCall(10, this, "int", msecsDelayBeforeBlock, "HRESULT")
        return result
    }
}
