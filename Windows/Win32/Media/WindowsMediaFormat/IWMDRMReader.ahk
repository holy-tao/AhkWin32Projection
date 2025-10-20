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
     * 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    AcquireLicense(dwFlags) {
        result := ComCall(3, this, "uint", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    CancelLicenseAcquisition() {
        result := ComCall(4, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    Individualize(dwFlags) {
        result := ComCall(5, this, "uint", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    CancelIndividualization() {
        result := ComCall(6, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    MonitorLicenseAcquisition() {
        result := ComCall(7, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    CancelMonitorLicenseAcquisition() {
        result := ComCall(8, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwstrName 
     * @param {Integer} dwType 
     * @param {Pointer<Byte>} pValue 
     * @param {Integer} cbLength 
     * @returns {HRESULT} 
     */
    SetDRMProperty(pwstrName, dwType, pValue, cbLength) {
        pwstrName := pwstrName is String ? StrPtr(pwstrName) : pwstrName

        result := ComCall(9, this, "ptr", pwstrName, "int", dwType, "char*", pValue, "ushort", cbLength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwstrName 
     * @param {Pointer<Int32>} pdwType 
     * @param {Pointer<Byte>} pValue 
     * @param {Pointer<UInt16>} pcbLength 
     * @returns {HRESULT} 
     */
    GetDRMProperty(pwstrName, pdwType, pValue, pcbLength) {
        pwstrName := pwstrName is String ? StrPtr(pwstrName) : pwstrName

        result := ComCall(10, this, "ptr", pwstrName, "int*", pdwType, "char*", pValue, "ushort*", pcbLength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
