#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMRegisteredDevice interface is the primary interface of the registered device object. It provides access to information about a playback device in the device registration database.
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmregistereddevice
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMRegisteredDevice extends IUnknown{
    /**
     * The interface identifier for IWMRegisteredDevice
     * @type {Guid}
     */
    static IID => Guid("{a4503bec-5508-4148-97ac-bfa75760a70d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<DRM_VAL16>} pSerialNumber 
     * @returns {HRESULT} 
     */
    GetDeviceSerialNumber(pSerialNumber) {
        result := ComCall(3, this, "ptr", pSerialNumber, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<INSSBuffer>} ppCertificate 
     * @returns {HRESULT} 
     */
    GetDeviceCertificate(ppCertificate) {
        result := ComCall(4, this, "ptr", ppCertificate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwType 
     * @returns {HRESULT} 
     */
    GetDeviceType(pdwType) {
        result := ComCall(5, this, "uint*", pdwType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pcAttributes 
     * @returns {HRESULT} 
     */
    GetAttributeCount(pcAttributes) {
        result := ComCall(6, this, "uint*", pcAttributes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwIndex 
     * @param {Pointer<BSTR>} pbstrName 
     * @param {Pointer<BSTR>} pbstrValue 
     * @returns {HRESULT} 
     */
    GetAttributeByIndex(dwIndex, pbstrName, pbstrValue) {
        result := ComCall(7, this, "uint", dwIndex, "ptr", pbstrName, "ptr", pbstrValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrName 
     * @param {Pointer<BSTR>} pbstrValue 
     * @returns {HRESULT} 
     */
    GetAttributeByName(bstrName, pbstrValue) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(8, this, "ptr", bstrName, "ptr", pbstrValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrName 
     * @param {BSTR} bstrValue 
     * @returns {HRESULT} 
     */
    SetAttributeByName(bstrName, bstrValue) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName
        bstrValue := bstrValue is String ? BSTR.Alloc(bstrValue).Value : bstrValue

        result := ComCall(9, this, "ptr", bstrName, "ptr", bstrValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} fApprove 
     * @returns {HRESULT} 
     */
    Approve(fApprove) {
        result := ComCall(10, this, "int", fApprove, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfValid 
     * @returns {HRESULT} 
     */
    IsValid(pfValid) {
        result := ComCall(11, this, "ptr", pfValid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfApproved 
     * @returns {HRESULT} 
     */
    IsApproved(pfApproved) {
        result := ComCall(12, this, "ptr", pfApproved, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfCompliant 
     * @returns {HRESULT} 
     */
    IsWmdrmCompliant(pfCompliant) {
        result := ComCall(13, this, "ptr", pfCompliant, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfOpened 
     * @returns {HRESULT} 
     */
    IsOpened(pfOpened) {
        result := ComCall(14, this, "ptr", pfOpened, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Open() {
        result := ComCall(15, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Close() {
        result := ComCall(16, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
