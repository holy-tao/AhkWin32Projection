#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 * @charset ANSI
 */
class PRODUCT_INFOA extends Win32Struct
{
    static sizeof => 260

    static packingSize => 1

    /**
     * @type {Array<SByte>}
     */
    CompanyName{
        get {
            if(!this.HasProp("__CompanyNameProxyArray"))
                this.__CompanyNameProxyArray := Win32FixedArray(this.ptr + 0, 256, Primitive, "char")
            return this.__CompanyNameProxyArray
        }
    }

    /**
     * @type {Array<SByte>}
     */
    ProductID{
        get {
            if(!this.HasProp("__ProductIDProxyArray"))
                this.__ProductIDProxyArray := Win32FixedArray(this.ptr + 256, 4, Primitive, "char")
            return this.__ProductIDProxyArray
        }
    }
}
