#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

#Import ".\ICreateDeviceAccessAsync.ahk" { ICreateDeviceAccessAsync }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Devices.DeviceAccess
 */

;@region Functions
/**
 * Creates the object that's used to access a device. The instantiated object implements the IDeviceIoControl and ICreateDeviceAccessAsync interfaces.
 * @param {PWSTR} deviceInterfacePath A valid device interface path for the device that this instance should bind to.
 * @param {Integer} desiredAccess The requested level of access to the device, which can be summarized as read, write, both, or neither (zero).
 *  
 * 
 * 
 * The most commonly used values are <b>GENERIC_READ</b>, <b>GENERIC_WRITE</b>, or both (<b>GENERIC_READ</b> | <b>GENERIC_WRITE</b>). For more information, see <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/generic-access-rights">Generic Access Rights</a>, <a href="https://docs.microsoft.com/windows/desktop/FileIO/file-security-and-access-rights">File Security and Access Rights</a>, <a href="https://docs.microsoft.com/windows/desktop/FileIO/file-access-rights-constants">File Access Rights Constants</a>, <a href="https://docs.microsoft.com/windows/desktop/FileIO/creating-and-opening-files">Creating and Opening Files</a>, and <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-mask">ACCESS_MASK</a>.
 * @returns {ICreateDeviceAccessAsync} Asynchronous interface to control binding for this instance.  For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/deviceaccess/nn-deviceaccess-icreatedeviceaccessasync">ICreateDeviceAccessAsync</a>.
 * @see https://learn.microsoft.com/windows/win32/api/deviceaccess/nf-deviceaccess-createdeviceaccessinstance
 */
export CreateDeviceAccessInstance(deviceInterfacePath, desiredAccess) {
    deviceInterfacePath := deviceInterfacePath is String ? StrPtr(deviceInterfacePath) : deviceInterfacePath

    result := DllCall("deviceaccess.dll\CreateDeviceAccessInstance", "ptr", deviceInterfacePath, "uint", desiredAccess, "ptr*", &createAsync := 0, "HRESULT")
    return ICreateDeviceAccessAsync(createAsync)
}

;@endregion Functions
