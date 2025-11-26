#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IAMDeviceRemoval interface provides a way for the Filter Graph Manager to register for device removal events for a capture device.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-iamdeviceremoval
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IAMDeviceRemoval extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAMDeviceRemoval
     * @type {Guid}
     */
    static IID => Guid("{f90a6130-b658-11d2-ae49-0000f8754b99}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["DeviceInfo", "Reassociate", "Disassociate"]

    /**
     * The DeviceInfo method retrieves information about the device.
     * @param {Pointer<Guid>} pclsidInterfaceClass Receives a GUID that specifies the device interface class.
     * @param {Pointer<PWSTR>} pwszSymbolicLink Receives a pointer to a string that contains the Plug and Play (PnP) device path for the device. The caller must release the string by calling <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>. This parameter can be <b>NULL</b>.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. Otherwise it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamdeviceremoval-deviceinfo
     */
    DeviceInfo(pclsidInterfaceClass, pwszSymbolicLink) {
        pwszSymbolicLinkMarshal := pwszSymbolicLink is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", pclsidInterfaceClass, pwszSymbolicLinkMarshal, pwszSymbolicLink, "HRESULT")
        return result
    }

    /**
     * The Reassociate method reassociates the KsProxy filter with the device. The Filter Graph Manager calls this method if it receives a notification that the device has returned after being removed.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. Otherwise it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamdeviceremoval-reassociate
     */
    Reassociate() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * The Disassociate method disassociates the KsProxy filter from the device by closing the device handle. The Filter Graph Manager calls this method if it receives a notification that the device was removed.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. Otherwise it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamdeviceremoval-disassociate
     */
    Disassociate() {
        result := ComCall(5, this, "HRESULT")
        return result
    }
}
