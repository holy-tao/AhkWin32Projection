#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMDServiceProvider.ahk

/**
 * The IMDServiceProvider2 interface extends the IMDServiceProvider interface by providing a way of obtaining IMDSPDevice object(s) for a given device path name. The device path name comes from the Plug and Play (PnP) subsystem.
 * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nn-mswmdm-imdserviceprovider2
 * @namespace Windows.Win32.Media.DeviceManager
 * @version v4.0.30319
 */
class IMDServiceProvider2 extends IMDServiceProvider{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMDServiceProvider2
     * @type {Guid}
     */
    static IID => Guid("{b2fa24b7-cda3-4694-9862-413ae1a34819}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 5

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateDevice"]

    /**
     * 
     * @param {PWSTR} pwszDevicePath 
     * @param {Pointer<Integer>} pdwCount 
     * @param {Pointer<Pointer<IMDSPDevice>>} pppDeviceArray 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-imdserviceprovider2-createdevice
     */
    CreateDevice(pwszDevicePath, pdwCount, pppDeviceArray) {
        pwszDevicePath := pwszDevicePath is String ? StrPtr(pwszDevicePath) : pwszDevicePath

        pdwCountMarshal := pdwCount is VarRef ? "uint*" : "ptr"
        pppDeviceArrayMarshal := pppDeviceArray is VarRef ? "ptr*" : "ptr"

        result := ComCall(5, this, "ptr", pwszDevicePath, pdwCountMarshal, pdwCount, pppDeviceArrayMarshal, pppDeviceArray, "HRESULT")
        return result
    }
}
