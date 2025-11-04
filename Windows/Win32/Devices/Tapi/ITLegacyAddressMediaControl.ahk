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
     * 
     * @param {BSTR} pDeviceClass 
     * @param {Pointer<Integer>} pdwSize 
     * @param {Pointer<Pointer<Integer>>} ppDeviceID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itlegacyaddressmediacontrol-getid
     */
    GetID(pDeviceClass, pdwSize, ppDeviceID) {
        pDeviceClass := pDeviceClass is String ? BSTR.Alloc(pDeviceClass).Value : pDeviceClass

        pdwSizeMarshal := pdwSize is VarRef ? "uint*" : "ptr"
        ppDeviceIDMarshal := ppDeviceID is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", pDeviceClass, pdwSizeMarshal, pdwSize, ppDeviceIDMarshal, ppDeviceID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} pDeviceClass 
     * @param {Pointer<Integer>} pdwSize 
     * @param {Pointer<Pointer<Integer>>} ppDeviceConfig 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itlegacyaddressmediacontrol-getdevconfig
     */
    GetDevConfig(pDeviceClass, pdwSize, ppDeviceConfig) {
        pDeviceClass := pDeviceClass is String ? BSTR.Alloc(pDeviceClass).Value : pDeviceClass

        pdwSizeMarshal := pdwSize is VarRef ? "uint*" : "ptr"
        ppDeviceConfigMarshal := ppDeviceConfig is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, "ptr", pDeviceClass, pdwSizeMarshal, pdwSize, ppDeviceConfigMarshal, ppDeviceConfig, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} pDeviceClass 
     * @param {Integer} dwSize 
     * @param {Pointer<Integer>} pDeviceConfig 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itlegacyaddressmediacontrol-setdevconfig
     */
    SetDevConfig(pDeviceClass, dwSize, pDeviceConfig) {
        pDeviceClass := pDeviceClass is String ? BSTR.Alloc(pDeviceClass).Value : pDeviceClass

        pDeviceConfigMarshal := pDeviceConfig is VarRef ? "char*" : "ptr"

        result := ComCall(5, this, "ptr", pDeviceClass, "uint", dwSize, pDeviceConfigMarshal, pDeviceConfig, "HRESULT")
        return result
    }
}
