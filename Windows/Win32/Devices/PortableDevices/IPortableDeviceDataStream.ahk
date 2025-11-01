#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IStream.ahk

/**
 * The IPortableDeviceDataStream interface exposes additional methods on an IStream that is used for data transfers.
 * @see https://docs.microsoft.com/windows/win32/api//portabledeviceapi/nn-portabledeviceapi-iportabledevicedatastream
 * @namespace Windows.Win32.Devices.PortableDevices
 * @version v4.0.30319
 */
class IPortableDeviceDataStream extends IStream{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPortableDeviceDataStream
     * @type {Guid}
     */
    static IID => Guid("{88e04db3-1012-4d64-9996-f703a950d3f4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 14

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetObjectID", "Cancel"]

    /**
     * 
     * @param {Pointer<PWSTR>} ppszObjectID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledevicedatastream-getobjectid
     */
    GetObjectID(ppszObjectID) {
        result := ComCall(14, this, "ptr", ppszObjectID, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledevicedatastream-cancel
     */
    Cancel() {
        result := ComCall(15, this, "HRESULT")
        return result
    }
}
