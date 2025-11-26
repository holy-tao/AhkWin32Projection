#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IWindowsMediaLibrarySharingDeviceProperty.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IWindowsMediaLibrarySharingDeviceProperties interface defines methods that provide access to the collection of all properties for an individual media device.
 * @remarks
 * 
 * To obtain an <b>IWindowsMediaLibrarySharingDeviceProperties</b> interface, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmlss/nf-wmlss-iwindowsmedialibrarysharingdevice-get_properties">get_Properties</a> method of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmlss/nn-wmlss-iwindowsmedialibrarysharingdevice">IWindowsMediaLibrarySharingDevice</a> interface.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wmlss/nn-wmlss-iwindowsmedialibrarysharingdeviceproperties
 * @namespace Windows.Win32.Media.LibrarySharingServices
 * @version v4.0.30319
 */
class IWindowsMediaLibrarySharingDeviceProperties extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWindowsMediaLibrarySharingDeviceProperties
     * @type {Guid}
     */
    static IID => Guid("{c4623214-6b06-40c5-a623-b2ff4c076bfd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Item", "get_Count", "GetProperty"]

    /**
     * @type {Integer} 
     */
    Count {
        get => this.get_Count()
    }

    /**
     * The get_Item method retrieves an IWindowsMediaLibrarySharingDeviceProperty interface that represents an individual property for a media device.
     * @param {Integer} index The zero-based index of the property in the collection of all properties associated with the media device.
     * @returns {IWindowsMediaLibrarySharingDeviceProperty} A pointer to a variable that receives a pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmlss/nn-wmlss-iwindowsmedialibrarysharingdeviceproperty">IWindowsMediaLibrarySharingDeviceProperty</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//wmlss/nf-wmlss-iwindowsmedialibrarysharingdeviceproperties-get_item
     */
    get_Item(index) {
        result := ComCall(7, this, "int", index, "ptr*", &property := 0, "HRESULT")
        return IWindowsMediaLibrarySharingDeviceProperty(property)
    }

    /**
     * The get_Count method retrieves the number of properties associated with an individual media device.
     * @returns {Integer} A pointer to a <b>LONG</b> that receives the number of properties.
     * @see https://docs.microsoft.com/windows/win32/api//wmlss/nf-wmlss-iwindowsmedialibrarysharingdeviceproperties-get_count
     */
    get_Count() {
        result := ComCall(8, this, "int*", &count := 0, "HRESULT")
        return count
    }

    /**
     * The GetProperty method retrieves an IWindowsMediaLibrarySharingDeviceProperty interface that represents an indivdual property for a media device.
     * @param {BSTR} name A <b>BSTR</b> that specifies the name of the property.
     * @returns {IWindowsMediaLibrarySharingDeviceProperty} A pointer to a variable that receives a pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmlss/nn-wmlss-iwindowsmedialibrarysharingdeviceproperty">IWindowsMediaLibrarySharingDeviceProperty</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//wmlss/nf-wmlss-iwindowsmedialibrarysharingdeviceproperties-getproperty
     */
    GetProperty(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(9, this, "ptr", name, "ptr*", &property := 0, "HRESULT")
        return IWindowsMediaLibrarySharingDeviceProperty(property)
    }
}
