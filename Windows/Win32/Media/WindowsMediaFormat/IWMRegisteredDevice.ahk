#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\DRM_VAL16.ahk
#Include .\INSSBuffer.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMRegisteredDevice interface is the primary interface of the registered device object. It provides access to information about a playback device in the device registration database.
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmregistereddevice
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMRegisteredDevice extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDeviceSerialNumber", "GetDeviceCertificate", "GetDeviceType", "GetAttributeCount", "GetAttributeByIndex", "GetAttributeByName", "SetAttributeByName", "Approve", "IsValid", "IsApproved", "IsWmdrmCompliant", "IsOpened", "Open", "Close"]

    /**
     * 
     * @returns {DRM_VAL16} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmregistereddevice-getdeviceserialnumber
     */
    GetDeviceSerialNumber() {
        pSerialNumber := DRM_VAL16()
        result := ComCall(3, this, "ptr", pSerialNumber, "HRESULT")
        return pSerialNumber
    }

    /**
     * 
     * @returns {INSSBuffer} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmregistereddevice-getdevicecertificate
     */
    GetDeviceCertificate() {
        result := ComCall(4, this, "ptr*", &ppCertificate := 0, "HRESULT")
        return INSSBuffer(ppCertificate)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmregistereddevice-getdevicetype
     */
    GetDeviceType() {
        result := ComCall(5, this, "uint*", &pdwType := 0, "HRESULT")
        return pdwType
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmregistereddevice-getattributecount
     */
    GetAttributeCount() {
        result := ComCall(6, this, "uint*", &pcAttributes := 0, "HRESULT")
        return pcAttributes
    }

    /**
     * 
     * @param {Integer} dwIndex 
     * @param {Pointer<BSTR>} pbstrName 
     * @param {Pointer<BSTR>} pbstrValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmregistereddevice-getattributebyindex
     */
    GetAttributeByIndex(dwIndex, pbstrName, pbstrValue) {
        result := ComCall(7, this, "uint", dwIndex, "ptr", pbstrName, "ptr", pbstrValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrName 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmregistereddevice-getattributebyname
     */
    GetAttributeByName(bstrName) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        pbstrValue := BSTR()
        result := ComCall(8, this, "ptr", bstrName, "ptr", pbstrValue, "HRESULT")
        return pbstrValue
    }

    /**
     * 
     * @param {BSTR} bstrName 
     * @param {BSTR} bstrValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmregistereddevice-setattributebyname
     */
    SetAttributeByName(bstrName, bstrValue) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName
        bstrValue := bstrValue is String ? BSTR.Alloc(bstrValue).Value : bstrValue

        result := ComCall(9, this, "ptr", bstrName, "ptr", bstrValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fApprove 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmregistereddevice-approve
     */
    Approve(fApprove) {
        result := ComCall(10, this, "int", fApprove, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmregistereddevice-isvalid
     */
    IsValid() {
        result := ComCall(11, this, "int*", &pfValid := 0, "HRESULT")
        return pfValid
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmregistereddevice-isapproved
     */
    IsApproved() {
        result := ComCall(12, this, "int*", &pfApproved := 0, "HRESULT")
        return pfApproved
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmregistereddevice-iswmdrmcompliant
     */
    IsWmdrmCompliant() {
        result := ComCall(13, this, "int*", &pfCompliant := 0, "HRESULT")
        return pfCompliant
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmregistereddevice-isopened
     */
    IsOpened() {
        result := ComCall(14, this, "int*", &pfOpened := 0, "HRESULT")
        return pfOpened
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmregistereddevice-open
     */
    Open() {
        result := ComCall(15, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmregistereddevice-close
     */
    Close() {
        result := ComCall(16, this, "HRESULT")
        return result
    }
}
