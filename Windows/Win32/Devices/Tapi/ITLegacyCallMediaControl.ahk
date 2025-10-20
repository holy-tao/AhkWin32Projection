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
     * 
     * @param {Integer} DigitMode 
     * @returns {HRESULT} 
     */
    DetectDigits(DigitMode) {
        result := ComCall(7, this, "int", DigitMode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} pDigits 
     * @param {Integer} DigitMode 
     * @returns {HRESULT} 
     */
    GenerateDigits(pDigits, DigitMode) {
        pDigits := pDigits is String ? BSTR.Alloc(pDigits).Value : pDigits

        result := ComCall(8, this, "ptr", pDigits, "int", DigitMode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} pDeviceClass 
     * @param {Pointer<UInt32>} pdwSize 
     * @param {Pointer<Byte>} ppDeviceID 
     * @returns {HRESULT} 
     */
    GetID(pDeviceClass, pdwSize, ppDeviceID) {
        pDeviceClass := pDeviceClass is String ? BSTR.Alloc(pDeviceClass).Value : pDeviceClass

        result := ComCall(9, this, "ptr", pDeviceClass, "uint*", pdwSize, "char*", ppDeviceID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lMediaType 
     * @returns {HRESULT} 
     */
    SetMediaType(lMediaType) {
        result := ComCall(10, this, "int", lMediaType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lMediaType 
     * @returns {HRESULT} 
     */
    MonitorMedia(lMediaType) {
        result := ComCall(11, this, "int", lMediaType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
