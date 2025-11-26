#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITLegacyAddressMediaControl interface is provided to support legacy applications that require direct access to a device and its configuration. It is exposed by the Address Object and can be created by calling QueryInterface on ITAddress.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nn-tapi3if-itlegacyaddressmediacontrol
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITLegacyAddressMediaControl extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITLegacyAddressMediaControl
     * @type {Guid}
     */
    static IID => Guid("{ab493640-4c0b-11d2-a046-00c04fb6809f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetID", "GetDevConfig", "SetDevConfig"]

    /**
     * The GetID method returns a device identifier for the specified device class associated with the current address.
     * @param {BSTR} pDeviceClass Pointer to <b>BSTR</b> containing 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/tapi-device-classes">TAPI device class</a> for which configuration information is needed.
     * @param {Pointer<Integer>} pdwSize Length of device identifier returned.
     * @param {Pointer<Pointer<Integer>>} ppDeviceID Device identifier.
     * @returns {HRESULT} This method can return one of these values.
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
     * Method succeeded.
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
     * Method failed. This may mean there is no device of a specified class associated with the current address.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pdwSize</i> or <i>ppDeviceID</i> parameter is not a valid pointer.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itlegacyaddressmediacontrol-getid
     */
    GetID(pDeviceClass, pdwSize, ppDeviceID) {
        pDeviceClass := pDeviceClass is String ? BSTR.Alloc(pDeviceClass).Value : pDeviceClass

        pdwSizeMarshal := pdwSize is VarRef ? "uint*" : "ptr"
        ppDeviceIDMarshal := ppDeviceID is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", pDeviceClass, pdwSizeMarshal, pdwSize, ppDeviceIDMarshal, ppDeviceID, "HRESULT")
        return result
    }

    /**
     * The GetDevConfig method returns an opaque data structure.
     * @param {BSTR} pDeviceClass Pointer to <b>BSTR</b> containing 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/tapi-device-classes">TAPI device class</a> for which configuration information is needed.
     * @param {Pointer<Integer>} pdwSize Pointer to size of configuration array.
     * @param {Pointer<Pointer<Integer>>} ppDeviceConfig Pointer to array of bytes containing device configuration information.
     * @returns {HRESULT} This method can return one of these values.
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
     * Method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pDeviceClass</i>, <i>pdwSize</i>, or <i>ppDeviceConfig</i> parameter is not a valid pointer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory exists to perform the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itlegacyaddressmediacontrol-getdevconfig
     */
    GetDevConfig(pDeviceClass, pdwSize, ppDeviceConfig) {
        pDeviceClass := pDeviceClass is String ? BSTR.Alloc(pDeviceClass).Value : pDeviceClass

        pdwSizeMarshal := pdwSize is VarRef ? "uint*" : "ptr"
        ppDeviceConfigMarshal := ppDeviceConfig is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, "ptr", pDeviceClass, pdwSizeMarshal, pdwSize, ppDeviceConfigMarshal, ppDeviceConfig, "HRESULT")
        return result
    }

    /**
     * The SetDevConfig function allows the application to restore the configuration of a media stream device on a line device to a setup previously obtained using GetDevConfig.
     * @param {BSTR} pDeviceClass Pointer to <b>BSTR</b> containing 
     * <a href="https://docs.microsoft.com/windows/desktop/Tapi/tapi-device-classes">TAPI device class</a> for which configuration information is needed.
     * @param {Integer} dwSize Size of configuration array.
     * @param {Pointer<Integer>} pDeviceConfig Pointer to the array of bytes containing device configuration information obtained by a call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nf-tapi3if-itlegacyaddressmediacontrol-getdevconfig">GetDevConfig</a>.
     * @returns {HRESULT} This method can return one of these values.
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
     * Method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pDeviceClass</i>, <i>pdwSize</i>, or <i>ppDeviceConfig</i> parameter is not a valid pointer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pdwSize</i> parameter is zero.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory exists to perform the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itlegacyaddressmediacontrol-setdevconfig
     */
    SetDevConfig(pDeviceClass, dwSize, pDeviceConfig) {
        pDeviceClass := pDeviceClass is String ? BSTR.Alloc(pDeviceClass).Value : pDeviceClass

        pDeviceConfigMarshal := pDeviceConfig is VarRef ? "char*" : "ptr"

        result := ComCall(5, this, "ptr", pDeviceClass, "uint", dwSize, pDeviceConfigMarshal, pDeviceConfig, "HRESULT")
        return result
    }
}
