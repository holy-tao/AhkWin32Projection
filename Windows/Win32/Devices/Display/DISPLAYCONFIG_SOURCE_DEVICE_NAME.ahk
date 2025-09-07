#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\LUID.ahk
#Include .\DISPLAYCONFIG_DEVICE_INFO_HEADER.ahk

/**
 * The DISPLAYCONFIG_SOURCE_DEVICE_NAME structure contains the GDI device name for the source or view.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-displayconfig_source_device_name
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class DISPLAYCONFIG_SOURCE_DEVICE_NAME extends Win32Struct
{
    static sizeof => 88

    static packingSize => 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-displayconfig_device_info_header">DISPLAYCONFIG_DEVICE_INFO_HEADER</a> structure that contains information about the request for the source device name. The caller should set the <b>type</b> member of DISPLAYCONFIG_DEVICE_INFO_HEADER to DISPLAYCONFIG_DEVICE_INFO_GET_SOURCE_NAME and the <b>adapterId</b> and <b>id</b> members of DISPLAYCONFIG_DEVICE_INFO_HEADER to the source for which the caller wants the source device name. The caller should set the <b>size</b> member of DISPLAYCONFIG_DEVICE_INFO_HEADER to at least the size of the DISPLAYCONFIG_SOURCE_DEVICE_NAME structure.
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
     * A NULL-terminated WCHAR string that is the GDI device name for the source, or view. This name can be used in a call to <b>EnumDisplaySettings</b> to obtain a list of available modes for the specified source.
     * @type {String}
     */
    viewGdiDeviceName {
        get => StrGet(this.ptr + 24, 31, "UTF-16")
        set => StrPut(value, this.ptr + 24, 31, "UTF-16")
    }
}
