#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * Contains information identifying the code pages and Unicode subranges for which a given font provides glyphs.
 * @remarks
 * 
 * GDI relies on Windows code pages fitting within a 32-bit value. Furthermore, the highest 2 bits within this value are reserved for GDI internal use and may not be assigned to code pages.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wingdi/ns-wingdi-fontsignature
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class FONTSIGNATURE extends Win32Struct
{
    static sizeof => 24

    static packingSize => 4

    /**
     * A 128-bit Unicode subset bitfield (USB) identifying up to 126 Unicode subranges. Each bit, except the two most significant bits, represents a single subrange. The most significant bit is always 1 and identifies the bitfield as a font signature; the second most significant bit is reserved and must be 0. Unicode subranges are numbered in accordance with the ISO 10646 standard. For more information, see <a href="https://docs.microsoft.com/windows/desktop/Intl/unicode-subset-bitfields">Unicode Subset Bitfields</a>.
     * @type {Array<UInt32>}
     */
    fsUsb{
        get {
            if(!this.HasProp("__fsUsbProxyArray"))
                this.__fsUsbProxyArray := Win32FixedArray(this.ptr + 0, 4, Primitive, "uint")
            return this.__fsUsbProxyArray
        }
    }

    /**
     * A 64-bit, code-page bitfield (CPB) that identifies a specific character set or code page. Code pages are in the lower 32 bits of this bitfield. The high 32 are used for non-Windows code pages. For more information, see <a href="https://docs.microsoft.com/windows/desktop/Intl/code-page-bitfields">Code Page Bitfields</a>.
     * @type {Array<UInt32>}
     */
    fsCsb{
        get {
            if(!this.HasProp("__fsCsbProxyArray"))
                this.__fsCsbProxyArray := Win32FixedArray(this.ptr + 16, 2, Primitive, "uint")
            return this.__fsCsbProxyArray
        }
    }
}
