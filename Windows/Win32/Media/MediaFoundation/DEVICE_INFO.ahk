#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BSTR.ahk

/**
 * Contains information about a media sharing device.
 * @see https://learn.microsoft.com/windows/win32/api/mfsharingengine/ns-mfsharingengine-device_info
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class DEVICE_INFO extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * The friendly name of the device.
     * @type {BSTR}
     */
    pFriendlyDeviceName{
        get {
            if(!this.HasProp("__pFriendlyDeviceName"))
                this.__pFriendlyDeviceName := BSTR(0, this)
            return this.__pFriendlyDeviceName
        }
    }

    /**
     * A string that uniquely identifies the device.
     * @type {BSTR}
     */
    pUniqueDeviceName{
        get {
            if(!this.HasProp("__pUniqueDeviceName"))
                this.__pUniqueDeviceName := BSTR(8, this)
            return this.__pUniqueDeviceName
        }
    }

    /**
     * The manufacturer name.
     * @type {BSTR}
     */
    pManufacturerName{
        get {
            if(!this.HasProp("__pManufacturerName"))
                this.__pManufacturerName := BSTR(16, this)
            return this.__pManufacturerName
        }
    }

    /**
     * The model name.
     * @type {BSTR}
     */
    pModelName{
        get {
            if(!this.HasProp("__pModelName"))
                this.__pModelName := BSTR(24, this)
            return this.__pModelName
        }
    }

    /**
     * The URL of an icon for the device.
     * @type {BSTR}
     */
    pIconURL{
        get {
            if(!this.HasProp("__pIconURL"))
                this.__pIconURL := BSTR(32, this)
            return this.__pIconURL
        }
    }
}
