#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IStream.ahk

/**
 * The IPortableDeviceDataStream interface exposes additional methods on an IStream that is used for data transfers.
 * @see https://learn.microsoft.com/windows/win32/api//content/portabledeviceapi/nn-portabledeviceapi-iportabledevicedatastream
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
     * The GetObjectID method retrieves the object ID of the resource that was written to the device. This method is only valid after calling IStream::Commit on the data stream.
     * @remarks
     * An object ID is created after the object is created on the device. Therefore, a new object that is created by calling <a href="https://docs.microsoft.com/windows/desktop/api/portabledeviceapi/nf-portabledeviceapi-iportabledevicecontent-createobjectwithpropertiesanddata">IPortableDeviceContent::CreateObjectWithPropertiesAndData</a> will not have an ID assigned until the application calls <b>Commit</b> on the data transfer stream.
     * @returns {PWSTR} The ID of the object just transferred to the device.
     * @see https://learn.microsoft.com/windows/win32/api//content/portabledeviceapi/nf-portabledeviceapi-iportabledevicedatastream-getobjectid
     */
    GetObjectID() {
        result := ComCall(14, this, "ptr*", &ppszObjectID := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppszObjectID
    }

    /**
     * The Cancel method cancels a call in progress on this interface.
     * @remarks
     * This method cancels all pending operations on the current device handle, which corresponds to a session associated with an <a href="https://docs.microsoft.com/windows/desktop/api/portabledeviceapi/nn-portabledeviceapi-iportabledevice">IPortableDevice</a> interface. The Windows Portable Devices (WPD) API does not support targeted cancellation of specific operations.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/portabledeviceapi/nf-portabledeviceapi-iportabledevicedatastream-cancel
     */
    Cancel() {
        result := ComCall(15, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
