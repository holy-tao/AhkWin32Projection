#Requires AutoHotkey v2.0.0 64-bit

/**
 * The values of the **BMFORMAT** enumerated type are used by several WCS functions to indicate the format that particular bitmaps are in.
 * @remarks
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//icm/ne-icm-bmformat
 * @namespace Windows.Win32.UI.ColorSystem
 * @version v4.0.30319
 */
class BMFORMAT{

    /**
     * 16 bits per pixel. RGB color space. 5 bits per channel. The most significant bit is ignored.
     * @type {Integer (Int32)}
     */
    static BM_x555RGB => 0

    /**
     * 16 bits per pixel. CIE device-independent XYZ color space. 5 bits per channel. The most significant bit is ignored.
     * @type {Integer (Int32)}
     */
    static BM_x555XYZ => 257

    /**
     * 16 bits per pixel. Yxy color space. 5 bits per channel. The most significant bit is ignored.
     * @type {Integer (Int32)}
     */
    static BM_x555Yxy => 258

    /**
     * 16 bits per pixel. L\*a\*b color space. 5 bits per channel. The most significant bit is ignored.
     * @type {Integer (Int32)}
     */
    static BM_x555Lab => 259

    /**
     * 16 bits per pixel. G3CH color space. 5 bits per channel. The most significant bit is ignored.
     * @type {Integer (Int32)}
     */
    static BM_x555G3CH => 260

    /**
     * 24 bits per pixel maximum. For three channel colors, such as Red,Green,Blue, the total size is 24 bits per pixel. For single channel colors, such as gray, the total size is 8 bits per pixel.
     * @type {Integer (Int32)}
     */
    static BM_RGBTRIPLETS => 2

    /**
     * 24 bits per pixel maximum. For three channel colors, such as Red,Green,Blue, the total size is 24 bits per pixel. For single channel colors, such as gray, the total size is 8 bits per pixel.
     * @type {Integer (Int32)}
     */
    static BM_BGRTRIPLETS => 4

    /**
     * 24 bits per pixel maximum. For three channel, X, Y and Z values, the total size is 24 bits per pixel. For single channel gray scale, the total size is 8 bits per pixel.
     * 
     * > [!Note]  
     * > The [**TranslateBitmapBits**](/windows/win32/api/icm/nf-icm-translatebitmapbits) function does not support [**BM\_XYZTRIPLETS**](/windows/win32/api/icm/ne-icm-bmformat) as an input.
     * @type {Integer (Int32)}
     */
    static BM_XYZTRIPLETS => 513

    /**
     * 24 bits per pixel maximum. For three channel, Y, x and y values, the total size is 24 bits per pixel. For single channel gray scale, the total size is 8 bits per pixel.
     * 
     * > [!Note]  
     * > The [**TranslateBitmapBits**](/windows/win32/api/icm/nf-icm-translatebitmapbits) function does not support [**BM\_YxyTRIPLETS**](/windows/win32/api/icm/ne-icm-bmformat) as an input.
     * @type {Integer (Int32)}
     */
    static BM_YxyTRIPLETS => 514

    /**
     * 24 bits per pixel maximum. For three channel, L, a and b values, the total size is 24 bits per pixel. For single channel gray scale, the total size is 8 bits per pixel.
     * @type {Integer (Int32)}
     */
    static BM_LabTRIPLETS => 515

    /**
     * 24 bits per pixel maximum. For three channel values, the total size is 24 bits per pixel. For single channel gray scale, the total size is 8 bits per pixel.
     * @type {Integer (Int32)}
     */
    static BM_G3CHTRIPLETS => 516

    /**
     * 40 bits per pixel. 8 bits apiece are used for each channel.
     * @type {Integer (Int32)}
     */
    static BM_5CHANNEL => 517

    /**
     * 48 bits per pixel. 8 bits apiece are used for each channel.
     * @type {Integer (Int32)}
     */
    static BM_6CHANNEL => 518

    /**
     * 56 bits per pixel. 8 bits apiece are used for each channel.
     * @type {Integer (Int32)}
     */
    static BM_7CHANNEL => 519

    /**
     * 64 bits per pixel. 8 bits apiece are used for each channel.
     * @type {Integer (Int32)}
     */
    static BM_8CHANNEL => 520

    /**
     * 32 bits per pixel. Only the 8 bit gray-scale value is used.
     * @type {Integer (Int32)}
     */
    static BM_GRAY => 521

    /**
     * 32 bits per pixel. 8 bits are used for each color channel. The most significant byte is ignored.
     * @type {Integer (Int32)}
     */
    static BM_xRGBQUADS => 8

    /**
     * 32 bits per pixel. 8 bits are used for each color channel. The most significant byte is ignored.
     * @type {Integer (Int32)}
     */
    static BM_xBGRQUADS => 16

