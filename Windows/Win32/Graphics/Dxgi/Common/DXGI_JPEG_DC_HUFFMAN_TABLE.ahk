#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/direct3ddxgi/dxgi-jpeg-dc-huffman-table
 * @namespace Windows.Win32.Graphics.Dxgi.Common
 * @version v4.0.30319
 */
class DXGI_JPEG_DC_HUFFMAN_TABLE extends Win32Struct
{
    static sizeof => 24

    static packingSize => 1

    /**
     * @type {Array<Byte>}
     */
    CodeCounts{
        get {
            if(!this.HasProp("__CodeCountsProxyArray"))
                this.__CodeCountsProxyArray := Win32FixedArray(this.ptr + 0, 12, Primitive, "char")
            return this.__CodeCountsProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    CodeValues{
        get {
            if(!this.HasProp("__CodeValuesProxyArray"))
                this.__CodeValuesProxyArray := Win32FixedArray(this.ptr + 12, 12, Primitive, "char")
            return this.__CodeValuesProxyArray
        }
    }
}
