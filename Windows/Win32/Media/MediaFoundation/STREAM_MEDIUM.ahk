#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Not for application use.
 * @remarks
 * 
 * This structure is used internally by the Microsoft Media Foundation AVStream proxy.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mftransform/ns-mftransform-stream_medium
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class STREAM_MEDIUM extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Reserved.
     * @type {Pointer<Guid>}
     */
    gidMedium {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Reserved.
     * @type {Integer}
     */
    unMediumInstance {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
