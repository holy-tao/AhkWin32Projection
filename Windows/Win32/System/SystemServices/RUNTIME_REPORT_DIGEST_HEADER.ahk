#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.SystemServices
 * @version v4.0.30319
 */
class RUNTIME_REPORT_DIGEST_HEADER extends Win32Struct
{
    static sizeof => 68

    static packingSize => 2

    /**
     * @type {Integer}
     */
    ReportType {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * @type {Array<Byte>}
     */
    ReportDigest{
        get {
            if(!this.HasProp("__ReportDigestProxyArray"))
                this.__ReportDigestProxyArray := Win32FixedArray(this.ptr + 4, 64, Primitive, "char")
            return this.__ReportDigestProxyArray
        }
    }
}
