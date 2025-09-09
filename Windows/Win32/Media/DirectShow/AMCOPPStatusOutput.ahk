#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The AMCOPPStatusOutput structure contains the result of a Certified Output Protection Protocol (COPP) status request.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ns-strmif-amcoppstatusoutput
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class AMCOPPStatusOutput extends Win32Struct
{
    static sizeof => 4088

    static packingSize => 8

    /**
     * Message Authentication Code (MAC) of the status data. The driver will use AES-based one-key CBC MAC (OMAC) to calculate this value.
     * @type {Pointer<Guid>}
     */
    macKDI {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Size of the valid data in the <b>COPPStatus</b> member.
     * @type {Integer}
     */
    cbSizeData {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Buffer that contains the result of the status request.
     * @type {Array<Byte>}
     */
    COPPStatus{
        get {
            if(!this.HasProp("__COPPStatusProxyArray"))
                this.__COPPStatusProxyArray := Win32FixedArray(this.ptr + 12, 4076, Primitive, "char")
            return this.__COPPStatusProxyArray
        }
    }
}
