#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The ITLegacyCallMediaControl interface supports legacy applications that must communicate directly with a device. This interface is exposed on the Call Object and can be created by calling QueryInterface on ITBasicCallControl.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nn-tapi3if-itlegacycallmediacontrol
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITLegacyCallMediaControl extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITLegacyCallMediaControl
     * @type {Guid}
     */
    static IID => Guid("{d624582f-cc23-4436-b8a5-47c625c8045d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["DetectDigits", "GenerateDigits", "GetID", "SetMediaType", "MonitorMedia"]

    /**
     * 
     * @param {Integer} DigitMode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itlegacycallmediacontrol-detectdigits
     */
    DetectDigits(DigitMode) {
        result := ComCall(7, this, "int", DigitMode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} pDigits 
     * @param {Integer} DigitMode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itlegacycallmediacontrol-generatedigits
     */
    GenerateDigits(pDigits, DigitMode) {
        pDigits := pDigits is String ? BSTR.Alloc(pDigits).Value : pDigits

        result := ComCall(8, this, "ptr", pDigits, "int", DigitMode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} pDeviceClass 
     * @param {Pointer<Integer>} pdwSize 
     * @param {Pointer<Pointer<Integer>>} ppDeviceID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itlegacycallmediacontrol-getid
     */
    GetID(pDeviceClass, pdwSize, ppDeviceID) {
        pDeviceClass := pDeviceClass is String ? BSTR.Alloc(pDeviceClass).Value : pDeviceClass

        pdwSizeMarshal := pdwSize is VarRef ? "uint*" : "ptr"
        ppDeviceIDMarshal := ppDeviceID is VarRef ? "ptr*" : "ptr"

        result := ComCall(9, this, "ptr", pDeviceClass, pdwSizeMarshal, pdwSize, ppDeviceIDMarshal, ppDeviceID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lMediaType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itlegacycallmediacontrol-setmediatype
     */
    SetMediaType(lMediaType) {
        result := ComCall(10, this, "int", lMediaType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lMediaType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itlegacycallmediacontrol-monitormedia
     */
    MonitorMedia(lMediaType) {
        result := ComCall(11, this, "int", lMediaType, "HRESULT")
        return result
    }
}
