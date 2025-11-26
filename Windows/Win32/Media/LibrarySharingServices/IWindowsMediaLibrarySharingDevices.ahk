#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IWindowsMediaLibrarySharingDevice.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IWindowsMediaLibrarySharingDevices.
 * @remarks
 * 
 * To obtain an <b>IWindowsMediaLibrarySharingDevices</b> interface, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmlss/nf-wmlss-iwindowsmedialibrarysharingservices-getalldevices">getAllDevices</a> method of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmlss/nn-wmlss-iwindowsmedialibrarysharingservices">IWindowsMediaLibrarySharingServices</a> interface.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wmlss/nn-wmlss-iwindowsmedialibrarysharingdevices
 * @namespace Windows.Win32.Media.LibrarySharingServices
 * @version v4.0.30319
 */
class IWindowsMediaLibrarySharingDevices extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWindowsMediaLibrarySharingDevices
     * @type {Guid}
     */
    static IID => Guid("{1803f9d6-fe6d-4546-bf5b-992fe8ec12d1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Item", "get_Count", "GetDevice"]

    /**
     * @type {Integer} 
     */
    Count {
        get => this.get_Count()
    }

    /**
     * 
     * @param {Integer} index 
     * @returns {IWindowsMediaLibrarySharingDevice} 
     * @see https://learn.microsoft.com/windows/win32/api/wmlss/nf-wmlss-iwindowsmedialibrarysharingdevices-get_item
     */
    get_Item(index) {
        result := ComCall(7, this, "int", index, "ptr*", &device := 0, "HRESULT")
        return IWindowsMediaLibrarySharingDevice(device)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wmlss/nf-wmlss-iwindowsmedialibrarysharingdevices-get_count
     */
    get_Count() {
        result := ComCall(8, this, "int*", &count := 0, "HRESULT")
        return count
    }

    /**
     * 
     * @param {BSTR} deviceID 
     * @returns {IWindowsMediaLibrarySharingDevice} 
     * @see https://learn.microsoft.com/windows/win32/api/wmlss/nf-wmlss-iwindowsmedialibrarysharingdevices-getdevice
     */
    GetDevice(deviceID) {
        deviceID := deviceID is String ? BSTR.Alloc(deviceID).Value : deviceID

        result := ComCall(9, this, "ptr", deviceID, "ptr*", &device := 0, "HRESULT")
        return IWindowsMediaLibrarySharingDevice(device)
    }
}
