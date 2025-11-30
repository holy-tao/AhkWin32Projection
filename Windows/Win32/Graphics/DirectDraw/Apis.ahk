#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDirectDraw.ahk
#Include .\IDirectDrawClipper.ahk

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class DirectDraw {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static DIRECTDRAW_VERSION => 1792

    /**
     * @type {Integer (UInt32)}
     */
    static _FACDD => 2166

    /**
     * @type {Guid}
     */
    static CLSID_DirectDraw => Guid("{d7b70ee0-4340-11cf-b063-0020afc2cd35}")

    /**
     * @type {Guid}
     */
    static CLSID_DirectDraw7 => Guid("{3c305196-50db-11d3-9cfe-00c04fd930c5}")

    /**
     * @type {Guid}
     */
    static CLSID_DirectDrawClipper => Guid("{593817a0-7db3-11cf-a2de-00aa00b93356}")

    /**
     * @type {Integer (Int32)}
     */
    static DDENUM_ATTACHEDSECONDARYDEVICES => 1

    /**
     * @type {Integer (Int32)}
     */
    static DDENUM_DETACHEDSECONDARYDEVICES => 2

    /**
     * @type {Integer (Int32)}
     */
    static DDENUM_NONDISPLAYDEVICES => 4

    /**
     * @type {String}
     */
    static REGSTR_KEY_DDHW_DESCRIPTION => "Description"

    /**
     * @type {String}
     */
    static REGSTR_KEY_DDHW_DRIVERNAME => "DriverName"

    /**
     * @type {String}
     */
    static REGSTR_PATH_DDHW => "Hardware\DirectDrawDrivers"

    /**
     * @type {Integer (Int32)}
     */
    static DDCREATE_HARDWAREONLY => 1

    /**
     * @type {Integer (Int32)}
     */
    static DDCREATE_EMULATIONONLY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_DDDEVICEID_STRING => 512

    /**
     * @type {Integer (Int32)}
     */
    static DDGDI_GETHOSTIDENTIFIER => 1

    /**
     * @type {Integer (Int32)}
     */
    static DDSD_CAPS => 1

    /**
     * @type {Integer (Int32)}
     */
    static DDSD_HEIGHT => 2

    /**
     * @type {Integer (Int32)}
     */
    static DDSD_WIDTH => 4

    /**
     * @type {Integer (Int32)}
     */
    static DDSD_PITCH => 8

    /**
     * @type {Integer (Int32)}
     */
    static DDSD_BACKBUFFERCOUNT => 32

    /**
     * @type {Integer (Int32)}
     */
    static DDSD_ZBUFFERBITDEPTH => 64

    /**
     * @type {Integer (Int32)}
     */
    static DDSD_ALPHABITDEPTH => 128

    /**
     * @type {Integer (Int32)}
     */
    static DDSD_LPSURFACE => 2048

    /**
     * @type {Integer (Int32)}
     */
    static DDSD_PIXELFORMAT => 4096

    /**
     * @type {Integer (Int32)}
     */
    static DDSD_CKDESTOVERLAY => 8192

    /**
     * @type {Integer (Int32)}
     */
    static DDSD_CKDESTBLT => 16384

    /**
     * @type {Integer (Int32)}
     */
    static DDSD_CKSRCOVERLAY => 32768

    /**
     * @type {Integer (Int32)}
     */
    static DDSD_CKSRCBLT => 65536

    /**
     * @type {Integer (Int32)}
     */
    static DDSD_MIPMAPCOUNT => 131072

    /**
     * @type {Integer (Int32)}
     */
    static DDSD_REFRESHRATE => 262144

    /**
     * @type {Integer (Int32)}
     */
    static DDSD_LINEARSIZE => 524288

    /**
     * @type {Integer (Int32)}
     */
    static DDSD_TEXTURESTAGE => 1048576

    /**
     * @type {Integer (Int32)}
     */
    static DDSD_FVF => 2097152

    /**
     * @type {Integer (Int32)}
     */
    static DDSD_SRCVBHANDLE => 4194304

    /**
     * @type {Integer (Int32)}
     */
    static DDSD_DEPTH => 8388608

    /**
     * @type {Integer (Int32)}
     */
    static DDSD_ALL => 16775662

    /**
     * @type {Integer (Int32)}
     */
    static DDOSD_GUID => 1

    /**
     * @type {Integer (Int32)}
     */
    static DDOSD_COMPRESSION_RATIO => 2

    /**
     * @type {Integer (Int32)}
     */
    static DDOSD_SCAPS => 4

    /**
     * @type {Integer (Int32)}
     */
    static DDOSD_OSCAPS => 8

    /**
     * @type {Integer (Int32)}
     */
    static DDOSD_ALL => 15

    /**
     * @type {Integer (Int32)}
     */
    static DDOSDCAPS_OPTCOMPRESSED => 1

    /**
     * @type {Integer (Int32)}
     */
    static DDOSDCAPS_OPTREORDERED => 2

    /**
     * @type {Integer (Int32)}
     */
    static DDOSDCAPS_MONOLITHICMIPMAP => 4

    /**
     * @type {Integer (Int32)}
     */
    static DDOSDCAPS_VALIDSCAPS => 805324800

    /**
     * @type {Integer (Int32)}
     */
    static DDOSDCAPS_VALIDOSCAPS => 7

    /**
     * @type {Integer (Int32)}
     */
    static DDCOLOR_BRIGHTNESS => 1

    /**
     * @type {Integer (Int32)}
     */
    static DDCOLOR_CONTRAST => 2

    /**
     * @type {Integer (Int32)}
     */
    static DDCOLOR_HUE => 4

    /**
     * @type {Integer (Int32)}
     */
    static DDCOLOR_SATURATION => 8

    /**
     * @type {Integer (Int32)}
     */
    static DDCOLOR_SHARPNESS => 16

    /**
     * @type {Integer (Int32)}
     */
    static DDCOLOR_GAMMA => 32

    /**
     * @type {Integer (Int32)}
     */
    static DDCOLOR_COLORENABLE => 64

    /**
     * @type {Integer (Int32)}
     */
    static DDSCAPS_RESERVED1 => 1

    /**
     * @type {Integer (Int32)}
     */
    static DDSCAPS_ALPHA => 2

    /**
     * @type {Integer (Int32)}
     */
    static DDSCAPS_BACKBUFFER => 4

    /**
     * @type {Integer (Int32)}
     */
    static DDSCAPS_COMPLEX => 8

    /**
     * @type {Integer (Int32)}
     */
    static DDSCAPS_FLIP => 16

    /**
     * @type {Integer (Int32)}
     */
    static DDSCAPS_FRONTBUFFER => 32

    /**
     * @type {Integer (Int32)}
     */
    static DDSCAPS_OFFSCREENPLAIN => 64

    /**
     * @type {Integer (Int32)}
     */
    static DDSCAPS_OVERLAY => 128

    /**
     * @type {Integer (Int32)}
     */
    static DDSCAPS_PALETTE => 256

    /**
     * @type {Integer (Int32)}
     */
    static DDSCAPS_PRIMARYSURFACE => 512

    /**
     * @type {Integer (Int32)}
     */
    static DDSCAPS_RESERVED3 => 1024

    /**
     * @type {Integer (Int32)}
     */
    static DDSCAPS_PRIMARYSURFACELEFT => 0

    /**
     * @type {Integer (Int32)}
     */
    static DDSCAPS_SYSTEMMEMORY => 2048

    /**
     * @type {Integer (Int32)}
     */
    static DDSCAPS_TEXTURE => 4096

    /**
     * @type {Integer (Int32)}
     */
    static DDSCAPS_3DDEVICE => 8192

    /**
     * @type {Integer (Int32)}
     */
    static DDSCAPS_VIDEOMEMORY => 16384

    /**
     * @type {Integer (Int32)}
     */
    static DDSCAPS_VISIBLE => 32768

    /**
     * @type {Integer (Int32)}
     */
    static DDSCAPS_WRITEONLY => 65536

    /**
     * @type {Integer (Int32)}
     */
    static DDSCAPS_ZBUFFER => 131072

    /**
     * @type {Integer (Int32)}
     */
    static DDSCAPS_OWNDC => 262144

    /**
     * @type {Integer (Int32)}
     */
    static DDSCAPS_LIVEVIDEO => 524288

    /**
     * @type {Integer (Int32)}
     */
    static DDSCAPS_HWCODEC => 1048576

    /**
     * @type {Integer (Int32)}
     */
    static DDSCAPS_MODEX => 2097152

    /**
     * @type {Integer (Int32)}
     */
    static DDSCAPS_MIPMAP => 4194304

    /**
     * @type {Integer (Int32)}
     */
    static DDSCAPS_RESERVED2 => 8388608

    /**
     * @type {Integer (Int32)}
     */
    static DDSCAPS_ALLOCONLOAD => 67108864

    /**
     * @type {Integer (Int32)}
     */
    static DDSCAPS_VIDEOPORT => 134217728

    /**
     * @type {Integer (Int32)}
     */
    static DDSCAPS_LOCALVIDMEM => 268435456

    /**
     * @type {Integer (Int32)}
     */
    static DDSCAPS_NONLOCALVIDMEM => 536870912

    /**
     * @type {Integer (Int32)}
     */
    static DDSCAPS_STANDARDVGAMODE => 1073741824

    /**
     * @type {Integer (Int32)}
     */
    static DDSCAPS_OPTIMIZED => -2147483648

    /**
     * @type {Integer (Int32)}
     */
    static DDSCAPS2_RESERVED4 => 2

    /**
     * @type {Integer (Int32)}
     */
    static DDSCAPS2_HARDWAREDEINTERLACE => 0

    /**
     * @type {Integer (Int32)}
     */
    static DDSCAPS2_HINTDYNAMIC => 4

    /**
     * @type {Integer (Int32)}
     */
    static DDSCAPS2_HINTSTATIC => 8

    /**
     * @type {Integer (Int32)}
     */
    static DDSCAPS2_TEXTUREMANAGE => 16

    /**
     * @type {Integer (Int32)}
     */
    static DDSCAPS2_RESERVED1 => 32

    /**
     * @type {Integer (Int32)}
     */
    static DDSCAPS2_RESERVED2 => 64

    /**
     * @type {Integer (Int32)}
     */
    static DDSCAPS2_OPAQUE => 128

    /**
     * @type {Integer (Int32)}
     */
    static DDSCAPS2_HINTANTIALIASING => 256

    /**
     * @type {Integer (Int32)}
     */
    static DDSCAPS2_CUBEMAP => 512

    /**
     * @type {Integer (Int32)}
     */
    static DDSCAPS2_CUBEMAP_POSITIVEX => 1024

    /**
     * @type {Integer (Int32)}
     */
    static DDSCAPS2_CUBEMAP_NEGATIVEX => 2048

    /**
     * @type {Integer (Int32)}
     */
    static DDSCAPS2_CUBEMAP_POSITIVEY => 4096

    /**
     * @type {Integer (Int32)}
     */
    static DDSCAPS2_CUBEMAP_NEGATIVEY => 8192

    /**
     * @type {Integer (Int32)}
     */
    static DDSCAPS2_CUBEMAP_POSITIVEZ => 16384

    /**
     * @type {Integer (Int32)}
     */
    static DDSCAPS2_CUBEMAP_NEGATIVEZ => 32768

    /**
     * @type {Integer (Int32)}
     */
    static DDSCAPS2_MIPMAPSUBLEVEL => 65536

    /**
     * @type {Integer (Int32)}
     */
    static DDSCAPS2_D3DTEXTUREMANAGE => 131072

    /**
     * @type {Integer (Int32)}
     */
    static DDSCAPS2_DONOTPERSIST => 262144

    /**
     * @type {Integer (Int32)}
     */
    static DDSCAPS2_STEREOSURFACELEFT => 524288

    /**
     * @type {Integer (Int32)}
     */
    static DDSCAPS2_VOLUME => 2097152

    /**
     * @type {Integer (Int32)}
     */
    static DDSCAPS2_NOTUSERLOCKABLE => 4194304

    /**
     * @type {Integer (Int32)}
     */
    static DDSCAPS2_POINTS => 8388608

    /**
     * @type {Integer (Int32)}
     */
    static DDSCAPS2_RTPATCHES => 16777216

    /**
     * @type {Integer (Int32)}
     */
    static DDSCAPS2_NPATCHES => 33554432

    /**
     * @type {Integer (Int32)}
     */
    static DDSCAPS2_RESERVED3 => 67108864

    /**
     * @type {Integer (Int32)}
     */
    static DDSCAPS2_DISCARDBACKBUFFER => 268435456

    /**
     * @type {Integer (Int32)}
     */
    static DDSCAPS2_ENABLEALPHACHANNEL => 536870912

    /**
     * @type {Integer (Int32)}
     */
    static DDSCAPS2_EXTENDEDFORMATPRIMARY => 1073741824

    /**
     * @type {Integer (Int32)}
     */
    static DDSCAPS2_ADDITIONALPRIMARY => -2147483648

    /**
     * @type {Integer (Int32)}
     */
    static DDSCAPS3_MULTISAMPLE_MASK => 31

    /**
     * @type {Integer (Int32)}
     */
    static DDSCAPS3_MULTISAMPLE_QUALITY_MASK => 224

    /**
     * @type {Integer (UInt32)}
     */
    static DDSCAPS3_MULTISAMPLE_QUALITY_SHIFT => 5

    /**
     * @type {Integer (Int32)}
     */
    static DDSCAPS3_RESERVED1 => 256

    /**
     * @type {Integer (Int32)}
     */
    static DDSCAPS3_RESERVED2 => 512

    /**
     * @type {Integer (Int32)}
     */
    static DDSCAPS3_LIGHTWEIGHTMIPMAP => 1024

    /**
     * @type {Integer (Int32)}
     */
    static DDSCAPS3_AUTOGENMIPMAP => 2048

    /**
     * @type {Integer (Int32)}
     */
    static DDSCAPS3_DMAP => 4096

    /**
     * @type {Integer (Int32)}
     */
    static DDSCAPS3_CREATESHAREDRESOURCE => 8192

    /**
     * @type {Integer (Int32)}
     */
    static DDSCAPS3_READONLYRESOURCE => 16384

    /**
     * @type {Integer (Int32)}
     */
    static DDSCAPS3_OPENSHAREDRESOURCE => 32768

    /**
     * @type {Integer (Int32)}
     */
    static DDCAPS_3D => 1

    /**
     * @type {Integer (Int32)}
     */
    static DDCAPS_ALIGNBOUNDARYDEST => 2

    /**
     * @type {Integer (Int32)}
     */
    static DDCAPS_ALIGNSIZEDEST => 4

    /**
     * @type {Integer (Int32)}
     */
    static DDCAPS_ALIGNBOUNDARYSRC => 8

    /**
     * @type {Integer (Int32)}
     */
    static DDCAPS_ALIGNSIZESRC => 16

    /**
     * @type {Integer (Int32)}
     */
    static DDCAPS_ALIGNSTRIDE => 32

    /**
     * @type {Integer (Int32)}
     */
    static DDCAPS_BLT => 64

    /**
     * @type {Integer (Int32)}
     */
    static DDCAPS_BLTQUEUE => 128

    /**
     * @type {Integer (Int32)}
     */
    static DDCAPS_BLTFOURCC => 256

    /**
     * @type {Integer (Int32)}
     */
    static DDCAPS_BLTSTRETCH => 512

    /**
     * @type {Integer (Int32)}
     */
    static DDCAPS_GDI => 1024

    /**
     * @type {Integer (Int32)}
     */
    static DDCAPS_OVERLAY => 2048

    /**
     * @type {Integer (Int32)}
     */
    static DDCAPS_OVERLAYCANTCLIP => 4096

    /**
     * @type {Integer (Int32)}
     */
    static DDCAPS_OVERLAYFOURCC => 8192

    /**
     * @type {Integer (Int32)}
     */
    static DDCAPS_OVERLAYSTRETCH => 16384

    /**
     * @type {Integer (Int32)}
     */
    static DDCAPS_PALETTE => 32768

    /**
     * @type {Integer (Int32)}
     */
    static DDCAPS_PALETTEVSYNC => 65536

    /**
     * @type {Integer (Int32)}
     */
    static DDCAPS_READSCANLINE => 131072

    /**
     * @type {Integer (Int32)}
     */
    static DDCAPS_RESERVED1 => 262144

    /**
     * @type {Integer (Int32)}
     */
    static DDCAPS_VBI => 524288

    /**
     * @type {Integer (Int32)}
     */
    static DDCAPS_ZBLTS => 1048576

    /**
     * @type {Integer (Int32)}
     */
    static DDCAPS_ZOVERLAYS => 2097152

    /**
     * @type {Integer (Int32)}
     */
    static DDCAPS_COLORKEY => 4194304

    /**
     * @type {Integer (Int32)}
     */
    static DDCAPS_ALPHA => 8388608

    /**
     * @type {Integer (Int32)}
     */
    static DDCAPS_COLORKEYHWASSIST => 16777216

    /**
     * @type {Integer (Int32)}
     */
    static DDCAPS_NOHARDWARE => 33554432

    /**
     * @type {Integer (Int32)}
     */
    static DDCAPS_BLTCOLORFILL => 67108864

    /**
     * @type {Integer (Int32)}
     */
    static DDCAPS_BANKSWITCHED => 134217728

    /**
     * @type {Integer (Int32)}
     */
    static DDCAPS_BLTDEPTHFILL => 268435456

    /**
     * @type {Integer (Int32)}
     */
    static DDCAPS_CANCLIP => 536870912

    /**
     * @type {Integer (Int32)}
     */
    static DDCAPS_CANCLIPSTRETCHED => 1073741824

    /**
     * @type {Integer (Int32)}
     */
    static DDCAPS_CANBLTSYSMEM => -2147483648

    /**
     * @type {Integer (Int32)}
     */
    static DDCAPS2_CERTIFIED => 1

    /**
     * @type {Integer (Int32)}
     */
    static DDCAPS2_NO2DDURING3DSCENE => 2

    /**
     * @type {Integer (Int32)}
     */
    static DDCAPS2_VIDEOPORT => 4

    /**
     * @type {Integer (Int32)}
     */
    static DDCAPS2_AUTOFLIPOVERLAY => 8

    /**
     * @type {Integer (Int32)}
     */
    static DDCAPS2_CANBOBINTERLEAVED => 16

    /**
     * @type {Integer (Int32)}
     */
    static DDCAPS2_CANBOBNONINTERLEAVED => 32

    /**
     * @type {Integer (Int32)}
     */
    static DDCAPS2_COLORCONTROLOVERLAY => 64

    /**
     * @type {Integer (Int32)}
     */
    static DDCAPS2_COLORCONTROLPRIMARY => 128

    /**
     * @type {Integer (Int32)}
     */
    static DDCAPS2_CANDROPZ16BIT => 256

    /**
     * @type {Integer (Int32)}
     */
    static DDCAPS2_NONLOCALVIDMEM => 512

    /**
     * @type {Integer (Int32)}
     */
    static DDCAPS2_NONLOCALVIDMEMCAPS => 1024

    /**
     * @type {Integer (Int32)}
     */
    static DDCAPS2_NOPAGELOCKREQUIRED => 2048

    /**
     * @type {Integer (Int32)}
     */
    static DDCAPS2_WIDESURFACES => 4096

    /**
     * @type {Integer (Int32)}
     */
    static DDCAPS2_CANFLIPODDEVEN => 8192

    /**
     * @type {Integer (Int32)}
     */
    static DDCAPS2_CANBOBHARDWARE => 16384

    /**
     * @type {Integer (Int32)}
     */
    static DDCAPS2_COPYFOURCC => 32768

    /**
     * @type {Integer (Int32)}
     */
    static DDCAPS2_PRIMARYGAMMA => 131072

    /**
     * @type {Integer (Int32)}
     */
    static DDCAPS2_CANRENDERWINDOWED => 524288

    /**
     * @type {Integer (Int32)}
     */
    static DDCAPS2_CANCALIBRATEGAMMA => 1048576

    /**
     * @type {Integer (Int32)}
     */
    static DDCAPS2_FLIPINTERVAL => 2097152

    /**
     * @type {Integer (Int32)}
     */
    static DDCAPS2_FLIPNOVSYNC => 4194304

    /**
     * @type {Integer (Int32)}
     */
    static DDCAPS2_CANMANAGETEXTURE => 8388608

    /**
     * @type {Integer (Int32)}
     */
    static DDCAPS2_TEXMANINNONLOCALVIDMEM => 16777216

    /**
     * @type {Integer (Int32)}
     */
    static DDCAPS2_STEREO => 33554432

    /**
     * @type {Integer (Int32)}
     */
    static DDCAPS2_SYSTONONLOCAL_AS_SYSTOLOCAL => 67108864

    /**
     * @type {Integer (Int32)}
     */
    static DDCAPS2_RESERVED1 => 134217728

    /**
     * @type {Integer (Int32)}
     */
    static DDCAPS2_CANMANAGERESOURCE => 268435456

    /**
     * @type {Integer (Int32)}
     */
    static DDCAPS2_DYNAMICTEXTURES => 536870912

    /**
     * @type {Integer (Int32)}
     */
    static DDCAPS2_CANAUTOGENMIPMAP => 1073741824

    /**
     * @type {Integer (Int32)}
     */
    static DDCAPS2_CANSHARERESOURCE => -2147483648

    /**
     * @type {Integer (Int32)}
     */
    static DDFXALPHACAPS_BLTALPHAEDGEBLEND => 1

    /**
     * @type {Integer (Int32)}
     */
    static DDFXALPHACAPS_BLTALPHAPIXELS => 2

    /**
     * @type {Integer (Int32)}
     */
    static DDFXALPHACAPS_BLTALPHAPIXELSNEG => 4

    /**
     * @type {Integer (Int32)}
     */
    static DDFXALPHACAPS_BLTALPHASURFACES => 8

    /**
     * @type {Integer (Int32)}
     */
    static DDFXALPHACAPS_BLTALPHASURFACESNEG => 16

    /**
     * @type {Integer (Int32)}
     */
    static DDFXALPHACAPS_OVERLAYALPHAEDGEBLEND => 32

    /**
     * @type {Integer (Int32)}
     */
    static DDFXALPHACAPS_OVERLAYALPHAPIXELS => 64

    /**
     * @type {Integer (Int32)}
     */
    static DDFXALPHACAPS_OVERLAYALPHAPIXELSNEG => 128

    /**
     * @type {Integer (Int32)}
     */
    static DDFXALPHACAPS_OVERLAYALPHASURFACES => 256

    /**
     * @type {Integer (Int32)}
     */
    static DDFXALPHACAPS_OVERLAYALPHASURFACESNEG => 512

    /**
     * @type {Integer (Int32)}
     */
    static DDFXCAPS_BLTARITHSTRETCHY => 32

    /**
     * @type {Integer (Int32)}
     */
    static DDFXCAPS_BLTARITHSTRETCHYN => 16

    /**
     * @type {Integer (Int32)}
     */
    static DDFXCAPS_BLTMIRRORLEFTRIGHT => 64

    /**
     * @type {Integer (Int32)}
     */
    static DDFXCAPS_BLTMIRRORUPDOWN => 128

    /**
     * @type {Integer (Int32)}
     */
    static DDFXCAPS_BLTROTATION => 256

    /**
     * @type {Integer (Int32)}
     */
    static DDFXCAPS_BLTROTATION90 => 512

    /**
     * @type {Integer (Int32)}
     */
    static DDFXCAPS_BLTSHRINKX => 1024

    /**
     * @type {Integer (Int32)}
     */
    static DDFXCAPS_BLTSHRINKXN => 2048

    /**
     * @type {Integer (Int32)}
     */
    static DDFXCAPS_BLTSHRINKY => 4096

    /**
     * @type {Integer (Int32)}
     */
    static DDFXCAPS_BLTSHRINKYN => 8192

    /**
     * @type {Integer (Int32)}
     */
    static DDFXCAPS_BLTSTRETCHX => 16384

    /**
     * @type {Integer (Int32)}
     */
    static DDFXCAPS_BLTSTRETCHXN => 32768

    /**
     * @type {Integer (Int32)}
     */
    static DDFXCAPS_BLTSTRETCHY => 65536

    /**
     * @type {Integer (Int32)}
     */
    static DDFXCAPS_BLTSTRETCHYN => 131072

    /**
     * @type {Integer (Int32)}
     */
    static DDFXCAPS_OVERLAYARITHSTRETCHY => 262144

    /**
     * @type {Integer (Int32)}
     */
    static DDFXCAPS_OVERLAYARITHSTRETCHYN => 8

    /**
     * @type {Integer (Int32)}
     */
    static DDFXCAPS_OVERLAYSHRINKX => 524288

    /**
     * @type {Integer (Int32)}
     */
    static DDFXCAPS_OVERLAYSHRINKXN => 1048576

    /**
     * @type {Integer (Int32)}
     */
    static DDFXCAPS_OVERLAYSHRINKY => 2097152

    /**
     * @type {Integer (Int32)}
     */
    static DDFXCAPS_OVERLAYSHRINKYN => 4194304

    /**
     * @type {Integer (Int32)}
     */
    static DDFXCAPS_OVERLAYSTRETCHX => 8388608

    /**
     * @type {Integer (Int32)}
     */
    static DDFXCAPS_OVERLAYSTRETCHXN => 16777216

    /**
     * @type {Integer (Int32)}
     */
    static DDFXCAPS_OVERLAYSTRETCHY => 33554432

    /**
     * @type {Integer (Int32)}
     */
    static DDFXCAPS_OVERLAYSTRETCHYN => 67108864

    /**
     * @type {Integer (Int32)}
     */
    static DDFXCAPS_OVERLAYMIRRORLEFTRIGHT => 134217728

    /**
     * @type {Integer (Int32)}
     */
    static DDFXCAPS_OVERLAYMIRRORUPDOWN => 268435456

    /**
     * @type {Integer (Int32)}
     */
    static DDFXCAPS_OVERLAYDEINTERLACE => 536870912

    /**
     * @type {Integer (Int32)}
     */
    static DDFXCAPS_BLTALPHA => 1

    /**
     * @type {Integer (Int32)}
     */
    static DDFXCAPS_BLTFILTER => 32

    /**
     * @type {Integer (Int32)}
     */
    static DDFXCAPS_OVERLAYALPHA => 4

    /**
     * @type {Integer (Int32)}
     */
    static DDFXCAPS_OVERLAYFILTER => 262144

    /**
     * @type {Integer (Int32)}
     */
    static DDSVCAPS_RESERVED1 => 1

    /**
     * @type {Integer (Int32)}
     */
    static DDSVCAPS_RESERVED2 => 2

    /**
     * @type {Integer (Int32)}
     */
    static DDSVCAPS_RESERVED3 => 4

    /**
     * @type {Integer (Int32)}
     */
    static DDSVCAPS_RESERVED4 => 8

    /**
     * @type {Integer (Int32)}
     */
    static DDSVCAPS_STEREOSEQUENTIAL => 16

    /**
     * @type {Integer (Int32)}
     */
    static DDPCAPS_4BIT => 1

    /**
     * @type {Integer (Int32)}
     */
    static DDPCAPS_8BITENTRIES => 2

    /**
     * @type {Integer (Int32)}
     */
    static DDPCAPS_8BIT => 4

    /**
     * @type {Integer (Int32)}
     */
    static DDPCAPS_INITIALIZE => 0

    /**
     * @type {Integer (Int32)}
     */
    static DDPCAPS_PRIMARYSURFACE => 16

    /**
     * @type {Integer (Int32)}
     */
    static DDPCAPS_PRIMARYSURFACELEFT => 32

    /**
     * @type {Integer (Int32)}
     */
    static DDPCAPS_ALLOW256 => 64

    /**
     * @type {Integer (Int32)}
     */
    static DDPCAPS_VSYNC => 128

    /**
     * @type {Integer (Int32)}
     */
    static DDPCAPS_1BIT => 256

    /**
     * @type {Integer (Int32)}
     */
    static DDPCAPS_2BIT => 512

    /**
     * @type {Integer (Int32)}
     */
    static DDPCAPS_ALPHA => 1024

    /**
     * @type {Integer (Int32)}
     */
    static DDSPD_IUNKNOWNPOINTER => 1

    /**
     * @type {Integer (Int32)}
     */
    static DDSPD_VOLATILE => 2

    /**
     * @type {Integer (Int32)}
     */
    static DDBD_1 => 16384

    /**
     * @type {Integer (Int32)}
     */
    static DDBD_2 => 8192

    /**
     * @type {Integer (Int32)}
     */
    static DDBD_4 => 4096

    /**
     * @type {Integer (Int32)}
     */
    static DDBD_8 => 2048

    /**
     * @type {Integer (Int32)}
     */
    static DDBD_16 => 1024

    /**
     * @type {Integer (Int32)}
     */
    static DDBD_24 => 512

    /**
     * @type {Integer (Int32)}
     */
    static DDBD_32 => 256

    /**
     * @type {Integer (Int32)}
     */
    static DDCKEY_COLORSPACE => 1

    /**
     * @type {Integer (Int32)}
     */
    static DDCKEY_DESTBLT => 2

    /**
     * @type {Integer (Int32)}
     */
    static DDCKEY_DESTOVERLAY => 4

    /**
     * @type {Integer (Int32)}
     */
    static DDCKEY_SRCBLT => 8

    /**
     * @type {Integer (Int32)}
     */
    static DDCKEY_SRCOVERLAY => 16

    /**
     * @type {Integer (Int32)}
     */
    static DDCKEYCAPS_DESTBLT => 1

    /**
     * @type {Integer (Int32)}
     */
    static DDCKEYCAPS_DESTBLTCLRSPACE => 2

    /**
     * @type {Integer (Int32)}
     */
    static DDCKEYCAPS_DESTBLTCLRSPACEYUV => 4

    /**
     * @type {Integer (Int32)}
     */
    static DDCKEYCAPS_DESTBLTYUV => 8

    /**
     * @type {Integer (Int32)}
     */
    static DDCKEYCAPS_DESTOVERLAY => 16

    /**
     * @type {Integer (Int32)}
     */
    static DDCKEYCAPS_DESTOVERLAYCLRSPACE => 32

    /**
     * @type {Integer (Int32)}
     */
    static DDCKEYCAPS_DESTOVERLAYCLRSPACEYUV => 64

    /**
     * @type {Integer (Int32)}
     */
    static DDCKEYCAPS_DESTOVERLAYONEACTIVE => 128

    /**
     * @type {Integer (Int32)}
     */
    static DDCKEYCAPS_DESTOVERLAYYUV => 256

    /**
     * @type {Integer (Int32)}
     */
    static DDCKEYCAPS_SRCBLT => 512

    /**
     * @type {Integer (Int32)}
     */
    static DDCKEYCAPS_SRCBLTCLRSPACE => 1024

    /**
     * @type {Integer (Int32)}
     */
    static DDCKEYCAPS_SRCBLTCLRSPACEYUV => 2048

    /**
     * @type {Integer (Int32)}
     */
    static DDCKEYCAPS_SRCBLTYUV => 4096

    /**
     * @type {Integer (Int32)}
     */
    static DDCKEYCAPS_SRCOVERLAY => 8192

    /**
     * @type {Integer (Int32)}
     */
    static DDCKEYCAPS_SRCOVERLAYCLRSPACE => 16384

    /**
     * @type {Integer (Int32)}
     */
    static DDCKEYCAPS_SRCOVERLAYCLRSPACEYUV => 32768

    /**
     * @type {Integer (Int32)}
     */
    static DDCKEYCAPS_SRCOVERLAYONEACTIVE => 65536

    /**
     * @type {Integer (Int32)}
     */
    static DDCKEYCAPS_SRCOVERLAYYUV => 131072

    /**
     * @type {Integer (Int32)}
     */
    static DDCKEYCAPS_NOCOSTOVERLAY => 262144

    /**
     * @type {Integer (Int32)}
     */
    static DDPF_ALPHAPIXELS => 1

    /**
     * @type {Integer (Int32)}
     */
    static DDPF_ALPHA => 2

    /**
     * @type {Integer (Int32)}
     */
    static DDPF_FOURCC => 4

    /**
     * @type {Integer (Int32)}
     */
    static DDPF_PALETTEINDEXED4 => 8

    /**
     * @type {Integer (Int32)}
     */
    static DDPF_PALETTEINDEXEDTO8 => 16

    /**
     * @type {Integer (Int32)}
     */
    static DDPF_PALETTEINDEXED8 => 32

    /**
     * @type {Integer (Int32)}
     */
    static DDPF_RGB => 64

    /**
     * @type {Integer (Int32)}
     */
    static DDPF_COMPRESSED => 128

    /**
     * @type {Integer (Int32)}
     */
    static DDPF_RGBTOYUV => 256

    /**
     * @type {Integer (Int32)}
     */
    static DDPF_YUV => 512

    /**
     * @type {Integer (Int32)}
     */
    static DDPF_ZBUFFER => 1024

    /**
     * @type {Integer (Int32)}
     */
    static DDPF_PALETTEINDEXED1 => 2048

    /**
     * @type {Integer (Int32)}
     */
    static DDPF_PALETTEINDEXED2 => 4096

    /**
     * @type {Integer (Int32)}
     */
    static DDPF_ZPIXELS => 8192

    /**
     * @type {Integer (Int32)}
     */
    static DDPF_STENCILBUFFER => 16384

    /**
     * @type {Integer (Int32)}
     */
    static DDPF_ALPHAPREMULT => 32768

    /**
     * @type {Integer (Int32)}
     */
    static DDPF_LUMINANCE => 131072

    /**
     * @type {Integer (Int32)}
     */
    static DDPF_BUMPLUMINANCE => 262144

    /**
     * @type {Integer (Int32)}
     */
    static DDPF_BUMPDUDV => 524288

    /**
     * @type {Integer (Int32)}
     */
    static DDENUMSURFACES_ALL => 1

    /**
     * @type {Integer (Int32)}
     */
    static DDENUMSURFACES_MATCH => 2

    /**
     * @type {Integer (Int32)}
     */
    static DDENUMSURFACES_NOMATCH => 4

    /**
     * @type {Integer (Int32)}
     */
    static DDENUMSURFACES_CANBECREATED => 8

    /**
     * @type {Integer (Int32)}
     */
    static DDENUMSURFACES_DOESEXIST => 16

    /**
     * @type {Integer (Int32)}
     */
    static DDSDM_STANDARDVGAMODE => 1

    /**
     * @type {Integer (Int32)}
     */
    static DDEDM_REFRESHRATES => 1

    /**
     * @type {Integer (Int32)}
     */
    static DDEDM_STANDARDVGAMODES => 2

    /**
     * @type {Integer (Int32)}
     */
    static DDSCL_FULLSCREEN => 1

    /**
     * @type {Integer (Int32)}
     */
    static DDSCL_ALLOWREBOOT => 2

    /**
     * @type {Integer (Int32)}
     */
    static DDSCL_NOWINDOWCHANGES => 4

    /**
     * @type {Integer (Int32)}
     */
    static DDSCL_NORMAL => 8

    /**
     * @type {Integer (Int32)}
     */
    static DDSCL_EXCLUSIVE => 16

    /**
     * @type {Integer (Int32)}
     */
    static DDSCL_ALLOWMODEX => 64

    /**
     * @type {Integer (Int32)}
     */
    static DDSCL_SETFOCUSWINDOW => 128

    /**
     * @type {Integer (Int32)}
     */
    static DDSCL_SETDEVICEWINDOW => 256

    /**
     * @type {Integer (Int32)}
     */
    static DDSCL_CREATEDEVICEWINDOW => 512

    /**
     * @type {Integer (Int32)}
     */
    static DDSCL_MULTITHREADED => 1024

    /**
     * @type {Integer (Int32)}
     */
    static DDSCL_FPUSETUP => 2048

    /**
     * @type {Integer (Int32)}
     */
    static DDSCL_FPUPRESERVE => 4096

    /**
     * @type {Integer (Int32)}
     */
    static DDBLT_ALPHADEST => 1

    /**
     * @type {Integer (Int32)}
     */
    static DDBLT_ALPHADESTCONSTOVERRIDE => 2

    /**
     * @type {Integer (Int32)}
     */
    static DDBLT_ALPHADESTNEG => 4

    /**
     * @type {Integer (Int32)}
     */
    static DDBLT_ALPHADESTSURFACEOVERRIDE => 8

    /**
     * @type {Integer (Int32)}
     */
    static DDBLT_ALPHAEDGEBLEND => 16

    /**
     * @type {Integer (Int32)}
     */
    static DDBLT_ALPHASRC => 32

    /**
     * @type {Integer (Int32)}
     */
    static DDBLT_ALPHASRCCONSTOVERRIDE => 64

    /**
     * @type {Integer (Int32)}
     */
    static DDBLT_ALPHASRCNEG => 128

    /**
     * @type {Integer (Int32)}
     */
    static DDBLT_ALPHASRCSURFACEOVERRIDE => 256

    /**
     * @type {Integer (Int32)}
     */
    static DDBLT_ASYNC => 512

    /**
     * @type {Integer (Int32)}
     */
    static DDBLT_COLORFILL => 1024

    /**
     * @type {Integer (Int32)}
     */
    static DDBLT_DDFX => 2048

    /**
     * @type {Integer (Int32)}
     */
    static DDBLT_DDROPS => 4096

    /**
     * @type {Integer (Int32)}
     */
    static DDBLT_KEYDEST => 8192

    /**
     * @type {Integer (Int32)}
     */
    static DDBLT_KEYDESTOVERRIDE => 16384

    /**
     * @type {Integer (Int32)}
     */
    static DDBLT_KEYSRC => 32768

    /**
     * @type {Integer (Int32)}
     */
    static DDBLT_KEYSRCOVERRIDE => 65536

    /**
     * @type {Integer (Int32)}
     */
    static DDBLT_ROP => 131072

    /**
     * @type {Integer (Int32)}
     */
    static DDBLT_ROTATIONANGLE => 262144

    /**
     * @type {Integer (Int32)}
     */
    static DDBLT_ZBUFFER => 524288

    /**
     * @type {Integer (Int32)}
     */
    static DDBLT_ZBUFFERDESTCONSTOVERRIDE => 1048576

    /**
     * @type {Integer (Int32)}
     */
    static DDBLT_ZBUFFERDESTOVERRIDE => 2097152

    /**
     * @type {Integer (Int32)}
     */
    static DDBLT_ZBUFFERSRCCONSTOVERRIDE => 4194304

    /**
     * @type {Integer (Int32)}
     */
    static DDBLT_ZBUFFERSRCOVERRIDE => 8388608

    /**
     * @type {Integer (Int32)}
     */
    static DDBLT_WAIT => 16777216

    /**
     * @type {Integer (Int32)}
     */
    static DDBLT_DEPTHFILL => 33554432

    /**
     * @type {Integer (Int32)}
     */
    static DDBLT_DONOTWAIT => 134217728

    /**
     * @type {Integer (Int32)}
     */
    static DDBLT_PRESENTATION => 268435456

    /**
     * @type {Integer (Int32)}
     */
    static DDBLT_LAST_PRESENTATION => 536870912

    /**
     * @type {Integer (Int32)}
     */
    static DDBLT_EXTENDED_FLAGS => 1073741824

    /**
     * @type {Integer (Int32)}
     */
    static DDBLT_EXTENDED_LINEAR_CONTENT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DDBLTFAST_NOCOLORKEY => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DDBLTFAST_SRCCOLORKEY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DDBLTFAST_DESTCOLORKEY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DDBLTFAST_WAIT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DDBLTFAST_DONOTWAIT => 32

    /**
     * @type {Integer (Int32)}
     */
    static DDFLIP_WAIT => 1

    /**
     * @type {Integer (Int32)}
     */
    static DDFLIP_EVEN => 2

    /**
     * @type {Integer (Int32)}
     */
    static DDFLIP_ODD => 4

    /**
     * @type {Integer (Int32)}
     */
    static DDFLIP_NOVSYNC => 8

    /**
     * @type {Integer (Int32)}
     */
    static DDFLIP_INTERVAL2 => 33554432

    /**
     * @type {Integer (Int32)}
     */
    static DDFLIP_INTERVAL3 => 50331648

    /**
     * @type {Integer (Int32)}
     */
    static DDFLIP_INTERVAL4 => 67108864

    /**
     * @type {Integer (Int32)}
     */
    static DDFLIP_STEREO => 16

    /**
     * @type {Integer (Int32)}
     */
    static DDFLIP_DONOTWAIT => 32

    /**
     * @type {Integer (Int32)}
     */
    static DDOVER_ALPHADEST => 1

    /**
     * @type {Integer (Int32)}
     */
    static DDOVER_ALPHADESTCONSTOVERRIDE => 2

    /**
     * @type {Integer (Int32)}
     */
    static DDOVER_ALPHADESTNEG => 4

    /**
     * @type {Integer (Int32)}
     */
    static DDOVER_ALPHADESTSURFACEOVERRIDE => 8

    /**
     * @type {Integer (Int32)}
     */
    static DDOVER_ALPHAEDGEBLEND => 16

    /**
     * @type {Integer (Int32)}
     */
    static DDOVER_ALPHASRC => 32

    /**
     * @type {Integer (Int32)}
     */
    static DDOVER_ALPHASRCCONSTOVERRIDE => 64

    /**
     * @type {Integer (Int32)}
     */
    static DDOVER_ALPHASRCNEG => 128

    /**
     * @type {Integer (Int32)}
     */
    static DDOVER_ALPHASRCSURFACEOVERRIDE => 256

    /**
     * @type {Integer (Int32)}
     */
    static DDOVER_HIDE => 512

    /**
     * @type {Integer (Int32)}
     */
    static DDOVER_KEYDEST => 1024

    /**
     * @type {Integer (Int32)}
     */
    static DDOVER_KEYDESTOVERRIDE => 2048

    /**
     * @type {Integer (Int32)}
     */
    static DDOVER_KEYSRC => 4096

    /**
     * @type {Integer (Int32)}
     */
    static DDOVER_KEYSRCOVERRIDE => 8192

    /**
     * @type {Integer (Int32)}
     */
    static DDOVER_SHOW => 16384

    /**
     * @type {Integer (Int32)}
     */
    static DDOVER_ADDDIRTYRECT => 32768

    /**
     * @type {Integer (Int32)}
     */
    static DDOVER_REFRESHDIRTYRECTS => 65536

    /**
     * @type {Integer (Int32)}
     */
    static DDOVER_REFRESHALL => 131072

    /**
     * @type {Integer (Int32)}
     */
    static DDOVER_DDFX => 524288

    /**
     * @type {Integer (Int32)}
     */
    static DDOVER_AUTOFLIP => 1048576

    /**
     * @type {Integer (Int32)}
     */
    static DDOVER_BOB => 2097152

    /**
     * @type {Integer (Int32)}
     */
    static DDOVER_OVERRIDEBOBWEAVE => 4194304

    /**
     * @type {Integer (Int32)}
     */
    static DDOVER_INTERLEAVED => 8388608

    /**
     * @type {Integer (Int32)}
     */
    static DDOVER_BOBHARDWARE => 16777216

    /**
     * @type {Integer (Int32)}
     */
    static DDOVER_ARGBSCALEFACTORS => 33554432

    /**
     * @type {Integer (Int32)}
     */
    static DDOVER_DEGRADEARGBSCALING => 67108864

    /**
     * @type {Integer (Int32)}
     */
    static DDSETSURFACEDESC_RECREATEDC => 0

    /**
     * @type {Integer (Int32)}
     */
    static DDSETSURFACEDESC_PRESERVEDC => 1

    /**
     * @type {Integer (Int32)}
     */
    static DDLOCK_SURFACEMEMORYPTR => 0

    /**
     * @type {Integer (Int32)}
     */
    static DDLOCK_WAIT => 1

    /**
     * @type {Integer (Int32)}
     */
    static DDLOCK_EVENT => 2

    /**
     * @type {Integer (Int32)}
     */
    static DDLOCK_READONLY => 16

    /**
     * @type {Integer (Int32)}
     */
    static DDLOCK_WRITEONLY => 32

    /**
     * @type {Integer (Int32)}
     */
    static DDLOCK_NOSYSLOCK => 2048

    /**
     * @type {Integer (Int32)}
     */
    static DDLOCK_NOOVERWRITE => 4096

    /**
     * @type {Integer (Int32)}
     */
    static DDLOCK_DISCARDCONTENTS => 8192

    /**
     * @type {Integer (Int32)}
     */
    static DDLOCK_OKTOSWAP => 8192

    /**
     * @type {Integer (Int32)}
     */
    static DDLOCK_DONOTWAIT => 16384

    /**
     * @type {Integer (Int32)}
     */
    static DDLOCK_HASVOLUMETEXTUREBOXRECT => 32768

    /**
     * @type {Integer (Int32)}
     */
    static DDLOCK_NODIRTYUPDATE => 65536

    /**
     * @type {Integer (Int32)}
     */
    static DDBLTFX_ARITHSTRETCHY => 1

    /**
     * @type {Integer (Int32)}
     */
    static DDBLTFX_MIRRORLEFTRIGHT => 2

    /**
     * @type {Integer (Int32)}
     */
    static DDBLTFX_MIRRORUPDOWN => 4

    /**
     * @type {Integer (Int32)}
     */
    static DDBLTFX_NOTEARING => 8

    /**
     * @type {Integer (Int32)}
     */
    static DDBLTFX_ROTATE180 => 16

    /**
     * @type {Integer (Int32)}
     */
    static DDBLTFX_ROTATE270 => 32

    /**
     * @type {Integer (Int32)}
     */
    static DDBLTFX_ROTATE90 => 64

    /**
     * @type {Integer (Int32)}
     */
    static DDBLTFX_ZBUFFERRANGE => 128

    /**
     * @type {Integer (Int32)}
     */
    static DDBLTFX_ZBUFFERBASEDEST => 256

    /**
     * @type {Integer (Int32)}
     */
    static DDOVERFX_ARITHSTRETCHY => 1

    /**
     * @type {Integer (Int32)}
     */
    static DDOVERFX_MIRRORLEFTRIGHT => 2

    /**
     * @type {Integer (Int32)}
     */
    static DDOVERFX_MIRRORUPDOWN => 4

    /**
     * @type {Integer (Int32)}
     */
    static DDOVERFX_DEINTERLACE => 8

    /**
     * @type {Integer (Int32)}
     */
    static DDWAITVB_BLOCKBEGIN => 1

    /**
     * @type {Integer (Int32)}
     */
    static DDWAITVB_BLOCKBEGINEVENT => 2

    /**
     * @type {Integer (Int32)}
     */
    static DDWAITVB_BLOCKEND => 4

    /**
     * @type {Integer (Int32)}
     */
    static DDGFS_CANFLIP => 1

    /**
     * @type {Integer (Int32)}
     */
    static DDGFS_ISFLIPDONE => 2

    /**
     * @type {Integer (Int32)}
     */
    static DDGBS_CANBLT => 1

    /**
     * @type {Integer (Int32)}
     */
    static DDGBS_ISBLTDONE => 2

    /**
     * @type {Integer (Int32)}
     */
    static DDENUMOVERLAYZ_BACKTOFRONT => 0

    /**
     * @type {Integer (Int32)}
     */
    static DDENUMOVERLAYZ_FRONTTOBACK => 1

    /**
     * @type {Integer (Int32)}
     */
    static DDOVERZ_SENDTOFRONT => 0

    /**
     * @type {Integer (Int32)}
     */
    static DDOVERZ_SENDTOBACK => 1

    /**
     * @type {Integer (Int32)}
     */
    static DDOVERZ_MOVEFORWARD => 2

    /**
     * @type {Integer (Int32)}
     */
    static DDOVERZ_MOVEBACKWARD => 3

    /**
     * @type {Integer (Int32)}
     */
    static DDOVERZ_INSERTINFRONTOF => 4

    /**
     * @type {Integer (Int32)}
     */
    static DDOVERZ_INSERTINBACKOF => 5

    /**
     * @type {Integer (Int32)}
     */
    static DDSGR_CALIBRATE => 1

    /**
     * @type {Integer (Int32)}
     */
    static DDSMT_ISTESTREQUIRED => 1

    /**
     * @type {Integer (Int32)}
     */
    static DDEM_MODEPASSED => 1

    /**
     * @type {Integer (Int32)}
     */
    static DDEM_MODEFAILED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DDENUMRET_CANCEL => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DDENUMRET_OK => 1

    /**
     * @type {Integer (Int32)}
     */
    static DDERR_NOTINITIALIZED => -2147221008

    /**
     * @type {Integer (Int32)}
     */
    static OBJECT_ISROOT => -2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static DDUNSUPPORTEDMODE => 4294967295

    /**
     * @type {Guid}
     */
    static GUID_MiscellaneousCallbacks => Guid("{efd60cc0-49e7-11d0-889d-00aa00bbb76a}")

    /**
     * @type {Guid}
     */
    static GUID_VideoPortCallbacks => Guid("{efd60cc1-49e7-11d0-889d-00aa00bbb76a}")

    /**
     * @type {Guid}
     */
    static GUID_ColorControlCallbacks => Guid("{efd60cc2-49e7-11d0-889d-00aa00bbb76a}")

    /**
     * @type {Guid}
     */
    static GUID_VideoPortCaps => Guid("{efd60cc3-49e7-11d0-889d-00aa00bbb76a}")

    /**
     * @type {Guid}
     */
    static GUID_D3DCallbacks2 => Guid("{0ba584e1-70b6-11d0-889d-00aa00bbb76a}")

    /**
     * @type {Guid}
     */
    static GUID_D3DCallbacks3 => Guid("{ddf41230-ec0a-11d0-a9b6-00aa00c0993e}")

    /**
     * @type {Guid}
     */
    static GUID_NonLocalVidMemCaps => Guid("{86c4fa80-8d84-11d0-94e8-00c04fc34137}")

    /**
     * @type {Guid}
     */
    static GUID_KernelCallbacks => Guid("{80863800-6b06-11d0-9b06-00a0c903a3b8}")

    /**
     * @type {Guid}
     */
    static GUID_KernelCaps => Guid("{ffaa7540-7aa8-11d0-9b06-00a0c903a3b8}")

    /**
     * @type {Guid}
     */
    static GUID_D3DExtendedCaps => Guid("{7de41f80-9d93-11d0-89ab-00a0c9054129}")

    /**
     * @type {Guid}
     */
    static GUID_ZPixelFormats => Guid("{93869880-36cf-11d1-9b1b-00aa00bbb8ae}")

    /**
     * @type {Guid}
     */
    static GUID_DDMoreSurfaceCaps => Guid("{3b8a0466-f269-11d1-880b-00c04fd930c5}")

    /**
     * @type {Guid}
     */
    static GUID_DDStereoMode => Guid("{f828169c-a8e8-11d2-a1f2-00a0c983eaf6}")

    /**
     * @type {Guid}
     */
    static GUID_OptSurfaceKmodeInfo => Guid("{e05c8472-51d4-11d1-8cce-00a0c90629a8}")

    /**
     * @type {Guid}
     */
    static GUID_OptSurfaceUmodeInfo => Guid("{9d792804-5fa8-11d1-8cd0-00a0c90629a8}")

    /**
     * @type {Guid}
     */
    static GUID_UserModeDriverInfo => Guid("{f0b0e8e2-5f97-11d1-8cd0-00a0c90629a8}")

    /**
     * @type {Guid}
     */
    static GUID_UserModeDriverPassword => Guid("{97f861b6-60a1-11d1-8cd0-00a0c90629a8}")

    /**
     * @type {Guid}
     */
    static GUID_D3DParseUnknownCommandCallback => Guid("{2e04ffa0-98e4-11d1-8ce1-00a0c90629a8}")

    /**
     * @type {Guid}
     */
    static GUID_MotionCompCallbacks => Guid("{b1122b40-5da5-11d1-8fcf-00c04fc29b4e}")

    /**
     * @type {Guid}
     */
    static GUID_Miscellaneous2Callbacks => Guid("{406b2f00-3e5a-11d1-b640-00aa00a1f96a}")

    /**
     * @type {Integer (Int32)}
     */
    static DDPF_NOVEL_TEXTURE_FORMAT => 1048576

    /**
     * @type {Integer (Int32)}
     */
    static DDPF_D3DFORMAT => 2097152

    /**
     * @type {Integer (Int32)}
     */
    static D3DFORMAT_OP_TEXTURE => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DFORMAT_OP_VOLUMETEXTURE => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DFORMAT_OP_CUBETEXTURE => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3DFORMAT_OP_OFFSCREEN_RENDERTARGET => 8

    /**
     * @type {Integer (Int32)}
     */
    static D3DFORMAT_OP_SAME_FORMAT_RENDERTARGET => 16

    /**
     * @type {Integer (Int32)}
     */
    static D3DFORMAT_OP_ZSTENCIL => 64

    /**
     * @type {Integer (Int32)}
     */
    static D3DFORMAT_OP_ZSTENCIL_WITH_ARBITRARY_COLOR_DEPTH => 128

    /**
     * @type {Integer (Int32)}
     */
    static D3DFORMAT_OP_SAME_FORMAT_UP_TO_ALPHA_RENDERTARGET => 256

    /**
     * @type {Integer (Int32)}
     */
    static D3DFORMAT_OP_DISPLAYMODE => 1024

    /**
     * @type {Integer (Int32)}
     */
    static D3DFORMAT_OP_3DACCELERATION => 2048

    /**
     * @type {Integer (Int32)}
     */
    static D3DFORMAT_OP_PIXELSIZE => 4096

    /**
     * @type {Integer (Int32)}
     */
    static D3DFORMAT_OP_CONVERT_TO_ARGB => 8192

    /**
     * @type {Integer (Int32)}
     */
    static D3DFORMAT_OP_OFFSCREENPLAIN => 16384

    /**
     * @type {Integer (Int32)}
     */
    static D3DFORMAT_OP_SRGBREAD => 32768

    /**
     * @type {Integer (Int32)}
     */
    static D3DFORMAT_OP_BUMPMAP => 65536

    /**
     * @type {Integer (Int32)}
     */
    static D3DFORMAT_OP_DMAP => 131072

    /**
     * @type {Integer (Int32)}
     */
    static D3DFORMAT_OP_NOFILTER => 262144

    /**
     * @type {Integer (Int32)}
     */
    static D3DFORMAT_MEMBEROFGROUP_ARGB => 524288

    /**
     * @type {Integer (Int32)}
     */
    static D3DFORMAT_OP_SRGBWRITE => 1048576

    /**
     * @type {Integer (Int32)}
     */
    static D3DFORMAT_OP_NOALPHABLEND => 2097152

    /**
     * @type {Integer (Int32)}
     */
    static D3DFORMAT_OP_AUTOGENMIPMAP => 4194304

    /**
     * @type {Integer (Int32)}
     */
    static D3DFORMAT_OP_VERTEXTEXTURE => 8388608

    /**
     * @type {Integer (Int32)}
     */
    static D3DFORMAT_OP_NOTEXCOORDWRAPNORMIP => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static DELETED_OK => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DELETED_LASTONE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DELETED_NOTFOUND => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DCICOMMAND => 3075

    /**
     * @type {Integer (Int32)}
     */
    static DD_VERSION => 512

    /**
     * @type {Integer (Int32)}
     */
    static DD_RUNTIME_VERSION => 2306

    /**
     * @type {Integer (UInt32)}
     */
    static DD_HAL_VERSION => 256

    /**
     * @type {Integer (UInt32)}
     */
    static DDCREATEDRIVEROBJECT => 10

    /**
     * @type {Integer (UInt32)}
     */
    static DDGET32BITDRIVERNAME => 11

    /**
     * @type {Integer (UInt32)}
     */
    static DDNEWCALLBACKFNS => 12

    /**
     * @type {Integer (UInt32)}
     */
    static DDVERSIONINFO => 13

    /**
     * @type {String}
     */
    static DDHAL_DRIVER_DLLNAME => "DDRAW16.DLL"

    /**
     * @type {String}
     */
    static DDHAL_APP_DLLNAME => "DDRAW.DLL"

    /**
     * @type {Integer (UInt32)}
     */
    static CCHDEVICENAME => 32

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_DRIVER_NAME => 32

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_PALETTE_SIZE => 256

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_AUTOFLIP_BUFFERS => 10

    /**
     * @type {Integer (Int32)}
     */
    static DDSCAPS_EXECUTEBUFFER => 8388608

    /**
     * @type {Integer (Int32)}
     */
    static DDSCAPS2_VERTEXBUFFER => 32

    /**
     * @type {Integer (Int32)}
     */
    static DDSCAPS2_COMMANDBUFFER => 64

    /**
     * @type {Integer (Int32)}
     */
    static DDSCAPS2_INDEXBUFFER => 67108864

    /**
     * @type {Integer (Int32)}
     */
    static DDSCAPS3_VIDEO => 512

    /**
     * @type {Integer (UInt32)}
     */
    static D3DFMT_INTERNAL_D32 => 71

    /**
     * @type {Integer (UInt32)}
     */
    static D3DFMT_INTERNAL_S1D15 => 72

    /**
     * @type {Integer (UInt32)}
     */
    static D3DFMT_INTERNAL_D15S1 => 73

    /**
     * @type {Integer (UInt32)}
     */
    static D3DFMT_INTERNAL_S8D24 => 74

    /**
     * @type {Integer (UInt32)}
     */
    static D3DFMT_INTERNAL_D24S8 => 75

    /**
     * @type {Integer (UInt32)}
     */
    static D3DFMT_INTERNAL_X8D24 => 76

    /**
     * @type {Integer (UInt32)}
     */
    static D3DFMT_INTERNAL_D24X8 => 77

    /**
     * @type {Integer (Int32)}
     */
    static DDHAL_PLEASEALLOC_BLOCKSIZE => 2

    /**
     * @type {Integer (Int32)}
     */
    static DDHAL_PLEASEALLOC_LINEARSIZE => 3

    /**
     * @type {Integer (Int32)}
     */
    static VIDMEM_ISLINEAR => 1

    /**
     * @type {Integer (Int32)}
     */
    static VIDMEM_ISRECTANGULAR => 2

    /**
     * @type {Integer (Int32)}
     */
    static VIDMEM_ISHEAP => 4

    /**
     * @type {Integer (Int32)}
     */
    static VIDMEM_ISNONLOCAL => 8

    /**
     * @type {Integer (Int32)}
     */
    static VIDMEM_ISWC => 16

    /**
     * @type {Integer (Int32)}
     */
    static VIDMEM_HEAPDISABLED => 32

    /**
     * @type {Integer (Int32)}
     */
    static HEAPALIASINFO_MAPPEDREAL => 1

    /**
     * @type {Integer (Int32)}
     */
    static HEAPALIASINFO_MAPPEDDUMMY => 2

    /**
     * @type {Integer (Int32)}
     */
    static DDHAL_CB32_DESTROYDRIVER => 1

    /**
     * @type {Integer (Int32)}
     */
    static DDHAL_CB32_CREATESURFACE => 2

    /**
     * @type {Integer (Int32)}
     */
    static DDHAL_CB32_SETCOLORKEY => 4

    /**
     * @type {Integer (Int32)}
     */
    static DDHAL_CB32_SETMODE => 8

    /**
     * @type {Integer (Int32)}
     */
    static DDHAL_CB32_WAITFORVERTICALBLANK => 16

    /**
     * @type {Integer (Int32)}
     */
    static DDHAL_CB32_CANCREATESURFACE => 32

    /**
     * @type {Integer (Int32)}
     */
    static DDHAL_CB32_CREATEPALETTE => 64

    /**
     * @type {Integer (Int32)}
     */
    static DDHAL_CB32_GETSCANLINE => 128

    /**
     * @type {Integer (Int32)}
     */
    static DDHAL_CB32_SETEXCLUSIVEMODE => 256

    /**
     * @type {Integer (Int32)}
     */
    static DDHAL_CB32_FLIPTOGDISURFACE => 512

    /**
     * @type {Integer (Int32)}
     */
    static DDHAL_PALCB32_DESTROYPALETTE => 1

    /**
     * @type {Integer (Int32)}
     */
    static DDHAL_PALCB32_SETENTRIES => 2

    /**
     * @type {Integer (Int32)}
     */
    static DDHAL_SURFCB32_DESTROYSURFACE => 1

    /**
     * @type {Integer (Int32)}
     */
    static DDHAL_SURFCB32_FLIP => 2

    /**
     * @type {Integer (Int32)}
     */
    static DDHAL_SURFCB32_SETCLIPLIST => 4

    /**
     * @type {Integer (Int32)}
     */
    static DDHAL_SURFCB32_LOCK => 8

    /**
     * @type {Integer (Int32)}
     */
    static DDHAL_SURFCB32_UNLOCK => 16

    /**
     * @type {Integer (Int32)}
     */
    static DDHAL_SURFCB32_BLT => 32

    /**
     * @type {Integer (Int32)}
     */
    static DDHAL_SURFCB32_SETCOLORKEY => 64

    /**
     * @type {Integer (Int32)}
     */
    static DDHAL_SURFCB32_ADDATTACHEDSURFACE => 128

    /**
     * @type {Integer (Int32)}
     */
    static DDHAL_SURFCB32_GETBLTSTATUS => 256

    /**
     * @type {Integer (Int32)}
     */
    static DDHAL_SURFCB32_GETFLIPSTATUS => 512

    /**
     * @type {Integer (Int32)}
     */
    static DDHAL_SURFCB32_UPDATEOVERLAY => 1024

    /**
     * @type {Integer (Int32)}
     */
    static DDHAL_SURFCB32_SETOVERLAYPOSITION => 2048

    /**
     * @type {Integer (Int32)}
     */
    static DDHAL_SURFCB32_RESERVED4 => 4096

    /**
     * @type {Integer (Int32)}
     */
    static DDHAL_SURFCB32_SETPALETTE => 8192

    /**
     * @type {Integer (Int32)}
     */
    static DDHAL_MISCCB32_GETAVAILDRIVERMEMORY => 1

    /**
     * @type {Integer (Int32)}
     */
    static DDHAL_MISCCB32_UPDATENONLOCALHEAP => 2

    /**
     * @type {Integer (Int32)}
     */
    static DDHAL_MISCCB32_GETHEAPALIGNMENT => 4

    /**
     * @type {Integer (Int32)}
     */
    static DDHAL_MISCCB32_GETSYSMEMBLTSTATUS => 8

    /**
     * @type {Integer (Int32)}
     */
    static DDHAL_MISC2CB32_CREATESURFACEEX => 2

    /**
     * @type {Integer (Int32)}
     */
    static DDHAL_MISC2CB32_GETDRIVERSTATE => 4

    /**
     * @type {Integer (Int32)}
     */
    static DDHAL_MISC2CB32_DESTROYDDLOCAL => 8

    /**
     * @type {Integer (Int32)}
     */
    static DDHAL_EXEBUFCB32_CANCREATEEXEBUF => 1

    /**
     * @type {Integer (Int32)}
     */
    static DDHAL_EXEBUFCB32_CREATEEXEBUF => 2

    /**
     * @type {Integer (Int32)}
     */
    static DDHAL_EXEBUFCB32_DESTROYEXEBUF => 4

    /**
     * @type {Integer (Int32)}
     */
    static DDHAL_EXEBUFCB32_LOCKEXEBUF => 8

    /**
     * @type {Integer (Int32)}
     */
    static DDHAL_EXEBUFCB32_UNLOCKEXEBUF => 16

    /**
     * @type {Integer (Int32)}
     */
    static DDHAL_VPORT32_CANCREATEVIDEOPORT => 1

    /**
     * @type {Integer (Int32)}
     */
    static DDHAL_VPORT32_CREATEVIDEOPORT => 2

    /**
     * @type {Integer (Int32)}
     */
    static DDHAL_VPORT32_FLIP => 4

    /**
     * @type {Integer (Int32)}
     */
    static DDHAL_VPORT32_GETBANDWIDTH => 8

    /**
     * @type {Integer (Int32)}
     */
    static DDHAL_VPORT32_GETINPUTFORMATS => 16

    /**
     * @type {Integer (Int32)}
     */
    static DDHAL_VPORT32_GETOUTPUTFORMATS => 32

    /**
     * @type {Integer (Int32)}
     */
    static DDHAL_VPORT32_GETFIELD => 128

    /**
     * @type {Integer (Int32)}
     */
    static DDHAL_VPORT32_GETLINE => 256

    /**
     * @type {Integer (Int32)}
     */
    static DDHAL_VPORT32_GETCONNECT => 512

    /**
     * @type {Integer (Int32)}
     */
    static DDHAL_VPORT32_DESTROY => 1024

    /**
     * @type {Integer (Int32)}
     */
    static DDHAL_VPORT32_GETFLIPSTATUS => 2048

    /**
     * @type {Integer (Int32)}
     */
    static DDHAL_VPORT32_UPDATE => 4096

    /**
     * @type {Integer (Int32)}
     */
    static DDHAL_VPORT32_WAITFORSYNC => 8192

    /**
     * @type {Integer (Int32)}
     */
    static DDHAL_VPORT32_GETSIGNALSTATUS => 16384

    /**
     * @type {Integer (Int32)}
     */
    static DDHAL_VPORT32_COLORCONTROL => 32768

    /**
     * @type {Integer (Int32)}
     */
    static DDHAL_COLOR_COLORCONTROL => 1

    /**
     * @type {Integer (Int32)}
     */
    static DDHAL_KERNEL_SYNCSURFACEDATA => 1

    /**
     * @type {Integer (Int32)}
     */
    static DDHAL_KERNEL_SYNCVIDEOPORTDATA => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DDHAL_MOCOMP32_GETGUIDS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DDHAL_MOCOMP32_GETFORMATS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DDHAL_MOCOMP32_CREATE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DDHAL_MOCOMP32_GETCOMPBUFFINFO => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DDHAL_MOCOMP32_GETINTERNALINFO => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DDHAL_MOCOMP32_BEGINFRAME => 32

    /**
     * @type {Integer (UInt32)}
     */
    static DDHAL_MOCOMP32_ENDFRAME => 64

    /**
     * @type {Integer (UInt32)}
     */
    static DDHAL_MOCOMP32_RENDER => 128

    /**
     * @type {Integer (UInt32)}
     */
    static DDHAL_MOCOMP32_QUERYSTATUS => 256

    /**
     * @type {Integer (UInt32)}
     */
    static DDHAL_MOCOMP32_DESTROY => 512

    /**
     * @type {Integer (Int32)}
     */
    static DDHAL_DRIVER_NOTHANDLED => 0

    /**
     * @type {Integer (Int32)}
     */
    static DDHAL_DRIVER_HANDLED => 1

    /**
     * @type {Integer (Int32)}
     */
    static DDHAL_DRIVER_NOCKEYHW => 2

    /**
     * @type {Integer (Int32)}
     */
    static DDRAWIPAL_256 => 1

    /**
     * @type {Integer (Int32)}
     */
    static DDRAWIPAL_16 => 2

    /**
     * @type {Integer (Int32)}
     */
    static DDRAWIPAL_GDI => 4

    /**
     * @type {Integer (Int32)}
     */
    static DDRAWIPAL_STORED_8 => 8

    /**
     * @type {Integer (Int32)}
     */
    static DDRAWIPAL_STORED_16 => 16

    /**
     * @type {Integer (Int32)}
     */
    static DDRAWIPAL_STORED_24 => 32

    /**
     * @type {Integer (Int32)}
     */
    static DDRAWIPAL_EXCLUSIVE => 64

    /**
     * @type {Integer (Int32)}
     */
    static DDRAWIPAL_INHEL => 128

    /**
     * @type {Integer (Int32)}
     */
    static DDRAWIPAL_DIRTY => 256

    /**
     * @type {Integer (Int32)}
     */
    static DDRAWIPAL_ALLOW256 => 512

    /**
     * @type {Integer (Int32)}
     */
    static DDRAWIPAL_4 => 1024

    /**
     * @type {Integer (Int32)}
     */
    static DDRAWIPAL_2 => 2048

    /**
     * @type {Integer (Int32)}
     */
    static DDRAWIPAL_STORED_8INDEX => 4096

    /**
     * @type {Integer (Int32)}
     */
    static DDRAWIPAL_ALPHA => 8192

    /**
     * @type {Integer (Int32)}
     */
    static DDRAWICLIP_WATCHWINDOW => 1

    /**
     * @type {Integer (Int32)}
     */
    static DDRAWICLIP_ISINITIALIZED => 2

    /**
     * @type {Integer (Int32)}
     */
    static DDRAWICLIP_INMASTERSPRITELIST => 4

    /**
     * @type {Integer (Int32)}
     */
    static DDAL_IMPLICIT => 1

    /**
     * @type {Integer (Int32)}
     */
    static ACCESSRECT_VRAMSTYLE => 1

    /**
     * @type {Integer (Int32)}
     */
    static ACCESSRECT_NOTHOLDINGWIN16LOCK => 2

    /**
     * @type {Integer (Int32)}
     */
    static ACCESSRECT_BROKEN => 4

    /**
     * @type {Integer (UInt32)}
     */
    static PFINDEX_UNINITIALIZED => 0

    /**
     * @type {Integer (Int32)}
     */
    static DDRAWISURFGBL_MEMFREE => 1

    /**
     * @type {Integer (Int32)}
     */
    static DDRAWISURFGBL_SYSMEMREQUESTED => 2

    /**
     * @type {Integer (Int32)}
     */
    static DDRAWISURFGBL_ISGDISURFACE => 4

    /**
     * @type {Integer (Int32)}
     */
    static DDRAWISURFGBL_SOFTWAREAUTOFLIP => 8

    /**
     * @type {Integer (Int32)}
     */
    static DDRAWISURFGBL_LOCKNOTHOLDINGWIN16LOCK => 16

    /**
     * @type {Integer (Int32)}
     */
    static DDRAWISURFGBL_LOCKVRAMSTYLE => 32

    /**
     * @type {Integer (Int32)}
     */
    static DDRAWISURFGBL_LOCKBROKEN => 64

    /**
     * @type {Integer (Int32)}
     */
    static DDRAWISURFGBL_IMPLICITHANDLE => 128

    /**
     * @type {Integer (Int32)}
     */
    static DDRAWISURFGBL_ISCLIENTMEM => 256

    /**
     * @type {Integer (Int32)}
     */
    static DDRAWISURFGBL_HARDWAREOPSOURCE => 512

    /**
     * @type {Integer (Int32)}
     */
    static DDRAWISURFGBL_HARDWAREOPDEST => 1024

    /**
     * @type {Integer (Int32)}
     */
    static DDRAWISURFGBL_VPORTINTERLEAVED => 2048

    /**
     * @type {Integer (Int32)}
     */
    static DDRAWISURFGBL_VPORTDATA => 4096

    /**
     * @type {Integer (Int32)}
     */
    static DDRAWISURFGBL_LATEALLOCATELINEAR => 8192

    /**
     * @type {Integer (Int32)}
     */
    static DDRAWISURFGBL_SYSMEMEXECUTEBUFFER => 16384

    /**
     * @type {Integer (Int32)}
     */
    static DDRAWISURFGBL_FASTLOCKHELD => 32768

    /**
     * @type {Integer (Int32)}
     */
    static DDRAWISURFGBL_READONLYLOCKHELD => 65536

    /**
     * @type {Integer (Int32)}
     */
    static DDRAWISURFGBL_DX8SURFACE => 524288

    /**
     * @type {Integer (Int32)}
     */
    static DDRAWISURFGBL_DDHELDONTFREE => 1048576

    /**
     * @type {Integer (Int32)}
     */
    static DDRAWISURFGBL_NOTIFYWHENUNLOCKED => 2097152

    /**
     * @type {Integer (Int32)}
     */
    static DDRAWISURFGBL_RESERVED0 => -2147483648

    /**
     * @type {Integer (Int32)}
     */
    static DDRAWISURF_ATTACHED => 1

    /**
     * @type {Integer (Int32)}
     */
    static DDRAWISURF_IMPLICITCREATE => 2

    /**
     * @type {Integer (Int32)}
     */
    static DDRAWISURF_ISFREE => 4

    /**
     * @type {Integer (Int32)}
     */
    static DDRAWISURF_ATTACHED_FROM => 8

    /**
     * @type {Integer (Int32)}
     */
    static DDRAWISURF_IMPLICITROOT => 16

    /**
     * @type {Integer (Int32)}
     */
    static DDRAWISURF_PARTOFPRIMARYCHAIN => 32

    /**
     * @type {Integer (Int32)}
     */
    static DDRAWISURF_DATAISALIASED => 64

    /**
     * @type {Integer (Int32)}
     */
    static DDRAWISURF_HASDC => 128

    /**
     * @type {Integer (Int32)}
     */
    static DDRAWISURF_HASCKEYDESTOVERLAY => 256

    /**
     * @type {Integer (Int32)}
     */
    static DDRAWISURF_HASCKEYDESTBLT => 512

    /**
     * @type {Integer (Int32)}
     */
    static DDRAWISURF_HASCKEYSRCOVERLAY => 1024

    /**
     * @type {Integer (Int32)}
     */
    static DDRAWISURF_HASCKEYSRCBLT => 2048

    /**
     * @type {Integer (Int32)}
     */
    static DDRAWISURF_LOCKEXCLUDEDCURSOR => 4096

    /**
     * @type {Integer (Int32)}
     */
    static DDRAWISURF_HASPIXELFORMAT => 8192

    /**
     * @type {Integer (Int32)}
     */
    static DDRAWISURF_HASOVERLAYDATA => 16384

    /**
     * @type {Integer (Int32)}
     */
    static DDRAWISURF_SETGAMMA => 32768

    /**
     * @type {Integer (Int32)}
     */
    static DDRAWISURF_SW_CKEYDESTOVERLAY => 65536

    /**
     * @type {Integer (Int32)}
     */
    static DDRAWISURF_SW_CKEYDESTBLT => 131072

    /**
     * @type {Integer (Int32)}
     */
    static DDRAWISURF_SW_CKEYSRCOVERLAY => 262144

    /**
     * @type {Integer (Int32)}
     */
    static DDRAWISURF_SW_CKEYSRCBLT => 524288

    /**
     * @type {Integer (Int32)}
     */
    static DDRAWISURF_HW_CKEYDESTOVERLAY => 1048576

    /**
     * @type {Integer (Int32)}
     */
    static DDRAWISURF_HW_CKEYDESTBLT => 2097152

    /**
     * @type {Integer (Int32)}
     */
    static DDRAWISURF_HW_CKEYSRCOVERLAY => 4194304

    /**
     * @type {Integer (Int32)}
     */
    static DDRAWISURF_HW_CKEYSRCBLT => 8388608

    /**
     * @type {Integer (Int32)}
     */
    static DDRAWISURF_INMASTERSPRITELIST => 16777216

    /**
     * @type {Integer (Int32)}
     */
    static DDRAWISURF_HELCB => 33554432

    /**
     * @type {Integer (Int32)}
     */
    static DDRAWISURF_FRONTBUFFER => 67108864

    /**
     * @type {Integer (Int32)}
     */
    static DDRAWISURF_BACKBUFFER => 134217728

    /**
     * @type {Integer (Int32)}
     */
    static DDRAWISURF_INVALID => 268435456

    /**
     * @type {Integer (Int32)}
     */
    static DDRAWISURF_DCIBUSY => 536870912

    /**
     * @type {Integer (Int32)}
     */
    static DDRAWISURF_GETDCNULL => 1073741824

    /**
     * @type {Integer (Int32)}
     */
    static DDRAWISURF_STEREOSURFACELEFT => 536870912

    /**
     * @type {Integer (Int32)}
     */
    static DDRAWISURF_DRIVERMANAGED => 1073741824

    /**
     * @type {Integer (Int32)}
     */
    static DDRAWISURF_DCILOCK => -2147483648

    /**
     * @type {Integer (Int32)}
     */
    static ROP_HAS_SOURCE => 1

    /**
     * @type {Integer (Int32)}
     */
    static ROP_HAS_PATTERN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DDMODEINFO_PALETTIZED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DDMODEINFO_MODEX => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DDMODEINFO_UNSUPPORTED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DDMODEINFO_STANDARDVGA => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DDMODEINFO_MAXREFRESH => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DDMODEINFO_STEREO => 32

    /**
     * @type {Integer (Int32)}
     */
    static DDRAWILCL_HASEXCLUSIVEMODE => 1

    /**
     * @type {Integer (Int32)}
     */
    static DDRAWILCL_ISFULLSCREEN => 2

    /**
     * @type {Integer (Int32)}
     */
    static DDRAWILCL_SETCOOPCALLED => 4

    /**
     * @type {Integer (Int32)}
     */
    static DDRAWILCL_ACTIVEYES => 8

    /**
     * @type {Integer (Int32)}
     */
    static DDRAWILCL_ACTIVENO => 16

    /**
     * @type {Integer (Int32)}
     */
    static DDRAWILCL_HOOKEDHWND => 32

    /**
     * @type {Integer (Int32)}
     */
    static DDRAWILCL_ALLOWMODEX => 64

    /**
     * @type {Integer (Int32)}
     */
    static DDRAWILCL_V1SCLBEHAVIOUR => 128

    /**
     * @type {Integer (Int32)}
     */
    static DDRAWILCL_MODEHASBEENCHANGED => 256

    /**
     * @type {Integer (Int32)}
     */
    static DDRAWILCL_CREATEDWINDOW => 512

    /**
     * @type {Integer (Int32)}
     */
    static DDRAWILCL_DIRTYDC => 1024

    /**
     * @type {Integer (Int32)}
     */
    static DDRAWILCL_DISABLEINACTIVATE => 2048

    /**
     * @type {Integer (Int32)}
     */
    static DDRAWILCL_CURSORCLIPPED => 4096

    /**
     * @type {Integer (Int32)}
     */
    static DDRAWILCL_EXPLICITMONITOR => 8192

    /**
     * @type {Integer (Int32)}
     */
    static DDRAWILCL_MULTITHREADED => 16384

    /**
     * @type {Integer (Int32)}
     */
    static DDRAWILCL_FPUSETUP => 32768

    /**
     * @type {Integer (Int32)}
     */
    static DDRAWILCL_POWEREDDOWN => 65536

    /**
     * @type {Integer (Int32)}
     */
    static DDRAWILCL_DIRECTDRAW7 => 131072

    /**
     * @type {Integer (Int32)}
     */
    static DDRAWILCL_ATTEMPTEDD3DCONTEXT => 262144

    /**
     * @type {Integer (Int32)}
     */
    static DDRAWILCL_FPUPRESERVE => 524288

    /**
     * @type {Integer (Int32)}
     */
    static DDRAWILCL_DX8DRIVER => 1048576

    /**
     * @type {Integer (Int32)}
     */
    static DDRAWILCL_DIRECTDRAW8 => 2097152

    /**
     * @type {Integer (Int32)}
     */
    static DDRAWI_xxxxxxxxx1 => 1

    /**
     * @type {Integer (Int32)}
     */
    static DDRAWI_xxxxxxxxx2 => 2

    /**
     * @type {Integer (Int32)}
     */
    static DDRAWI_VIRTUALDESKTOP => 8

    /**
     * @type {Integer (Int32)}
     */
    static DDRAWI_MODEX => 16

    /**
     * @type {Integer (Int32)}
     */
    static DDRAWI_DISPLAYDRV => 32

    /**
     * @type {Integer (Int32)}
     */
    static DDRAWI_FULLSCREEN => 64

    /**
     * @type {Integer (Int32)}
     */
    static DDRAWI_MODECHANGED => 128

    /**
     * @type {Integer (Int32)}
     */
    static DDRAWI_NOHARDWARE => 256

    /**
     * @type {Integer (Int32)}
     */
    static DDRAWI_PALETTEINIT => 512

    /**
     * @type {Integer (Int32)}
     */
    static DDRAWI_NOEMULATION => 1024

    /**
     * @type {Integer (Int32)}
     */
    static DDRAWI_HASCKEYDESTOVERLAY => 2048

    /**
     * @type {Integer (Int32)}
     */
    static DDRAWI_HASCKEYSRCOVERLAY => 4096

    /**
     * @type {Integer (Int32)}
     */
    static DDRAWI_HASGDIPALETTE => 8192

    /**
     * @type {Integer (Int32)}
     */
    static DDRAWI_EMULATIONINITIALIZED => 16384

    /**
     * @type {Integer (Int32)}
     */
    static DDRAWI_HASGDIPALETTE_EXCLUSIVE => 32768

    /**
     * @type {Integer (Int32)}
     */
    static DDRAWI_MODEXILLEGAL => 65536

    /**
     * @type {Integer (Int32)}
     */
    static DDRAWI_FLIPPEDTOGDI => 131072

    /**
     * @type {Integer (Int32)}
     */
    static DDRAWI_NEEDSWIN16FORVRAMLOCK => 262144

    /**
     * @type {Integer (Int32)}
     */
    static DDRAWI_PDEVICEVRAMBITCLEARED => 524288

    /**
     * @type {Integer (Int32)}
     */
    static DDRAWI_STANDARDVGA => 1048576

    /**
     * @type {Integer (Int32)}
     */
    static DDRAWI_EXTENDEDALIGNMENT => 2097152

    /**
     * @type {Integer (Int32)}
     */
    static DDRAWI_CHANGINGMODE => 4194304

    /**
     * @type {Integer (Int32)}
     */
    static DDRAWI_GDIDRV => 8388608

    /**
     * @type {Integer (Int32)}
     */
    static DDRAWI_ATTACHEDTODESKTOP => 16777216

    /**
     * @type {Integer (Int32)}
     */
    static DDRAWI_UMODELOADED => 33554432

    /**
     * @type {Integer (Int32)}
     */
    static DDRAWI_DDRAWDATANOTFETCHED => 67108864

    /**
     * @type {Integer (Int32)}
     */
    static DDRAWI_SECONDARYDRIVERLOADED => 134217728

    /**
     * @type {Integer (Int32)}
     */
    static DDRAWI_TESTINGMODES => 268435456

    /**
     * @type {Integer (Int32)}
     */
    static DDRAWI_DRIVERINFO2 => 536870912

    /**
     * @type {Integer (Int32)}
     */
    static DDRAWI_BADPDEV => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static DDRAWIVPORT_ON => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DDRAWIVPORT_SOFTWARE_AUTOFLIP => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DDRAWIVPORT_COLORKEYANDINTERP => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DDRAWIVPORT_NOKERNELHANDLES => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DDRAWIVPORT_SOFTWARE_BOB => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DDRAWIVPORT_VBION => 32

    /**
     * @type {Integer (UInt32)}
     */
    static DDRAWIVPORT_VIDEOON => 64

    /**
     * @type {Integer (Int32)}
     */
    static DDHALINFO_ISPRIMARYDISPLAY => 1

    /**
     * @type {Integer (Int32)}
     */
    static DDHALINFO_MODEXILLEGAL => 2

    /**
     * @type {Integer (Int32)}
     */
    static DDHALINFO_GETDRIVERINFOSET => 4

    /**
     * @type {Integer (Int32)}
     */
    static DDHALINFO_GETDRIVERINFO2 => 8

    /**
     * @type {Integer (Int32)}
     */
    static DDWAITVB_I_TESTVB => -2147483642

    /**
     * @type {Integer (UInt32)}
     */
    static DDRAWI_VPORTSTART => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DDRAWI_VPORTSTOP => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DDRAWI_VPORTUPDATE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DDRAWI_VPORTGETCOLOR => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DDRAWI_VPORTSETCOLOR => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DDRAWI_GETCOLOR => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DDRAWI_SETCOLOR => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DDMCQUERY_READ => 1

    /**
     * @type {Guid}
     */
    static GUID_D3DCaps => Guid("{7bf06991-8794-11d0-9139-080036d2ef02}")

    /**
     * @type {Guid}
     */
    static GUID_D3DCallbacks => Guid("{7bf06990-8794-11d0-9139-080036d2ef02}")

    /**
     * @type {Guid}
     */
    static GUID_DDMoreCaps => Guid("{880baf30-b030-11d0-8ea7-00609797ea5b}")

    /**
     * @type {Guid}
     */
    static GUID_NTCallbacks => Guid("{6fe9ecde-df89-11d1-9db0-0060082771ba}")

    /**
     * @type {Guid}
     */
    static GUID_GetHeapAlignment => Guid("{42e02f16-7b41-11d2-8bff-00a0c983eaf6}")

    /**
     * @type {Guid}
     */
    static GUID_UpdateNonLocalHeap => Guid("{42e02f17-7b41-11d2-8bff-00a0c983eaf6}")

    /**
     * @type {Guid}
     */
    static GUID_NTPrivateDriverCaps => Guid("{fad16a23-7b66-11d2-83d7-00c04f7ce58c}")

    /**
     * @type {Guid}
     */
    static GUID_VPE2Callbacks => Guid("{52882147-2d47-469a-a0d1-03455890f6c8}")

    /**
     * @type {Integer (Int32)}
     */
    static DDSCAPS_COMMANDBUFFER => 1024

    /**
     * @type {Integer (Int32)}
     */
    static DDHAL_PLEASEALLOC_USERMEM => 4

    /**
     * @type {Integer (Int32)}
     */
    static DDHAL_CB32_MAPMEMORY => -2147483648

    /**
     * @type {Integer (Int32)}
     */
    static DDHAL_MISC2CB32_ALPHABLT => 1

    /**
     * @type {Integer (Int32)}
     */
    static DDHAL_CREATESURFACEEX_SWAPHANDLES => 1

    /**
     * @type {Integer (Int32)}
     */
    static DDHAL_NTCB32_FREEDRIVERMEMORY => 1

    /**
     * @type {Integer (Int32)}
     */
    static DDHAL_NTCB32_SETEXCLUSIVEMODE => 2

    /**
     * @type {Integer (Int32)}
     */
    static DDHAL_NTCB32_FLIPTOGDISURFACE => 4

    /**
     * @type {Integer (Int32)}
     */
    static DDHAL_VPORT32_GETAUTOFLIPSURF => 64

    /**
     * @type {Integer (Int32)}
     */
    static DDHAL_D3DBUFCB32_CANCREATED3DBUF => 1

    /**
     * @type {Integer (Int32)}
     */
    static DDHAL_D3DBUFCB32_CREATED3DBUF => 2

    /**
     * @type {Integer (Int32)}
     */
    static DDHAL_D3DBUFCB32_DESTROYD3DBUF => 4

    /**
     * @type {Integer (Int32)}
     */
    static DDHAL_D3DBUFCB32_LOCKD3DBUF => 8

    /**
     * @type {Integer (Int32)}
     */
    static DDHAL_D3DBUFCB32_UNLOCKD3DBUF => 16

    /**
     * @type {Integer (Int32)}
     */
    static DDHAL_PRIVATECAP_ATOMICSURFACECREATION => 1

    /**
     * @type {Integer (Int32)}
     */
    static DDHAL_PRIVATECAP_NOTIFYPRIMARYCREATION => 2

    /**
     * @type {Integer (Int32)}
     */
    static DDHAL_PRIVATECAP_RESERVED1 => 4

    /**
     * @type {Integer (Int32)}
     */
    static DDBLT_AFLAGS => -2147483648

    /**
     * @type {Integer (Int32)}
     */
    static DDABLT_SRCOVERDEST => 1

    /**
     * @type {Integer (Int32)}
     */
    static DDKERNELCAPS_SKIPFIELDS => 1

    /**
     * @type {Integer (Int32)}
     */
    static DDKERNELCAPS_AUTOFLIP => 2

    /**
     * @type {Integer (Int32)}
     */
    static DDKERNELCAPS_SETSTATE => 4

    /**
     * @type {Integer (Int32)}
     */
    static DDKERNELCAPS_LOCK => 8

    /**
     * @type {Integer (Int32)}
     */
    static DDKERNELCAPS_FLIPVIDEOPORT => 16

    /**
     * @type {Integer (Int32)}
     */
    static DDKERNELCAPS_FLIPOVERLAY => 32

    /**
     * @type {Integer (Int32)}
     */
    static DDKERNELCAPS_CAPTURE_SYSMEM => 64

    /**
     * @type {Integer (Int32)}
     */
    static DDKERNELCAPS_CAPTURE_NONLOCALVIDMEM => 128

    /**
     * @type {Integer (Int32)}
     */
    static DDKERNELCAPS_FIELDPOLARITY => 256

    /**
     * @type {Integer (Int32)}
     */
    static DDKERNELCAPS_CAPTURE_INVERTED => 512

    /**
     * @type {Integer (Int32)}
     */
    static DDIRQ_DISPLAY_VSYNC => 1

    /**
     * @type {Integer (Int32)}
     */
    static DDIRQ_RESERVED1 => 2

    /**
     * @type {Integer (Int32)}
     */
    static DDIRQ_VPORT0_VSYNC => 4

    /**
     * @type {Integer (Int32)}
     */
    static DDIRQ_VPORT0_LINE => 8

    /**
     * @type {Integer (Int32)}
     */
    static DDIRQ_VPORT1_VSYNC => 16

    /**
     * @type {Integer (Int32)}
     */
    static DDIRQ_VPORT1_LINE => 32

    /**
     * @type {Integer (Int32)}
     */
    static DDIRQ_VPORT2_VSYNC => 64

    /**
     * @type {Integer (Int32)}
     */
    static DDIRQ_VPORT2_LINE => 128

    /**
     * @type {Integer (Int32)}
     */
    static DDIRQ_VPORT3_VSYNC => 256

    /**
     * @type {Integer (Int32)}
     */
    static DDIRQ_VPORT3_LINE => 512

    /**
     * @type {Integer (Int32)}
     */
    static DDIRQ_VPORT4_VSYNC => 1024

    /**
     * @type {Integer (Int32)}
     */
    static DDIRQ_VPORT4_LINE => 2048

    /**
     * @type {Integer (Int32)}
     */
    static DDIRQ_VPORT5_VSYNC => 4096

    /**
     * @type {Integer (Int32)}
     */
    static DDIRQ_VPORT5_LINE => 8192

    /**
     * @type {Integer (Int32)}
     */
    static DDIRQ_VPORT6_VSYNC => 16384

    /**
     * @type {Integer (Int32)}
     */
    static DDIRQ_VPORT6_LINE => 32768

    /**
     * @type {Integer (Int32)}
     */
    static DDIRQ_VPORT7_VSYNC => 65536

    /**
     * @type {Integer (Int32)}
     */
    static DDIRQ_VPORT7_LINE => 131072

    /**
     * @type {Integer (Int32)}
     */
    static DDIRQ_VPORT8_VSYNC => 262144

    /**
     * @type {Integer (Int32)}
     */
    static DDIRQ_VPORT8_LINE => 524288

    /**
     * @type {Integer (Int32)}
     */
    static DDIRQ_VPORT9_VSYNC => 65536

    /**
     * @type {Integer (Int32)}
     */
    static DDIRQ_VPORT9_LINE => 131072

    /**
     * @type {Integer (Int32)}
     */
    static SURFACEALIGN_DISCARDABLE => 1

    /**
     * @type {Integer (Int32)}
     */
    static VMEMHEAP_LINEAR => 1

    /**
     * @type {Integer (Int32)}
     */
    static VMEMHEAP_RECTANGULAR => 2

    /**
     * @type {Integer (Int32)}
     */
    static VMEMHEAP_ALIGNMENT => 4

    /**
     * @type {Guid}
     */
    static DDVPTYPE_E_HREFH_VREFH => Guid("{54f39980-da60-11cf-9b06-00a0c903a3b8}")

    /**
     * @type {Guid}
     */
    static DDVPTYPE_E_HREFH_VREFL => Guid("{92783220-da60-11cf-9b06-00a0c903a3b8}")

    /**
     * @type {Guid}
     */
    static DDVPTYPE_E_HREFL_VREFH => Guid("{a07a02e0-da60-11cf-9b06-00a0c903a3b8}")

    /**
     * @type {Guid}
     */
    static DDVPTYPE_E_HREFL_VREFL => Guid("{e09c77e0-da60-11cf-9b06-00a0c903a3b8}")

    /**
     * @type {Guid}
     */
    static DDVPTYPE_CCIR656 => Guid("{fca326a0-da60-11cf-9b06-00a0c903a3b8}")

    /**
     * @type {Guid}
     */
    static DDVPTYPE_BROOKTREE => Guid("{1352a560-da61-11cf-9b06-00a0c903a3b8}")

    /**
     * @type {Guid}
     */
    static DDVPTYPE_PHILIPS => Guid("{332cf160-da61-11cf-9b06-00a0c903a3b8}")

    /**
     * @type {Integer (Int32)}
     */
    static DDVPD_WIDTH => 1

    /**
     * @type {Integer (Int32)}
     */
    static DDVPD_HEIGHT => 2

    /**
     * @type {Integer (Int32)}
     */
    static DDVPD_ID => 4

    /**
     * @type {Integer (Int32)}
     */
    static DDVPD_CAPS => 8

    /**
     * @type {Integer (Int32)}
     */
    static DDVPD_FX => 16

    /**
     * @type {Integer (Int32)}
     */
    static DDVPD_AUTOFLIP => 32

    /**
     * @type {Integer (Int32)}
     */
    static DDVPD_ALIGN => 64

    /**
     * @type {Integer (Int32)}
     */
    static DDVPD_PREFERREDAUTOFLIP => 128

    /**
     * @type {Integer (Int32)}
     */
    static DDVPD_FILTERQUALITY => 256

    /**
     * @type {Integer (Int32)}
     */
    static DDVPCONNECT_DOUBLECLOCK => 1

    /**
     * @type {Integer (Int32)}
     */
    static DDVPCONNECT_VACT => 2

    /**
     * @type {Integer (Int32)}
     */
    static DDVPCONNECT_INVERTPOLARITY => 4

    /**
     * @type {Integer (Int32)}
     */
    static DDVPCONNECT_DISCARDSVREFDATA => 8

    /**
     * @type {Integer (Int32)}
     */
    static DDVPCONNECT_HALFLINE => 16

    /**
     * @type {Integer (Int32)}
     */
    static DDVPCONNECT_INTERLACED => 32

    /**
     * @type {Integer (Int32)}
     */
    static DDVPCONNECT_SHAREEVEN => 64

    /**
     * @type {Integer (Int32)}
     */
    static DDVPCONNECT_SHAREODD => 128

    /**
     * @type {Integer (Int32)}
     */
    static DDVPCAPS_AUTOFLIP => 1

    /**
     * @type {Integer (Int32)}
     */
    static DDVPCAPS_INTERLACED => 2

    /**
     * @type {Integer (Int32)}
     */
    static DDVPCAPS_NONINTERLACED => 4

    /**
     * @type {Integer (Int32)}
     */
    static DDVPCAPS_READBACKFIELD => 8

    /**
     * @type {Integer (Int32)}
     */
    static DDVPCAPS_READBACKLINE => 16

    /**
     * @type {Integer (Int32)}
     */
    static DDVPCAPS_SHAREABLE => 32

    /**
     * @type {Integer (Int32)}
     */
    static DDVPCAPS_SKIPEVENFIELDS => 64

    /**
     * @type {Integer (Int32)}
     */
    static DDVPCAPS_SKIPODDFIELDS => 128

    /**
     * @type {Integer (Int32)}
     */
    static DDVPCAPS_SYNCMASTER => 256

    /**
     * @type {Integer (Int32)}
     */
    static DDVPCAPS_VBISURFACE => 512

    /**
     * @type {Integer (Int32)}
     */
    static DDVPCAPS_COLORCONTROL => 1024

    /**
     * @type {Integer (Int32)}
     */
    static DDVPCAPS_OVERSAMPLEDVBI => 2048

    /**
     * @type {Integer (Int32)}
     */
    static DDVPCAPS_SYSTEMMEMORY => 4096

    /**
     * @type {Integer (Int32)}
     */
    static DDVPCAPS_VBIANDVIDEOINDEPENDENT => 8192

    /**
     * @type {Integer (Int32)}
     */
    static DDVPCAPS_HARDWAREDEINTERLACE => 16384

    /**
     * @type {Integer (Int32)}
     */
    static DDVPFX_CROPTOPDATA => 1

    /**
     * @type {Integer (Int32)}
     */
    static DDVPFX_CROPX => 2

    /**
     * @type {Integer (Int32)}
     */
    static DDVPFX_CROPY => 4

    /**
     * @type {Integer (Int32)}
     */
    static DDVPFX_INTERLEAVE => 8

    /**
     * @type {Integer (Int32)}
     */
    static DDVPFX_MIRRORLEFTRIGHT => 16

    /**
     * @type {Integer (Int32)}
     */
    static DDVPFX_MIRRORUPDOWN => 32

    /**
     * @type {Integer (Int32)}
     */
    static DDVPFX_PRESHRINKX => 64

    /**
     * @type {Integer (Int32)}
     */
    static DDVPFX_PRESHRINKY => 128

    /**
     * @type {Integer (Int32)}
     */
    static DDVPFX_PRESHRINKXB => 256

    /**
     * @type {Integer (Int32)}
     */
    static DDVPFX_PRESHRINKYB => 512

    /**
     * @type {Integer (Int32)}
     */
    static DDVPFX_PRESHRINKXS => 1024

    /**
     * @type {Integer (Int32)}
     */
    static DDVPFX_PRESHRINKYS => 2048

    /**
     * @type {Integer (Int32)}
     */
    static DDVPFX_PRESTRETCHX => 4096

    /**
     * @type {Integer (Int32)}
     */
    static DDVPFX_PRESTRETCHY => 8192

    /**
     * @type {Integer (Int32)}
     */
    static DDVPFX_PRESTRETCHXN => 16384

    /**
     * @type {Integer (Int32)}
     */
    static DDVPFX_PRESTRETCHYN => 32768

    /**
     * @type {Integer (Int32)}
     */
    static DDVPFX_VBICONVERT => 65536

    /**
     * @type {Integer (Int32)}
     */
    static DDVPFX_VBINOSCALE => 131072

    /**
     * @type {Integer (Int32)}
     */
    static DDVPFX_IGNOREVBIXCROP => 262144

    /**
     * @type {Integer (Int32)}
     */
    static DDVPFX_VBINOINTERLEAVE => 524288

    /**
     * @type {Integer (Int32)}
     */
    static DDVP_AUTOFLIP => 1

    /**
     * @type {Integer (Int32)}
     */
    static DDVP_CONVERT => 2

    /**
     * @type {Integer (Int32)}
     */
    static DDVP_CROP => 4

    /**
     * @type {Integer (Int32)}
     */
    static DDVP_INTERLEAVE => 8

    /**
     * @type {Integer (Int32)}
     */
    static DDVP_MIRRORLEFTRIGHT => 16

    /**
     * @type {Integer (Int32)}
     */
    static DDVP_MIRRORUPDOWN => 32

    /**
     * @type {Integer (Int32)}
     */
    static DDVP_PRESCALE => 64

    /**
     * @type {Integer (Int32)}
     */
    static DDVP_SKIPEVENFIELDS => 128

    /**
     * @type {Integer (Int32)}
     */
    static DDVP_SKIPODDFIELDS => 256

    /**
     * @type {Integer (Int32)}
     */
    static DDVP_SYNCMASTER => 512

    /**
     * @type {Integer (Int32)}
     */
    static DDVP_VBICONVERT => 1024

    /**
     * @type {Integer (Int32)}
     */
    static DDVP_VBINOSCALE => 2048

    /**
     * @type {Integer (Int32)}
     */
    static DDVP_OVERRIDEBOBWEAVE => 4096

    /**
     * @type {Integer (Int32)}
     */
    static DDVP_IGNOREVBIXCROP => 8192

    /**
     * @type {Integer (Int32)}
     */
    static DDVP_VBINOINTERLEAVE => 16384

    /**
     * @type {Integer (Int32)}
     */
    static DDVP_HARDWAREDEINTERLACE => 32768

    /**
     * @type {Integer (Int32)}
     */
    static DDVPFORMAT_VIDEO => 1

    /**
     * @type {Integer (Int32)}
     */
    static DDVPFORMAT_VBI => 2

    /**
     * @type {Integer (Int32)}
     */
    static DDVPTARGET_VIDEO => 1

    /**
     * @type {Integer (Int32)}
     */
    static DDVPTARGET_VBI => 2

    /**
     * @type {Integer (Int32)}
     */
    static DDVPWAIT_BEGIN => 1

    /**
     * @type {Integer (Int32)}
     */
    static DDVPWAIT_END => 2

    /**
     * @type {Integer (Int32)}
     */
    static DDVPWAIT_LINE => 3

    /**
     * @type {Integer (Int32)}
     */
    static DDVPFLIP_VIDEO => 1

    /**
     * @type {Integer (Int32)}
     */
    static DDVPFLIP_VBI => 2

    /**
     * @type {Integer (Int32)}
     */
    static DDVPSQ_NOSIGNAL => 1

    /**
     * @type {Integer (Int32)}
     */
    static DDVPSQ_SIGNALOK => 2

    /**
     * @type {Integer (Int32)}
     */
    static DDVPB_VIDEOPORT => 1

    /**
     * @type {Integer (Int32)}
     */
    static DDVPB_OVERLAY => 2

    /**
     * @type {Integer (Int32)}
     */
    static DDVPB_TYPE => 4

    /**
     * @type {Integer (Int32)}
     */
    static DDVPBCAPS_SOURCE => 1

    /**
     * @type {Integer (Int32)}
     */
    static DDVPBCAPS_DESTINATION => 2

    /**
     * @type {Integer (Int32)}
     */
    static DDVPCREATE_VBIONLY => 1

    /**
     * @type {Integer (Int32)}
     */
    static DDVPCREATE_VIDEOONLY => 2

    /**
     * @type {Integer (Int32)}
     */
    static DDVPSTATUS_VBIONLY => 1

    /**
     * @type {Integer (Int32)}
     */
    static DDVPSTATUS_VIDEOONLY => 2

    /**
     * @type {Guid}
     */
    static GUID_DxApi => Guid("{8a79bef0-b915-11d0-9144-080036d2ef02}")

    /**
     * @type {Integer (UInt32)}
     */
    static MDL_MAPPED_TO_SYSTEM_VA => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MDL_PAGES_LOCKED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MDL_SOURCE_IS_NONPAGED_POOL => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MDL_ALLOCATED_FIXED_SIZE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static MDL_PARTIAL => 16

    /**
     * @type {Integer (UInt32)}
     */
    static MDL_PARTIAL_HAS_BEEN_MAPPED => 32

    /**
     * @type {Integer (UInt32)}
     */
    static MDL_IO_PAGE_READ => 64

    /**
     * @type {Integer (UInt32)}
     */
    static MDL_WRITE_OPERATION => 128

    /**
     * @type {Integer (UInt32)}
     */
    static MDL_PARENT_MAPPED_SYSTEM_VA => 256

    /**
     * @type {Integer (UInt32)}
     */
    static MDL_LOCK_HELD => 512

    /**
     * @type {Integer (UInt32)}
     */
    static MDL_SCATTER_GATHER_VA => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static MDL_IO_SPACE => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static MDL_NETWORK_HEADER => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static MDL_MAPPING_CAN_FAIL => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static MDL_ALLOCATED_MUST_SUCCEED => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static MDL_64_BIT_VA => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static DX_OK => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DXERR_UNSUPPORTED => 2147500033

    /**
     * @type {Integer (UInt32)}
     */
    static DXERR_GENERIC => 2147500037

    /**
     * @type {Integer (UInt32)}
     */
    static DXERR_OUTOFCAPS => 2289434984

    /**
     * @type {Integer (Int32)}
     */
    static DDIRQ_BUSMASTER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IRQINFO_HANDLED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IRQINFO_NOTHANDLED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DDSKIP_SKIPNEXT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DDSKIP_ENABLENEXT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DDTRANSFER_SYSTEMMEMORY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DDTRANSFER_NONLOCALVIDMEM => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DDTRANSFER_INVERT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DDTRANSFER_CANCEL => 128

    /**
     * @type {Integer (UInt32)}
     */
    static DDTRANSFER_HALFLINES => 256

    /**
     * @type {Integer (UInt32)}
     */
    static DXAPI_HALVERSION => 1
;@endregion Constants

;@region Methods
    /**
     * This function is superseded by the DirectDrawEnumerateEx function.
     * @param {Pointer<LPDDENUMCALLBACKW>} lpCallback Address of a <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nc-ddraw-lpddenumcallbacka">DDEnumCallback</a> function to be called with a description of each enumerated DirectDraw-enabled hardware abstraction layer (HAL).
     * @param {Pointer<Void>} lpContext Address of an application-defined context to be passed to the enumeration callback function each time that it is called.
     * @returns {HRESULT} If the function succeeds, the return value is <b>DD_OK</b>.
     * 
     * If it fails, the function returns <b>DDERR_INVALIDPARAMS</b>.
     * @see https://docs.microsoft.com/windows/win32/api//ddraw/nf-ddraw-directdrawenumeratew
     */
    static DirectDrawEnumerateW(lpCallback, lpContext) {
        lpContextMarshal := lpContext is VarRef ? "ptr" : "ptr"

        result := DllCall("DDRAW.dll\DirectDrawEnumerateW", "ptr", lpCallback, lpContextMarshal, lpContext, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * This function is superseded by the DirectDrawEnumerateEx function.
     * @param {Pointer<LPDDENUMCALLBACKA>} lpCallback Address of a <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nc-ddraw-lpddenumcallbacka">DDEnumCallback</a> function to be called with a description of each enumerated DirectDraw-enabled hardware abstraction layer (HAL).
     * @param {Pointer<Void>} lpContext Address of an application-defined context to be passed to the enumeration callback function each time that it is called.
     * @returns {HRESULT} If the function succeeds, the return value is <b>DD_OK</b>.
     * 
     * If it fails, the function returns <b>DDERR_INVALIDPARAMS</b>.
     * @see https://docs.microsoft.com/windows/win32/api//ddraw/nf-ddraw-directdrawenumeratea
     */
    static DirectDrawEnumerateA(lpCallback, lpContext) {
        lpContextMarshal := lpContext is VarRef ? "ptr" : "ptr"

        result := DllCall("DDRAW.dll\DirectDrawEnumerateA", "ptr", lpCallback, lpContextMarshal, lpContext, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Enumerates all DirectDraw devices that are installed on the computer. The NULL entry always identifies the primary display device that is shared with GDI.
     * @param {Pointer<LPDDENUMCALLBACKEXW>} lpCallback Address of a <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nc-ddraw-lpddenumcallbackexa">DDEnumCallbackEx</a> function to be called with a description of each enumerated DirectDraw-enabled hardware abstraction layer (HAL).
     * @param {Pointer<Void>} lpContext Address of an application-defined value to be passed to the enumeration callback function each time that it is called.
     * @param {Integer} dwFlags Flags that specify the enumeration scope. This parameter can be 0 or a combination of the following flags. If the value is 0, the function enumerates only the primary display device.
     * @returns {HRESULT} If the function succeeds, the return value is <b>DD_OK</b>.
     * 
     * 
     * 
     * If it fails, the function returns <b>DDERR_INVALIDPARAMS</b>.
     * @see https://docs.microsoft.com/windows/win32/api//ddraw/nf-ddraw-directdrawenumerateexw
     */
    static DirectDrawEnumerateExW(lpCallback, lpContext, dwFlags) {
        lpContextMarshal := lpContext is VarRef ? "ptr" : "ptr"

        result := DllCall("DDRAW.dll\DirectDrawEnumerateExW", "ptr", lpCallback, lpContextMarshal, lpContext, "uint", dwFlags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Enumerates all DirectDraw devices that are installed on the computer. The NULL entry always identifies the primary display device that is shared with GDI.
     * @param {Pointer<LPDDENUMCALLBACKEXA>} lpCallback Address of a <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nc-ddraw-lpddenumcallbackexa">DDEnumCallbackEx</a> function to be called with a description of each enumerated DirectDraw-enabled hardware abstraction layer (HAL).
     * @param {Pointer<Void>} lpContext Address of an application-defined value to be passed to the enumeration callback function each time that it is called.
     * @param {Integer} dwFlags Flags that specify the enumeration scope. This parameter can be 0 or a combination of the following flags. If the value is 0, the function enumerates only the primary display device.
     * @returns {HRESULT} If the function succeeds, the return value is <b>DD_OK</b>.
     * 
     * 
     * 
     * If it fails, the function returns <b>DDERR_INVALIDPARAMS</b>.
     * @see https://docs.microsoft.com/windows/win32/api//ddraw/nf-ddraw-directdrawenumerateexa
     */
    static DirectDrawEnumerateExA(lpCallback, lpContext, dwFlags) {
        lpContextMarshal := lpContext is VarRef ? "ptr" : "ptr"

        result := DllCall("DDRAW.dll\DirectDrawEnumerateExA", "ptr", lpCallback, lpContextMarshal, lpContext, "uint", dwFlags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Creates an instance of a DirectDraw object.
     * @param {Pointer<Guid>} lpGUID A pointer to the globally unique identifier (GUID) that represents the driver to be created. This can be NULL to indicate the active display driver, or you can pass one of the following flags to restrict the active display driver's behavior for debugging purposes:
     * @param {IUnknown} pUnkOuter Allows for future compatibility with COM aggregation features. Presently, however, this function returns an error if this parameter is anything but NULL.
     * @returns {IDirectDraw} A pointer to a variable to be set to a valid <b>IDirectDraw</b> interface pointer if the call succeeds.
     * @see https://docs.microsoft.com/windows/win32/api//ddraw/nf-ddraw-directdrawcreate
     */
    static DirectDrawCreate(lpGUID, pUnkOuter) {
        result := DllCall("DDRAW.dll\DirectDrawCreate", "ptr", lpGUID, "ptr*", &lplpDD := 0, "ptr", pUnkOuter, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDirectDraw(lplpDD)
    }

    /**
     * Creates an instance of a DirectDraw object that supports the set of Direct3D interfaces in DirectX 7.0. To use the features of Direct3D in DirectX 7.0, create a DirectDraw object with this function.
     * @param {Pointer<Guid>} lpGuid A pointer to the globally unique identifier (GUID) that represents the driver to be created. This can be NULL to indicate the active display driver, or you can pass one of the following flags to restrict the active display driver's behavior for debugging purposes:
     * @param {Pointer<Pointer<Void>>} lplpDD A pointer to a variable to be set to a valid <a href="https://docs.microsoft.com/windows/desktop/api/ddraw/nn-ddraw-idirectdraw7">IDirectDraw7</a> interface pointer if the call succeeds.
     * @param {Pointer<Guid>} iid This parameter must be set to IID_IDirectDraw7. This function fails and returns DDERR_INVALIDPARAMS if any other interface is specified.
     * @param {IUnknown} pUnkOuter Allows for future compatibility with COM aggregation features. Currently, this function returns an error if this parameter is not NULL.
     * @returns {HRESULT} If the function succeeds, the return value is DD_OK.
     * 
     * 
     * 
     * If it fails, the function can return one of the following error values:
     * 
     * <ul>
     * <li>DDERR_DIRECTDRAWALREADYCREATED</li>
     * <li>DDERR_GENERIC</li>
     * <li>DDERR_INVALIDDIRECTDRAWGUID</li>
     * <li>DDERR_INVALIDPARAMS</li>
     * <li>DDERR_NODIRECTDRAWHW</li>
     * <li>DDERR_OUTOFMEMORY</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//ddraw/nf-ddraw-directdrawcreateex
     */
    static DirectDrawCreateEx(lpGuid, lplpDD, iid, pUnkOuter) {
        lplpDDMarshal := lplpDD is VarRef ? "ptr*" : "ptr"

        result := DllCall("DDRAW.dll\DirectDrawCreateEx", "ptr", lpGuid, lplpDDMarshal, lplpDD, "ptr", iid, "ptr", pUnkOuter, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Creates an instance of a DirectDrawClipper object that is not associated with a DirectDraw object.
     * @param {Integer} dwFlags Currently not used and must be set to 0.
     * @param {IUnknown} pUnkOuter Allows for future compatibility with COM aggregation features. Currently, this function returns an error if this parameter is not NULL.
     * @returns {IDirectDrawClipper} Address of a pointer to be filled with the address of the new DirectDrawClipper object.
     * @see https://docs.microsoft.com/windows/win32/api//ddraw/nf-ddraw-directdrawcreateclipper
     */
    static DirectDrawCreateClipper(dwFlags, pUnkOuter) {
        result := DllCall("DDRAW.dll\DirectDrawCreateClipper", "uint", dwFlags, "ptr*", &lplpDDClipper := 0, "ptr", pUnkOuter, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDirectDrawClipper(lplpDDClipper)
    }

;@endregion Methods
}
