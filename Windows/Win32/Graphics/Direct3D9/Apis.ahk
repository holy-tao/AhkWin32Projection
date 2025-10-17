#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk
/**
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class Direct3D9 {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static D3DRTYPECOUNT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DIRECT3D_VERSION => 2304

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_SDK_VERSION => 32

    /**
     * @type {Integer (UInt32)}
     */
    static D3D9b_SDK_VERSION => 31

    /**
     * @type {Integer (Int32)}
     */
    static D3DSPD_IUNKNOWN => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DCREATE_FPU_PRESERVE => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DCREATE_MULTITHREADED => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3DCREATE_PUREDEVICE => 16

    /**
     * @type {Integer (Int32)}
     */
    static D3DCREATE_SOFTWARE_VERTEXPROCESSING => 32

    /**
     * @type {Integer (Int32)}
     */
    static D3DCREATE_HARDWARE_VERTEXPROCESSING => 64

    /**
     * @type {Integer (Int32)}
     */
    static D3DCREATE_MIXED_VERTEXPROCESSING => 128

    /**
     * @type {Integer (Int32)}
     */
    static D3DCREATE_DISABLE_DRIVER_MANAGEMENT => 256

    /**
     * @type {Integer (Int32)}
     */
    static D3DCREATE_ADAPTERGROUP_DEVICE => 512

    /**
     * @type {Integer (Int32)}
     */
    static D3DCREATE_DISABLE_DRIVER_MANAGEMENT_EX => 1024

    /**
     * @type {Integer (Int32)}
     */
    static D3DCREATE_NOWINDOWCHANGES => 2048

    /**
     * @type {Integer (Int32)}
     */
    static D3DCREATE_DISABLE_PSGP_THREADING => 8192

    /**
     * @type {Integer (Int32)}
     */
    static D3DCREATE_ENABLE_PRESENTSTATS => 16384

    /**
     * @type {Integer (Int32)}
     */
    static D3DCREATE_DISABLE_PRINTSCREEN => 32768

    /**
     * @type {Integer (Int32)}
     */
    static D3DCREATE_SCREENSAVER => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static D3DADAPTER_DEFAULT => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DENUM_WHQL_LEVEL => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DENUM_NO_DRIVERVERSION => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3DPRESENT_BACK_BUFFERS_MAX => 3

    /**
     * @type {Integer (Int32)}
     */
    static D3DPRESENT_BACK_BUFFERS_MAX_EX => 30

    /**
     * @type {Integer (Int32)}
     */
    static D3DSGR_NO_CALIBRATION => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DSGR_CALIBRATE => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DCURSOR_IMMEDIATE_UPDATE => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DPRESENT_DONOTWAIT => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DPRESENT_LINEAR_CONTENT => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DPRESENT_DONOTFLIP => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3DPRESENT_FLIPRESTART => 8

    /**
     * @type {Integer (Int32)}
     */
    static D3DPRESENT_VIDEO_RESTRICT_TO_MONITOR => 16

    /**
     * @type {Integer (Int32)}
     */
    static D3DPRESENT_UPDATEOVERLAYONLY => 32

    /**
     * @type {Integer (Int32)}
     */
    static D3DPRESENT_HIDEOVERLAY => 64

    /**
     * @type {Integer (Int32)}
     */
    static D3DPRESENT_UPDATECOLORKEY => 128

    /**
     * @type {Integer (Int32)}
     */
    static D3DPRESENT_FORCEIMMEDIATE => 256

    /**
     * @type {Integer (UInt32)}
     */
    static _FACD3D => 2166

    /**
     * @type {Integer (UInt32)}
     */
    static D3DVS20CAPS_PREDICATION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3DVS20_MAX_DYNAMICFLOWCONTROLDEPTH => 24

    /**
     * @type {Integer (UInt32)}
     */
    static D3DVS20_MIN_DYNAMICFLOWCONTROLDEPTH => 0

    /**
     * @type {Integer (UInt32)}
     */
    static D3DVS20_MAX_NUMTEMPS => 32

    /**
     * @type {Integer (UInt32)}
     */
    static D3DVS20_MIN_NUMTEMPS => 12

    /**
     * @type {Integer (UInt32)}
     */
    static D3DVS20_MAX_STATICFLOWCONTROLDEPTH => 4

    /**
     * @type {Integer (UInt32)}
     */
    static D3DVS20_MIN_STATICFLOWCONTROLDEPTH => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3DPS20CAPS_ARBITRARYSWIZZLE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3DPS20CAPS_GRADIENTINSTRUCTIONS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static D3DPS20CAPS_PREDICATION => 4

    /**
     * @type {Integer (UInt32)}
     */
    static D3DPS20CAPS_NODEPENDENTREADLIMIT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static D3DPS20CAPS_NOTEXINSTRUCTIONLIMIT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static D3DPS20_MAX_DYNAMICFLOWCONTROLDEPTH => 24

    /**
     * @type {Integer (UInt32)}
     */
    static D3DPS20_MIN_DYNAMICFLOWCONTROLDEPTH => 0

    /**
     * @type {Integer (UInt32)}
     */
    static D3DPS20_MAX_NUMTEMPS => 32

    /**
     * @type {Integer (UInt32)}
     */
    static D3DPS20_MIN_NUMTEMPS => 12

    /**
     * @type {Integer (UInt32)}
     */
    static D3DPS20_MAX_STATICFLOWCONTROLDEPTH => 4

    /**
     * @type {Integer (UInt32)}
     */
    static D3DPS20_MIN_STATICFLOWCONTROLDEPTH => 0

    /**
     * @type {Integer (UInt32)}
     */
    static D3DPS20_MAX_NUMINSTRUCTIONSLOTS => 512

    /**
     * @type {Integer (UInt32)}
     */
    static D3DPS20_MIN_NUMINSTRUCTIONSLOTS => 96

    /**
     * @type {Integer (UInt32)}
     */
    static D3DMIN30SHADERINSTRUCTIONS => 512

    /**
     * @type {Integer (UInt32)}
     */
    static D3DMAX30SHADERINSTRUCTIONS => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static D3DOVERLAYCAPS_FULLRANGERGB => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3DOVERLAYCAPS_LIMITEDRANGERGB => 2

    /**
     * @type {Integer (UInt32)}
     */
    static D3DOVERLAYCAPS_YCbCr_BT601 => 4

    /**
     * @type {Integer (UInt32)}
     */
    static D3DOVERLAYCAPS_YCbCr_BT709 => 8

    /**
     * @type {Integer (UInt32)}
     */
    static D3DOVERLAYCAPS_YCbCr_BT601_xvYCC => 16

    /**
     * @type {Integer (UInt32)}
     */
    static D3DOVERLAYCAPS_YCbCr_BT709_xvYCC => 32

    /**
     * @type {Integer (UInt32)}
     */
    static D3DOVERLAYCAPS_STRETCHX => 64

    /**
     * @type {Integer (UInt32)}
     */
    static D3DOVERLAYCAPS_STRETCHY => 128

    /**
     * @type {Integer (UInt32)}
     */
    static D3DCPCAPS_SOFTWARE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3DCPCAPS_HARDWARE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static D3DCPCAPS_PROTECTIONALWAYSON => 4

    /**
     * @type {Integer (UInt32)}
     */
    static D3DCPCAPS_PARTIALDECRYPTION => 8

    /**
     * @type {Integer (UInt32)}
     */
    static D3DCPCAPS_CONTENTKEY => 16

    /**
     * @type {Integer (UInt32)}
     */
    static D3DCPCAPS_FRESHENSESSIONKEY => 32

    /**
     * @type {Integer (UInt32)}
     */
    static D3DCPCAPS_ENCRYPTEDREADBACK => 64

    /**
     * @type {Integer (UInt32)}
     */
    static D3DCPCAPS_ENCRYPTEDREADBACKKEY => 128

    /**
     * @type {Integer (UInt32)}
     */
    static D3DCPCAPS_SEQUENTIAL_CTR_IV => 256

    /**
     * @type {Integer (UInt32)}
     */
    static D3DCPCAPS_ENCRYPTSLICEDATAONLY => 512

    /**
     * @type {String}
     */
    static D3DCRYPTOTYPE_AES128_CTR => "{9b6bd711-4f74-41c9-9e7b-0be2d7d93b4f}"

    /**
     * @type {String}
     */
    static D3DCRYPTOTYPE_PROPRIETARY => "{ab4e9afd-1d1c-46e6-a72f-0869917b0de8}"

    /**
     * @type {String}
     */
    static D3DKEYEXCHANGE_RSAES_OAEP => "{c1949895-d72a-4a1d-8e5d-ed857d171520}"

    /**
     * @type {String}
     */
    static D3DKEYEXCHANGE_DXVA => "{43d3775c-38e5-4924-8d86-d3fccf153e9b}"

    /**
     * @type {Integer (Int32)}
     */
    static D3DCAPS_OVERLAY => 2048

    /**
     * @type {Integer (Int32)}
     */
    static D3DCAPS_READ_SCANLINE => 131072

    /**
     * @type {Integer (Int32)}
     */
    static D3DCAPS2_FULLSCREENGAMMA => 131072

    /**
     * @type {Integer (Int32)}
     */
    static D3DCAPS2_CANCALIBRATEGAMMA => 1048576

    /**
     * @type {Integer (Int32)}
     */
    static D3DCAPS2_RESERVED => 33554432

    /**
     * @type {Integer (Int32)}
     */
    static D3DCAPS2_CANMANAGERESOURCE => 268435456

    /**
     * @type {Integer (Int32)}
     */
    static D3DCAPS2_DYNAMICTEXTURES => 536870912

    /**
     * @type {Integer (Int32)}
     */
    static D3DCAPS2_CANAUTOGENMIPMAP => 1073741824

    /**
     * @type {Integer (Int32)}
     */
    static D3DCAPS2_CANSHARERESOURCE => -2147483648

    /**
     * @type {Integer (Int32)}
     */
    static D3DCAPS3_RESERVED => -2147483617

    /**
     * @type {Integer (Int32)}
     */
    static D3DCAPS3_ALPHA_FULLSCREEN_FLIP_OR_DISCARD => 32

    /**
     * @type {Integer (Int32)}
     */
    static D3DCAPS3_LINEAR_TO_SRGB_PRESENTATION => 128

    /**
     * @type {Integer (Int32)}
     */
    static D3DCAPS3_COPY_TO_VIDMEM => 256

    /**
     * @type {Integer (Int32)}
     */
    static D3DCAPS3_COPY_TO_SYSTEMMEM => 512

    /**
     * @type {Integer (Int32)}
     */
    static D3DCAPS3_DXVAHD => 1024

    /**
     * @type {Integer (Int32)}
     */
    static D3DCAPS3_DXVAHD_LIMITED => 2048

    /**
     * @type {Integer (Int32)}
     */
    static D3DPRESENT_INTERVAL_DEFAULT => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DPRESENT_INTERVAL_ONE => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DPRESENT_INTERVAL_TWO => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DPRESENT_INTERVAL_THREE => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3DPRESENT_INTERVAL_FOUR => 8

    /**
     * @type {Integer (Int32)}
     */
    static D3DPRESENT_INTERVAL_IMMEDIATE => -2147483648

    /**
     * @type {Integer (Int32)}
     */
    static D3DCURSORCAPS_COLOR => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DCURSORCAPS_LOWRES => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DDEVCAPS_EXECUTESYSTEMMEMORY => 16

    /**
     * @type {Integer (Int32)}
     */
    static D3DDEVCAPS_EXECUTEVIDEOMEMORY => 32

    /**
     * @type {Integer (Int32)}
     */
    static D3DDEVCAPS_TLVERTEXSYSTEMMEMORY => 64

    /**
     * @type {Integer (Int32)}
     */
    static D3DDEVCAPS_TLVERTEXVIDEOMEMORY => 128

    /**
     * @type {Integer (Int32)}
     */
    static D3DDEVCAPS_TEXTURESYSTEMMEMORY => 256

    /**
     * @type {Integer (Int32)}
     */
    static D3DDEVCAPS_TEXTUREVIDEOMEMORY => 512

    /**
     * @type {Integer (Int32)}
     */
    static D3DDEVCAPS_DRAWPRIMTLVERTEX => 1024

    /**
     * @type {Integer (Int32)}
     */
    static D3DDEVCAPS_CANRENDERAFTERFLIP => 2048

    /**
     * @type {Integer (Int32)}
     */
    static D3DDEVCAPS_TEXTURENONLOCALVIDMEM => 4096

    /**
     * @type {Integer (Int32)}
     */
    static D3DDEVCAPS_DRAWPRIMITIVES2 => 8192

    /**
     * @type {Integer (Int32)}
     */
    static D3DDEVCAPS_SEPARATETEXTUREMEMORIES => 16384

    /**
     * @type {Integer (Int32)}
     */
    static D3DDEVCAPS_DRAWPRIMITIVES2EX => 32768

    /**
     * @type {Integer (Int32)}
     */
    static D3DDEVCAPS_HWTRANSFORMANDLIGHT => 65536

    /**
     * @type {Integer (Int32)}
     */
    static D3DDEVCAPS_CANBLTSYSTONONLOCAL => 131072

    /**
     * @type {Integer (Int32)}
     */
    static D3DDEVCAPS_HWRASTERIZATION => 524288

    /**
     * @type {Integer (Int32)}
     */
    static D3DDEVCAPS_PUREDEVICE => 1048576

    /**
     * @type {Integer (Int32)}
     */
    static D3DDEVCAPS_QUINTICRTPATCHES => 2097152

    /**
     * @type {Integer (Int32)}
     */
    static D3DDEVCAPS_RTPATCHES => 4194304

    /**
     * @type {Integer (Int32)}
     */
    static D3DDEVCAPS_RTPATCHHANDLEZERO => 8388608

    /**
     * @type {Integer (Int32)}
     */
    static D3DDEVCAPS_NPATCHES => 16777216

    /**
     * @type {Integer (Int32)}
     */
    static D3DPMISCCAPS_MASKZ => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DPMISCCAPS_CULLNONE => 16

    /**
     * @type {Integer (Int32)}
     */
    static D3DPMISCCAPS_CULLCW => 32

    /**
     * @type {Integer (Int32)}
     */
    static D3DPMISCCAPS_CULLCCW => 64

    /**
     * @type {Integer (Int32)}
     */
    static D3DPMISCCAPS_COLORWRITEENABLE => 128

    /**
     * @type {Integer (Int32)}
     */
    static D3DPMISCCAPS_CLIPPLANESCALEDPOINTS => 256

    /**
     * @type {Integer (Int32)}
     */
    static D3DPMISCCAPS_CLIPTLVERTS => 512

    /**
     * @type {Integer (Int32)}
     */
    static D3DPMISCCAPS_TSSARGTEMP => 1024

    /**
     * @type {Integer (Int32)}
     */
    static D3DPMISCCAPS_BLENDOP => 2048

    /**
     * @type {Integer (Int32)}
     */
    static D3DPMISCCAPS_NULLREFERENCE => 4096

    /**
     * @type {Integer (Int32)}
     */
    static D3DPMISCCAPS_INDEPENDENTWRITEMASKS => 16384

    /**
     * @type {Integer (Int32)}
     */
    static D3DPMISCCAPS_PERSTAGECONSTANT => 32768

    /**
     * @type {Integer (Int32)}
     */
    static D3DPMISCCAPS_FOGANDSPECULARALPHA => 65536

    /**
     * @type {Integer (Int32)}
     */
    static D3DPMISCCAPS_SEPARATEALPHABLEND => 131072

    /**
     * @type {Integer (Int32)}
     */
    static D3DPMISCCAPS_MRTINDEPENDENTBITDEPTHS => 262144

    /**
     * @type {Integer (Int32)}
     */
    static D3DPMISCCAPS_MRTPOSTPIXELSHADERBLENDING => 524288

    /**
     * @type {Integer (Int32)}
     */
    static D3DPMISCCAPS_FOGVERTEXCLAMPED => 1048576

    /**
     * @type {Integer (Int32)}
     */
    static D3DPMISCCAPS_POSTBLENDSRGBCONVERT => 2097152

    /**
     * @type {Integer (Int32)}
     */
    static D3DLINECAPS_TEXTURE => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DLINECAPS_ZTEST => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DLINECAPS_BLEND => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3DLINECAPS_ALPHACMP => 8

    /**
     * @type {Integer (Int32)}
     */
    static D3DLINECAPS_FOG => 16

    /**
     * @type {Integer (Int32)}
     */
    static D3DLINECAPS_ANTIALIAS => 32

    /**
     * @type {Integer (Int32)}
     */
    static D3DPRASTERCAPS_DITHER => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DPRASTERCAPS_ZTEST => 16

    /**
     * @type {Integer (Int32)}
     */
    static D3DPRASTERCAPS_FOGVERTEX => 128

    /**
     * @type {Integer (Int32)}
     */
    static D3DPRASTERCAPS_FOGTABLE => 256

    /**
     * @type {Integer (Int32)}
     */
    static D3DPRASTERCAPS_MIPMAPLODBIAS => 8192

    /**
     * @type {Integer (Int32)}
     */
    static D3DPRASTERCAPS_ZBUFFERLESSHSR => 32768

    /**
     * @type {Integer (Int32)}
     */
    static D3DPRASTERCAPS_FOGRANGE => 65536

    /**
     * @type {Integer (Int32)}
     */
    static D3DPRASTERCAPS_ANISOTROPY => 131072

    /**
     * @type {Integer (Int32)}
     */
    static D3DPRASTERCAPS_WBUFFER => 262144

    /**
     * @type {Integer (Int32)}
     */
    static D3DPRASTERCAPS_WFOG => 1048576

    /**
     * @type {Integer (Int32)}
     */
    static D3DPRASTERCAPS_ZFOG => 2097152

    /**
     * @type {Integer (Int32)}
     */
    static D3DPRASTERCAPS_COLORPERSPECTIVE => 4194304

    /**
     * @type {Integer (Int32)}
     */
    static D3DPRASTERCAPS_SCISSORTEST => 16777216

    /**
     * @type {Integer (Int32)}
     */
    static D3DPRASTERCAPS_SLOPESCALEDEPTHBIAS => 33554432

    /**
     * @type {Integer (Int32)}
     */
    static D3DPRASTERCAPS_DEPTHBIAS => 67108864

    /**
     * @type {Integer (Int32)}
     */
    static D3DPRASTERCAPS_MULTISAMPLE_TOGGLE => 134217728

    /**
     * @type {Integer (Int32)}
     */
    static D3DPCMPCAPS_NEVER => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DPCMPCAPS_LESS => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DPCMPCAPS_EQUAL => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3DPCMPCAPS_LESSEQUAL => 8

    /**
     * @type {Integer (Int32)}
     */
    static D3DPCMPCAPS_GREATER => 16

    /**
     * @type {Integer (Int32)}
     */
    static D3DPCMPCAPS_NOTEQUAL => 32

    /**
     * @type {Integer (Int32)}
     */
    static D3DPCMPCAPS_GREATEREQUAL => 64

    /**
     * @type {Integer (Int32)}
     */
    static D3DPCMPCAPS_ALWAYS => 128

    /**
     * @type {Integer (Int32)}
     */
    static D3DPBLENDCAPS_ZERO => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DPBLENDCAPS_ONE => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DPBLENDCAPS_SRCCOLOR => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3DPBLENDCAPS_INVSRCCOLOR => 8

    /**
     * @type {Integer (Int32)}
     */
    static D3DPBLENDCAPS_SRCALPHA => 16

    /**
     * @type {Integer (Int32)}
     */
    static D3DPBLENDCAPS_INVSRCALPHA => 32

    /**
     * @type {Integer (Int32)}
     */
    static D3DPBLENDCAPS_DESTALPHA => 64

    /**
     * @type {Integer (Int32)}
     */
    static D3DPBLENDCAPS_INVDESTALPHA => 128

    /**
     * @type {Integer (Int32)}
     */
    static D3DPBLENDCAPS_DESTCOLOR => 256

    /**
     * @type {Integer (Int32)}
     */
    static D3DPBLENDCAPS_INVDESTCOLOR => 512

    /**
     * @type {Integer (Int32)}
     */
    static D3DPBLENDCAPS_SRCALPHASAT => 1024

    /**
     * @type {Integer (Int32)}
     */
    static D3DPBLENDCAPS_BOTHSRCALPHA => 2048

    /**
     * @type {Integer (Int32)}
     */
    static D3DPBLENDCAPS_BOTHINVSRCALPHA => 4096

    /**
     * @type {Integer (Int32)}
     */
    static D3DPBLENDCAPS_BLENDFACTOR => 8192

    /**
     * @type {Integer (Int32)}
     */
    static D3DPBLENDCAPS_SRCCOLOR2 => 16384

    /**
     * @type {Integer (Int32)}
     */
    static D3DPBLENDCAPS_INVSRCCOLOR2 => 32768

    /**
     * @type {Integer (Int32)}
     */
    static D3DPSHADECAPS_COLORGOURAUDRGB => 8

    /**
     * @type {Integer (Int32)}
     */
    static D3DPSHADECAPS_SPECULARGOURAUDRGB => 512

    /**
     * @type {Integer (Int32)}
     */
    static D3DPSHADECAPS_ALPHAGOURAUDBLEND => 16384

    /**
     * @type {Integer (Int32)}
     */
    static D3DPSHADECAPS_FOGGOURAUD => 524288

    /**
     * @type {Integer (Int32)}
     */
    static D3DPTEXTURECAPS_PERSPECTIVE => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DPTEXTURECAPS_POW2 => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DPTEXTURECAPS_ALPHA => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3DPTEXTURECAPS_SQUAREONLY => 32

    /**
     * @type {Integer (Int32)}
     */
    static D3DPTEXTURECAPS_TEXREPEATNOTSCALEDBYSIZE => 64

    /**
     * @type {Integer (Int32)}
     */
    static D3DPTEXTURECAPS_ALPHAPALETTE => 128

    /**
     * @type {Integer (Int32)}
     */
    static D3DPTEXTURECAPS_NONPOW2CONDITIONAL => 256

    /**
     * @type {Integer (Int32)}
     */
    static D3DPTEXTURECAPS_PROJECTED => 1024

    /**
     * @type {Integer (Int32)}
     */
    static D3DPTEXTURECAPS_CUBEMAP => 2048

    /**
     * @type {Integer (Int32)}
     */
    static D3DPTEXTURECAPS_VOLUMEMAP => 8192

    /**
     * @type {Integer (Int32)}
     */
    static D3DPTEXTURECAPS_MIPMAP => 16384

    /**
     * @type {Integer (Int32)}
     */
    static D3DPTEXTURECAPS_MIPVOLUMEMAP => 32768

    /**
     * @type {Integer (Int32)}
     */
    static D3DPTEXTURECAPS_MIPCUBEMAP => 65536

    /**
     * @type {Integer (Int32)}
     */
    static D3DPTEXTURECAPS_CUBEMAP_POW2 => 131072

    /**
     * @type {Integer (Int32)}
     */
    static D3DPTEXTURECAPS_VOLUMEMAP_POW2 => 262144

    /**
     * @type {Integer (Int32)}
     */
    static D3DPTEXTURECAPS_NOPROJECTEDBUMPENV => 2097152

    /**
     * @type {Integer (Int32)}
     */
    static D3DPTFILTERCAPS_MINFPOINT => 256

    /**
     * @type {Integer (Int32)}
     */
    static D3DPTFILTERCAPS_MINFLINEAR => 512

    /**
     * @type {Integer (Int32)}
     */
    static D3DPTFILTERCAPS_MINFANISOTROPIC => 1024

    /**
     * @type {Integer (Int32)}
     */
    static D3DPTFILTERCAPS_MINFPYRAMIDALQUAD => 2048

    /**
     * @type {Integer (Int32)}
     */
    static D3DPTFILTERCAPS_MINFGAUSSIANQUAD => 4096

    /**
     * @type {Integer (Int32)}
     */
    static D3DPTFILTERCAPS_MIPFPOINT => 65536

    /**
     * @type {Integer (Int32)}
     */
    static D3DPTFILTERCAPS_MIPFLINEAR => 131072

    /**
     * @type {Integer (Int32)}
     */
    static D3DPTFILTERCAPS_CONVOLUTIONMONO => 262144

    /**
     * @type {Integer (Int32)}
     */
    static D3DPTFILTERCAPS_MAGFPOINT => 16777216

    /**
     * @type {Integer (Int32)}
     */
    static D3DPTFILTERCAPS_MAGFLINEAR => 33554432

    /**
     * @type {Integer (Int32)}
     */
    static D3DPTFILTERCAPS_MAGFANISOTROPIC => 67108864

    /**
     * @type {Integer (Int32)}
     */
    static D3DPTFILTERCAPS_MAGFPYRAMIDALQUAD => 134217728

    /**
     * @type {Integer (Int32)}
     */
    static D3DPTFILTERCAPS_MAGFGAUSSIANQUAD => 268435456

    /**
     * @type {Integer (Int32)}
     */
    static D3DPTADDRESSCAPS_WRAP => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DPTADDRESSCAPS_MIRROR => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DPTADDRESSCAPS_CLAMP => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3DPTADDRESSCAPS_BORDER => 8

    /**
     * @type {Integer (Int32)}
     */
    static D3DPTADDRESSCAPS_INDEPENDENTUV => 16

    /**
     * @type {Integer (Int32)}
     */
    static D3DPTADDRESSCAPS_MIRRORONCE => 32

    /**
     * @type {Integer (Int32)}
     */
    static D3DSTENCILCAPS_KEEP => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DSTENCILCAPS_ZERO => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DSTENCILCAPS_REPLACE => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3DSTENCILCAPS_INCRSAT => 8

    /**
     * @type {Integer (Int32)}
     */
    static D3DSTENCILCAPS_DECRSAT => 16

    /**
     * @type {Integer (Int32)}
     */
    static D3DSTENCILCAPS_INVERT => 32

    /**
     * @type {Integer (Int32)}
     */
    static D3DSTENCILCAPS_INCR => 64

    /**
     * @type {Integer (Int32)}
     */
    static D3DSTENCILCAPS_DECR => 128

    /**
     * @type {Integer (Int32)}
     */
    static D3DSTENCILCAPS_TWOSIDED => 256

    /**
     * @type {Integer (Int32)}
     */
    static D3DTEXOPCAPS_DISABLE => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DTEXOPCAPS_SELECTARG1 => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DTEXOPCAPS_SELECTARG2 => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3DTEXOPCAPS_MODULATE => 8

    /**
     * @type {Integer (Int32)}
     */
    static D3DTEXOPCAPS_MODULATE2X => 16

    /**
     * @type {Integer (Int32)}
     */
    static D3DTEXOPCAPS_MODULATE4X => 32

    /**
     * @type {Integer (Int32)}
     */
    static D3DTEXOPCAPS_ADD => 64

    /**
     * @type {Integer (Int32)}
     */
    static D3DTEXOPCAPS_ADDSIGNED => 128

    /**
     * @type {Integer (Int32)}
     */
    static D3DTEXOPCAPS_ADDSIGNED2X => 256

    /**
     * @type {Integer (Int32)}
     */
    static D3DTEXOPCAPS_SUBTRACT => 512

    /**
     * @type {Integer (Int32)}
     */
    static D3DTEXOPCAPS_ADDSMOOTH => 1024

    /**
     * @type {Integer (Int32)}
     */
    static D3DTEXOPCAPS_BLENDDIFFUSEALPHA => 2048

    /**
     * @type {Integer (Int32)}
     */
    static D3DTEXOPCAPS_BLENDTEXTUREALPHA => 4096

    /**
     * @type {Integer (Int32)}
     */
    static D3DTEXOPCAPS_BLENDFACTORALPHA => 8192

    /**
     * @type {Integer (Int32)}
     */
    static D3DTEXOPCAPS_BLENDTEXTUREALPHAPM => 16384

    /**
     * @type {Integer (Int32)}
     */
    static D3DTEXOPCAPS_BLENDCURRENTALPHA => 32768

    /**
     * @type {Integer (Int32)}
     */
    static D3DTEXOPCAPS_PREMODULATE => 65536

    /**
     * @type {Integer (Int32)}
     */
    static D3DTEXOPCAPS_MODULATEALPHA_ADDCOLOR => 131072

    /**
     * @type {Integer (Int32)}
     */
    static D3DTEXOPCAPS_MODULATECOLOR_ADDALPHA => 262144

    /**
     * @type {Integer (Int32)}
     */
    static D3DTEXOPCAPS_MODULATEINVALPHA_ADDCOLOR => 524288

    /**
     * @type {Integer (Int32)}
     */
    static D3DTEXOPCAPS_MODULATEINVCOLOR_ADDALPHA => 1048576

    /**
     * @type {Integer (Int32)}
     */
    static D3DTEXOPCAPS_BUMPENVMAP => 2097152

    /**
     * @type {Integer (Int32)}
     */
    static D3DTEXOPCAPS_BUMPENVMAPLUMINANCE => 4194304

    /**
     * @type {Integer (Int32)}
     */
    static D3DTEXOPCAPS_DOTPRODUCT3 => 8388608

    /**
     * @type {Integer (Int32)}
     */
    static D3DTEXOPCAPS_MULTIPLYADD => 16777216

    /**
     * @type {Integer (Int32)}
     */
    static D3DTEXOPCAPS_LERP => 33554432

    /**
     * @type {Integer (Int32)}
     */
    static D3DFVFCAPS_TEXCOORDCOUNTMASK => 65535

    /**
     * @type {Integer (Int32)}
     */
    static D3DFVFCAPS_DONOTSTRIPELEMENTS => 524288

    /**
     * @type {Integer (Int32)}
     */
    static D3DFVFCAPS_PSIZE => 1048576

    /**
     * @type {Integer (Int32)}
     */
    static D3DVTXPCAPS_TEXGEN => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DVTXPCAPS_MATERIALSOURCE7 => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DVTXPCAPS_DIRECTIONALLIGHTS => 8

    /**
     * @type {Integer (Int32)}
     */
    static D3DVTXPCAPS_POSITIONALLIGHTS => 16

    /**
     * @type {Integer (Int32)}
     */
    static D3DVTXPCAPS_LOCALVIEWER => 32

    /**
     * @type {Integer (Int32)}
     */
    static D3DVTXPCAPS_TWEENING => 64

    /**
     * @type {Integer (Int32)}
     */
    static D3DVTXPCAPS_TEXGEN_SPHEREMAP => 256

    /**
     * @type {Integer (Int32)}
     */
    static D3DVTXPCAPS_NO_TEXGEN_NONLOCALVIEWER => 512

    /**
     * @type {Integer (Int32)}
     */
    static D3DDEVCAPS2_STREAMOFFSET => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DDEVCAPS2_DMAPNPATCH => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DDEVCAPS2_ADAPTIVETESSRTPATCH => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3DDEVCAPS2_ADAPTIVETESSNPATCH => 8

    /**
     * @type {Integer (Int32)}
     */
    static D3DDEVCAPS2_CAN_STRETCHRECT_FROM_TEXTURES => 16

    /**
     * @type {Integer (Int32)}
     */
    static D3DDEVCAPS2_PRESAMPLEDDMAPNPATCH => 32

    /**
     * @type {Integer (Int32)}
     */
    static D3DDEVCAPS2_VERTEXELEMENTSCANSHARESTREAMOFFSET => 64

    /**
     * @type {Integer (Int32)}
     */
    static D3DDTCAPS_UBYTE4 => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DDTCAPS_UBYTE4N => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DDTCAPS_SHORT2N => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3DDTCAPS_SHORT4N => 8

    /**
     * @type {Integer (Int32)}
     */
    static D3DDTCAPS_USHORT2N => 16

    /**
     * @type {Integer (Int32)}
     */
    static D3DDTCAPS_USHORT4N => 32

    /**
     * @type {Integer (Int32)}
     */
    static D3DDTCAPS_UDEC3 => 64

    /**
     * @type {Integer (Int32)}
     */
    static D3DDTCAPS_DEC3N => 128

    /**
     * @type {Integer (Int32)}
     */
    static D3DDTCAPS_FLOAT16_2 => 256

    /**
     * @type {Integer (Int32)}
     */
    static D3DDTCAPS_FLOAT16_4 => 512

    /**
     * @type {Integer (UInt32)}
     */
    static D3DMAXUSERCLIPPLANES => 32

    /**
     * @type {Integer (UInt32)}
     */
    static D3DCLIPPLANE0 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3DCLIPPLANE1 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static D3DCLIPPLANE2 => 4

    /**
     * @type {Integer (UInt32)}
     */
    static D3DCLIPPLANE3 => 8

    /**
     * @type {Integer (UInt32)}
     */
    static D3DCLIPPLANE4 => 16

    /**
     * @type {Integer (UInt32)}
     */
    static D3DCLIPPLANE5 => 32

    /**
     * @type {Integer (Int32)}
     */
    static D3DCS_LEFT => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DCS_RIGHT => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DCS_TOP => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3DCS_BOTTOM => 8

    /**
     * @type {Integer (Int32)}
     */
    static D3DCS_FRONT => 16

    /**
     * @type {Integer (Int32)}
     */
    static D3DCS_BACK => 32

    /**
     * @type {Integer (Int32)}
     */
    static D3DCS_PLANE0 => 64

    /**
     * @type {Integer (Int32)}
     */
    static D3DCS_PLANE1 => 128

    /**
     * @type {Integer (Int32)}
     */
    static D3DCS_PLANE2 => 256

    /**
     * @type {Integer (Int32)}
     */
    static D3DCS_PLANE3 => 512

    /**
     * @type {Integer (Int32)}
     */
    static D3DCS_PLANE4 => 1024

    /**
     * @type {Integer (Int32)}
     */
    static D3DCS_PLANE5 => 2048

    /**
     * @type {Integer (Int32)}
     */
    static D3DCLEAR_TARGET => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DCLEAR_ZBUFFER => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DCLEAR_STENCIL => 4

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_MAX_SIMULTANEOUS_RENDERTARGETS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static D3DRENDERSTATE_WRAPBIAS => 128

    /**
     * @type {Integer (Int32)}
     */
    static D3DWRAP_U => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DWRAP_V => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DWRAP_W => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3DWRAPCOORD_0 => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DWRAPCOORD_1 => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DWRAPCOORD_2 => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3DWRAPCOORD_3 => 8

    /**
     * @type {Integer (UInt32)}
     */
    static D3DDMAPSAMPLER => 256

    /**
     * @type {Integer (UInt32)}
     */
    static D3DVERTEXTEXTURESAMPLER0 => 257

    /**
     * @type {Integer (UInt32)}
     */
    static D3DVERTEXTEXTURESAMPLER1 => 258

    /**
     * @type {Integer (UInt32)}
     */
    static D3DVERTEXTEXTURESAMPLER2 => 259

    /**
     * @type {Integer (UInt32)}
     */
    static D3DVERTEXTEXTURESAMPLER3 => 260

    /**
     * @type {Integer (UInt32)}
     */
    static D3DTSS_TCI_PASSTHRU => 0

    /**
     * @type {Integer (UInt32)}
     */
    static D3DTSS_TCI_CAMERASPACENORMAL => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static D3DTSS_TCI_CAMERASPACEPOSITION => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static D3DTSS_TCI_CAMERASPACEREFLECTIONVECTOR => 196608

    /**
     * @type {Integer (UInt32)}
     */
    static D3DTSS_TCI_SPHEREMAP => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static D3DTA_SELECTMASK => 15

    /**
     * @type {Integer (UInt32)}
     */
    static D3DTA_DIFFUSE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static D3DTA_CURRENT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3DTA_TEXTURE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static D3DTA_TFACTOR => 3

    /**
     * @type {Integer (UInt32)}
     */
    static D3DTA_SPECULAR => 4

    /**
     * @type {Integer (UInt32)}
     */
    static D3DTA_TEMP => 5

    /**
     * @type {Integer (UInt32)}
     */
    static D3DTA_CONSTANT => 6

    /**
     * @type {Integer (UInt32)}
     */
    static D3DTA_COMPLEMENT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static D3DTA_ALPHAREPLICATE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static D3DPV_DONOTCOPYDATA => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3DFVF_RESERVED0 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3DFVF_POSITION_MASK => 16398

    /**
     * @type {Integer (UInt32)}
     */
    static D3DFVF_XYZ => 2

    /**
     * @type {Integer (UInt32)}
     */
    static D3DFVF_XYZRHW => 4

    /**
     * @type {Integer (UInt32)}
     */
    static D3DFVF_XYZB1 => 6

    /**
     * @type {Integer (UInt32)}
     */
    static D3DFVF_XYZB2 => 8

    /**
     * @type {Integer (UInt32)}
     */
    static D3DFVF_XYZB3 => 10

    /**
     * @type {Integer (UInt32)}
     */
    static D3DFVF_XYZB4 => 12

    /**
     * @type {Integer (UInt32)}
     */
    static D3DFVF_XYZB5 => 14

    /**
     * @type {Integer (UInt32)}
     */
    static D3DFVF_XYZW => 16386

    /**
     * @type {Integer (UInt32)}
     */
    static D3DFVF_NORMAL => 16

    /**
     * @type {Integer (UInt32)}
     */
    static D3DFVF_PSIZE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static D3DFVF_DIFFUSE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static D3DFVF_SPECULAR => 128

    /**
     * @type {Integer (UInt32)}
     */
    static D3DFVF_TEXCOUNT_MASK => 3840

    /**
     * @type {Integer (UInt32)}
     */
    static D3DFVF_TEXCOUNT_SHIFT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static D3DFVF_TEX0 => 0

    /**
     * @type {Integer (UInt32)}
     */
    static D3DFVF_TEX1 => 256

    /**
     * @type {Integer (UInt32)}
     */
    static D3DFVF_TEX2 => 512

    /**
     * @type {Integer (UInt32)}
     */
    static D3DFVF_TEX3 => 768

    /**
     * @type {Integer (UInt32)}
     */
    static D3DFVF_TEX4 => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static D3DFVF_TEX5 => 1280

    /**
     * @type {Integer (UInt32)}
     */
    static D3DFVF_TEX6 => 1536

    /**
     * @type {Integer (UInt32)}
     */
    static D3DFVF_TEX7 => 1792

    /**
     * @type {Integer (UInt32)}
     */
    static D3DFVF_TEX8 => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static D3DFVF_LASTBETA_UBYTE4 => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static D3DFVF_LASTBETA_D3DCOLOR => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static D3DFVF_RESERVED2 => 24576

    /**
     * @type {Integer (UInt32)}
     */
    static MAXD3DDECLUSAGEINDEX => 15

    /**
     * @type {Integer (UInt32)}
     */
    static MAXD3DDECLLENGTH => 64

    /**
     * @type {Integer (UInt32)}
     */
    static D3DDP_MAXTEXCOORD => 8

    /**
     * @type {Integer (UInt32)}
     */
    static D3DSTREAMSOURCE_INDEXEDDATA => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static D3DSTREAMSOURCE_INSTANCEDATA => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static D3DSI_OPCODE_MASK => 65535

    /**
     * @type {Integer (UInt32)}
     */
    static D3DSI_INSTLENGTH_MASK => 251658240

    /**
     * @type {Integer (UInt32)}
     */
    static D3DSI_INSTLENGTH_SHIFT => 24

    /**
     * @type {Integer (UInt32)}
     */
    static D3DSI_COISSUE => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static D3DSP_OPCODESPECIFICCONTROL_MASK => 16711680

    /**
     * @type {Integer (UInt32)}
     */
    static D3DSP_OPCODESPECIFICCONTROL_SHIFT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static D3DSHADER_COMPARISON_SHIFT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static D3DSHADER_INSTRUCTION_PREDICATED => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static D3DSP_DCL_USAGE_SHIFT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static D3DSP_DCL_USAGE_MASK => 15

    /**
     * @type {Integer (UInt32)}
     */
    static D3DSP_DCL_USAGEINDEX_SHIFT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static D3DSP_DCL_USAGEINDEX_MASK => 983040

    /**
     * @type {Integer (UInt32)}
     */
    static D3DSP_TEXTURETYPE_SHIFT => 27

    /**
     * @type {Integer (UInt32)}
     */
    static D3DSP_TEXTURETYPE_MASK => 2013265920

    /**
     * @type {Integer (UInt32)}
     */
    static D3DSP_REGNUM_MASK => 2047

    /**
     * @type {Integer (UInt32)}
     */
    static D3DSP_WRITEMASK_0 => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static D3DSP_WRITEMASK_1 => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static D3DSP_WRITEMASK_2 => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static D3DSP_WRITEMASK_3 => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static D3DSP_WRITEMASK_ALL => 983040

    /**
     * @type {Integer (UInt32)}
     */
    static D3DSP_DSTMOD_SHIFT => 20

    /**
     * @type {Integer (UInt32)}
     */
    static D3DSP_DSTMOD_MASK => 15728640

    /**
     * @type {Integer (UInt32)}
     */
    static D3DSP_DSTSHIFT_SHIFT => 24

    /**
     * @type {Integer (UInt32)}
     */
    static D3DSP_DSTSHIFT_MASK => 251658240

    /**
     * @type {Integer (UInt32)}
     */
    static D3DSP_REGTYPE_SHIFT => 28

    /**
     * @type {Integer (UInt32)}
     */
    static D3DSP_REGTYPE_SHIFT2 => 8

    /**
     * @type {Integer (UInt32)}
     */
    static D3DSP_REGTYPE_MASK => 1879048192

    /**
     * @type {Integer (UInt32)}
     */
    static D3DSP_REGTYPE_MASK2 => 6144

    /**
     * @type {Integer (UInt32)}
     */
    static D3DVS_ADDRESSMODE_SHIFT => 13

    /**
     * @type {Integer (UInt32)}
     */
    static D3DSHADER_ADDRESSMODE_SHIFT => 13

    /**
     * @type {Integer (UInt32)}
     */
    static D3DVS_SWIZZLE_SHIFT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static D3DVS_SWIZZLE_MASK => 16711680

    /**
     * @type {Integer (UInt32)}
     */
    static D3DSP_SWIZZLE_SHIFT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static D3DSP_SWIZZLE_MASK => 16711680

    /**
     * @type {Integer (UInt32)}
     */
    static D3DSP_SRCMOD_SHIFT => 24

    /**
     * @type {Integer (UInt32)}
     */
    static D3DSP_SRCMOD_MASK => 251658240

    /**
     * @type {Integer (UInt32)}
     */
    static D3DSP_MIN_PRECISION_SHIFT => 14

    /**
     * @type {Integer (UInt32)}
     */
    static D3DSP_MIN_PRECISION_MASK => 49152

    /**
     * @type {Integer (UInt32)}
     */
    static D3DSI_COMMENTSIZE_SHIFT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static D3DSI_COMMENTSIZE_MASK => 2147418112

    /**
     * @type {Integer (UInt32)}
     */
    static D3DFVF_TEXTUREFORMAT2 => 0

    /**
     * @type {Integer (UInt32)}
     */
    static D3DFVF_TEXTUREFORMAT1 => 3

    /**
     * @type {Integer (UInt32)}
     */
    static D3DFVF_TEXTUREFORMAT3 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3DFVF_TEXTUREFORMAT4 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static D3DPRESENT_RATE_DEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static D3DPRESENTFLAG_LOCKABLE_BACKBUFFER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3DPRESENTFLAG_DISCARD_DEPTHSTENCIL => 2

    /**
     * @type {Integer (UInt32)}
     */
    static D3DPRESENTFLAG_DEVICECLIP => 4

    /**
     * @type {Integer (UInt32)}
     */
    static D3DPRESENTFLAG_VIDEO => 16

    /**
     * @type {Integer (UInt32)}
     */
    static D3DPRESENTFLAG_NOAUTOROTATE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static D3DPRESENTFLAG_UNPRUNEDMODE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static D3DPRESENTFLAG_OVERLAY_LIMITEDRGB => 128

    /**
     * @type {Integer (UInt32)}
     */
    static D3DPRESENTFLAG_OVERLAY_YCbCr_BT709 => 256

    /**
     * @type {Integer (UInt32)}
     */
    static D3DPRESENTFLAG_OVERLAY_YCbCr_xvYCC => 512

    /**
     * @type {Integer (UInt32)}
     */
    static D3DPRESENTFLAG_RESTRICTED_CONTENT => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static D3DPRESENTFLAG_RESTRICT_SHARED_RESOURCE_DRIVER => 2048

    /**
     * @type {Integer (Int32)}
     */
    static D3DUSAGE_RENDERTARGET => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DUSAGE_DEPTHSTENCIL => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DUSAGE_DYNAMIC => 512

    /**
     * @type {Integer (Int32)}
     */
    static D3DUSAGE_NONSECURE => 8388608

    /**
     * @type {Integer (Int32)}
     */
    static D3DUSAGE_AUTOGENMIPMAP => 1024

    /**
     * @type {Integer (Int32)}
     */
    static D3DUSAGE_DMAP => 16384

    /**
     * @type {Integer (Int32)}
     */
    static D3DUSAGE_QUERY_LEGACYBUMPMAP => 32768

    /**
     * @type {Integer (Int32)}
     */
    static D3DUSAGE_QUERY_SRGBREAD => 65536

    /**
     * @type {Integer (Int32)}
     */
    static D3DUSAGE_QUERY_FILTER => 131072

    /**
     * @type {Integer (Int32)}
     */
    static D3DUSAGE_QUERY_SRGBWRITE => 262144

    /**
     * @type {Integer (Int32)}
     */
    static D3DUSAGE_QUERY_POSTPIXELSHADER_BLENDING => 524288

    /**
     * @type {Integer (Int32)}
     */
    static D3DUSAGE_QUERY_VERTEXTEXTURE => 1048576

    /**
     * @type {Integer (Int32)}
     */
    static D3DUSAGE_QUERY_WRAPANDMIP => 2097152

    /**
     * @type {Integer (Int32)}
     */
    static D3DUSAGE_WRITEONLY => 8

    /**
     * @type {Integer (Int32)}
     */
    static D3DUSAGE_SOFTWAREPROCESSING => 16

    /**
     * @type {Integer (Int32)}
     */
    static D3DUSAGE_DONOTCLIP => 32

    /**
     * @type {Integer (Int32)}
     */
    static D3DUSAGE_POINTS => 64

    /**
     * @type {Integer (Int32)}
     */
    static D3DUSAGE_RTPATCHES => 128

    /**
     * @type {Integer (Int32)}
     */
    static D3DUSAGE_NPATCHES => 256

    /**
     * @type {Integer (Int32)}
     */
    static D3DUSAGE_TEXTAPI => 268435456

    /**
     * @type {Integer (Int32)}
     */
    static D3DUSAGE_RESTRICTED_CONTENT => 2048

    /**
     * @type {Integer (Int32)}
     */
    static D3DUSAGE_RESTRICT_SHARED_RESOURCE => 8192

    /**
     * @type {Integer (Int32)}
     */
    static D3DUSAGE_RESTRICT_SHARED_RESOURCE_DRIVER => 4096

    /**
     * @type {Integer (Int32)}
     */
    static D3DLOCK_READONLY => 16

    /**
     * @type {Integer (Int32)}
     */
    static D3DLOCK_DISCARD => 8192

    /**
     * @type {Integer (Int32)}
     */
    static D3DLOCK_NOOVERWRITE => 4096

    /**
     * @type {Integer (Int32)}
     */
    static D3DLOCK_NOSYSLOCK => 2048

    /**
     * @type {Integer (Int32)}
     */
    static D3DLOCK_DONOTWAIT => 16384

    /**
     * @type {Integer (Int32)}
     */
    static D3DLOCK_NO_DIRTY_UPDATE => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_DEVICE_IDENTIFIER_STRING => 512

    /**
     * @type {Integer (UInt32)}
     */
    static D3DISSUE_END => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3DISSUE_BEGIN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static D3DGETDATA_FLUSH => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3DCOMPOSERECTS_MAXNUMRECTS => 65535

    /**
     * @type {Integer (UInt32)}
     */
    static D3DCONVOLUTIONMONO_MAXWIDTH => 7

    /**
     * @type {Integer (UInt32)}
     */
    static D3DCONVOLUTIONMONO_MAXHEIGHT => 7

    /**
     * @type {Integer (UInt32)}
     */
    static D3DFMT_A1_SURFACE_MAXWIDTH => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static D3DFMT_A1_SURFACE_MAXHEIGHT => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static D3D9_RESOURCE_PRIORITY_MINIMUM => 671088640

    /**
     * @type {Integer (UInt32)}
     */
    static D3D9_RESOURCE_PRIORITY_LOW => 1342177280

    /**
     * @type {Integer (UInt32)}
     */
    static D3D9_RESOURCE_PRIORITY_NORMAL => 2013265920

    /**
     * @type {Integer (UInt32)}
     */
    static D3D9_RESOURCE_PRIORITY_HIGH => 2684354560

    /**
     * @type {Integer (UInt32)}
     */
    static D3D9_RESOURCE_PRIORITY_MAXIMUM => 3355443200

    /**
     * @type {Integer (UInt32)}
     */
    static D3D_OMAC_SIZE => 16

    /**
     * @type {String}
     */
    static D3DAUTHENTICATEDQUERY_PROTECTION => "{a84eb584-c495-48aa-b94d-8bd2d6fbce05}"

    /**
     * @type {String}
     */
    static D3DAUTHENTICATEDQUERY_CHANNELTYPE => "{bc1b18a5-b1fb-42ab-bd94-b5828b4bf7be}"

    /**
     * @type {String}
     */
    static D3DAUTHENTICATEDQUERY_DEVICEHANDLE => "{ec1c539d-8cff-4e2a-bcc4-f5692f99f480}"

    /**
     * @type {String}
     */
    static D3DAUTHENTICATEDQUERY_CRYPTOSESSION => "{2634499e-d018-4d74-ac17-7f724059528d}"

    /**
     * @type {String}
     */
    static D3DAUTHENTICATEDQUERY_RESTRICTEDSHAREDRESOURCEPROCESSCOUNT => "{0db207b3-9450-46a6-82de-1b96d44f9cf2}"

    /**
     * @type {String}
     */
    static D3DAUTHENTICATEDQUERY_RESTRICTEDSHAREDRESOURCEPROCESS => "{649bbadb-f0f4-4639-a15b-24393fc3abac}"

    /**
     * @type {String}
     */
    static D3DAUTHENTICATEDQUERY_UNRESTRICTEDPROTECTEDSHAREDRESOURCECOUNT => "{012f0bd6-e662-4474-befd-aa53e5143c6d}"

    /**
     * @type {String}
     */
    static D3DAUTHENTICATEDQUERY_OUTPUTIDCOUNT => "{2c042b5e-8c07-46d5-aabe-8f75cbad4c31}"

    /**
     * @type {String}
     */
    static D3DAUTHENTICATEDQUERY_OUTPUTID => "{839ddca3-9b4e-41e4-b053-892bd2a11ee7}"

    /**
     * @type {String}
     */
    static D3DAUTHENTICATEDQUERY_ACCESSIBILITYATTRIBUTES => "{6214d9d2-432c-4abb-9fce-216eea269e3b}"

    /**
     * @type {String}
     */
    static D3DAUTHENTICATEDQUERY_ENCRYPTIONWHENACCESSIBLEGUIDCOUNT => "{b30f7066-203c-4b07-93fc-ceaafd61241e}"

    /**
     * @type {String}
     */
    static D3DAUTHENTICATEDQUERY_ENCRYPTIONWHENACCESSIBLEGUID => "{f83a5958-e986-4bda-beb0-411f6a7a01b7}"

    /**
     * @type {String}
     */
    static D3DAUTHENTICATEDQUERY_CURRENTENCRYPTIONWHENACCESSIBLE => "{ec1791c7-dad3-4f15-9ec3-faa93d60d4f0}"

    /**
     * @type {String}
     */
    static D3DAUTHENTICATEDCONFIGURE_INITIALIZE => "{06114bdb-3523-470a-8dca-fbc2845154f0}"

    /**
     * @type {String}
     */
    static D3DAUTHENTICATEDCONFIGURE_PROTECTION => "{50455658-3f47-4362-bf99-bfdfcde9ed29}"

    /**
     * @type {String}
     */
    static D3DAUTHENTICATEDCONFIGURE_CRYPTOSESSION => "{6346cc54-2cfc-4ad4-8224-d15837de7700}"

    /**
     * @type {String}
     */
    static D3DAUTHENTICATEDCONFIGURE_SHAREDRESOURCE => "{0772d047-1b40-48e8-9ca6-b5f510de9f01}"

    /**
     * @type {String}
     */
    static D3DAUTHENTICATEDCONFIGURE_ENCRYPTIONWHENACCESSIBLE => "{41fff286-6ae0-4d43-9d55-a46e9efd158a}"

    /**
     * @type {Integer (Int32)}
     */
    static D3DTRANSFORMCAPS_CLIP => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DLIGHTINGMODEL_RGB => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DLIGHTINGMODEL_MONO => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DLIGHTCAPS_POINT => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DLIGHTCAPS_SPOT => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DLIGHTCAPS_DIRECTIONAL => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3DLIGHTCAPS_PARALLELPOINT => 8

    /**
     * @type {Integer (Int32)}
     */
    static D3DLIGHTCAPS_GLSPOT => 16

    /**
     * @type {Integer (Int32)}
     */
    static D3DPMISCCAPS_MASKPLANES => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DPMISCCAPS_LINEPATTERNREP => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3DPMISCCAPS_CONFORMANT => 8

    /**
     * @type {Integer (Int32)}
     */
    static D3DPRASTERCAPS_ROP2 => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DPRASTERCAPS_XOR => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3DPRASTERCAPS_PAT => 8

    /**
     * @type {Integer (Int32)}
     */
    static D3DPRASTERCAPS_SUBPIXEL => 32

    /**
     * @type {Integer (Int32)}
     */
    static D3DPRASTERCAPS_SUBPIXELX => 64

    /**
     * @type {Integer (Int32)}
     */
    static D3DPRASTERCAPS_STIPPLE => 512

    /**
     * @type {Integer (Int32)}
     */
    static D3DPRASTERCAPS_ANTIALIASSORTDEPENDENT => 1024

    /**
     * @type {Integer (Int32)}
     */
    static D3DPRASTERCAPS_ANTIALIASSORTINDEPENDENT => 2048

    /**
     * @type {Integer (Int32)}
     */
    static D3DPRASTERCAPS_ANTIALIASEDGES => 4096

    /**
     * @type {Integer (Int32)}
     */
    static D3DPRASTERCAPS_ZBIAS => 16384

    /**
     * @type {Integer (Int32)}
     */
    static D3DPRASTERCAPS_TRANSLUCENTSORTINDEPENDENT => 524288

    /**
     * @type {Integer (Int32)}
     */
    static D3DPSHADECAPS_COLORFLATMONO => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DPSHADECAPS_COLORFLATRGB => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DPSHADECAPS_COLORGOURAUDMONO => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3DPSHADECAPS_COLORPHONGMONO => 16

    /**
     * @type {Integer (Int32)}
     */
    static D3DPSHADECAPS_COLORPHONGRGB => 32

    /**
     * @type {Integer (Int32)}
     */
    static D3DPSHADECAPS_SPECULARFLATMONO => 64

    /**
     * @type {Integer (Int32)}
     */
    static D3DPSHADECAPS_SPECULARFLATRGB => 128

    /**
     * @type {Integer (Int32)}
     */
    static D3DPSHADECAPS_SPECULARGOURAUDMONO => 256

    /**
     * @type {Integer (Int32)}
     */
    static D3DPSHADECAPS_SPECULARPHONGMONO => 1024

    /**
     * @type {Integer (Int32)}
     */
    static D3DPSHADECAPS_SPECULARPHONGRGB => 2048

    /**
     * @type {Integer (Int32)}
     */
    static D3DPSHADECAPS_ALPHAFLATBLEND => 4096

    /**
     * @type {Integer (Int32)}
     */
    static D3DPSHADECAPS_ALPHAFLATSTIPPLED => 8192

    /**
     * @type {Integer (Int32)}
     */
    static D3DPSHADECAPS_ALPHAGOURAUDSTIPPLED => 32768

    /**
     * @type {Integer (Int32)}
     */
    static D3DPSHADECAPS_ALPHAPHONGBLEND => 65536

    /**
     * @type {Integer (Int32)}
     */
    static D3DPSHADECAPS_ALPHAPHONGSTIPPLED => 131072

    /**
     * @type {Integer (Int32)}
     */
    static D3DPSHADECAPS_FOGFLAT => 262144

    /**
     * @type {Integer (Int32)}
     */
    static D3DPSHADECAPS_FOGPHONG => 1048576

    /**
     * @type {Integer (Int32)}
     */
    static D3DPTEXTURECAPS_TRANSPARENCY => 8

    /**
     * @type {Integer (Int32)}
     */
    static D3DPTEXTURECAPS_BORDER => 16

    /**
     * @type {Integer (Int32)}
     */
    static D3DPTEXTURECAPS_COLORKEYBLEND => 4096

    /**
     * @type {Integer (Int32)}
     */
    static D3DPTFILTERCAPS_NEAREST => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DPTFILTERCAPS_LINEAR => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DPTFILTERCAPS_MIPNEAREST => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3DPTFILTERCAPS_MIPLINEAR => 8

    /**
     * @type {Integer (Int32)}
     */
    static D3DPTFILTERCAPS_LINEARMIPNEAREST => 16

    /**
     * @type {Integer (Int32)}
     */
    static D3DPTFILTERCAPS_LINEARMIPLINEAR => 32

    /**
     * @type {Integer (Int32)}
     */
    static D3DPTFILTERCAPS_MAGFAFLATCUBIC => 134217728

    /**
     * @type {Integer (Int32)}
     */
    static D3DPTFILTERCAPS_MAGFGAUSSIANCUBIC => 268435456

    /**
     * @type {Integer (Int32)}
     */
    static D3DPTBLENDCAPS_DECAL => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DPTBLENDCAPS_MODULATE => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DPTBLENDCAPS_DECALALPHA => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3DPTBLENDCAPS_MODULATEALPHA => 8

    /**
     * @type {Integer (Int32)}
     */
    static D3DPTBLENDCAPS_DECALMASK => 16

    /**
     * @type {Integer (Int32)}
     */
    static D3DPTBLENDCAPS_MODULATEMASK => 32

    /**
     * @type {Integer (Int32)}
     */
    static D3DPTBLENDCAPS_COPY => 64

    /**
     * @type {Integer (Int32)}
     */
    static D3DPTBLENDCAPS_ADD => 128

    /**
     * @type {Integer (Int32)}
     */
    static D3DDD_COLORMODEL => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DDD_DEVCAPS => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DDD_TRANSFORMCAPS => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3DDD_LIGHTINGCAPS => 8

    /**
     * @type {Integer (Int32)}
     */
    static D3DDD_BCLIPPING => 16

    /**
     * @type {Integer (Int32)}
     */
    static D3DDD_LINECAPS => 32

    /**
     * @type {Integer (Int32)}
     */
    static D3DDD_TRICAPS => 64

    /**
     * @type {Integer (Int32)}
     */
    static D3DDD_DEVICERENDERBITDEPTH => 128

    /**
     * @type {Integer (Int32)}
     */
    static D3DDD_DEVICEZBUFFERBITDEPTH => 256

    /**
     * @type {Integer (Int32)}
     */
    static D3DDD_MAXBUFFERSIZE => 512

    /**
     * @type {Integer (Int32)}
     */
    static D3DDD_MAXVERTEXCOUNT => 1024

    /**
     * @type {Integer (Int32)}
     */
    static D3DDEVCAPS_FLOATTLVERTEX => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DDEVCAPS_SORTINCREASINGZ => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DDEVCAPS_SORTDECREASINGZ => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3DDEVCAPS_SORTEXACT => 8

    /**
     * @type {Integer (Int32)}
     */
    static D3DVTXPCAPS_VERTEXFOG => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3DFDS_COLORMODEL => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DFDS_GUID => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DFDS_HARDWARE => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3DFDS_TRIANGLES => 8

    /**
     * @type {Integer (Int32)}
     */
    static D3DFDS_LINES => 16

    /**
     * @type {Integer (Int32)}
     */
    static D3DFDS_MISCCAPS => 32

    /**
     * @type {Integer (Int32)}
     */
    static D3DFDS_RASTERCAPS => 64

    /**
     * @type {Integer (Int32)}
     */
    static D3DFDS_ZCMPCAPS => 128

    /**
     * @type {Integer (Int32)}
     */
    static D3DFDS_ALPHACMPCAPS => 256

    /**
     * @type {Integer (Int32)}
     */
    static D3DFDS_SRCBLENDCAPS => 512

    /**
     * @type {Integer (Int32)}
     */
    static D3DFDS_DSTBLENDCAPS => 1024

    /**
     * @type {Integer (Int32)}
     */
    static D3DFDS_SHADECAPS => 2048

    /**
     * @type {Integer (Int32)}
     */
    static D3DFDS_TEXTURECAPS => 4096

    /**
     * @type {Integer (Int32)}
     */
    static D3DFDS_TEXTUREFILTERCAPS => 8192

    /**
     * @type {Integer (Int32)}
     */
    static D3DFDS_TEXTUREBLENDCAPS => 16384

    /**
     * @type {Integer (Int32)}
     */
    static D3DFDS_TEXTUREADDRESSCAPS => 32768

    /**
     * @type {Integer (Int32)}
     */
    static D3DDEB_BUFSIZE => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DDEB_CAPS => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DDEB_LPDATA => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3DDEBCAPS_SYSTEMMEMORY => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DDEBCAPS_VIDEOMEMORY => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DCLIP_LEFT => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DCLIP_RIGHT => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DCLIP_TOP => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3DCLIP_BOTTOM => 8

    /**
     * @type {Integer (Int32)}
     */
    static D3DCLIP_FRONT => 16

    /**
     * @type {Integer (Int32)}
     */
    static D3DCLIP_BACK => 32

    /**
     * @type {Integer (Int32)}
     */
    static D3DCLIP_GEN0 => 64

    /**
     * @type {Integer (Int32)}
     */
    static D3DCLIP_GEN1 => 128

    /**
     * @type {Integer (Int32)}
     */
    static D3DCLIP_GEN2 => 256

    /**
     * @type {Integer (Int32)}
     */
    static D3DCLIP_GEN3 => 512

    /**
     * @type {Integer (Int32)}
     */
    static D3DCLIP_GEN4 => 1024

    /**
     * @type {Integer (Int32)}
     */
    static D3DCLIP_GEN5 => 2048

    /**
     * @type {Integer (Int32)}
     */
    static D3DSTATUS_CLIPUNIONLEFT => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DSTATUS_CLIPUNIONRIGHT => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DSTATUS_CLIPUNIONTOP => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3DSTATUS_CLIPUNIONBOTTOM => 8

    /**
     * @type {Integer (Int32)}
     */
    static D3DSTATUS_CLIPUNIONFRONT => 16

    /**
     * @type {Integer (Int32)}
     */
    static D3DSTATUS_CLIPUNIONBACK => 32

    /**
     * @type {Integer (Int32)}
     */
    static D3DSTATUS_CLIPUNIONGEN0 => 64

    /**
     * @type {Integer (Int32)}
     */
    static D3DSTATUS_CLIPUNIONGEN1 => 128

    /**
     * @type {Integer (Int32)}
     */
    static D3DSTATUS_CLIPUNIONGEN2 => 256

    /**
     * @type {Integer (Int32)}
     */
    static D3DSTATUS_CLIPUNIONGEN3 => 512

    /**
     * @type {Integer (Int32)}
     */
    static D3DSTATUS_CLIPUNIONGEN4 => 1024

    /**
     * @type {Integer (Int32)}
     */
    static D3DSTATUS_CLIPUNIONGEN5 => 2048

    /**
     * @type {Integer (Int32)}
     */
    static D3DSTATUS_CLIPINTERSECTIONLEFT => 4096

    /**
     * @type {Integer (Int32)}
     */
    static D3DSTATUS_CLIPINTERSECTIONRIGHT => 8192

    /**
     * @type {Integer (Int32)}
     */
    static D3DSTATUS_CLIPINTERSECTIONTOP => 16384

    /**
     * @type {Integer (Int32)}
     */
    static D3DSTATUS_CLIPINTERSECTIONBOTTOM => 32768

    /**
     * @type {Integer (Int32)}
     */
    static D3DSTATUS_CLIPINTERSECTIONFRONT => 65536

    /**
     * @type {Integer (Int32)}
     */
    static D3DSTATUS_CLIPINTERSECTIONBACK => 131072

    /**
     * @type {Integer (Int32)}
     */
    static D3DSTATUS_CLIPINTERSECTIONGEN0 => 262144

    /**
     * @type {Integer (Int32)}
     */
    static D3DSTATUS_CLIPINTERSECTIONGEN1 => 524288

    /**
     * @type {Integer (Int32)}
     */
    static D3DSTATUS_CLIPINTERSECTIONGEN2 => 1048576

    /**
     * @type {Integer (Int32)}
     */
    static D3DSTATUS_CLIPINTERSECTIONGEN3 => 2097152

    /**
     * @type {Integer (Int32)}
     */
    static D3DSTATUS_CLIPINTERSECTIONGEN4 => 4194304

    /**
     * @type {Integer (Int32)}
     */
    static D3DSTATUS_CLIPINTERSECTIONGEN5 => 8388608

    /**
     * @type {Integer (Int32)}
     */
    static D3DSTATUS_ZNOTVISIBLE => 16777216

    /**
     * @type {Integer (Int32)}
     */
    static D3DTRANSFORM_CLIPPED => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DTRANSFORM_UNCLIPPED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static D3DLIGHT_ACTIVE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3DLIGHT_NO_SPECULAR => 2

    /**
     * @type {Integer (UInt32)}
     */
    static D3DCOLOR_MONO => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3DCOLOR_RGB => 2

    /**
     * @type {Integer (UInt32)}
     */
    static D3DSTATE_OVERRIDE_BIAS => 256

    /**
     * @type {Integer (Int32)}
     */
    static D3DPROCESSVERTICES_TRANSFORMLIGHT => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DPROCESSVERTICES_TRANSFORM => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DPROCESSVERTICES_COPY => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DPROCESSVERTICES_OPMASK => 7

    /**
     * @type {Integer (Int32)}
     */
    static D3DPROCESSVERTICES_UPDATEEXTENTS => 8

    /**
     * @type {Integer (Int32)}
     */
    static D3DPROCESSVERTICES_NOCOLOR => 16

    /**
     * @type {Integer (Int32)}
     */
    static D3DTRIFLAG_START => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DTRIFLAG_ODD => 30

    /**
     * @type {Integer (Int32)}
     */
    static D3DTRIFLAG_EVEN => 31

    /**
     * @type {Integer (Int32)}
     */
    static D3DTRIFLAG_EDGEENABLE1 => 256

    /**
     * @type {Integer (Int32)}
     */
    static D3DTRIFLAG_EDGEENABLE2 => 512

    /**
     * @type {Integer (Int32)}
     */
    static D3DTRIFLAG_EDGEENABLE3 => 1024

    /**
     * @type {Integer (Int32)}
     */
    static D3DSETSTATUS_STATUS => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DSETSTATUS_EXTENTS => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DCLIPSTATUS_STATUS => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DCLIPSTATUS_EXTENTS2 => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DCLIPSTATUS_EXTENTS3 => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3DEXECUTE_CLIPPED => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DEXECUTE_UNCLIPPED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static D3DPAL_FREE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static D3DPAL_READONLY => 64

    /**
     * @type {Integer (UInt32)}
     */
    static D3DPAL_RESERVED => 128

    /**
     * @type {Integer (Int32)}
     */
    static D3DVBCAPS_SYSTEMMEMORY => 2048

    /**
     * @type {Integer (Int32)}
     */
    static D3DVBCAPS_WRITEONLY => 65536

    /**
     * @type {Integer (Int32)}
     */
    static D3DVBCAPS_OPTIMIZED => -2147483648

    /**
     * @type {Integer (Int32)}
     */
    static D3DVBCAPS_DONOTCLIP => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3DVOP_LIGHT => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static D3DVOP_TRANSFORM => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3DVOP_CLIP => 4

    /**
     * @type {Integer (UInt32)}
     */
    static D3DVOP_EXTENTS => 8

    /**
     * @type {Integer (UInt32)}
     */
    static D3DFVF_RESERVED1 => 32

    /**
     * @type {Integer (UInt32)}
     */
    static D3DVIS_INSIDE_FRUSTUM => 0

    /**
     * @type {Integer (UInt32)}
     */
    static D3DVIS_INTERSECT_FRUSTUM => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3DVIS_OUTSIDE_FRUSTUM => 2

    /**
     * @type {Integer (UInt32)}
     */
    static D3DVIS_INSIDE_LEFT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static D3DVIS_INTERSECT_LEFT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static D3DVIS_OUTSIDE_LEFT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static D3DVIS_INSIDE_RIGHT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static D3DVIS_INTERSECT_RIGHT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static D3DVIS_OUTSIDE_RIGHT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static D3DVIS_INSIDE_TOP => 0

    /**
     * @type {Integer (UInt32)}
     */
    static D3DVIS_INTERSECT_TOP => 64

    /**
     * @type {Integer (UInt32)}
     */
    static D3DVIS_OUTSIDE_TOP => 128

    /**
     * @type {Integer (UInt32)}
     */
    static D3DVIS_INSIDE_BOTTOM => 0

    /**
     * @type {Integer (UInt32)}
     */
    static D3DVIS_INTERSECT_BOTTOM => 256

    /**
     * @type {Integer (UInt32)}
     */
    static D3DVIS_OUTSIDE_BOTTOM => 512

    /**
     * @type {Integer (UInt32)}
     */
    static D3DVIS_INSIDE_NEAR => 0

    /**
     * @type {Integer (UInt32)}
     */
    static D3DVIS_INTERSECT_NEAR => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static D3DVIS_OUTSIDE_NEAR => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static D3DVIS_INSIDE_FAR => 0

    /**
     * @type {Integer (UInt32)}
     */
    static D3DVIS_INTERSECT_FAR => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static D3DVIS_OUTSIDE_FAR => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static D3DVIS_MASK_FRUSTUM => 3

    /**
     * @type {Integer (UInt32)}
     */
    static D3DVIS_MASK_LEFT => 12

    /**
     * @type {Integer (UInt32)}
     */
    static D3DVIS_MASK_RIGHT => 48

    /**
     * @type {Integer (UInt32)}
     */
    static D3DVIS_MASK_TOP => 192

    /**
     * @type {Integer (UInt32)}
     */
    static D3DVIS_MASK_BOTTOM => 768

    /**
     * @type {Integer (UInt32)}
     */
    static D3DVIS_MASK_NEAR => 3072

    /**
     * @type {Integer (UInt32)}
     */
    static D3DVIS_MASK_FAR => 12288

    /**
     * @type {Integer (UInt32)}
     */
    static D3DDEVINFOID_TEXTUREMANAGER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static D3DDEVINFOID_D3DTEXTUREMANAGER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static D3DDEVINFOID_TEXTURING => 3
