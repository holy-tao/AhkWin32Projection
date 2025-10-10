#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains pointers to the functions called by a client-side DLL to access virtual channels.
 * @see https://docs.microsoft.com/windows/win32/api//cchannel/ns-cchannel-channel_entry_points
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class CHANNEL_ENTRY_POINTS extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * Size, in bytes, of this structure.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Protocol version. Remote Desktop Services sets this member to <b>VIRTUAL_CHANNEL_VERSION_WIN2000</b>.
     * @type {Integer}
     */
    protocolVersion {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/cchannel/nc-cchannel-virtualchannelinit">VirtualChannelInit</a> function.
     * @type {Pointer<PVIRTUALCHANNELINIT>}
     */
    pVirtualChannelInit {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/cchannel/nc-cchannel-virtualchannelopen">VirtualChannelOpen</a> function.
     * @type {Pointer<PVIRTUALCHANNELOPEN>}
     */
    pVirtualChannelOpen {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/cchannel/nc-cchannel-virtualchannelclose">VirtualChannelClose</a> function.
     * @type {Pointer<PVIRTUALCHANNELCLOSE>}
     */
    pVirtualChannelClose {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/cchannel/nc-cchannel-virtualchannelwrite">VirtualChannelWrite</a> function.
     * @type {Pointer<PVIRTUALCHANNELWRITE>}
     */
    pVirtualChannelWrite {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 40
    }
}
