#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\LUID.ahk
#Include .\DISPLAYCONFIG_DEVICE_INFO_HEADER.ahk

/**
 * The DISPLAYCONFIG_ADAPTER_NAME structure contains information about the display adapter.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-displayconfig_adapter_name
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class DISPLAYCONFIG_ADAPTER_NAME extends Win32Struct
{
    static sizeof => 280

    static packingSize => 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-displayconfig_device_info_header">DISPLAYCONFIG_DEVICE_INFO_HEADER</a> structure that contains information about the request for the adapter name. The caller should set the <b>type</b> member of DISPLAYCONFIG_DEVICE_INFO_HEADER to DISPLAYCONFIG_DEVICE_INFO_GET_ADAPTER_NAME and the <b>adapterId</b> member of DISPLAYCONFIG_DEVICE_INFO_HEADER to the adapter identifier of the adapter for which the caller wants the name. For this request, the caller does not need to set the <b>id</b> member of DISPLAYCONFIG_DEVICE_INFO_HEADER. The caller should set the <b>size</b> member of DISPLAYCONFIG_DEVICE_INFO_HEADER to at least the size of the DISPLAYCONFIG_ADAPTER_NAME structure.
     * @type {DISPLAYCONFIG_DEVICE_INFO_HEADER}
     */
    header{
        get {
            if(!this.HasProp("__header"))
                this.__header := DISPLAYCONFIG_DEVICE_INFO_HEADER(this.ptr + 0)
            return this.__header
        }
    }

    /**
     * A NULL-terminated WCHAR string that is the  device name for the adapter. This name can be used with <i>SetupAPI.dll</i> to obtain the device name that is contained in the installation package.
     * @type {String}
     */
    adapterDevicePath {
        get => StrGet(this.ptr + 24, 127, "UTF-16")
        set => StrPut(value, this.ptr + 24, 127, "UTF-16")
    }
}