;@endregion Constants

;@region Methods
    /**
     * Create an IDirect3D9 object and return an interface to it.
     * @param {Integer} SDKVersion Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The value of this parameter should be D3D_SDK_VERSION. See Remarks.
     * @returns {Pointer<IDirect3D9>} Type: <b><a href="/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3d9">IDirect3D9</a>*</b>
     * 
     * If successful, this function returns a pointer to an <a href="/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3d9">IDirect3D9</a> interface; otherwise, a <b>NULL</b> pointer is returned.
     * @see https://docs.microsoft.com/windows/win32/api//d3d9helper/nf-d3d9helper-direct3dcreate9
     */
    static Direct3DCreate9(SDKVersion) {
        result := DllCall("d3d9.dll\Direct3DCreate9", "uint", SDKVersion, "ptr")
        return result
    }

    /**
     * 
     * @param {Integer} col 
     * @param {PWSTR} wszName 
     * @returns {Integer} 
     */
    static D3DPERF_BeginEvent(col, wszName) {
        wszName := wszName is String ? StrPtr(wszName) : wszName

        result := DllCall("d3d9.dll\D3DPERF_BeginEvent", "uint", col, "ptr", wszName, "int")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    static D3DPERF_EndEvent() {
        result := DllCall("d3d9.dll\D3DPERF_EndEvent", "int")
        return result
    }

    /**
     * 
     * @param {Integer} col 
     * @param {PWSTR} wszName 
     * @returns {String} Nothing - always returns an empty string
     */
    static D3DPERF_SetMarker(col, wszName) {
        wszName := wszName is String ? StrPtr(wszName) : wszName

        DllCall("d3d9.dll\D3DPERF_SetMarker", "uint", col, "ptr", wszName)
    }

    /**
     * 
     * @param {Integer} col 
     * @param {PWSTR} wszName 
     * @returns {String} Nothing - always returns an empty string
     */
    static D3DPERF_SetRegion(col, wszName) {
        wszName := wszName is String ? StrPtr(wszName) : wszName

        DllCall("d3d9.dll\D3DPERF_SetRegion", "uint", col, "ptr", wszName)
    }

    /**
     * 
     * @returns {BOOL} 
     */
    static D3DPERF_QueryRepeatFrame() {
        result := DllCall("d3d9.dll\D3DPERF_QueryRepeatFrame", "int")
        return result
    }

    /**
     * 
     * @param {Integer} dwOptions 
     * @returns {String} Nothing - always returns an empty string
     */
    static D3DPERF_SetOptions(dwOptions) {
        DllCall("d3d9.dll\D3DPERF_SetOptions", "uint", dwOptions)
    }

    /**
     * 
     * @returns {Integer} 
     */
    static D3DPERF_GetStatus() {
        result := DllCall("d3d9.dll\D3DPERF_GetStatus", "uint")
        return result
    }

    /**
     * Creates an IDirect3D9Ex object and returns an interface to it.
     * @param {Integer} SDKVersion Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The value of this parameter should be <b>D3D_SDK_VERSION</b>. See Remarks.
     * @param {Pointer<IDirect3D9Ex>} param1 
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * <ul>
     * <li><b>D3DERR_NOTAVAILABLE</b> if Direct3DEx features are not supported (no WDDM driver is
     *             installed) or if the <b>SDKVersion</b> does not match the version of the DLL.</li>
     * <li><b>D3DERR_OUTOFMEMORY</b> if out-of-memory conditions are detected when creating the
     *             enumerator object.</li>
     * <li><b>S_OK</b> if the creation of the enumerator object is successful.</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//d3d9/nf-d3d9-direct3dcreate9ex
     */
    static Direct3DCreate9Ex(SDKVersion, param1) {
        result := DllCall("d3d9.dll\Direct3DCreate9Ex", "uint", SDKVersion, "ptr", param1, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

;@endregion Methods
}
