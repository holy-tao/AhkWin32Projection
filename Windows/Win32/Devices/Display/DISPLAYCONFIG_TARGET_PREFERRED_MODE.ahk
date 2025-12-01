#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\LUID.ahk
#Include .\DISPLAYCONFIG_DEVICE_INFO_HEADER.ahk
#Include .\DISPLAYCONFIG_RATIONAL.ahk
#Include .\DISPLAYCONFIG_2DREGION.ahk
#Include .\DISPLAYCONFIG_VIDEO_SIGNAL_INFO.ahk
#Include .\DISPLAYCONFIG_TARGET_MODE.ahk

/**
 * The DISPLAYCONFIG_TARGET_PREFERRED_MODE structure contains information about the preferred mode of a display.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-displayconfig_target_preferred_mode
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class DISPLAYCONFIG_TARGET_PREFERRED_MODE extends Win32Struct
{
    static sizeof => 80

    static packingSize => 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-displayconfig_device_info_header">DISPLAYCONFIG_DEVICE_INFO_HEADER</a> structure that contains information about the request for the target preferred mode. The caller should set the <b>type</b> member of DISPLAYCONFIG_DEVICE_INFO_HEADER to DISPLAYCONFIG_DEVICE_INFO_GET_TARGET_PREFERRED_MODE and the <b>adapterId</b> and <b>id</b> members of DISPLAYCONFIG_DEVICE_INFO_HEADER to the target for which the caller wants the preferred mode. The caller should set the <b>size</b> member of DISPLAYCONFIG_DEVICE_INFO_HEADER to at least the size of the DISPLAYCONFIG_TARGET_PREFERRED_MODE structure.
     * @type {DISPLAYCONFIG_DEVICE_INFO_HEADER}
     */
    header{
        get {
            if(!this.HasProp("__header"))
                this.__header := DISPLAYCONFIG_DEVICE_INFO_HEADER(0, this)
            return this.__header
        }
    }

    /**
     * The width in pixels of the best mode for the monitor that is connected to the target that the <b>targetMode</b> member specifies.
     * @type {Integer}
     */
    width {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * The height in pixels of the best mode for the monitor that is connected to the target that the <b>targetMode</b> member specifies.
     * @type {Integer}
     */
    height {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-displayconfig_target_mode">DISPLAYCONFIG_TARGET_MODE</a> structure that describes the best target mode for the monitor that is connected to the specified target.
     * @type {DISPLAYCONFIG_TARGET_MODE}
     */
    targetMode{
        get {
            if(!this.HasProp("__targetMode"))
                this.__targetMode := DISPLAYCONFIG_TARGET_MODE(32, this)
            return this.__targetMode
        }
    }
}
