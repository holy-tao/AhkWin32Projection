#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\LUID.ahk
#Include .\DISPLAYCONFIG_RATIONAL.ahk
#Include .\DISPLAYCONFIG_2DREGION.ahk
#Include .\DISPLAYCONFIG_VIDEO_SIGNAL_INFO.ahk
#Include .\DISPLAYCONFIG_TARGET_MODE.ahk
#Include ..\..\Foundation\POINTL.ahk
#Include .\DISPLAYCONFIG_SOURCE_MODE.ahk
#Include ..\..\Foundation\RECTL.ahk
#Include .\DISPLAYCONFIG_DESKTOP_IMAGE_INFO.ahk

/**
 * The DISPLAYCONFIG_MODE_INFO structure contains either source mode or target mode information.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-displayconfig_mode_info
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class DISPLAYCONFIG_MODE_INFO extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * A value that indicates whether the <b>DISPLAYCONFIG_MODE_INFO</b> structure represents source or target mode information. If <b>infoType</b> is DISPLAYCONFIG_MODE_INFO_TYPE_TARGET, the <i>targetMode</i> parameter value contains a valid DISPLAYCONFIG_TARGET_MODE structure describing the specified target. If <b>infoType</b> is DISPLAYCONFIG_MODE_INFO_TYPE_SOURCE, the <i>sourceMode</i> parameter value contains a valid DISPLAYCONFIG_SOURCE_MODE structure describing the specified source.
     * @type {Integer}
     */
    infoType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The source or target identifier on the specified adapter that this path relates to.
     * @type {Integer}
     */
    id {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The identifier of the adapter that this source or target mode information relates to.
     * @type {LUID}
     */
    adapterId{
        get {
            if(!this.HasProp("__adapterId"))
                this.__adapterId := LUID(8, this)
            return this.__adapterId
        }
    }

    /**
     * @type {DISPLAYCONFIG_TARGET_MODE}
     */
    targetMode{
        get {
            if(!this.HasProp("__targetMode"))
                this.__targetMode := DISPLAYCONFIG_TARGET_MODE(16, this)
            return this.__targetMode
        }
    }

    /**
     * @type {DISPLAYCONFIG_SOURCE_MODE}
     */
    sourceMode{
        get {
            if(!this.HasProp("__sourceMode"))
                this.__sourceMode := DISPLAYCONFIG_SOURCE_MODE(16, this)
            return this.__sourceMode
        }
    }

    /**
     * @type {DISPLAYCONFIG_DESKTOP_IMAGE_INFO}
     */
    desktopImageInfo{
        get {
            if(!this.HasProp("__desktopImageInfo"))
                this.__desktopImageInfo := DISPLAYCONFIG_DESKTOP_IMAGE_INFO(16, this)
            return this.__desktopImageInfo
        }
    }
}
