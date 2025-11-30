#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class DXGKMDT_OPM_REQUESTED_INFORMATION extends Win32Struct
{
    static sizeof => 4088

    static packingSize => 8

    /**
     * @type {Pointer<DXGKMDT_OPM_OMAC>}
     */
    omac {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    cbRequestedInformationSize {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Array<Byte>}
     */
    abRequestedInformation{
        get {
            if(!this.HasProp("__abRequestedInformationProxyArray"))
                this.__abRequestedInformationProxyArray := Win32FixedArray(this.ptr + 12, 4076, Primitive, "char")
            return this.__abRequestedInformationProxyArray
        }
    }
}
