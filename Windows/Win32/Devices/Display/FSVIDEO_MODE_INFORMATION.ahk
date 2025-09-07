#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\VIDEO_MODE_INFORMATION.ahk
#Include .\VIDEO_MEMORY_INFORMATION.ahk

/**
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class FSVIDEO_MODE_INFORMATION extends Win32Struct
{
    static sizeof => 112

    static packingSize => 8

    /**
     * @type {VIDEO_MODE_INFORMATION}
     */
    VideoMode{
        get {
            if(!this.HasProp("__VideoMode"))
                this.__VideoMode := VIDEO_MODE_INFORMATION(this.ptr + 0)
            return this.__VideoMode
        }
    }

    /**
     * @type {VIDEO_MEMORY_INFORMATION}
     */
    VideoMemory{
        get {
            if(!this.HasProp("__VideoMemory"))
                this.__VideoMemory := VIDEO_MEMORY_INFORMATION(this.ptr + 80)
            return this.__VideoMemory
        }
    }
}
