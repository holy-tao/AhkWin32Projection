#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * Contains extended font signature information, including two code page bitfields (CPBs) that define the default and supported character sets and code pages. This structure is typically used to represent the relationships between font coverage and locales.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-localesignature
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class LOCALESIGNATURE extends Win32Struct
{
    static sizeof => 32

    static packingSize => 4

    /**
     * A 128-bit Unicode subset bitfield (USB) identifying up to 122 Unicode subranges. Each bit, except the five most significant bits, represents a single subrange. The most significant bit is always 1; the second most significant is reserved and must be 0. Unicode subsets are numbered in accordance with the <a href="https://docs.microsoft.com/windows/desktop/Intl/opentype-font-format">OpenType font specification</a>. For a list of possible bitfield values, see <a href="https://docs.microsoft.com/windows/desktop/Intl/unicode-subset-bitfields">Unicode Subset Bitfields</a>.
     * @type {Array<UInt32>}
     */
    lsUsb{
        get {
            if(!this.HasProp("__lsUsbProxyArray"))
                this.__lsUsbProxyArray := Win32FixedArray(this.ptr + 0, 4, Primitive, "uint")
            return this.__lsUsbProxyArray
        }
    }

    /**
     * A code page bitfield that indicates the default OEM and ANSI code pages for a locale. The code pages can be identified by separate bits or a single bit representing a common ANSI and OEM code page. For a list of possible bitfield values, see <a href="https://docs.microsoft.com/windows/desktop/Intl/code-page-bitfields">Code Page Bitfields</a>.
     * @type {Array<UInt32>}
     */
    lsCsbDefault{
        get {
            if(!this.HasProp("__lsCsbDefaultProxyArray"))
                this.__lsCsbDefaultProxyArray := Win32FixedArray(this.ptr + 16, 2, Primitive, "uint")
            return this.__lsCsbDefaultProxyArray
        }
    }

    /**
     * A code page bitfield that indicates all the code pages in which the locale can be supported. For a list of possible bitfield values, see <a href="https://docs.microsoft.com/windows/desktop/Intl/code-page-bitfields">Code Page Bitfields</a>.
     * @type {Array<UInt32>}
     */
    lsCsbSupported{
        get {
            if(!this.HasProp("__lsCsbSupportedProxyArray"))
                this.__lsCsbSupportedProxyArray := Win32FixedArray(this.ptr + 24, 2, Primitive, "uint")
            return this.__lsCsbSupportedProxyArray
        }
    }
}
