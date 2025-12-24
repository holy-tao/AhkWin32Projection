#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * The IEvalRat interface is used to evaluate content ratings carried by a broadcast stream.
 * @remarks
 * 
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IEvalRat)</c>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//tvratings/nn-tvratings-ievalrat
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IEvalRat extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEvalRat
     * @type {Guid}
     */
    static IID => Guid("{c5c5c5b1-3abc-11d6-b25b-00c04fa0c026}")

    /**
     * The class identifier for EvalRat
     * @type {Guid}
     */
    static CLSID => Guid("{c5c5c5f1-3abc-11d6-b25b-00c04fa0c026}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_BlockedRatingAttributes", "put_BlockedRatingAttributes", "get_BlockUnRated", "put_BlockUnRated", "MostRestrictiveRating", "TestRating"]

    /**
     * @type {BOOL} 
     */
    BlockUnRated {
        get => this.get_BlockUnRated()
        set => this.put_BlockUnRated(value)
    }

    /**
     * The get_BlockedRatingAttributes method determines whether content is blocked for a given rating system and rating level.
     * @param {Integer} enSystem Specifies the rating system, as an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tvratings/ne-tvratings-entvrat_system">EnTvRat_System</a> enumeration type.
     * @param {Integer} enLevel Specifies the rating level, as an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tvratings/ne-tvratings-entvrat_genericlevel">EnTvRat_GenericLevel</a> enumeration type. The meaning of this value depends on the rating system.
     * @returns {Integer} [out, retval] Receives a bitwise combination of flags from the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tvratings/ne-tvratings-bfentvrat_genericattributes">BfEnTvRat_GenericAttributes</a> enumeration. The flags indicate whether the overall rating is blocked, or specific attributes within the rating are blocked.
     * @see https://docs.microsoft.com/windows/win32/api//tvratings/nf-tvratings-ievalrat-get_blockedratingattributes
     */
    get_BlockedRatingAttributes(enSystem, enLevel) {
        result := ComCall(7, this, "int", enSystem, "int", enLevel, "int*", &plbfAttrs := 0, "HRESULT")
        return plbfAttrs
    }

    /**
     * The put_BlockedRatingAttributes method specifies whether to block content that has a specified rating.
     * @param {Integer} enSystem Specifies the rating system, as an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tvratings/ne-tvratings-entvrat_system">EnTvRat_System</a> enumeration type.
     * @param {Integer} enLevel Specifies the rating level, as an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tvratings/ne-tvratings-entvrat_genericlevel">EnTvRat_GenericLevel</a> enumeration type. The meaning of this value depends on the rating system.
     * @param {Integer} lbfAttrs Bitwise combination of zero or more flags from the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tvratings/ne-tvratings-bfentvrat_genericattributes">BfEnTvRat_GenericAttributes</a> enumeration. The flags specify whether the overall rating is blocked, or specific attributes within the rating are blocked.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include those in the following table.
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
     * @see https://docs.microsoft.com/windows/win32/api//tvratings/nf-tvratings-ievalrat-put_blockedratingattributes
     */
    put_BlockedRatingAttributes(enSystem, enLevel, lbfAttrs) {
        result := ComCall(8, this, "int", enSystem, "int", enLevel, "int", lbfAttrs, "HRESULT")
        return result
    }

    /**
     * The get_BlockUnRated method indicates whether a program without rating information is blocked.
     * @returns {BOOL} Receives a Boolean value. If the value is <b>TRUE</b>, unrated shows are blocked. Otherwise, they are not blocked.
     * @see https://docs.microsoft.com/windows/win32/api//tvratings/nf-tvratings-ievalrat-get_blockunrated
     */
    get_BlockUnRated() {
        result := ComCall(9, this, "int*", &pfBlockUnRatedShows := 0, "HRESULT")
        return pfBlockUnRatedShows
    }

    /**
     * The put_BlockUnRated method specifies whether to block a program for which rating information has not been obtained.
     * @param {BOOL} fBlockUnRatedShows Boolean value. Specify <b>TRUE</b> to block unrated programs, or specify <b>FALSE</b> not to block unrated programs.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include those in the following table.
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
     * @see https://docs.microsoft.com/windows/win32/api//tvratings/nf-tvratings-ievalrat-put_blockunrated
     */
    put_BlockUnRated(fBlockUnRatedShows) {
        result := ComCall(10, this, "int", fBlockUnRatedShows, "HRESULT")
        return result
    }

    /**
     * The MostRestrictiveRating method compares two ratings and returns the more restrictive of the two.
     * @param {Integer} enSystem1 The rating system of the first rating to compare, specified as a member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tvratings/ne-tvratings-entvrat_system">EnTvRat_System</a> enumeration.
     * @param {Integer} enEnLevel1 The rating level of the first rating, specified as a member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tvratings/ne-tvratings-entvrat_genericlevel">EnTvRat_GenericLevel</a> enumeration.
     * @param {Integer} lbfEnAttr1 Specifies the content attributes of the first rating, as a bitwise combination of flags from the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tvratings/ne-tvratings-bfentvrat_genericattributes">BfEnTvRat_GenericAttributes</a> enumeration.
     * @param {Integer} enSystem2 The rating system of the second rating to compare, specified as a member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tvratings/ne-tvratings-entvrat_system">EnTvRat_System</a> enumeration.
     * @param {Integer} enEnLevel2 The rating level of the second rating, specified as a member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tvratings/ne-tvratings-entvrat_genericlevel">EnTvRat_GenericLevel</a> enumeration.
     * @param {Integer} lbfEnAttr2 Specifies the content attributes of the second rating, as a bitwise combination of flags from the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tvratings/ne-tvratings-bfentvrat_genericattributes">BfEnTvRat_GenericAttributes</a> enumeration.
     * @param {Pointer<Integer>} penSystem Receives the rating system of the more restrictive rating.
     * @param {Pointer<Integer>} penEnLevel Receives the rating level of the more restrictive rating.
     * @param {Pointer<Integer>} plbfEnAttr Receives a bitwise combination of flags from the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tvratings/ne-tvratings-bfentvrat_genericattributes">BfEnTvRat_GenericAttributes</a> enumeration.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * NULL pointer argument.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The ratings are from two different rating systems.
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
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//tvratings/nf-tvratings-ievalrat-mostrestrictiverating
     */
    MostRestrictiveRating(enSystem1, enEnLevel1, lbfEnAttr1, enSystem2, enEnLevel2, lbfEnAttr2, penSystem, penEnLevel, plbfEnAttr) {
        penSystemMarshal := penSystem is VarRef ? "int*" : "ptr"
        penEnLevelMarshal := penEnLevel is VarRef ? "int*" : "ptr"
        plbfEnAttrMarshal := plbfEnAttr is VarRef ? "int*" : "ptr"

        result := ComCall(11, this, "int", enSystem1, "int", enEnLevel1, "int", lbfEnAttr1, "int", enSystem2, "int", enEnLevel2, "int", lbfEnAttr2, penSystemMarshal, penSystem, penEnLevelMarshal, penEnLevel, plbfEnAttrMarshal, plbfEnAttr, "HRESULT")
        return result
    }

    /**
     * The TestRating method determines whether a program with the specified rating should be blocked.
     * @param {Integer} enShowSystem Specifies the rating system, as an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tvratings/ne-tvratings-entvrat_system">EnTvRat_System</a> enumeration type.
     * @param {Integer} enShowLevel Specifies the rating level, as an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tvratings/ne-tvratings-entvrat_genericlevel">EnTvRat_GenericLevel</a> enumeration type. The meaning of this value depends on the rating system.
     * @param {Integer} lbfEnShowAttributes Bitwise combination of zero or more flags from the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tvratings/ne-tvratings-bfentvrat_genericattributes">BfEnTvRat_GenericAttributes</a> enumeration. The flags specify content attributes, such as violence or adult language. Content attributes do not apply to all rating systems.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include those in the following table.
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
     * Invalid argument.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This program is restricted and should be blocked.
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
     * This program is allowed and should not be blocked.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//tvratings/nf-tvratings-ievalrat-testrating
     */
    TestRating(enShowSystem, enShowLevel, lbfEnShowAttributes) {
        result := ComCall(12, this, "int", enShowSystem, "int", enShowLevel, "int", lbfEnShowAttributes, "HRESULT")
        return result
    }
}
