#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\KernelStreaming\KSIDENTIFIER.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
class KSM_BDA_GDDS_SERVICEFROMTUNEXML extends Win32Struct {
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {KSIDENTIFIER}
     */
    Method {
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
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Array<Integer>}
     */
    argbTuneXml {
        get {
            if(!this.HasProp("__argbTuneXmlProxyArray"))
                this.__argbTuneXmlProxyArray := Win32FixedArray(this.ptr + 28, 1, Primitive, "char")
            return this.__argbTuneXmlProxyArray
        }
    }
}
