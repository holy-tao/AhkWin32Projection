#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IWMPSettings.ahk

/**
 * The IWMPSettings2 interface provides methods that supplement the IWMPSettings interface.
 * @see https://docs.microsoft.com/windows/win32/api//wmp/nn-wmp-iwmpsettings2
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPSettings2 extends IWMPSettings{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMPSettings2
     * @type {Guid}
     */
    static IID => Guid("{fda937a4-eece-4da5-a0b6-39bf89ade2c2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 30

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_defaultAudioLanguage", "get_mediaAccessRights", "requestMediaAccessRights"]

    /**
     */
    defaultAudioLanguage {
        get => this.get_defaultAudioLanguage()
    }

    /**
     */
    mediaAccessRights {
        get => this.get_mediaAccessRights()
    }

    /**
     * The get_defaultAudioLanguage method retrieves the LCID of the default audio language specified in Windows Media Player.
     * @param {Pointer<Integer>} plLangID Pointer to a <b>long</b> containing the LCID.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpsettings2-get_defaultaudiolanguage
     */
    get_defaultAudioLanguage(plLangID) {
        plLangIDMarshal := plLangID is VarRef ? "int*" : "ptr"

        result := ComCall(30, this, plLangIDMarshal, plLangID, "HRESULT")
        return result
    }

    /**
     * The get_mediaAccessRights method retrieves a value indicating the permissions currently granted for library access.
     * @param {Pointer<BSTR>} pbstrRights 
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
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpsettings2-get_mediaaccessrights
     */
    get_mediaAccessRights(pbstrRights) {
        result := ComCall(31, this, "ptr", pbstrRights, "HRESULT")
        return result
    }

    /**
     * The requestMediaAccessRights method requests a specified level of access to the library.
     * @param {BSTR} bstrDesiredAccess 
     * @param {Pointer<VARIANT_BOOL>} pvbAccepted Pointer to a <b>VARIANT_BOOL</b> indicating whether the requested access rights were granted.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpsettings2-requestmediaaccessrights
     */
    requestMediaAccessRights(bstrDesiredAccess, pvbAccepted) {
        bstrDesiredAccess := bstrDesiredAccess is String ? BSTR.Alloc(bstrDesiredAccess).Value : bstrDesiredAccess

        pvbAcceptedMarshal := pvbAccepted is VarRef ? "short*" : "ptr"

        result := ComCall(32, this, "ptr", bstrDesiredAccess, pvbAcceptedMarshal, pvbAccepted, "HRESULT")
        return result
    }
}
