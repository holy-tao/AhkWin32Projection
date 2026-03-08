#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * The IEvalRat interface is used to evaluate content ratings carried by a broadcast stream.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IEvalRat)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/tvratings/nn-tvratings-ievalrat
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
     * @remarks
     * If the <b>BfIsBlocked</b> flag is set, all content with the specified rating level will be blocked. If one of the <b>BfIsAttr_X</b> flags is set, any content with that rating level and attribute will be blocked.
     * @param {Integer} enSystem Specifies the rating system, as an <a href="https://docs.microsoft.com/previous-versions/dd375612(v=vs.85)">EnTvRat_System</a> enumeration type.
     * @param {Integer} enLevel Specifies the rating level, as an <a href="https://docs.microsoft.com/previous-versions/dd375610(v=vs.85)">EnTvRat_GenericLevel</a> enumeration type. The meaning of this value depends on the rating system.
     * @returns {Integer} [out, retval] Receives a bitwise combination of flags from the <a href="https://docs.microsoft.com/previous-versions/dd318226(v=vs.85)">BfEnTvRat_GenericAttributes</a> enumeration. The flags indicate whether the overall rating is blocked, or specific attributes within the rating are blocked.
     * @see https://learn.microsoft.com/windows/win32/api/tvratings/nf-tvratings-ievalrat-get_blockedratingattributes
     */
    get_BlockedRatingAttributes(enSystem, enLevel) {
        result := ComCall(7, this, "int", enSystem, "int", enLevel, "int*", &plbfAttrs := 0, "HRESULT")
        return plbfAttrs
    }

    /**
     * The put_BlockedRatingAttributes method specifies whether to block content that has a specified rating.
     * @remarks
     * This method should be called once for each level in a rating system, to specify viewing permissions for that level. The <i>lbfAttrs</i> parameter indicates the permissions for the specified rating level:
     * 
     * <ul>
     * <li>If no flags are set, this rating level is unrestricted. Any program with this rating level can be viewed.</li>
     * <li>If the <b>BflsBlocked</b> flag is set, this rating level is restricted. No program with this rating level can be viewed.</li>
     * <li>Flags in the range <b>BfIsAttr_1</b> to <b>BfIsAttr_7</b> specify content attributes, such as violence or adult language. If one of these flags is set, it means that a program with that content attribute and the specified rating level will be blocked.</li>
     * </ul>
     * @param {Integer} enSystem Specifies the rating system, as an <a href="https://docs.microsoft.com/previous-versions/dd375612(v=vs.85)">EnTvRat_System</a> enumeration type.
     * @param {Integer} enLevel Specifies the rating level, as an <a href="https://docs.microsoft.com/previous-versions/dd375610(v=vs.85)">EnTvRat_GenericLevel</a> enumeration type. The meaning of this value depends on the rating system.
     * @param {Integer} lbfAttrs Bitwise combination of zero or more flags from the <a href="https://docs.microsoft.com/previous-versions/dd318226(v=vs.85)">BfEnTvRat_GenericAttributes</a> enumeration. The flags specify whether the overall rating is blocked, or specific attributes within the rating are blocked.
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
     * @see https://learn.microsoft.com/windows/win32/api/tvratings/nf-tvratings-ievalrat-put_blockedratingattributes
     */
    put_BlockedRatingAttributes(enSystem, enLevel, lbfAttrs) {
        result := ComCall(8, this, "int", enSystem, "int", enLevel, "int", lbfAttrs, "HRESULT")
        return result
    }

    /**
     * The get_BlockUnRated method indicates whether a program without rating information is blocked.
     * @remarks
     * <div class="alert"><b>Note</b>  By default, unrated programs should be allowed. Return <b>FALSE</b> in <i>pfBlockUnRatedShows</i> unless the <b>put_BlockUnRated</b> method was previously called with the value <b>TRUE</b>.</div>
     * <div> </div>
     * @returns {BOOL} Receives a Boolean value. If the value is <b>TRUE</b>, unrated shows are blocked. Otherwise, they are not blocked.
     * @see https://learn.microsoft.com/windows/win32/api/tvratings/nf-tvratings-ievalrat-get_blockunrated
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
     * @see https://learn.microsoft.com/windows/win32/api/tvratings/nf-tvratings-ievalrat-put_blockunrated
     */
    put_BlockUnRated(fBlockUnRatedShows) {
        result := ComCall(10, this, "int", fBlockUnRatedShows, "HRESULT")
        return result
    }

    /**
     * The MostRestrictiveRating method compares two ratings and returns the more restrictive of the two.
     * @remarks
     * This method enables the client to determine which of two ratings is more restrictive. For example, in the MPAA system, PG is more restrictive than R. The more restrictive rating is returned in the <i>penSystem</i>, <i>penEnLevel</i>, and <i>plbfEnAttr</i> parameters.
     * 
     * When the method compares ratings from two different ratings systems, it returns a rating expressed in the first system, unless the first system is unknown (TvRat_SystemDontKnow). In that case, it returns a rating using the second system.
     * 
     * The method returns S_FALSE if the ratings systems are not the same. There may not be an exact mapping between the two systems.
     * @param {Integer} enSystem1 The rating system of the first rating to compare, specified as a member of the <a href="https://docs.microsoft.com/previous-versions/dd375612(v=vs.85)">EnTvRat_System</a> enumeration.
     * @param {Integer} enEnLevel1 The rating level of the first rating, specified as a member of the <a href="https://docs.microsoft.com/previous-versions/dd375610(v=vs.85)">EnTvRat_GenericLevel</a> enumeration.
     * @param {Integer} lbfEnAttr1 Specifies the content attributes of the first rating, as a bitwise combination of flags from the <a href="https://docs.microsoft.com/previous-versions/dd318226(v=vs.85)">BfEnTvRat_GenericAttributes</a> enumeration.
     * @param {Integer} enSystem2 The rating system of the second rating to compare, specified as a member of the <a href="https://docs.microsoft.com/previous-versions/dd375612(v=vs.85)">EnTvRat_System</a> enumeration.
     * @param {Integer} enEnLevel2 The rating level of the second rating, specified as a member of the <a href="https://docs.microsoft.com/previous-versions/dd375610(v=vs.85)">EnTvRat_GenericLevel</a> enumeration.
     * @param {Integer} lbfEnAttr2 Specifies the content attributes of the second rating, as a bitwise combination of flags from the <a href="https://docs.microsoft.com/previous-versions/dd318226(v=vs.85)">BfEnTvRat_GenericAttributes</a> enumeration.
     * @param {Pointer<Integer>} penSystem Receives the rating system of the more restrictive rating.
     * @param {Pointer<Integer>} penEnLevel Receives the rating level of the more restrictive rating.
     * @param {Pointer<Integer>} plbfEnAttr Receives a bitwise combination of flags from the <a href="https://docs.microsoft.com/previous-versions/dd318226(v=vs.85)">BfEnTvRat_GenericAttributes</a> enumeration.
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
     * @see https://learn.microsoft.com/windows/win32/api/tvratings/nf-tvratings-ievalrat-mostrestrictiverating
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
     * @remarks
     * The application sets viewing permissions through the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tvratings/nf-tvratings-ievalrat-put_blockedratingattributes">IEvalRat::put_BlockedRatingAttributes</a> method. Whenever the Decrypter/Detagger filter receives a new rating in a program, it calls <b>TestRating</b> to determine whether to block the program. If <b>TestRating</b> returns S_OK, the rating is restricted under the current set of viewing permissions, and the Decrypter/Tagger filter blocks the program.
     * 
     * <h3><a id="Implementation_Note_"></a><a id="implementation_note_"></a><a id="IMPLEMENTATION_NOTE_"></a>Implementation Note:</h3>
     * For each supported rating system, store a table that contains bitmasks for each level within that system. On object creation, initialize each bitmask to zero. Update the bitmasks in the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/encdec/nf-encdec-idtfilter-put_blockedratingattributes">put_BlockedRatingAttributes</a> method.
     * 
     * In the <b>TestRating</b> method, use the <i>enShowSystem</i> and <i>enShowLevel</i> parameters to perform a table lookup and get the corresponding bitmask. Return S_FALSE if either of the following tests are true:
     * 
     * <ul>
     * <li>The <b>BfIsBlocked</b> flag is set in the bitmask</li>
     * <li>Any attribute flag in <i>lbfEnShowAttributes</i> is also set in the bitmask.</li>
     * </ul>
     * Use a bitwise <b>AND</b> to test the bitmask. If neither test is true, return S_OK.
     * 
     * The following code shows a possible implementation. It assumes that the object stores the bitmasks in a two-dimensional array named Mask:
     * 
     * 
     * ```cpp
     * 
     * if ((0 != Mask[system][level] & BfIsBlocked) || 
     *     (0 != Mask[system][level] & attributes))
     * {
     *     return S_FALSE; // Blocked.
     * }
     * else
     * {
     *     return S_OK; // Not blocked.
     * }
     * 
     * ```
     * @param {Integer} enShowSystem Specifies the rating system, as an <a href="https://docs.microsoft.com/previous-versions/dd375612(v=vs.85)">EnTvRat_System</a> enumeration type.
     * @param {Integer} enShowLevel Specifies the rating level, as an <a href="https://docs.microsoft.com/previous-versions/dd375610(v=vs.85)">EnTvRat_GenericLevel</a> enumeration type. The meaning of this value depends on the rating system.
     * @param {Integer} lbfEnShowAttributes Bitwise combination of zero or more flags from the <a href="https://docs.microsoft.com/previous-versions/dd318226(v=vs.85)">BfEnTvRat_GenericAttributes</a> enumeration. The flags specify content attributes, such as violence or adult language. Content attributes do not apply to all rating systems.
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
     * @see https://learn.microsoft.com/windows/win32/api/tvratings/nf-tvratings-ievalrat-testrating
     */
    TestRating(enShowSystem, enShowLevel, lbfEnShowAttributes) {
        result := ComCall(12, this, "int", enShowSystem, "int", enShowLevel, "int", lbfEnShowAttributes, "HRESULT")
        return result
    }
}
