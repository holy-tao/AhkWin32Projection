#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITfFunction.ahk

/**
 * The ITfFnLangProfileUtil interface is implemented by the speech text service and used to provide utility methods for the speech text service.
 * @see https://docs.microsoft.com/windows/win32/api//ctffunc/nn-ctffunc-itffnlangprofileutil
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfFnLangProfileUtil extends ITfFunction{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITfFnLangProfileUtil
     * @type {Guid}
     */
    static IID => Guid("{a87a8574-a6c1-4e15-99f0-3d3965f548eb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RegisterActiveProfiles", "IsProfileAvailableForLang"]

    /**
     * ITfFnLangProfileUtil::RegisterActiveProfiles method
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method was successful.
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
     * The speech text service removed its active profiles based on user actions.
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
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//ctffunc/nf-ctffunc-itffnlangprofileutil-registeractiveprofiles
     */
    RegisterActiveProfiles() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * ITfFnLangProfileUtil::IsProfileAvailableForLang method
     * @param {Integer} langid Contains a <b>LANGID</b> that specifies the language that the query applies to.
     * @returns {BOOL} Pointer to a <b>BOOL</b> that receives nonzero if a profile is available for the language identified by langid or zero otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//ctffunc/nf-ctffunc-itffnlangprofileutil-isprofileavailableforlang
     */
    IsProfileAvailableForLang(langid) {
        result := ComCall(5, this, "ushort", langid, "int*", &pfAvailable := 0, "HRESULT")
        return pfAvailable
    }
}
