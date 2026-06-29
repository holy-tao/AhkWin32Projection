#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\HMIDI.ahk" { HMIDI }
#Import "..\..\Multimedia\MIDIOPENSTRMID.ahk" { MIDIOPENSTRMID }

/**
 * The MIDIOPENDESC structure is a client-filled structure that provides information about how to open a MIDI device.
 * @see https://learn.microsoft.com/windows/win32/api/mmddk/ns-mmddk-midiopendesc
 * @namespace Windows.Win32.Media.Audio.DirectMusic
 */
export default struct MIDIOPENDESC {
    #StructPack 8

    /**
     * Specifies the handle that the client uses to reference the device. This handle is assigned by WINMM. Use this handle when you notify the client with the <a href="https://docs.microsoft.com/previous-versions//ms708182(v=vs.85)">DriverCallback</a> function.
     */
    hMidi : HMIDI

    /**
     * Specifies either the address of a callback function, a window handle, or a task handle, depending on the flags that are specified in the dwParam2 parameter of the <a href="https://docs.microsoft.com/previous-versions/windows/hardware/drivers/ff537541(v=vs.85)">MODM_OPEN</a> message. If this field contains a handle, it is contained in the low-order word.
     */
    dwCallback : IntPtr

    /**
     * Specifies a pointer to a DWORD that contains instance information for the client. This instance information is returned to the client whenever the driver notifies the client by using the <b>DriverCallback</b> function.
     */
    dwInstance : IntPtr

    /**
     * Specifies a device node for the MIDI output device, if it is a Plug and Play (PnP) MIDI device.
     */
    dnDevNode : IntPtr

    /**
     * Specifies the number of stream identifiers, if a stream is open.
     */
    cIds : UInt32

    /**
     * Specifies an array of device identifiers. The number of identifiers is given by the <b>cIds</b> member.
     */
    rgIds : MIDIOPENSTRMID[1]

}
