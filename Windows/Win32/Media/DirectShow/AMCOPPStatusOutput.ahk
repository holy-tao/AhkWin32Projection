#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * The AMCOPPStatusOutput structure contains the result of a Certified Output Protection Protocol (COPP) status request.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ns-strmif-amcoppstatusoutput
 * @namespace Windows.Win32.Media.DirectShow
 */
class AMCOPPStatusOutput extends Win32Struct {
    static sizeof => 4096

    static packingSize => 4

    /**
     * Message Authentication Code (MAC) of the status data. The driver will use AES-based one-key CBC MAC (OMAC) to calculate this value.
     * @type {Guid}
     */
    macKDI {
        get {
            if(!this.HasProp("__macKDI"))
                this.__macKDI := Guid(0, this)
            return this.__macKDI
        }
    }

    /**
     * Size of the valid data in the <b>COPPStatus</b> member.
     * @type {Integer}
     */
    cbSizeData {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Buffer that contains the result of the status request.
     * @type {Array<Integer>}
     */
    COPPStatus {
        get {
            if(!this.HasProp("__COPPStatusProxyArray"))
                this.__COPPStatusProxyArray := Win32FixedArray(this.ptr + 20, 4076, Primitive, "char")
            return this.__COPPStatusProxyArray
        }
    }
}
