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
     * The CreateDevice method is called by the Windows Media Device Manager to get the IMDSPDevice object(s) corresponding to the canonical device obtained from the PnP subsystem.
     * @param {PWSTR} pwszDevicePath Pointer to a wide-character null-terminated string containing the device path of the device detected by Windows Media Device Manager. This name is obtained from the PnP subsystem, and is the canonical name plus "$ <i>#</i> ", where <i>#</i> is an auto-incremented number. This name can be passed directly to functions such as <b>CreateFile</b> to gain access to the underlying kernel device object. The service provider should create a wrapper <b>IMDSPDevice</b> object(s) for this device.
     * @param {Pointer<Integer>} pdwCount Pointer to a <b>DWORD</b> containing the number of <b>IMDSPDevice</b> objects that are created.
     * @param {Pointer<Pointer<IMDSPDevice>>} pppDeviceArray An array of <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nn-mswmdm-imdspdevice">IMDSPDevice</a> interfaces representing the devices. Typically, there is only one array element, but a service provider can create more than one <b>IMDSPDevice</b> object corresponding to a device path name if it creates an <b>IMDSPDevice</b> object for each top-level storage. This is subject to change in the future, and the count may be restricted to 1.
     * @returns {HRESULT} If the method succeeds it returns S_OK. If the method fails, it returns the Windows Media Device Manager error codes.
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-imdserviceprovider2-createdevice
     */
    CreateDevice(pwszDevicePath, pdwCount, pppDeviceArray) {
        pwszDevicePath := pwszDevicePath is String ? StrPtr(pwszDevicePath) : pwszDevicePath

        pdwCountMarshal := pdwCount is VarRef ? "uint*" : "ptr"
        pppDeviceArrayMarshal := pppDeviceArray is VarRef ? "ptr*" : "ptr"

        result := ComCall(5, this, "ptr", pwszDevicePath, pdwCountMarshal, pdwCount, pppDeviceArrayMarshal, pppDeviceArray, "HRESULT")
        return result
    }
}
