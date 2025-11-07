#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IWindowsMediaLibrarySharingDeviceProperty interface defines methods that provide access to the name and value of an individual property of a media device.
 * @remarks
 * 
  * To obtain an <b>IWindowsMediaLibrarySharingDeviceProperty</b> interface, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmlss/nf-wmlss-iwindowsmedialibrarysharingdeviceproperties-getproperty">GetProperty</a> method or the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmlss/nf-wmlss-iwindowsmedialibrarysharingdeviceproperties-get_item">get_Item</a> method of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmlss/nn-wmlss-iwindowsmedialibrarysharingdeviceproperties">IWindowsMediaLibrarySharingDeviceProperties</a> interface.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wmlss/nn-wmlss-iwindowsmedialibrarysharingdeviceproperty
 * @namespace Windows.Win32.Media.LibrarySharingServices
 * @version v4.0.30319
 */
class IWindowsMediaLibrarySharingDeviceProperty extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWindowsMediaLibrarySharingDeviceProperty
     * @type {Guid}
     */
    static IID => Guid("{81e26927-7a7d-40a7-81d4-bddc02960e3e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Name", "get_Value"]

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wmlss/nf-wmlss-iwindowsmedialibrarysharingdeviceproperty-get_name
     */
    get_Name() {
        name := BSTR()
        result := ComCall(7, this, "ptr", name, "HRESULT")
        return name
    }

    /**
     * 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmlss/nf-wmlss-iwindowsmedialibrarysharingdeviceproperty-get_value
     */
    get_Value() {
        value := VARIANT()
        result := ComCall(8, this, "ptr", value, "HRESULT")
        return value
    }
}
