#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CLUSPROP_SYNTAX.ahk
#Include .\CLUSPROP_VALUE.ahk

/**
 * Describes a binary data value.
 * @remarks
 * Use the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/clusapi/nf-clusapi-clusprop_binary_declare">CLUSPROP_BINARY_DECLARE</a> macro to 
 *      initialize a <b>CLUSPROP_BINARY</b> structure.
 * @see https://learn.microsoft.com/windows/win32/api/clusapi/ns-clusapi-clusprop_binary
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUSPROP_BINARY extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {CLUSPROP_VALUE}
     */
    Base{
        get {
            if(!this.HasProp("__Base"))
                this.__Base := CLUSPROP_VALUE(0, this)
            return this.__Base
        }
    }

    /**
     * Array of bytes containing the data.
     * @type {Array<Byte>}
     */
    rgb{
        get {
            if(!this.HasProp("__rgbProxyArray"))
                this.__rgbProxyArray := Win32FixedArray(this.ptr + 16, 1, Primitive, "char")
            return this.__rgbProxyArray
        }
    }
}
