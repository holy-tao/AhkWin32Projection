#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMPLibrarySharingServices interface provides methods to manage library sharing.To use this interface, you must create a remoted instance of the Windows Media Player control.
 * @see https://docs.microsoft.com/windows/win32/api//wmp/nn-wmp-iwmplibrarysharingservices
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPLibrarySharingServices extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMPLibrarySharingServices
     * @type {Guid}
     */
    static IID => Guid("{82cba86b-9f04-474b-a365-d6dd1466e541}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["isLibraryShared", "isLibrarySharingEnabled", "showLibrarySharing"]

    /**
     * The isLibraryShared method retrieves a value indicating whether the user's library is shared.
     * @param {Pointer<VARIANT_BOOL>} pvbShared Pointer to a <b>VARIANT_BOOL</b> that receives the result. <b>VARIANT_TRUE</b> indicates that the user's library is currently shared.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmplibrarysharingservices-islibraryshared
     */
    isLibraryShared(pvbShared) {
        pvbSharedMarshal := pvbShared is VarRef ? "short*" : "ptr"

        result := ComCall(3, this, pvbSharedMarshal, pvbShared, "HRESULT")
        return result
    }

    /**
     * The isLibrarySharingEnabled method retrieves a value indicating whether the user has enabled library sharing in Windows Media Player.
     * @param {Pointer<VARIANT_BOOL>} pvbEnabled Pointer to a <b>VARIANT_BOOL</b> that receives the result. <b>VARIANT_TRUE</b> indicates that the user has enabled library sharing.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmplibrarysharingservices-islibrarysharingenabled
     */
    isLibrarySharingEnabled(pvbEnabled) {
        pvbEnabledMarshal := pvbEnabled is VarRef ? "short*" : "ptr"

        result := ComCall(4, this, pvbEnabledMarshal, pvbEnabled, "HRESULT")
        return result
    }

    /**
     * The showLibrarySharing method displays the Windows Media Player Library Sharing dialog box.
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
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmplibrarysharingservices-showlibrarysharing
     */
    showLibrarySharing() {
        result := ComCall(5, this, "HRESULT")
        return result
    }
}
