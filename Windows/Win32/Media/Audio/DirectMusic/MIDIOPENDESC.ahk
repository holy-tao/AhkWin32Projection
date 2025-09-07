#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\HMIDI.ahk
#Include ..\..\Multimedia\MIDIOPENSTRMID.ahk

/**
 * The MIDIOPENDESC structure is a client-filled structure that provides information about how to open a MIDI device.
 * @see https://learn.microsoft.com/windows/win32/api/mmddk/ns-mmddk-midiopendesc
 * @namespace Windows.Win32.Media.Audio.DirectMusic
 * @version v4.0.30319
 */
class MIDIOPENDESC extends Win32Struct
{
    static sizeof => 44

    static packingSize => 1

    /**
     * Specifies the handle that the client uses to reference the device. This handle is assigned by WINMM. Use this handle when you notify the client with the <a href="https://docs.microsoft.com/previous-versions//ms708182(v=vs.85)">DriverCallback</a> function.
     * @type {HMIDI}
     */
    hMidi{
        get {
            if(!this.HasProp("__hMidi"))
                this.__hMidi := HMIDI(this.ptr + 0)
            return this.__hMidi
        }
    }

    /**
     * Specifies either the address of a callback function, a window handle, or a task handle, depending on the flags that are specified in the dwParam2 parameter of the <a href="https://docs.microsoft.com/previous-versions/windows/hardware/drivers/ff537541(v=vs.85)">MODM_OPEN</a> message. If this field contains a handle, it is contained in the low-order word.
     * @type {Pointer}
     */
    dwCallback {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Specifies a pointer to a DWORD that contains instance information for the client. This instance information is returned to the client whenever the driver notifies the client by using the <b>DriverCallback</b> function.
     * @type {Pointer}
     */
    dwInstance {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Specifies a device node for the MIDI output device, if it is a Plug and Play (PnP) MIDI device.
     * @type {Pointer}
     */
    dnDevNode {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Specifies the number of stream identifiers, if a stream is open.
     * @type {Integer}
     */
    cIds {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Specifies an array of device identifiers. The number of identifiers is given by the <b>cIds</b> member.
     * @type {Array<MIDIOPENSTRMID>}
     */
    rgIds{
        get {
            if(!this.HasProp("__rgIdsProxyArray"))
                this.__rgIdsProxyArray := Win32FixedArray(this.ptr + 36, 8, MIDIOPENSTRMID, "")
            return this.__rgIdsProxyArray
        }
    }
}
