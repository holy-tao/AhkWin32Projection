#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3DDDIFORMAT extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static D3DDDIFMT_UNKNOWN => 0

    /**
     * @type {Integer (UInt32)}
     */
    static D3DDDIFMT_R8G8B8 => 20

    /**
     * @type {Integer (UInt32)}
     */
    static D3DDDIFMT_A8R8G8B8 => 21

    /**
     * @type {Integer (UInt32)}
     */
    static D3DDDIFMT_X8R8G8B8 => 22

    /**
     * @type {Integer (UInt32)}
     */
    static D3DDDIFMT_R5G6B5 => 23

    /**
     * @type {Integer (UInt32)}
     */
    static D3DDDIFMT_X1R5G5B5 => 24

    /**
     * @type {Integer (UInt32)}
     */
    static D3DDDIFMT_A1R5G5B5 => 25

    /**
     * @type {Integer (UInt32)}
     */
    static D3DDDIFMT_A4R4G4B4 => 26

    /**
     * @type {Integer (UInt32)}
     */
    static D3DDDIFMT_R3G3B2 => 27

    /**
     * @type {Integer (UInt32)}
     */
    static D3DDDIFMT_A8 => 28

    /**
     * @type {Integer (UInt32)}
     */
    static D3DDDIFMT_A8R3G3B2 => 29

    /**
     * @type {Integer (UInt32)}
     */
    static D3DDDIFMT_X4R4G4B4 => 30

    /**
     * @type {Integer (UInt32)}
     */
    static D3DDDIFMT_A2B10G10R10 => 31

    /**
     * @type {Integer (UInt32)}
     */
    static D3DDDIFMT_A8B8G8R8 => 32

    /**
     * @type {Integer (UInt32)}
     */
    static D3DDDIFMT_X8B8G8R8 => 33

    /**
     * @type {Integer (UInt32)}
     */
    static D3DDDIFMT_G16R16 => 34

    /**
     * @type {Integer (UInt32)}
     */
    static D3DDDIFMT_A2R10G10B10 => 35

    /**
     * @type {Integer (UInt32)}
     */
    static D3DDDIFMT_A16B16G16R16 => 36

    /**
     * @type {Integer (UInt32)}
     */
    static D3DDDIFMT_A8P8 => 40

    /**
     * @type {Integer (UInt32)}
     */
    static D3DDDIFMT_P8 => 41

    /**
     * @type {Integer (UInt32)}
     */
    static D3DDDIFMT_L8 => 50

    /**
     * @type {Integer (UInt32)}
     */
    static D3DDDIFMT_A8L8 => 51

    /**
     * @type {Integer (UInt32)}
     */
    static D3DDDIFMT_A4L4 => 52

    /**
     * @type {Integer (UInt32)}
     */
    static D3DDDIFMT_V8U8 => 60

    /**
     * @type {Integer (UInt32)}
     */
    static D3DDDIFMT_L6V5U5 => 61

    /**
     * @type {Integer (UInt32)}
     */
    static D3DDDIFMT_X8L8V8U8 => 62

    /**
     * @type {Integer (UInt32)}
     */
    static D3DDDIFMT_Q8W8V8U8 => 63

    /**
     * @type {Integer (UInt32)}
     */
    static D3DDDIFMT_V16U16 => 64

    /**
     * @type {Integer (UInt32)}
     */
    static D3DDDIFMT_W11V11U10 => 65

    /**
     * @type {Integer (UInt32)}
     */
    static D3DDDIFMT_A2W10V10U10 => 67

    /**
     * @type {Integer (UInt32)}
     */
    static D3DDDIFMT_UYVY => 1498831189

    /**
     * @type {Integer (UInt32)}
     */
    static D3DDDIFMT_R8G8_B8G8 => 1195525970

    /**
     * @type {Integer (UInt32)}
     */
    static D3DDDIFMT_YUY2 => 844715353

    /**
     * @type {Integer (UInt32)}
     */
    static D3DDDIFMT_G8R8_G8B8 => 1111970375

    /**
     * @type {Integer (UInt32)}
     */
    static D3DDDIFMT_DXT1 => 827611204

    /**
     * @type {Integer (UInt32)}
     */
    static D3DDDIFMT_DXT2 => 844388420

    /**
     * @type {Integer (UInt32)}
     */
    static D3DDDIFMT_DXT3 => 861165636

    /**
     * @type {Integer (UInt32)}
     */
    static D3DDDIFMT_DXT4 => 877942852

    /**
     * @type {Integer (UInt32)}
     */
    static D3DDDIFMT_DXT5 => 894720068

    /**
     * @type {Integer (UInt32)}
     */
    static D3DDDIFMT_D16_LOCKABLE => 70

    /**
     * @type {Integer (UInt32)}
     */
    static D3DDDIFMT_D32 => 71

    /**
     * @type {Integer (UInt32)}
     */
    static D3DDDIFMT_D15S1 => 73

    /**
     * @type {Integer (UInt32)}
     */
    static D3DDDIFMT_D24S8 => 75

    /**
     * @type {Integer (UInt32)}
     */
    static D3DDDIFMT_D24X8 => 77

    /**
     * @type {Integer (UInt32)}
     */
    static D3DDDIFMT_D24X4S4 => 79

    /**
     * @type {Integer (UInt32)}
     */
    static D3DDDIFMT_D16 => 80

    /**
     * @type {Integer (UInt32)}
     */
    static D3DDDIFMT_D32F_LOCKABLE => 82

    /**
     * @type {Integer (UInt32)}
     */
    static D3DDDIFMT_D24FS8 => 83

    /**
     * @type {Integer (UInt32)}
     */
    static D3DDDIFMT_D32_LOCKABLE => 84

    /**
     * @type {Integer (UInt32)}
     */
    static D3DDDIFMT_S8_LOCKABLE => 85

    /**
     * @type {Integer (UInt32)}
     */
    static D3DDDIFMT_S1D15 => 72

    /**
     * @type {Integer (UInt32)}
     */
    static D3DDDIFMT_S8D24 => 74

    /**
     * @type {Integer (UInt32)}
     */
    static D3DDDIFMT_X8D24 => 76

    /**
     * @type {Integer (UInt32)}
     */
    static D3DDDIFMT_X4S4D24 => 78

    /**
     * @type {Integer (UInt32)}
     */
    static D3DDDIFMT_L16 => 81

    /**
     * @type {Integer (UInt32)}
     */
    static D3DDDIFMT_G8R8 => 91

    /**
     * @type {Integer (UInt32)}
     */
    static D3DDDIFMT_R8 => 92

    /**
     * @type {Integer (UInt32)}
     */
    static D3DDDIFMT_VERTEXDATA => 100

    /**
     * @type {Integer (UInt32)}
     */
    static D3DDDIFMT_INDEX16 => 101

    /**
     * @type {Integer (UInt32)}
     */
    static D3DDDIFMT_INDEX32 => 102

    /**
     * @type {Integer (UInt32)}
     */
    static D3DDDIFMT_Q16W16V16U16 => 110

    /**
     * @type {Integer (UInt32)}
     */
    static D3DDDIFMT_MULTI2_ARGB8 => 827606349

    /**
     * @type {Integer (UInt32)}
     */
    static D3DDDIFMT_R16F => 111

    /**
     * @type {Integer (UInt32)}
     */
    static D3DDDIFMT_G16R16F => 112

    /**
     * @type {Integer (UInt32)}
     */
    static D3DDDIFMT_A16B16G16R16F => 113

    /**
     * @type {Integer (UInt32)}
     */
    static D3DDDIFMT_R32F => 114

    /**
     * @type {Integer (UInt32)}
     */
    static D3DDDIFMT_G32R32F => 115

    /**
     * @type {Integer (UInt32)}
     */
    static D3DDDIFMT_A32B32G32R32F => 116

    /**
     * @type {Integer (UInt32)}
     */
    static D3DDDIFMT_CxV8U8 => 117

    /**
     * @type {Integer (UInt32)}
     */
    static D3DDDIFMT_A1 => 118

    /**
     * @type {Integer (UInt32)}
     */
    static D3DDDIFMT_A2B10G10R10_XR_BIAS => 119

    /**
     * @type {Integer (UInt32)}
     */
    static D3DDDIFMT_DXVACOMPBUFFER_BASE => 150

    /**
     * @type {Integer (UInt32)}
     */
    static D3DDDIFMT_PICTUREPARAMSDATA => 150

    /**
     * @type {Integer (UInt32)}
     */
    static D3DDDIFMT_MACROBLOCKDATA => 151

    /**
     * @type {Integer (UInt32)}
     */
    static D3DDDIFMT_RESIDUALDIFFERENCEDATA => 152

    /**
     * @type {Integer (UInt32)}
     */
    static D3DDDIFMT_DEBLOCKINGDATA => 153

    /**
     * @type {Integer (UInt32)}
     */
    static D3DDDIFMT_INVERSEQUANTIZATIONDATA => 154

    /**
     * @type {Integer (UInt32)}
     */
    static D3DDDIFMT_SLICECONTROLDATA => 155

    /**
     * @type {Integer (UInt32)}
     */
    static D3DDDIFMT_BITSTREAMDATA => 156

    /**
     * @type {Integer (UInt32)}
     */
    static D3DDDIFMT_MOTIONVECTORBUFFER => 157

    /**
     * @type {Integer (UInt32)}
     */
    static D3DDDIFMT_FILMGRAINBUFFER => 158

    /**
     * @type {Integer (UInt32)}
     */
    static D3DDDIFMT_DXVA_RESERVED9 => 159

    /**
     * @type {Integer (UInt32)}
     */
    static D3DDDIFMT_DXVA_RESERVED10 => 160

    /**
     * @type {Integer (UInt32)}
     */
    static D3DDDIFMT_DXVA_RESERVED11 => 161

    /**
     * @type {Integer (UInt32)}
     */
    static D3DDDIFMT_DXVA_RESERVED12 => 162

    /**
     * @type {Integer (UInt32)}
     */
    static D3DDDIFMT_DXVA_RESERVED13 => 163

    /**
     * @type {Integer (UInt32)}
     */
    static D3DDDIFMT_DXVA_RESERVED14 => 164

    /**
     * @type {Integer (UInt32)}
     */
    static D3DDDIFMT_DXVA_RESERVED15 => 165

    /**
     * @type {Integer (UInt32)}
     */
    static D3DDDIFMT_DXVA_RESERVED16 => 166

    /**
     * @type {Integer (UInt32)}
     */
    static D3DDDIFMT_DXVA_RESERVED17 => 167

    /**
     * @type {Integer (UInt32)}
     */
    static D3DDDIFMT_DXVA_RESERVED18 => 168

    /**
     * @type {Integer (UInt32)}
     */
    static D3DDDIFMT_DXVA_RESERVED19 => 169

    /**
     * @type {Integer (UInt32)}
     */
    static D3DDDIFMT_DXVA_RESERVED20 => 170

    /**
     * @type {Integer (UInt32)}
     */
    static D3DDDIFMT_DXVA_RESERVED21 => 171

    /**
     * @type {Integer (UInt32)}
     */
    static D3DDDIFMT_DXVA_RESERVED22 => 172

    /**
     * @type {Integer (UInt32)}
     */
    static D3DDDIFMT_DXVA_RESERVED23 => 173

    /**
     * @type {Integer (UInt32)}
     */
    static D3DDDIFMT_DXVA_RESERVED24 => 174

    /**
     * @type {Integer (UInt32)}
     */
    static D3DDDIFMT_DXVA_RESERVED25 => 175

    /**
     * @type {Integer (UInt32)}
     */
    static D3DDDIFMT_DXVA_RESERVED26 => 176

    /**
     * @type {Integer (UInt32)}
     */
    static D3DDDIFMT_DXVA_RESERVED27 => 177

    /**
     * @type {Integer (UInt32)}
     */
    static D3DDDIFMT_DXVA_RESERVED28 => 178

    /**
     * @type {Integer (UInt32)}
     */
    static D3DDDIFMT_DXVA_RESERVED29 => 179

    /**
     * @type {Integer (UInt32)}
     */
    static D3DDDIFMT_DXVA_RESERVED30 => 180

    /**
     * @type {Integer (UInt32)}
     */
    static D3DDDIFMT_DXVA_RESERVED31 => 181

    /**
     * @type {Integer (UInt32)}
     */
    static D3DDDIFMT_DXVACOMPBUFFER_MAX => 181

    /**
     * @type {Integer (UInt32)}
     */
    static D3DDDIFMT_BINARYBUFFER => 199
}