    /**
     * 32 bits per pixel. 8 bits are used for each color channel. The most significant byte is ignored.
     * @type {Integer (Int32)}
     */
    static BM_xG3CHQUADS => 772

    /**
     * 32 bits per pixel. 8 bits are used for each color channel.
     * @type {Integer (Int32)}
     */
    static BM_KYMCQUADS => 773

    /**
     * 32 bits per pixel. 8 bits are used for each color channel.
     * @type {Integer (Int32)}
     */
    static BM_CMYKQUADS => 32

    /**
     * 32 bits per pixel. 10 bits are used for each color channel. The 2 most significant bits are ignored.
     * @type {Integer (Int32)}
     */
    static BM_10b_RGB => 9

    /**
     * 32 bits per pixel. 10 bits are used for each color channel. The 2 most significant bits are ignored.
     * @type {Integer (Int32)}
     */
    static BM_10b_XYZ => 1025

    /**
     * 32 bits per pixel. 10 bits are used for each color channel. The 2 most significant bits are ignored.
     * @type {Integer (Int32)}
     */
    static BM_10b_Yxy => 1026

    /**
     * 32 bits per pixel. 10 bits are used for each color channel. The 2 most significant bits are ignored.
     * @type {Integer (Int32)}
     */
    static BM_10b_Lab => 1027

    /**
     * 32 bits per pixel. 10 bits are used for each color channel. The 2 most significant bits are ignored.
     * @type {Integer (Int32)}
     */
    static BM_10b_G3CH => 1028

    /**
     * 32 bits per pixel. Named color indices. Index numbering begins at 1.
     * @type {Integer (Int32)}
     */
    static BM_NAMED_INDEX => 1029

    /**
     * 48 bits per pixel. Each channel uses 16 bits.
     * @type {Integer (Int32)}
     */
    static BM_16b_RGB => 10

    /**
     * 48 bits per pixel. Each channel uses 16 bits.
     * @type {Integer (Int32)}
     */
    static BM_16b_XYZ => 1281

    /**
     * 48 bits per pixel. Each channel uses 16 bits.
     * @type {Integer (Int32)}
     */
    static BM_16b_Yxy => 1282

    /**
     * 48 bits per pixel. Each channel uses 16 bits.
     * @type {Integer (Int32)}
     */
    static BM_16b_Lab => 1283

    /**
     * 48 bits per pixel. Each channel uses 16 bits.
     * @type {Integer (Int32)}
     */
    static BM_16b_G3CH => 1284

    /**
     * 16 bits per pixel.
     * @type {Integer (Int32)}
     */
    static BM_16b_GRAY => 1285

    /**
     * 16 bits per pixel. 5 bits are used for red, 6 for green, and 5 for blue.
     * @type {Integer (Int32)}
     */
    static BM_565RGB => 1

    /**
     * 96 bits per pixel, 32 bit per channel IEEE floating point.
     * @type {Integer (Int32)}
     */
    static BM_32b_scRGB => 1537

    /**
     * 128 bits per pixel, 32 bit per channel IEEE floating point.
     * @type {Integer (Int32)}
     */
    static BM_32b_scARGB => 1538

    /**
     * 48 bits per pixel, Fixed point integer ranging from -4 to +4 with a sign bit and 2 bit exponent and 13 bit mantissa.
     * @type {Integer (Int32)}
     */
    static BM_S2DOT13FIXED_scRGB => 1539

    /**
     * 64 bits per pixel, Fixed point integer ranging from -4 to +4 with a sign bit and 2 bit exponent and 13 bit mantissa.
     * @type {Integer (Int32)}
     */
    static BM_S2DOT13FIXED_scARGB => 1540

    /**
     * 32 bits per pixel. 10 bits are used for each color channel. The two most significant bits are alpha.
     * @type {Integer (Int32)}
     */
    static BM_R10G10B10A2 => 1793

    /**
     * 32 bits per pixel. 10 bits are used for each color channel. The 10 bits of each color channel are 2.8 fixed point with a -0.75 bias, giving a range of \[-0.76 .. 1.25\]. This range corresponds to \[-0.5 .. 1.5\] in a gamma = 1 space. The two most significant bits are preserved for alpha.
     * 
     * This uses an extended range (XR) sRGB color space. It has the same RGB primaries, white point, and gamma as sRGB.
     * @type {Integer (Int32)}
     */
    static BM_R10G10B10A2_XR => 1794

    /**
     * 64 bits per pixel. Each channel is a 16-bit float. The last WORD is alpha.
     * @type {Integer (Int32)}
     */
    static BM_R16G16B16A16_FLOAT => 1795
}
