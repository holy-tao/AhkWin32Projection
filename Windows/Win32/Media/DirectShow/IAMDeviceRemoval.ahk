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
     * 
     * @param {Pointer<Guid>} pclsidInterfaceClass 
     * @param {Pointer<PWSTR>} pwszSymbolicLink 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamdeviceremoval-deviceinfo
     */
    DeviceInfo(pclsidInterfaceClass, pwszSymbolicLink) {
        pwszSymbolicLinkMarshal := pwszSymbolicLink is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", pclsidInterfaceClass, pwszSymbolicLinkMarshal, pwszSymbolicLink, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamdeviceremoval-reassociate
     */
    Reassociate() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamdeviceremoval-disassociate
     */
    Disassociate() {
        result := ComCall(5, this, "HRESULT")
        return result
    }
}
