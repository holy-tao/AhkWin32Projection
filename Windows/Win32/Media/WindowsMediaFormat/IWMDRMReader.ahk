#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMDRMReader interface provides methods to configure the DRM component and to manage DRM license acquisition and individualization of client applications.
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmdrmreader
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMDRMReader extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMDRMReader
     * @type {Guid}
     */
    static IID => Guid("{d2827540-3ee7-432c-b14c-dc17f085d3b3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AcquireLicense", "CancelLicenseAcquisition", "Individualize", "CancelIndividualization", "MonitorLicenseAcquisition", "CancelMonitorLicenseAcquisition", "SetDRMProperty", "GetDRMProperty"]

    /**
     * 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmdrmreader-acquirelicense
     */
    AcquireLicense(dwFlags) {
        result := ComCall(3, this, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmdrmreader-cancellicenseacquisition
     */
    CancelLicenseAcquisition() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmdrmreader-individualize
     */
    Individualize(dwFlags) {
        result := ComCall(5, this, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmdrmreader-cancelindividualization
     */
    CancelIndividualization() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmdrmreader-monitorlicenseacquisition
     */
    MonitorLicenseAcquisition() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmdrmreader-cancelmonitorlicenseacquisition
     */
    CancelMonitorLicenseAcquisition() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwstrName 
     * @param {Integer} dwType 
     * @param {Pointer<Integer>} pValue 
     * @param {Integer} cbLength 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmdrmreader-setdrmproperty
     */
    SetDRMProperty(pwstrName, dwType, pValue, cbLength) {
        pwstrName := pwstrName is String ? StrPtr(pwstrName) : pwstrName

        result := ComCall(9, this, "ptr", pwstrName, "int", dwType, "char*", pValue, "ushort", cbLength, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwstrName 
     * @param {Pointer<Integer>} pdwType 
     * @param {Pointer<Integer>} pValue 
     * @param {Pointer<Integer>} pcbLength 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmdrmreader-getdrmproperty
     */
    GetDRMProperty(pwstrName, pdwType, pValue, pcbLength) {
        pwstrName := pwstrName is String ? StrPtr(pwstrName) : pwstrName

        result := ComCall(10, this, "ptr", pwstrName, "int*", pdwType, "char*", pValue, "ushort*", pcbLength, "HRESULT")
        return result
    }
}
