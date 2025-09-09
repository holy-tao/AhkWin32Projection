#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Describes a JPEG AC huffman table.
 * @see https://learn.microsoft.com/windows/win32/direct3ddxgi/dxgi-jpeg-ac-huffman-table
 * @namespace Windows.Win32.Graphics.Dxgi.Common
 * @version v4.0.30319
 */
class DXGI_JPEG_AC_HUFFMAN_TABLE extends Win32Struct
{
    static sizeof => 178

    static packingSize => 1

    /**
     * The number of codes for each code length.
     * @type {Array<Byte>}
     */
    CodeCounts{
        get {
            if(!this.HasProp("__CodeCountsProxyArray"))
                this.__CodeCountsProxyArray := Win32FixedArray(this.ptr + 0, 16, Primitive, "char")
            return this.__CodeCountsProxyArray
        }
    }

    /**
     * The Huffman code values, in order of increasing code length.
     * @type {Array<Byte>}
     */
    CodeValues{
        get {
            if(!this.HasProp("__CodeValuesProxyArray"))
                this.__CodeValuesProxyArray := Win32FixedArray(this.ptr + 16, 162, Primitive, "char")
            return this.__CodeValuesProxyArray
        }
    }
}
