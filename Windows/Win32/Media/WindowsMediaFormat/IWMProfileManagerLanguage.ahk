#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMProfileManagerLanguage interface controls the language of the system profiles parsed by the profile manager.An IWMProfileManagerLanguage interface exists for every profile manager object.
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmprofilemanagerlanguage
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMProfileManagerLanguage extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMProfileManagerLanguage
     * @type {Guid}
     */
    static IID => Guid("{ba4dcc78-7ee0-4ab8-b27a-dbce8bc51454}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetUserLanguageID", "SetUserLanguageID"]

    /**
     * The GetUserLanguageID method retrieves the language identifier for the system profiles loaded by the profile manager object.
     * @param {Pointer<Integer>} wLangID Pointer to a <b>WORD</b> that receives the language identifier (LANGID) of the language set in the profile manager.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmprofilemanagerlanguage-getuserlanguageid
     */
    GetUserLanguageID(wLangID) {
        wLangIDMarshal := wLangID is VarRef ? "ushort*" : "ptr"

        result := ComCall(3, this, wLangIDMarshal, wLangID, "HRESULT")
        return result
    }

    /**
     * The SetUserLanguageID method sets the language of the system profiles that will be parsed by the profile manager object.
     * @param {Integer} wLangID <b>WORD</b> containing the language identifier (LANGID) of the language you want to use.
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NS_E_NOMATCHING_ELEMENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified LANGID represents a locality not supported by a localized set of system profiles.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmprofilemanagerlanguage-setuserlanguageid
     */
    SetUserLanguageID(wLangID) {
        result := ComCall(4, this, "ushort", wLangID, "HRESULT")
        return result
    }
}
