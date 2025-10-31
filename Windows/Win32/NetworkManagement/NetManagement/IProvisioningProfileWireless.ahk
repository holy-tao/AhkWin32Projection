#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class IProvisioningProfileWireless extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IProvisioningProfileWireless
     * @type {Guid}
     */
    static IID => Guid("{c96fbd51-24dd-11d8-89fb-00904b2ea9c6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateProfile"]

    /**
     * Creates a new user profile.
     * @param {BSTR} bstrXMLWirelessConfigProfile 
     * @param {BSTR} bstrXMLConnectionConfigProfile 
     * @param {Pointer<Guid>} pAdapterInstanceGuid 
     * @param {Pointer<Integer>} pulStatus 
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful, or an error value otherwise, including the following:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller does not have a sufficient permission level to create the profile.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_ALREADY_EXISTS)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A profile already exists for the specified user.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//userenv/nf-userenv-createprofile
     */
    CreateProfile(bstrXMLWirelessConfigProfile, bstrXMLConnectionConfigProfile, pAdapterInstanceGuid, pulStatus) {
        bstrXMLWirelessConfigProfile := bstrXMLWirelessConfigProfile is String ? BSTR.Alloc(bstrXMLWirelessConfigProfile).Value : bstrXMLWirelessConfigProfile
        bstrXMLConnectionConfigProfile := bstrXMLConnectionConfigProfile is String ? BSTR.Alloc(bstrXMLConnectionConfigProfile).Value : bstrXMLConnectionConfigProfile

        result := ComCall(3, this, "ptr", bstrXMLWirelessConfigProfile, "ptr", bstrXMLConnectionConfigProfile, "ptr", pAdapterInstanceGuid, "uint*", pulStatus, "HRESULT")
        return result
    }
}
