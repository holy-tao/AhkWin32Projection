#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Implement this interface to receive notification when a CD or DVD device is added to or removed from the computer.
 * @see https://learn.microsoft.com/windows/win32/api//content/imapi2/nn-imapi2-ddiscmaster2events
 * @namespace Windows.Win32.Storage.Imapi
 * @version v4.0.30319
 */
class DDiscMaster2Events extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for DDiscMaster2Events
     * @type {Guid}
     */
    static IID => Guid("{27354131-7f64-5b0f-8f00-5d77afbe261e}")

    /**
     * The class identifier for DDiscMaster2Events
     * @type {Guid}
     */
    static CLSID => Guid("{27354131-7f64-5b0f-8f00-5d77afbe261e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["NotifyDeviceAdded", "NotifyDeviceRemoved"]

    /**
     * Receives notification when an optical media device is added to the computer.
     * @param {IDispatch} object_ An <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nn-imapi2-idiscmaster2">IDiscMaster2</a> interface that you can use to enumerate the devices on the computer. 
     * 
     * This parameter is a <b>MsftDiscMaster2</b> object in script.
     * @param {BSTR} uniqueId String that contains an identifier that uniquely identifies the optical media device that was added to the computer.
     * @returns {HRESULT} Return values are ignored.
     * @see https://learn.microsoft.com/windows/win32/api//content/imapi2/nf-imapi2-ddiscmaster2events-notifydeviceadded
     */
    NotifyDeviceAdded(object_, uniqueId) {
        if(uniqueId is String) {
            pin := BSTR.Alloc(uniqueId)
            uniqueId := pin.Value
        }

        result := ComCall(7, this, "ptr", object_, "ptr", uniqueId, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Receives notification when an optical media device is removed from the computer.
     * @param {IDispatch} object_ An <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nn-imapi2-idiscmaster2">IDiscMaster2</a> interface that you can use to enumerate the devices on the computer. 
     * 
     * This parameter is a <b>MsftDiscMaster2</b> object in script.
     * @param {BSTR} uniqueId String that contains an identifier that uniquely identifies the optical media device that was added to the computer.
     * @returns {HRESULT} Return values are ignored.
     * @see https://learn.microsoft.com/windows/win32/api//content/imapi2/nf-imapi2-ddiscmaster2events-notifydeviceremoved
     */
    NotifyDeviceRemoved(object_, uniqueId) {
        if(uniqueId is String) {
            pin := BSTR.Alloc(uniqueId)
            uniqueId := pin.Value
        }

        result := ComCall(8, this, "ptr", object_, "ptr", uniqueId, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
