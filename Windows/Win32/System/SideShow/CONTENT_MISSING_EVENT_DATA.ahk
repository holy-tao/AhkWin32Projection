#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.SideShow
 * @version v4.0.30319
 */
class CONTENT_MISSING_EVENT_DATA extends Win32Struct
{
    static sizeof => 24

    static packingSize => 1

    /**
     * @type {Integer}
     */
    cbContentMissingEventData {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Pointer<Guid>}
     */
    ApplicationId {
        get => NumGet(this, 4, "ptr")
        set => NumPut("ptr", value, this, 4)
    }

    /**
     * @type {Pointer<Guid>}
     */
    EndpointId {
        get => NumGet(this, 12, "ptr")
        set => NumPut("ptr", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    ContentId {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }
}
