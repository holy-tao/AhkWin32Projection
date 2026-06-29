#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains information identifying the code pages and Unicode subranges for which a given font provides glyphs.
 * @remarks
 * GDI relies on Windows code pages fitting within a 32-bit value. Furthermore, the highest 2 bits within this value are reserved for GDI internal use and may not be assigned to code pages.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-fontsignature
 * @namespace Windows.Win32.Globalization
 */
export default struct FONTSIGNATURE {
    #StructPack 4

    /**
     * A 128-bit Unicode subset bitfield (USB) identifying up to 126 Unicode subranges. Each bit, except the two most significant bits, represents a single subrange. The most significant bit is always 1 and identifies the bitfield as a font signature; the second most significant bit is reserved and must be 0. Unicode subranges are numbered in accordance with the ISO 10646 standard. For more information, see <a href="https://docs.microsoft.com/windows/desktop/Intl/unicode-subset-bitfields">Unicode Subset Bitfields</a>.
     */
    fsUsb : UInt32[4]

    /**
     * A 64-bit, code-page bitfield (CPB) that identifies a specific character set or code page. Code pages are in the lower 32 bits of this bitfield. The high 32 are used for non-Windows code pages. For more information, see <a href="https://docs.microsoft.com/windows/desktop/Intl/code-page-bitfields">Code Page Bitfields</a>.
     */
    fsCsb : UInt32[2]

}
