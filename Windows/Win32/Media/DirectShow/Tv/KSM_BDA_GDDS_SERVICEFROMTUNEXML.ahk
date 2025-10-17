#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\KernelStreaming\KSIDENTIFIER.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class KSM_BDA_GDDS_SERVICEFROMTUNEXML extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {KSIDENTIFIER}
     */
    Method{
        get {
            if(!this.HasProp("__Method"))
                this.__Method := KSIDENTIFIER(0, this)
            return this.__Method
        }
    }

    /**
     * @type {Integer}
     */
    ulTuneXmlLength {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Array<Byte>}
     */
    argbTuneXml{
        get {
            if(!this.HasProp("__argbTuneXmlProxyArray"))
                this.__argbTuneXmlProxyArray := Win32FixedArray(this.ptr + 20, 1, Primitive, "char")
            return this.__argbTuneXmlProxyArray
        }
    }
}
