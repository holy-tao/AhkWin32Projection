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
     * 
     * @param {BSTR} pDeviceClass 
     * @param {Pointer<UInt32>} pdwSize 
     * @param {Pointer<Byte>} ppDeviceID 
     * @returns {HRESULT} 
     */
    GetID(pDeviceClass, pdwSize, ppDeviceID) {
        pDeviceClass := pDeviceClass is String ? BSTR.Alloc(pDeviceClass).Value : pDeviceClass

        result := ComCall(3, this, "ptr", pDeviceClass, "uint*", pdwSize, "char*", ppDeviceID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} pDeviceClass 
     * @param {Pointer<UInt32>} pdwSize 
     * @param {Pointer<Byte>} ppDeviceConfig 
     * @returns {HRESULT} 
     */
    GetDevConfig(pDeviceClass, pdwSize, ppDeviceConfig) {
        pDeviceClass := pDeviceClass is String ? BSTR.Alloc(pDeviceClass).Value : pDeviceClass

        result := ComCall(4, this, "ptr", pDeviceClass, "uint*", pdwSize, "char*", ppDeviceConfig, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} pDeviceClass 
     * @param {Integer} dwSize 
     * @param {Pointer<Byte>} pDeviceConfig 
     * @returns {HRESULT} 
     */
    SetDevConfig(pDeviceClass, dwSize, pDeviceConfig) {
        pDeviceClass := pDeviceClass is String ? BSTR.Alloc(pDeviceClass).Value : pDeviceClass

        result := ComCall(5, this, "ptr", pDeviceClass, "uint", dwSize, "char*", pDeviceConfig, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
