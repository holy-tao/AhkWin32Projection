#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the various types of surface formats.
 * @remarks
 * There are several types of formats:
 * 
 * -   [BackBuffer or Display Formats](#backbuffer-or-display-formats)
 * -   [Buffer Formats](#buffer-formats)
 * -   [DXTn Compressed Texture Formats](#dxtn-compressed-texture-formats)
 * -   [Floating-Point Formats](#floating-point-formats)
 * -   [FOURCC Formats](#fourcc-formats)
 * -   [IEEE Formats](#ieee-formats)
 * -   [Mixed Formats](#mixed-formats)
 * -   [Signed Formats](#signed-formats)
 * -   [Unsigned Formats](#unsigned-formats)
 * -   [Other](#other)
 * 
 * All formats are listed from left to right, most-significant bit to least-significant bit. For example, **D3DFORMAT\_ARGB** is ordered from the most-significant bit channel A (alpha), to the least-significant bit channel B (blue). When traversing surface data, the data is stored in memory from least-significant bit to most-significant bit, which means that the channel order in memory is from least-significant bit (blue) to most-significant bit (alpha).
 * 
 * The default value for formats that contain undefined channels (G16R16, A8, and so on) is 1. The only exception is the A8 format, which is initialized to 000 for the three color channels.
 * 
 * The order of the bits is from the most significant byte first, so D3DFMT\_A8L8 indicates that the high byte of this 2-byte format is alpha. **D3DFMT\_D16** indicates a 16-bit integer value and an application-lockable surface.
 * 
 * Pixel formats have been chosen to enable the expression of hardware-vendor-defined extension formats, as well as to include the well-established FOURCC method. The set of formats understood by the Direct3D runtime is defined by D3DFORMAT.
 * 
 * Note that formats are supplied by independent hardware vendors (IHVs) and many FOURCC codes are not listed. The formats in this enumeration are unique in that they are sanctioned by the runtime, meaning that the reference rasterizer will operate on all these types. IHV-supplied formats will be supported by the individual IHVs on a card-by-card basis.
 * @see https://learn.microsoft.com/windows/win32/direct3d9/d3dformat
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class D3DFORMAT extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static D3DFMT_UNKNOWN => 0

    /**
     * @type {Integer (UInt32)}
     */
    static D3DFMT_R8G8B8 => 20

    /**
     * @type {Integer (UInt32)}
     */
    static D3DFMT_A8R8G8B8 => 21

    /**
     * @type {Integer (UInt32)}
     */
    static D3DFMT_X8R8G8B8 => 22

    /**
     * @type {Integer (UInt32)}
     */
    static D3DFMT_R5G6B5 => 23

    /**
     * @type {Integer (UInt32)}
     */
    static D3DFMT_X1R5G5B5 => 24

    /**
     * @type {Integer (UInt32)}
     */
    static D3DFMT_A1R5G5B5 => 25

    /**
     * @type {Integer (UInt32)}
     */
    static D3DFMT_A4R4G4B4 => 26

    /**
     * @type {Integer (UInt32)}
     */
    static D3DFMT_R3G3B2 => 27

    /**
     * @type {Integer (UInt32)}
     */
    static D3DFMT_A8 => 28

    /**
     * @type {Integer (UInt32)}
     */
    static D3DFMT_A8R3G3B2 => 29

    /**
     * @type {Integer (UInt32)}
     */
    static D3DFMT_X4R4G4B4 => 30

    /**
     * @type {Integer (UInt32)}
     */
    static D3DFMT_A2B10G10R10 => 31

    /**
     * @type {Integer (UInt32)}
     */
    static D3DFMT_A8B8G8R8 => 32

    /**
     * @type {Integer (UInt32)}
     */
    static D3DFMT_X8B8G8R8 => 33

    /**
     * @type {Integer (UInt32)}
     */
    static D3DFMT_G16R16 => 34

    /**
     * @type {Integer (UInt32)}
     */
    static D3DFMT_A2R10G10B10 => 35

    /**
     * @type {Integer (UInt32)}
     */
    static D3DFMT_A16B16G16R16 => 36

    /**
     * @type {Integer (UInt32)}
     */
    static D3DFMT_A8P8 => 40

    /**
     * @type {Integer (UInt32)}
     */
    static D3DFMT_P8 => 41

    /**
     * @type {Integer (UInt32)}
     */
    static D3DFMT_L8 => 50

    /**
     * @type {Integer (UInt32)}
     */
    static D3DFMT_A8L8 => 51

    /**
     * @type {Integer (UInt32)}
     */
    static D3DFMT_A4L4 => 52

    /**
     * @type {Integer (UInt32)}
     */
    static D3DFMT_V8U8 => 60

    /**
     * @type {Integer (UInt32)}
     */
    static D3DFMT_L6V5U5 => 61

    /**
     * @type {Integer (UInt32)}
     */
    static D3DFMT_X8L8V8U8 => 62

    /**
     * @type {Integer (UInt32)}
     */
    static D3DFMT_Q8W8V8U8 => 63

    /**
     * @type {Integer (UInt32)}
     */
    static D3DFMT_V16U16 => 64

    /**
     * @type {Integer (UInt32)}
     */
    static D3DFMT_A2W10V10U10 => 67

    /**
     * @type {Integer (UInt32)}
     */
    static D3DFMT_UYVY => 1498831189

    /**
     * @type {Integer (UInt32)}
     */
    static D3DFMT_R8G8_B8G8 => 1195525970

    /**
     * @type {Integer (UInt32)}
     */
    static D3DFMT_YUY2 => 844715353

    /**
     * @type {Integer (UInt32)}
     */
    static D3DFMT_G8R8_G8B8 => 1111970375

    /**
     * @type {Integer (UInt32)}
     */
    static D3DFMT_DXT1 => 827611204

    /**
     * @type {Integer (UInt32)}
     */
    static D3DFMT_DXT2 => 844388420

    /**
     * @type {Integer (UInt32)}
     */
    static D3DFMT_DXT3 => 861165636

    /**
     * @type {Integer (UInt32)}
     */
    static D3DFMT_DXT4 => 877942852

    /**
     * @type {Integer (UInt32)}
     */
    static D3DFMT_DXT5 => 894720068

    /**
     * @type {Integer (UInt32)}
     */
    static D3DFMT_D16_LOCKABLE => 70

    /**
     * @type {Integer (UInt32)}
     */
    static D3DFMT_D32 => 71

    /**
     * @type {Integer (UInt32)}
     */
    static D3DFMT_D15S1 => 73

    /**
     * @type {Integer (UInt32)}
     */
    static D3DFMT_D24S8 => 75

    /**
     * @type {Integer (UInt32)}
     */
    static D3DFMT_D24X8 => 77

    /**
     * @type {Integer (UInt32)}
     */
    static D3DFMT_D24X4S4 => 79

    /**
     * @type {Integer (UInt32)}
     */
    static D3DFMT_D16 => 80

    /**
     * @type {Integer (UInt32)}
     */
    static D3DFMT_D32F_LOCKABLE => 82

    /**
     * @type {Integer (UInt32)}
     */
    static D3DFMT_D24FS8 => 83

    /**
     * @type {Integer (UInt32)}
     */
    static D3DFMT_D32_LOCKABLE => 84

    /**
     * @type {Integer (UInt32)}
     */
    static D3DFMT_S8_LOCKABLE => 85

    /**
     * @type {Integer (UInt32)}
     */
    static D3DFMT_L16 => 81

    /**
     * @type {Integer (UInt32)}
     */
    static D3DFMT_VERTEXDATA => 100

    /**
     * @type {Integer (UInt32)}
     */
    static D3DFMT_INDEX16 => 101

    /**
     * @type {Integer (UInt32)}
     */
    static D3DFMT_INDEX32 => 102

    /**
     * @type {Integer (UInt32)}
     */
    static D3DFMT_Q16W16V16U16 => 110

    /**
     * @type {Integer (UInt32)}
     */
    static D3DFMT_MULTI2_ARGB8 => 827606349

    /**
     * @type {Integer (UInt32)}
     */
    static D3DFMT_R16F => 111

    /**
     * @type {Integer (UInt32)}
     */
    static D3DFMT_G16R16F => 112

    /**
     * @type {Integer (UInt32)}
     */
    static D3DFMT_A16B16G16R16F => 113

    /**
     * @type {Integer (UInt32)}
     */
    static D3DFMT_R32F => 114

    /**
     * @type {Integer (UInt32)}
     */
    static D3DFMT_G32R32F => 115

    /**
     * @type {Integer (UInt32)}
     */
    static D3DFMT_A32B32G32R32F => 116

    /**
     * @type {Integer (UInt32)}
     */
    static D3DFMT_CxV8U8 => 117

    /**
     * @type {Integer (UInt32)}
     */
    static D3DFMT_A1 => 118

    /**
     * @type {Integer (UInt32)}
     */
    static D3DFMT_A2B10G10R10_XR_BIAS => 119

    /**
     * @type {Integer (UInt32)}
     */
    static D3DFMT_BINARYBUFFER => 199
}
