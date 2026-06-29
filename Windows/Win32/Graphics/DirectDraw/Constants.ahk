#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */

;@region Constants

/**
 * @type {Integer (UInt32)}
 */
export global DIRECTDRAW_VERSION := 1792

/**
 * @type {Integer (UInt32)}
 */
export global _FACDD := 2166

/**
 * @type {Guid}
 */
export global CLSID_DirectDraw := Guid("{d7b70ee0-4340-11cf-b063-0020afc2cd35}")

/**
 * @type {Guid}
 */
export global CLSID_DirectDraw7 := Guid("{3c305196-50db-11d3-9cfe-00c04fd930c5}")

/**
 * @type {Guid}
 */
export global CLSID_DirectDrawClipper := Guid("{593817a0-7db3-11cf-a2de-00aa00b93356}")

/**
 * @type {Integer (Int32)}
 */
export global DDENUM_ATTACHEDSECONDARYDEVICES := 1

/**
 * @type {Integer (Int32)}
 */
export global DDENUM_DETACHEDSECONDARYDEVICES := 2

/**
 * @type {Integer (Int32)}
 */
export global DDENUM_NONDISPLAYDEVICES := 4

/**
 * @type {String}
 */
export global REGSTR_KEY_DDHW_DESCRIPTION := "Description"

/**
 * @type {String}
 */
export global REGSTR_KEY_DDHW_DRIVERNAME := "DriverName"

/**
 * @type {String}
 */
export global REGSTR_PATH_DDHW := "Hardware\DirectDrawDrivers"

/**
 * @type {Integer (Int32)}
 */
export global DDCREATE_HARDWAREONLY := 1

/**
 * @type {Integer (Int32)}
 */
export global DDCREATE_EMULATIONONLY := 2

/**
 * @type {Integer (UInt32)}
 */
export global MAX_DDDEVICEID_STRING := 512

/**
 * @type {Integer (Int32)}
 */
export global DDGDI_GETHOSTIDENTIFIER := 1

/**
 * @type {Integer (Int32)}
 */
export global DDSD_CAPS := 1

/**
 * @type {Integer (Int32)}
 */
export global DDSD_HEIGHT := 2

/**
 * @type {Integer (Int32)}
 */
export global DDSD_WIDTH := 4

/**
 * @type {Integer (Int32)}
 */
export global DDSD_PITCH := 8

/**
 * @type {Integer (Int32)}
 */
export global DDSD_BACKBUFFERCOUNT := 32

/**
 * @type {Integer (Int32)}
 */
export global DDSD_ZBUFFERBITDEPTH := 64

/**
 * @type {Integer (Int32)}
 */
export global DDSD_ALPHABITDEPTH := 128

/**
 * @type {Integer (Int32)}
 */
export global DDSD_LPSURFACE := 2048

/**
 * @type {Integer (Int32)}
 */
export global DDSD_PIXELFORMAT := 4096

/**
 * @type {Integer (Int32)}
 */
export global DDSD_CKDESTOVERLAY := 8192

/**
 * @type {Integer (Int32)}
 */
export global DDSD_CKDESTBLT := 16384

/**
 * @type {Integer (Int32)}
 */
export global DDSD_CKSRCOVERLAY := 32768

/**
 * @type {Integer (Int32)}
 */
export global DDSD_CKSRCBLT := 65536

/**
 * @type {Integer (Int32)}
 */
export global DDSD_MIPMAPCOUNT := 131072

/**
 * @type {Integer (Int32)}
 */
export global DDSD_REFRESHRATE := 262144

/**
 * @type {Integer (Int32)}
 */
export global DDSD_LINEARSIZE := 524288

/**
 * @type {Integer (Int32)}
 */
export global DDSD_TEXTURESTAGE := 1048576

/**
 * @type {Integer (Int32)}
 */
export global DDSD_FVF := 2097152

/**
 * @type {Integer (Int32)}
 */
export global DDSD_SRCVBHANDLE := 4194304

/**
 * @type {Integer (Int32)}
 */
export global DDSD_DEPTH := 8388608

/**
 * @type {Integer (Int32)}
 */
export global DDSD_ALL := 16775662

/**
 * @type {Integer (Int32)}
 */
export global DDOSD_GUID := 1

/**
 * @type {Integer (Int32)}
 */
export global DDOSD_COMPRESSION_RATIO := 2

/**
 * @type {Integer (Int32)}
 */
export global DDOSD_SCAPS := 4

/**
 * @type {Integer (Int32)}
 */
export global DDOSD_OSCAPS := 8

/**
 * @type {Integer (Int32)}
 */
export global DDOSD_ALL := 15

/**
 * @type {Integer (Int32)}
 */
export global DDOSDCAPS_OPTCOMPRESSED := 1

/**
 * @type {Integer (Int32)}
 */
export global DDOSDCAPS_OPTREORDERED := 2

/**
 * @type {Integer (Int32)}
 */
export global DDOSDCAPS_MONOLITHICMIPMAP := 4

/**
 * @type {Integer (Int32)}
 */
export global DDOSDCAPS_VALIDSCAPS := 805324800

/**
 * @type {Integer (Int32)}
 */
export global DDOSDCAPS_VALIDOSCAPS := 7

/**
 * @type {Integer (Int32)}
 */
export global DDCOLOR_BRIGHTNESS := 1

/**
 * @type {Integer (Int32)}
 */
export global DDCOLOR_CONTRAST := 2

/**
 * @type {Integer (Int32)}
 */
export global DDCOLOR_HUE := 4

/**
 * @type {Integer (Int32)}
 */
export global DDCOLOR_SATURATION := 8

/**
 * @type {Integer (Int32)}
 */
export global DDCOLOR_SHARPNESS := 16

/**
 * @type {Integer (Int32)}
 */
export global DDCOLOR_GAMMA := 32

/**
 * @type {Integer (Int32)}
 */
export global DDCOLOR_COLORENABLE := 64

/**
 * @type {Integer (Int32)}
 */
export global DDSCAPS_RESERVED1 := 1

/**
 * @type {Integer (Int32)}
 */
export global DDSCAPS_ALPHA := 2

/**
 * @type {Integer (Int32)}
 */
export global DDSCAPS_BACKBUFFER := 4

/**
 * @type {Integer (Int32)}
 */
export global DDSCAPS_COMPLEX := 8

/**
 * @type {Integer (Int32)}
 */
export global DDSCAPS_FLIP := 16

/**
 * @type {Integer (Int32)}
 */
export global DDSCAPS_FRONTBUFFER := 32

/**
 * @type {Integer (Int32)}
 */
export global DDSCAPS_OFFSCREENPLAIN := 64

/**
 * @type {Integer (Int32)}
 */
export global DDSCAPS_OVERLAY := 128

/**
 * @type {Integer (Int32)}
 */
export global DDSCAPS_PALETTE := 256

/**
 * @type {Integer (Int32)}
 */
export global DDSCAPS_PRIMARYSURFACE := 512

/**
 * @type {Integer (Int32)}
 */
export global DDSCAPS_RESERVED3 := 1024

/**
 * @type {Integer (Int32)}
 */
export global DDSCAPS_PRIMARYSURFACELEFT := 0

/**
 * @type {Integer (Int32)}
 */
export global DDSCAPS_SYSTEMMEMORY := 2048

/**
 * @type {Integer (Int32)}
 */
export global DDSCAPS_TEXTURE := 4096

/**
 * @type {Integer (Int32)}
 */
export global DDSCAPS_3DDEVICE := 8192

/**
 * @type {Integer (Int32)}
 */
export global DDSCAPS_VIDEOMEMORY := 16384

/**
 * @type {Integer (Int32)}
 */
export global DDSCAPS_VISIBLE := 32768

/**
 * @type {Integer (Int32)}
 */
export global DDSCAPS_WRITEONLY := 65536

/**
 * @type {Integer (Int32)}
 */
export global DDSCAPS_ZBUFFER := 131072

/**
 * @type {Integer (Int32)}
 */
export global DDSCAPS_OWNDC := 262144

/**
 * @type {Integer (Int32)}
 */
export global DDSCAPS_LIVEVIDEO := 524288

/**
 * @type {Integer (Int32)}
 */
export global DDSCAPS_HWCODEC := 1048576

/**
 * @type {Integer (Int32)}
 */
export global DDSCAPS_MODEX := 2097152

/**
 * @type {Integer (Int32)}
 */
export global DDSCAPS_MIPMAP := 4194304

/**
 * @type {Integer (Int32)}
 */
export global DDSCAPS_RESERVED2 := 8388608

/**
 * @type {Integer (Int32)}
 */
export global DDSCAPS_ALLOCONLOAD := 67108864

/**
 * @type {Integer (Int32)}
 */
export global DDSCAPS_VIDEOPORT := 134217728

/**
 * @type {Integer (Int32)}
 */
export global DDSCAPS_LOCALVIDMEM := 268435456

/**
 * @type {Integer (Int32)}
 */
export global DDSCAPS_NONLOCALVIDMEM := 536870912

/**
 * @type {Integer (Int32)}
 */
export global DDSCAPS_STANDARDVGAMODE := 1073741824

/**
 * @type {Integer (Int32)}
 */
export global DDSCAPS_OPTIMIZED := -2147483648

/**
 * @type {Integer (Int32)}
 */
export global DDSCAPS2_RESERVED4 := 2

/**
 * @type {Integer (Int32)}
 */
export global DDSCAPS2_HARDWAREDEINTERLACE := 0

/**
 * @type {Integer (Int32)}
 */
export global DDSCAPS2_HINTDYNAMIC := 4

/**
 * @type {Integer (Int32)}
 */
export global DDSCAPS2_HINTSTATIC := 8

/**
 * @type {Integer (Int32)}
 */
export global DDSCAPS2_TEXTUREMANAGE := 16

/**
 * @type {Integer (Int32)}
 */
export global DDSCAPS2_RESERVED1 := 32

/**
 * @type {Integer (Int32)}
 */
export global DDSCAPS2_RESERVED2 := 64

/**
 * @type {Integer (Int32)}
 */
export global DDSCAPS2_OPAQUE := 128

/**
 * @type {Integer (Int32)}
 */
export global DDSCAPS2_HINTANTIALIASING := 256

/**
 * @type {Integer (Int32)}
 */
export global DDSCAPS2_CUBEMAP := 512

/**
 * @type {Integer (Int32)}
 */
export global DDSCAPS2_CUBEMAP_POSITIVEX := 1024

/**
 * @type {Integer (Int32)}
 */
export global DDSCAPS2_CUBEMAP_NEGATIVEX := 2048

/**
 * @type {Integer (Int32)}
 */
export global DDSCAPS2_CUBEMAP_POSITIVEY := 4096

/**
 * @type {Integer (Int32)}
 */
export global DDSCAPS2_CUBEMAP_NEGATIVEY := 8192

/**
 * @type {Integer (Int32)}
 */
export global DDSCAPS2_CUBEMAP_POSITIVEZ := 16384

/**
 * @type {Integer (Int32)}
 */
export global DDSCAPS2_CUBEMAP_NEGATIVEZ := 32768

/**
 * @type {Integer (Int32)}
 */
export global DDSCAPS2_MIPMAPSUBLEVEL := 65536

/**
 * @type {Integer (Int32)}
 */
export global DDSCAPS2_D3DTEXTUREMANAGE := 131072

/**
 * @type {Integer (Int32)}
 */
export global DDSCAPS2_DONOTPERSIST := 262144

/**
 * @type {Integer (Int32)}
 */
export global DDSCAPS2_STEREOSURFACELEFT := 524288

/**
 * @type {Integer (Int32)}
 */
export global DDSCAPS2_VOLUME := 2097152

/**
 * @type {Integer (Int32)}
 */
export global DDSCAPS2_NOTUSERLOCKABLE := 4194304

/**
 * @type {Integer (Int32)}
 */
export global DDSCAPS2_POINTS := 8388608

/**
 * @type {Integer (Int32)}
 */
export global DDSCAPS2_RTPATCHES := 16777216

/**
 * @type {Integer (Int32)}
 */
export global DDSCAPS2_NPATCHES := 33554432

/**
 * @type {Integer (Int32)}
 */
export global DDSCAPS2_RESERVED3 := 67108864

/**
 * @type {Integer (Int32)}
 */
export global DDSCAPS2_DISCARDBACKBUFFER := 268435456

/**
 * @type {Integer (Int32)}
 */
export global DDSCAPS2_ENABLEALPHACHANNEL := 536870912

/**
 * @type {Integer (Int32)}
 */
export global DDSCAPS2_EXTENDEDFORMATPRIMARY := 1073741824

/**
 * @type {Integer (Int32)}
 */
export global DDSCAPS2_ADDITIONALPRIMARY := -2147483648

/**
 * @type {Integer (Int32)}
 */
export global DDSCAPS3_MULTISAMPLE_MASK := 31

/**
 * @type {Integer (Int32)}
 */
export global DDSCAPS3_MULTISAMPLE_QUALITY_MASK := 224

/**
 * @type {Integer (UInt32)}
 */
export global DDSCAPS3_MULTISAMPLE_QUALITY_SHIFT := 5

/**
 * @type {Integer (Int32)}
 */
export global DDSCAPS3_RESERVED1 := 256

/**
 * @type {Integer (Int32)}
 */
export global DDSCAPS3_RESERVED2 := 512

/**
 * @type {Integer (Int32)}
 */
export global DDSCAPS3_LIGHTWEIGHTMIPMAP := 1024

/**
 * @type {Integer (Int32)}
 */
export global DDSCAPS3_AUTOGENMIPMAP := 2048

/**
 * @type {Integer (Int32)}
 */
export global DDSCAPS3_DMAP := 4096

/**
 * @type {Integer (Int32)}
 */
export global DDSCAPS3_CREATESHAREDRESOURCE := 8192

/**
 * @type {Integer (Int32)}
 */
export global DDSCAPS3_READONLYRESOURCE := 16384

/**
 * @type {Integer (Int32)}
 */
export global DDSCAPS3_OPENSHAREDRESOURCE := 32768

/**
 * @type {Integer (Int32)}
 */
export global DDCAPS_3D := 1

/**
 * @type {Integer (Int32)}
 */
export global DDCAPS_ALIGNBOUNDARYDEST := 2

/**
 * @type {Integer (Int32)}
 */
export global DDCAPS_ALIGNSIZEDEST := 4

/**
 * @type {Integer (Int32)}
 */
export global DDCAPS_ALIGNBOUNDARYSRC := 8

/**
 * @type {Integer (Int32)}
 */
export global DDCAPS_ALIGNSIZESRC := 16

/**
 * @type {Integer (Int32)}
 */
export global DDCAPS_ALIGNSTRIDE := 32

/**
 * @type {Integer (Int32)}
 */
export global DDCAPS_BLT := 64

/**
 * @type {Integer (Int32)}
 */
export global DDCAPS_BLTQUEUE := 128

/**
 * @type {Integer (Int32)}
 */
export global DDCAPS_BLTFOURCC := 256

/**
 * @type {Integer (Int32)}
 */
export global DDCAPS_BLTSTRETCH := 512

/**
 * @type {Integer (Int32)}
 */
export global DDCAPS_GDI := 1024

/**
 * @type {Integer (Int32)}
 */
export global DDCAPS_OVERLAY := 2048

/**
 * @type {Integer (Int32)}
 */
export global DDCAPS_OVERLAYCANTCLIP := 4096

/**
 * @type {Integer (Int32)}
 */
export global DDCAPS_OVERLAYFOURCC := 8192

/**
 * @type {Integer (Int32)}
 */
export global DDCAPS_OVERLAYSTRETCH := 16384

/**
 * @type {Integer (Int32)}
 */
export global DDCAPS_PALETTE := 32768

/**
 * @type {Integer (Int32)}
 */
export global DDCAPS_PALETTEVSYNC := 65536

/**
 * @type {Integer (Int32)}
 */
export global DDCAPS_READSCANLINE := 131072

/**
 * @type {Integer (Int32)}
 */
export global DDCAPS_RESERVED1 := 262144

/**
 * @type {Integer (Int32)}
 */
export global DDCAPS_VBI := 524288

/**
 * @type {Integer (Int32)}
 */
export global DDCAPS_ZBLTS := 1048576

/**
 * @type {Integer (Int32)}
 */
export global DDCAPS_ZOVERLAYS := 2097152

/**
 * @type {Integer (Int32)}
 */
export global DDCAPS_COLORKEY := 4194304

/**
 * @type {Integer (Int32)}
 */
export global DDCAPS_ALPHA := 8388608

/**
 * @type {Integer (Int32)}
 */
export global DDCAPS_COLORKEYHWASSIST := 16777216

/**
 * @type {Integer (Int32)}
 */
export global DDCAPS_NOHARDWARE := 33554432

/**
 * @type {Integer (Int32)}
 */
export global DDCAPS_BLTCOLORFILL := 67108864

/**
 * @type {Integer (Int32)}
 */
export global DDCAPS_BANKSWITCHED := 134217728

/**
 * @type {Integer (Int32)}
 */
export global DDCAPS_BLTDEPTHFILL := 268435456

/**
 * @type {Integer (Int32)}
 */
export global DDCAPS_CANCLIP := 536870912

/**
 * @type {Integer (Int32)}
 */
export global DDCAPS_CANCLIPSTRETCHED := 1073741824

/**
 * @type {Integer (Int32)}
 */
export global DDCAPS_CANBLTSYSMEM := -2147483648

/**
 * @type {Integer (Int32)}
 */
export global DDCAPS2_CERTIFIED := 1

/**
 * @type {Integer (Int32)}
 */
export global DDCAPS2_NO2DDURING3DSCENE := 2

/**
 * @type {Integer (Int32)}
 */
export global DDCAPS2_VIDEOPORT := 4

/**
 * @type {Integer (Int32)}
 */
export global DDCAPS2_AUTOFLIPOVERLAY := 8

/**
 * @type {Integer (Int32)}
 */
export global DDCAPS2_CANBOBINTERLEAVED := 16

/**
 * @type {Integer (Int32)}
 */
export global DDCAPS2_CANBOBNONINTERLEAVED := 32

/**
 * @type {Integer (Int32)}
 */
export global DDCAPS2_COLORCONTROLOVERLAY := 64

/**
 * @type {Integer (Int32)}
 */
export global DDCAPS2_COLORCONTROLPRIMARY := 128

/**
 * @type {Integer (Int32)}
 */
export global DDCAPS2_CANDROPZ16BIT := 256

/**
 * @type {Integer (Int32)}
 */
export global DDCAPS2_NONLOCALVIDMEM := 512

/**
 * @type {Integer (Int32)}
 */
export global DDCAPS2_NONLOCALVIDMEMCAPS := 1024

/**
 * @type {Integer (Int32)}
 */
export global DDCAPS2_NOPAGELOCKREQUIRED := 2048

/**
 * @type {Integer (Int32)}
 */
export global DDCAPS2_WIDESURFACES := 4096

/**
 * @type {Integer (Int32)}
 */
export global DDCAPS2_CANFLIPODDEVEN := 8192

/**
 * @type {Integer (Int32)}
 */
export global DDCAPS2_CANBOBHARDWARE := 16384

/**
 * @type {Integer (Int32)}
 */
export global DDCAPS2_COPYFOURCC := 32768

/**
 * @type {Integer (Int32)}
 */
export global DDCAPS2_PRIMARYGAMMA := 131072

/**
 * @type {Integer (Int32)}
 */
export global DDCAPS2_CANRENDERWINDOWED := 524288

/**
 * @type {Integer (Int32)}
 */
export global DDCAPS2_CANCALIBRATEGAMMA := 1048576

/**
 * @type {Integer (Int32)}
 */
export global DDCAPS2_FLIPINTERVAL := 2097152

/**
 * @type {Integer (Int32)}
 */
export global DDCAPS2_FLIPNOVSYNC := 4194304

/**
 * @type {Integer (Int32)}
 */
export global DDCAPS2_CANMANAGETEXTURE := 8388608

/**
 * @type {Integer (Int32)}
 */
export global DDCAPS2_TEXMANINNONLOCALVIDMEM := 16777216

/**
 * @type {Integer (Int32)}
 */
export global DDCAPS2_STEREO := 33554432

/**
 * @type {Integer (Int32)}
 */
export global DDCAPS2_SYSTONONLOCAL_AS_SYSTOLOCAL := 67108864

/**
 * @type {Integer (Int32)}
 */
export global DDCAPS2_RESERVED1 := 134217728

/**
 * @type {Integer (Int32)}
 */
export global DDCAPS2_CANMANAGERESOURCE := 268435456

/**
 * @type {Integer (Int32)}
 */
export global DDCAPS2_DYNAMICTEXTURES := 536870912

/**
 * @type {Integer (Int32)}
 */
export global DDCAPS2_CANAUTOGENMIPMAP := 1073741824

/**
 * @type {Integer (Int32)}
 */
export global DDCAPS2_CANSHARERESOURCE := -2147483648

/**
 * @type {Integer (Int32)}
 */
export global DDFXALPHACAPS_BLTALPHAEDGEBLEND := 1

/**
 * @type {Integer (Int32)}
 */
export global DDFXALPHACAPS_BLTALPHAPIXELS := 2

/**
 * @type {Integer (Int32)}
 */
export global DDFXALPHACAPS_BLTALPHAPIXELSNEG := 4

/**
 * @type {Integer (Int32)}
 */
export global DDFXALPHACAPS_BLTALPHASURFACES := 8

/**
 * @type {Integer (Int32)}
 */
export global DDFXALPHACAPS_BLTALPHASURFACESNEG := 16

/**
 * @type {Integer (Int32)}
 */
export global DDFXALPHACAPS_OVERLAYALPHAEDGEBLEND := 32

/**
 * @type {Integer (Int32)}
 */
export global DDFXALPHACAPS_OVERLAYALPHAPIXELS := 64

/**
 * @type {Integer (Int32)}
 */
export global DDFXALPHACAPS_OVERLAYALPHAPIXELSNEG := 128

/**
 * @type {Integer (Int32)}
 */
export global DDFXALPHACAPS_OVERLAYALPHASURFACES := 256

/**
 * @type {Integer (Int32)}
 */
export global DDFXALPHACAPS_OVERLAYALPHASURFACESNEG := 512

/**
 * @type {Integer (Int32)}
 */
export global DDFXCAPS_BLTARITHSTRETCHY := 32

/**
 * @type {Integer (Int32)}
 */
export global DDFXCAPS_BLTARITHSTRETCHYN := 16

/**
 * @type {Integer (Int32)}
 */
export global DDFXCAPS_BLTMIRRORLEFTRIGHT := 64

/**
 * @type {Integer (Int32)}
 */
export global DDFXCAPS_BLTMIRRORUPDOWN := 128

/**
 * @type {Integer (Int32)}
 */
export global DDFXCAPS_BLTROTATION := 256

/**
 * @type {Integer (Int32)}
 */
export global DDFXCAPS_BLTROTATION90 := 512

/**
 * @type {Integer (Int32)}
 */
export global DDFXCAPS_BLTSHRINKX := 1024

/**
 * @type {Integer (Int32)}
 */
export global DDFXCAPS_BLTSHRINKXN := 2048

/**
 * @type {Integer (Int32)}
 */
export global DDFXCAPS_BLTSHRINKY := 4096

/**
 * @type {Integer (Int32)}
 */
export global DDFXCAPS_BLTSHRINKYN := 8192

/**
 * @type {Integer (Int32)}
 */
export global DDFXCAPS_BLTSTRETCHX := 16384

/**
 * @type {Integer (Int32)}
 */
export global DDFXCAPS_BLTSTRETCHXN := 32768

/**
 * @type {Integer (Int32)}
 */
export global DDFXCAPS_BLTSTRETCHY := 65536

/**
 * @type {Integer (Int32)}
 */
export global DDFXCAPS_BLTSTRETCHYN := 131072

/**
 * @type {Integer (Int32)}
 */
export global DDFXCAPS_OVERLAYARITHSTRETCHY := 262144

/**
 * @type {Integer (Int32)}
 */
export global DDFXCAPS_OVERLAYARITHSTRETCHYN := 8

/**
 * @type {Integer (Int32)}
 */
export global DDFXCAPS_OVERLAYSHRINKX := 524288

/**
 * @type {Integer (Int32)}
 */
export global DDFXCAPS_OVERLAYSHRINKXN := 1048576

/**
 * @type {Integer (Int32)}
 */
export global DDFXCAPS_OVERLAYSHRINKY := 2097152

/**
 * @type {Integer (Int32)}
 */
export global DDFXCAPS_OVERLAYSHRINKYN := 4194304

/**
 * @type {Integer (Int32)}
 */
export global DDFXCAPS_OVERLAYSTRETCHX := 8388608

/**
 * @type {Integer (Int32)}
 */
export global DDFXCAPS_OVERLAYSTRETCHXN := 16777216

/**
 * @type {Integer (Int32)}
 */
export global DDFXCAPS_OVERLAYSTRETCHY := 33554432

/**
 * @type {Integer (Int32)}
 */
export global DDFXCAPS_OVERLAYSTRETCHYN := 67108864

/**
 * @type {Integer (Int32)}
 */
export global DDFXCAPS_OVERLAYMIRRORLEFTRIGHT := 134217728

/**
 * @type {Integer (Int32)}
 */
export global DDFXCAPS_OVERLAYMIRRORUPDOWN := 268435456

/**
 * @type {Integer (Int32)}
 */
export global DDFXCAPS_OVERLAYDEINTERLACE := 536870912

/**
 * @type {Integer (Int32)}
 */
export global DDFXCAPS_BLTALPHA := 1

/**
 * @type {Integer (Int32)}
 */
export global DDFXCAPS_BLTFILTER := 32

/**
 * @type {Integer (Int32)}
 */
export global DDFXCAPS_OVERLAYALPHA := 4

/**
 * @type {Integer (Int32)}
 */
export global DDFXCAPS_OVERLAYFILTER := 262144

/**
 * @type {Integer (Int32)}
 */
export global DDSVCAPS_RESERVED1 := 1

/**
 * @type {Integer (Int32)}
 */
export global DDSVCAPS_RESERVED2 := 2

/**
 * @type {Integer (Int32)}
 */
export global DDSVCAPS_RESERVED3 := 4

/**
 * @type {Integer (Int32)}
 */
export global DDSVCAPS_RESERVED4 := 8

/**
 * @type {Integer (Int32)}
 */
export global DDSVCAPS_STEREOSEQUENTIAL := 16

/**
 * @type {Integer (Int32)}
 */
export global DDPCAPS_4BIT := 1

/**
 * @type {Integer (Int32)}
 */
export global DDPCAPS_8BITENTRIES := 2

/**
 * @type {Integer (Int32)}
 */
export global DDPCAPS_8BIT := 4

/**
 * @type {Integer (Int32)}
 */
export global DDPCAPS_INITIALIZE := 0

/**
 * @type {Integer (Int32)}
 */
export global DDPCAPS_PRIMARYSURFACE := 16

/**
 * @type {Integer (Int32)}
 */
export global DDPCAPS_PRIMARYSURFACELEFT := 32

/**
 * @type {Integer (Int32)}
 */
export global DDPCAPS_ALLOW256 := 64

/**
 * @type {Integer (Int32)}
 */
export global DDPCAPS_VSYNC := 128

/**
 * @type {Integer (Int32)}
 */
export global DDPCAPS_1BIT := 256

/**
 * @type {Integer (Int32)}
 */
export global DDPCAPS_2BIT := 512

/**
 * @type {Integer (Int32)}
 */
export global DDPCAPS_ALPHA := 1024

/**
 * @type {Integer (Int32)}
 */
export global DDSPD_IUNKNOWNPOINTER := 1

/**
 * @type {Integer (Int32)}
 */
export global DDSPD_VOLATILE := 2

/**
 * @type {Integer (Int32)}
 */
export global DDBD_1 := 16384

/**
 * @type {Integer (Int32)}
 */
export global DDBD_2 := 8192

/**
 * @type {Integer (Int32)}
 */
export global DDBD_4 := 4096

/**
 * @type {Integer (Int32)}
 */
export global DDBD_8 := 2048

/**
 * @type {Integer (Int32)}
 */
export global DDBD_16 := 1024

/**
 * @type {Integer (Int32)}
 */
export global DDBD_24 := 512

/**
 * @type {Integer (Int32)}
 */
export global DDBD_32 := 256

/**
 * @type {Integer (Int32)}
 */
export global DDCKEY_COLORSPACE := 1

/**
 * @type {Integer (Int32)}
 */
export global DDCKEY_DESTBLT := 2

/**
 * @type {Integer (Int32)}
 */
export global DDCKEY_DESTOVERLAY := 4

/**
 * @type {Integer (Int32)}
 */
export global DDCKEY_SRCBLT := 8

/**
 * @type {Integer (Int32)}
 */
export global DDCKEY_SRCOVERLAY := 16

/**
 * @type {Integer (Int32)}
 */
export global DDCKEYCAPS_DESTBLT := 1

/**
 * @type {Integer (Int32)}
 */
export global DDCKEYCAPS_DESTBLTCLRSPACE := 2

/**
 * @type {Integer (Int32)}
 */
export global DDCKEYCAPS_DESTBLTCLRSPACEYUV := 4

/**
 * @type {Integer (Int32)}
 */
export global DDCKEYCAPS_DESTBLTYUV := 8

/**
 * @type {Integer (Int32)}
 */
export global DDCKEYCAPS_DESTOVERLAY := 16

/**
 * @type {Integer (Int32)}
 */
export global DDCKEYCAPS_DESTOVERLAYCLRSPACE := 32

/**
 * @type {Integer (Int32)}
 */
export global DDCKEYCAPS_DESTOVERLAYCLRSPACEYUV := 64

/**
 * @type {Integer (Int32)}
 */
export global DDCKEYCAPS_DESTOVERLAYONEACTIVE := 128

/**
 * @type {Integer (Int32)}
 */
export global DDCKEYCAPS_DESTOVERLAYYUV := 256

/**
 * @type {Integer (Int32)}
 */
export global DDCKEYCAPS_SRCBLT := 512

/**
 * @type {Integer (Int32)}
 */
export global DDCKEYCAPS_SRCBLTCLRSPACE := 1024

/**
 * @type {Integer (Int32)}
 */
export global DDCKEYCAPS_SRCBLTCLRSPACEYUV := 2048

/**
 * @type {Integer (Int32)}
 */
export global DDCKEYCAPS_SRCBLTYUV := 4096

/**
 * @type {Integer (Int32)}
 */
export global DDCKEYCAPS_SRCOVERLAY := 8192

/**
 * @type {Integer (Int32)}
 */
export global DDCKEYCAPS_SRCOVERLAYCLRSPACE := 16384

/**
 * @type {Integer (Int32)}
 */
export global DDCKEYCAPS_SRCOVERLAYCLRSPACEYUV := 32768

/**
 * @type {Integer (Int32)}
 */
export global DDCKEYCAPS_SRCOVERLAYONEACTIVE := 65536

/**
 * @type {Integer (Int32)}
 */
export global DDCKEYCAPS_SRCOVERLAYYUV := 131072

/**
 * @type {Integer (Int32)}
 */
export global DDCKEYCAPS_NOCOSTOVERLAY := 262144

/**
 * @type {Integer (Int32)}
 */
export global DDPF_ALPHAPIXELS := 1

/**
 * @type {Integer (Int32)}
 */
export global DDPF_ALPHA := 2

/**
 * @type {Integer (Int32)}
 */
export global DDPF_FOURCC := 4

/**
 * @type {Integer (Int32)}
 */
export global DDPF_PALETTEINDEXED4 := 8

/**
 * @type {Integer (Int32)}
 */
export global DDPF_PALETTEINDEXEDTO8 := 16

/**
 * @type {Integer (Int32)}
 */
export global DDPF_PALETTEINDEXED8 := 32

/**
 * @type {Integer (Int32)}
 */
export global DDPF_RGB := 64

/**
 * @type {Integer (Int32)}
 */
export global DDPF_COMPRESSED := 128

/**
 * @type {Integer (Int32)}
 */
export global DDPF_RGBTOYUV := 256

/**
 * @type {Integer (Int32)}
 */
export global DDPF_YUV := 512

/**
 * @type {Integer (Int32)}
 */
export global DDPF_ZBUFFER := 1024

/**
 * @type {Integer (Int32)}
 */
export global DDPF_PALETTEINDEXED1 := 2048

/**
 * @type {Integer (Int32)}
 */
export global DDPF_PALETTEINDEXED2 := 4096

/**
 * @type {Integer (Int32)}
 */
export global DDPF_ZPIXELS := 8192

/**
 * @type {Integer (Int32)}
 */
export global DDPF_STENCILBUFFER := 16384

/**
 * @type {Integer (Int32)}
 */
export global DDPF_ALPHAPREMULT := 32768

/**
 * @type {Integer (Int32)}
 */
export global DDPF_LUMINANCE := 131072

/**
 * @type {Integer (Int32)}
 */
export global DDPF_BUMPLUMINANCE := 262144

/**
 * @type {Integer (Int32)}
 */
export global DDPF_BUMPDUDV := 524288

/**
 * @type {Integer (Int32)}
 */
export global DDENUMSURFACES_ALL := 1

/**
 * @type {Integer (Int32)}
 */
export global DDENUMSURFACES_MATCH := 2

/**
 * @type {Integer (Int32)}
 */
export global DDENUMSURFACES_NOMATCH := 4

/**
 * @type {Integer (Int32)}
 */
export global DDENUMSURFACES_CANBECREATED := 8

/**
 * @type {Integer (Int32)}
 */
export global DDENUMSURFACES_DOESEXIST := 16

/**
 * @type {Integer (Int32)}
 */
export global DDSDM_STANDARDVGAMODE := 1

/**
 * @type {Integer (Int32)}
 */
export global DDEDM_REFRESHRATES := 1

/**
 * @type {Integer (Int32)}
 */
export global DDEDM_STANDARDVGAMODES := 2

/**
 * @type {Integer (Int32)}
 */
export global DDSCL_FULLSCREEN := 1

/**
 * @type {Integer (Int32)}
 */
export global DDSCL_ALLOWREBOOT := 2

/**
 * @type {Integer (Int32)}
 */
export global DDSCL_NOWINDOWCHANGES := 4

/**
 * @type {Integer (Int32)}
 */
export global DDSCL_NORMAL := 8

/**
 * @type {Integer (Int32)}
 */
export global DDSCL_EXCLUSIVE := 16

/**
 * @type {Integer (Int32)}
 */
export global DDSCL_ALLOWMODEX := 64

/**
 * @type {Integer (Int32)}
 */
export global DDSCL_SETFOCUSWINDOW := 128

/**
 * @type {Integer (Int32)}
 */
export global DDSCL_SETDEVICEWINDOW := 256

/**
 * @type {Integer (Int32)}
 */
export global DDSCL_CREATEDEVICEWINDOW := 512

/**
 * @type {Integer (Int32)}
 */
export global DDSCL_MULTITHREADED := 1024

/**
 * @type {Integer (Int32)}
 */
export global DDSCL_FPUSETUP := 2048

/**
 * @type {Integer (Int32)}
 */
export global DDSCL_FPUPRESERVE := 4096

/**
 * @type {Integer (Int32)}
 */
export global DDBLT_ALPHADEST := 1

/**
 * @type {Integer (Int32)}
 */
export global DDBLT_ALPHADESTCONSTOVERRIDE := 2

/**
 * @type {Integer (Int32)}
 */
export global DDBLT_ALPHADESTNEG := 4

/**
 * @type {Integer (Int32)}
 */
export global DDBLT_ALPHADESTSURFACEOVERRIDE := 8

/**
 * @type {Integer (Int32)}
 */
export global DDBLT_ALPHAEDGEBLEND := 16

/**
 * @type {Integer (Int32)}
 */
export global DDBLT_ALPHASRC := 32

/**
 * @type {Integer (Int32)}
 */
export global DDBLT_ALPHASRCCONSTOVERRIDE := 64

/**
 * @type {Integer (Int32)}
 */
export global DDBLT_ALPHASRCNEG := 128

/**
 * @type {Integer (Int32)}
 */
export global DDBLT_ALPHASRCSURFACEOVERRIDE := 256

/**
 * @type {Integer (Int32)}
 */
export global DDBLT_ASYNC := 512

/**
 * @type {Integer (Int32)}
 */
export global DDBLT_COLORFILL := 1024

/**
 * @type {Integer (Int32)}
 */
export global DDBLT_DDFX := 2048

/**
 * @type {Integer (Int32)}
 */
export global DDBLT_DDROPS := 4096

/**
 * @type {Integer (Int32)}
 */
export global DDBLT_KEYDEST := 8192

/**
 * @type {Integer (Int32)}
 */
export global DDBLT_KEYDESTOVERRIDE := 16384

/**
 * @type {Integer (Int32)}
 */
export global DDBLT_KEYSRC := 32768

/**
 * @type {Integer (Int32)}
 */
export global DDBLT_KEYSRCOVERRIDE := 65536

/**
 * @type {Integer (Int32)}
 */
export global DDBLT_ROP := 131072

/**
 * @type {Integer (Int32)}
 */
export global DDBLT_ROTATIONANGLE := 262144

/**
 * @type {Integer (Int32)}
 */
export global DDBLT_ZBUFFER := 524288

/**
 * @type {Integer (Int32)}
 */
export global DDBLT_ZBUFFERDESTCONSTOVERRIDE := 1048576

/**
 * @type {Integer (Int32)}
 */
export global DDBLT_ZBUFFERDESTOVERRIDE := 2097152

/**
 * @type {Integer (Int32)}
 */
export global DDBLT_ZBUFFERSRCCONSTOVERRIDE := 4194304

/**
 * @type {Integer (Int32)}
 */
export global DDBLT_ZBUFFERSRCOVERRIDE := 8388608

/**
 * @type {Integer (Int32)}
 */
export global DDBLT_WAIT := 16777216

/**
 * @type {Integer (Int32)}
 */
export global DDBLT_DEPTHFILL := 33554432

/**
 * @type {Integer (Int32)}
 */
export global DDBLT_DONOTWAIT := 134217728

/**
 * @type {Integer (Int32)}
 */
export global DDBLT_PRESENTATION := 268435456

/**
 * @type {Integer (Int32)}
 */
export global DDBLT_LAST_PRESENTATION := 536870912

/**
 * @type {Integer (Int32)}
 */
export global DDBLT_EXTENDED_FLAGS := 1073741824

/**
 * @type {Integer (Int32)}
 */
export global DDBLT_EXTENDED_LINEAR_CONTENT := 4

/**
 * @type {Integer (UInt32)}
 */
export global DDBLTFAST_NOCOLORKEY := 0

/**
 * @type {Integer (UInt32)}
 */
export global DDBLTFAST_SRCCOLORKEY := 1

/**
 * @type {Integer (UInt32)}
 */
export global DDBLTFAST_DESTCOLORKEY := 2

/**
 * @type {Integer (UInt32)}
 */
export global DDBLTFAST_WAIT := 16

/**
 * @type {Integer (UInt32)}
 */
export global DDBLTFAST_DONOTWAIT := 32

/**
 * @type {Integer (Int32)}
 */
export global DDFLIP_WAIT := 1

/**
 * @type {Integer (Int32)}
 */
export global DDFLIP_EVEN := 2

/**
 * @type {Integer (Int32)}
 */
export global DDFLIP_ODD := 4

/**
 * @type {Integer (Int32)}
 */
export global DDFLIP_NOVSYNC := 8

/**
 * @type {Integer (Int32)}
 */
export global DDFLIP_INTERVAL2 := 33554432

/**
 * @type {Integer (Int32)}
 */
export global DDFLIP_INTERVAL3 := 50331648

/**
 * @type {Integer (Int32)}
 */
export global DDFLIP_INTERVAL4 := 67108864

/**
 * @type {Integer (Int32)}
 */
export global DDFLIP_STEREO := 16

/**
 * @type {Integer (Int32)}
 */
export global DDFLIP_DONOTWAIT := 32

/**
 * @type {Integer (Int32)}
 */
export global DDOVER_ALPHADEST := 1

/**
 * @type {Integer (Int32)}
 */
export global DDOVER_ALPHADESTCONSTOVERRIDE := 2

/**
 * @type {Integer (Int32)}
 */
export global DDOVER_ALPHADESTNEG := 4

/**
 * @type {Integer (Int32)}
 */
export global DDOVER_ALPHADESTSURFACEOVERRIDE := 8

/**
 * @type {Integer (Int32)}
 */
export global DDOVER_ALPHAEDGEBLEND := 16

/**
 * @type {Integer (Int32)}
 */
export global DDOVER_ALPHASRC := 32

/**
 * @type {Integer (Int32)}
 */
export global DDOVER_ALPHASRCCONSTOVERRIDE := 64

/**
 * @type {Integer (Int32)}
 */
export global DDOVER_ALPHASRCNEG := 128

/**
 * @type {Integer (Int32)}
 */
export global DDOVER_ALPHASRCSURFACEOVERRIDE := 256

/**
 * @type {Integer (Int32)}
 */
export global DDOVER_HIDE := 512

/**
 * @type {Integer (Int32)}
 */
export global DDOVER_KEYDEST := 1024

/**
 * @type {Integer (Int32)}
 */
export global DDOVER_KEYDESTOVERRIDE := 2048

/**
 * @type {Integer (Int32)}
 */
export global DDOVER_KEYSRC := 4096

/**
 * @type {Integer (Int32)}
 */
export global DDOVER_KEYSRCOVERRIDE := 8192

/**
 * @type {Integer (Int32)}
 */
export global DDOVER_SHOW := 16384

/**
 * @type {Integer (Int32)}
 */
export global DDOVER_ADDDIRTYRECT := 32768

/**
 * @type {Integer (Int32)}
 */
export global DDOVER_REFRESHDIRTYRECTS := 65536

/**
 * @type {Integer (Int32)}
 */
export global DDOVER_REFRESHALL := 131072

/**
 * @type {Integer (Int32)}
 */
export global DDOVER_DDFX := 524288

/**
 * @type {Integer (Int32)}
 */
export global DDOVER_AUTOFLIP := 1048576

/**
 * @type {Integer (Int32)}
 */
export global DDOVER_BOB := 2097152

/**
 * @type {Integer (Int32)}
 */
export global DDOVER_OVERRIDEBOBWEAVE := 4194304

/**
 * @type {Integer (Int32)}
 */
export global DDOVER_INTERLEAVED := 8388608

/**
 * @type {Integer (Int32)}
 */
export global DDOVER_BOBHARDWARE := 16777216

/**
 * @type {Integer (Int32)}
 */
export global DDOVER_ARGBSCALEFACTORS := 33554432

/**
 * @type {Integer (Int32)}
 */
export global DDOVER_DEGRADEARGBSCALING := 67108864

/**
 * @type {Integer (Int32)}
 */
export global DDSETSURFACEDESC_RECREATEDC := 0

/**
 * @type {Integer (Int32)}
 */
export global DDSETSURFACEDESC_PRESERVEDC := 1

/**
 * @type {Integer (Int32)}
 */
export global DDLOCK_SURFACEMEMORYPTR := 0

/**
 * @type {Integer (Int32)}
 */
export global DDLOCK_WAIT := 1

/**
 * @type {Integer (Int32)}
 */
export global DDLOCK_EVENT := 2

/**
 * @type {Integer (Int32)}
 */
export global DDLOCK_READONLY := 16

/**
 * @type {Integer (Int32)}
 */
export global DDLOCK_WRITEONLY := 32

/**
 * @type {Integer (Int32)}
 */
export global DDLOCK_NOSYSLOCK := 2048

/**
 * @type {Integer (Int32)}
 */
export global DDLOCK_NOOVERWRITE := 4096

/**
 * @type {Integer (Int32)}
 */
export global DDLOCK_DISCARDCONTENTS := 8192

/**
 * @type {Integer (Int32)}
 */
export global DDLOCK_OKTOSWAP := 8192

/**
 * @type {Integer (Int32)}
 */
export global DDLOCK_DONOTWAIT := 16384

/**
 * @type {Integer (Int32)}
 */
export global DDLOCK_HASVOLUMETEXTUREBOXRECT := 32768

/**
 * @type {Integer (Int32)}
 */
export global DDLOCK_NODIRTYUPDATE := 65536

/**
 * @type {Integer (Int32)}
 */
export global DDBLTFX_ARITHSTRETCHY := 1

/**
 * @type {Integer (Int32)}
 */
export global DDBLTFX_MIRRORLEFTRIGHT := 2

/**
 * @type {Integer (Int32)}
 */
export global DDBLTFX_MIRRORUPDOWN := 4

/**
 * @type {Integer (Int32)}
 */
export global DDBLTFX_NOTEARING := 8

/**
 * @type {Integer (Int32)}
 */
export global DDBLTFX_ROTATE180 := 16

/**
 * @type {Integer (Int32)}
 */
export global DDBLTFX_ROTATE270 := 32

/**
 * @type {Integer (Int32)}
 */
export global DDBLTFX_ROTATE90 := 64

/**
 * @type {Integer (Int32)}
 */
export global DDBLTFX_ZBUFFERRANGE := 128

/**
 * @type {Integer (Int32)}
 */
export global DDBLTFX_ZBUFFERBASEDEST := 256

/**
 * @type {Integer (Int32)}
 */
export global DDOVERFX_ARITHSTRETCHY := 1

/**
 * @type {Integer (Int32)}
 */
export global DDOVERFX_MIRRORLEFTRIGHT := 2

/**
 * @type {Integer (Int32)}
 */
export global DDOVERFX_MIRRORUPDOWN := 4

/**
 * @type {Integer (Int32)}
 */
export global DDOVERFX_DEINTERLACE := 8

/**
 * @type {Integer (Int32)}
 */
export global DDWAITVB_BLOCKBEGIN := 1

/**
 * @type {Integer (Int32)}
 */
export global DDWAITVB_BLOCKBEGINEVENT := 2

/**
 * @type {Integer (Int32)}
 */
export global DDWAITVB_BLOCKEND := 4

/**
 * @type {Integer (Int32)}
 */
export global DDGFS_CANFLIP := 1

/**
 * @type {Integer (Int32)}
 */
export global DDGFS_ISFLIPDONE := 2

/**
 * @type {Integer (Int32)}
 */
export global DDGBS_CANBLT := 1

/**
 * @type {Integer (Int32)}
 */
export global DDGBS_ISBLTDONE := 2

/**
 * @type {Integer (Int32)}
 */
export global DDENUMOVERLAYZ_BACKTOFRONT := 0

/**
 * @type {Integer (Int32)}
 */
export global DDENUMOVERLAYZ_FRONTTOBACK := 1

/**
 * @type {Integer (Int32)}
 */
export global DDOVERZ_SENDTOFRONT := 0

/**
 * @type {Integer (Int32)}
 */
export global DDOVERZ_SENDTOBACK := 1

/**
 * @type {Integer (Int32)}
 */
export global DDOVERZ_MOVEFORWARD := 2

/**
 * @type {Integer (Int32)}
 */
export global DDOVERZ_MOVEBACKWARD := 3

/**
 * @type {Integer (Int32)}
 */
export global DDOVERZ_INSERTINFRONTOF := 4

/**
 * @type {Integer (Int32)}
 */
export global DDOVERZ_INSERTINBACKOF := 5

/**
 * @type {Integer (Int32)}
 */
export global DDSGR_CALIBRATE := 1

/**
 * @type {Integer (Int32)}
 */
export global DDSMT_ISTESTREQUIRED := 1

/**
 * @type {Integer (Int32)}
 */
export global DDEM_MODEPASSED := 1

/**
 * @type {Integer (Int32)}
 */
export global DDEM_MODEFAILED := 2

/**
 * @type {Integer (UInt32)}
 */
export global DDENUMRET_CANCEL := 0

/**
 * @type {Integer (UInt32)}
 */
export global DDENUMRET_OK := 1

/**
 * @type {Integer (Int32)}
 */
export global DDERR_NOTINITIALIZED := -2147221008

/**
 * @type {Integer (Int32)}
 */
export global OBJECT_ISROOT := -2147483648

/**
 * @type {Integer (UInt32)}
 */
export global DDUNSUPPORTEDMODE := 4294967295

/**
 * @type {Guid}
 */
export global GUID_MiscellaneousCallbacks := Guid("{efd60cc0-49e7-11d0-889d-00aa00bbb76a}")

/**
 * @type {Guid}
 */
export global GUID_VideoPortCallbacks := Guid("{efd60cc1-49e7-11d0-889d-00aa00bbb76a}")

/**
 * @type {Guid}
 */
export global GUID_ColorControlCallbacks := Guid("{efd60cc2-49e7-11d0-889d-00aa00bbb76a}")

/**
 * @type {Guid}
 */
export global GUID_VideoPortCaps := Guid("{efd60cc3-49e7-11d0-889d-00aa00bbb76a}")

/**
 * @type {Guid}
 */
export global GUID_D3DCallbacks2 := Guid("{0ba584e1-70b6-11d0-889d-00aa00bbb76a}")

/**
 * @type {Guid}
 */
export global GUID_D3DCallbacks3 := Guid("{ddf41230-ec0a-11d0-a9b6-00aa00c0993e}")

/**
 * @type {Guid}
 */
export global GUID_NonLocalVidMemCaps := Guid("{86c4fa80-8d84-11d0-94e8-00c04fc34137}")

/**
 * @type {Guid}
 */
export global GUID_KernelCallbacks := Guid("{80863800-6b06-11d0-9b06-00a0c903a3b8}")

/**
 * @type {Guid}
 */
export global GUID_KernelCaps := Guid("{ffaa7540-7aa8-11d0-9b06-00a0c903a3b8}")

/**
 * @type {Guid}
 */
export global GUID_D3DExtendedCaps := Guid("{7de41f80-9d93-11d0-89ab-00a0c9054129}")

/**
 * @type {Guid}
 */
export global GUID_ZPixelFormats := Guid("{93869880-36cf-11d1-9b1b-00aa00bbb8ae}")

/**
 * @type {Guid}
 */
export global GUID_DDMoreSurfaceCaps := Guid("{3b8a0466-f269-11d1-880b-00c04fd930c5}")

/**
 * @type {Guid}
 */
export global GUID_DDStereoMode := Guid("{f828169c-a8e8-11d2-a1f2-00a0c983eaf6}")

/**
 * @type {Guid}
 */
export global GUID_OptSurfaceKmodeInfo := Guid("{e05c8472-51d4-11d1-8cce-00a0c90629a8}")

/**
 * @type {Guid}
 */
export global GUID_OptSurfaceUmodeInfo := Guid("{9d792804-5fa8-11d1-8cd0-00a0c90629a8}")

/**
 * @type {Guid}
 */
export global GUID_UserModeDriverInfo := Guid("{f0b0e8e2-5f97-11d1-8cd0-00a0c90629a8}")

/**
 * @type {Guid}
 */
export global GUID_UserModeDriverPassword := Guid("{97f861b6-60a1-11d1-8cd0-00a0c90629a8}")

/**
 * @type {Guid}
 */
export global GUID_D3DParseUnknownCommandCallback := Guid("{2e04ffa0-98e4-11d1-8ce1-00a0c90629a8}")

/**
 * @type {Guid}
 */
export global GUID_MotionCompCallbacks := Guid("{b1122b40-5da5-11d1-8fcf-00c04fc29b4e}")

/**
 * @type {Guid}
 */
export global GUID_Miscellaneous2Callbacks := Guid("{406b2f00-3e5a-11d1-b640-00aa00a1f96a}")

/**
 * @type {Integer (Int32)}
 */
export global DDPF_NOVEL_TEXTURE_FORMAT := 1048576

/**
 * @type {Integer (Int32)}
 */
export global DDPF_D3DFORMAT := 2097152

/**
 * @type {Integer (Int32)}
 */
export global D3DFORMAT_OP_TEXTURE := 1

/**
 * @type {Integer (Int32)}
 */
export global D3DFORMAT_OP_VOLUMETEXTURE := 2

/**
 * @type {Integer (Int32)}
 */
export global D3DFORMAT_OP_CUBETEXTURE := 4

/**
 * @type {Integer (Int32)}
 */
export global D3DFORMAT_OP_OFFSCREEN_RENDERTARGET := 8

/**
 * @type {Integer (Int32)}
 */
export global D3DFORMAT_OP_SAME_FORMAT_RENDERTARGET := 16

/**
 * @type {Integer (Int32)}
 */
export global D3DFORMAT_OP_ZSTENCIL := 64

/**
 * @type {Integer (Int32)}
 */
export global D3DFORMAT_OP_ZSTENCIL_WITH_ARBITRARY_COLOR_DEPTH := 128

/**
 * @type {Integer (Int32)}
 */
export global D3DFORMAT_OP_SAME_FORMAT_UP_TO_ALPHA_RENDERTARGET := 256

/**
 * @type {Integer (Int32)}
 */
export global D3DFORMAT_OP_DISPLAYMODE := 1024

/**
 * @type {Integer (Int32)}
 */
export global D3DFORMAT_OP_3DACCELERATION := 2048

/**
 * @type {Integer (Int32)}
 */
export global D3DFORMAT_OP_PIXELSIZE := 4096

/**
 * @type {Integer (Int32)}
 */
export global D3DFORMAT_OP_CONVERT_TO_ARGB := 8192

/**
 * @type {Integer (Int32)}
 */
export global D3DFORMAT_OP_OFFSCREENPLAIN := 16384

/**
 * @type {Integer (Int32)}
 */
export global D3DFORMAT_OP_SRGBREAD := 32768

/**
 * @type {Integer (Int32)}
 */
export global D3DFORMAT_OP_BUMPMAP := 65536

/**
 * @type {Integer (Int32)}
 */
export global D3DFORMAT_OP_DMAP := 131072

/**
 * @type {Integer (Int32)}
 */
export global D3DFORMAT_OP_NOFILTER := 262144

/**
 * @type {Integer (Int32)}
 */
export global D3DFORMAT_MEMBEROFGROUP_ARGB := 524288

/**
 * @type {Integer (Int32)}
 */
export global D3DFORMAT_OP_SRGBWRITE := 1048576

/**
 * @type {Integer (Int32)}
 */
export global D3DFORMAT_OP_NOALPHABLEND := 2097152

/**
 * @type {Integer (Int32)}
 */
export global D3DFORMAT_OP_AUTOGENMIPMAP := 4194304

/**
 * @type {Integer (Int32)}
 */
export global D3DFORMAT_OP_VERTEXTEXTURE := 8388608

/**
 * @type {Integer (Int32)}
 */
export global D3DFORMAT_OP_NOTEXCOORDWRAPNORMIP := 16777216

/**
 * @type {Integer (UInt32)}
 */
export global DELETED_OK := 0

/**
 * @type {Integer (UInt32)}
 */
export global DELETED_LASTONE := 1

/**
 * @type {Integer (UInt32)}
 */
export global DELETED_NOTFOUND := 2

/**
 * @type {Integer (UInt32)}
 */
export global DCICOMMAND := 3075

/**
 * @type {Integer (Int32)}
 */
export global DD_VERSION := 512

/**
 * @type {Integer (Int32)}
 */
export global DD_RUNTIME_VERSION := 2306

/**
 * @type {Integer (UInt32)}
 */
export global DD_HAL_VERSION := 256

/**
 * @type {Integer (UInt32)}
 */
export global DDCREATEDRIVEROBJECT := 10

/**
 * @type {Integer (UInt32)}
 */
export global DDGET32BITDRIVERNAME := 11

/**
 * @type {Integer (UInt32)}
 */
export global DDNEWCALLBACKFNS := 12

/**
 * @type {Integer (UInt32)}
 */
export global DDVERSIONINFO := 13

/**
 * @type {String}
 */
export global DDHAL_DRIVER_DLLNAME := "DDRAW16.DLL"

/**
 * @type {String}
 */
export global DDHAL_APP_DLLNAME := "DDRAW.DLL"

/**
 * @type {Integer (UInt32)}
 */
export global CCHDEVICENAME := 32

/**
 * @type {Integer (UInt32)}
 */
export global MAX_DRIVER_NAME := 32

/**
 * @type {Integer (UInt32)}
 */
export global MAX_PALETTE_SIZE := 256

/**
 * @type {Integer (UInt32)}
 */
export global MAX_AUTOFLIP_BUFFERS := 10

/**
 * @type {Integer (Int32)}
 */
export global DDSCAPS_EXECUTEBUFFER := 8388608

/**
 * @type {Integer (Int32)}
 */
export global DDSCAPS2_VERTEXBUFFER := 32

/**
 * @type {Integer (Int32)}
 */
export global DDSCAPS2_COMMANDBUFFER := 64

/**
 * @type {Integer (Int32)}
 */
export global DDSCAPS2_INDEXBUFFER := 67108864

/**
 * @type {Integer (Int32)}
 */
export global DDSCAPS3_VIDEO := 512

/**
 * @type {Integer (UInt32)}
 */
export global D3DFMT_INTERNAL_D32 := 71

/**
 * @type {Integer (UInt32)}
 */
export global D3DFMT_INTERNAL_S1D15 := 72

/**
 * @type {Integer (UInt32)}
 */
export global D3DFMT_INTERNAL_D15S1 := 73

/**
 * @type {Integer (UInt32)}
 */
export global D3DFMT_INTERNAL_S8D24 := 74

/**
 * @type {Integer (UInt32)}
 */
export global D3DFMT_INTERNAL_D24S8 := 75

/**
 * @type {Integer (UInt32)}
 */
export global D3DFMT_INTERNAL_X8D24 := 76

/**
 * @type {Integer (UInt32)}
 */
export global D3DFMT_INTERNAL_D24X8 := 77

/**
 * @type {Integer (Int32)}
 */
export global DDHAL_PLEASEALLOC_BLOCKSIZE := 2

/**
 * @type {Integer (Int32)}
 */
export global DDHAL_PLEASEALLOC_LINEARSIZE := 3

/**
 * @type {Integer (Int32)}
 */
export global VIDMEM_ISLINEAR := 1

/**
 * @type {Integer (Int32)}
 */
export global VIDMEM_ISRECTANGULAR := 2

/**
 * @type {Integer (Int32)}
 */
export global VIDMEM_ISHEAP := 4

/**
 * @type {Integer (Int32)}
 */
export global VIDMEM_ISNONLOCAL := 8

/**
 * @type {Integer (Int32)}
 */
export global VIDMEM_ISWC := 16

/**
 * @type {Integer (Int32)}
 */
export global VIDMEM_HEAPDISABLED := 32

/**
 * @type {Integer (Int32)}
 */
export global HEAPALIASINFO_MAPPEDREAL := 1

/**
 * @type {Integer (Int32)}
 */
export global HEAPALIASINFO_MAPPEDDUMMY := 2

/**
 * @type {Integer (Int32)}
 */
export global DDHAL_CB32_DESTROYDRIVER := 1

/**
 * @type {Integer (Int32)}
 */
export global DDHAL_CB32_CREATESURFACE := 2

/**
 * @type {Integer (Int32)}
 */
export global DDHAL_CB32_SETCOLORKEY := 4

/**
 * @type {Integer (Int32)}
 */
export global DDHAL_CB32_SETMODE := 8

/**
 * @type {Integer (Int32)}
 */
export global DDHAL_CB32_WAITFORVERTICALBLANK := 16

/**
 * @type {Integer (Int32)}
 */
export global DDHAL_CB32_CANCREATESURFACE := 32

/**
 * @type {Integer (Int32)}
 */
export global DDHAL_CB32_CREATEPALETTE := 64

/**
 * @type {Integer (Int32)}
 */
export global DDHAL_CB32_GETSCANLINE := 128

/**
 * @type {Integer (Int32)}
 */
export global DDHAL_CB32_SETEXCLUSIVEMODE := 256

/**
 * @type {Integer (Int32)}
 */
export global DDHAL_CB32_FLIPTOGDISURFACE := 512

/**
 * @type {Integer (Int32)}
 */
export global DDHAL_PALCB32_DESTROYPALETTE := 1

/**
 * @type {Integer (Int32)}
 */
export global DDHAL_PALCB32_SETENTRIES := 2

/**
 * @type {Integer (Int32)}
 */
export global DDHAL_SURFCB32_DESTROYSURFACE := 1

/**
 * @type {Integer (Int32)}
 */
export global DDHAL_SURFCB32_FLIP := 2

/**
 * @type {Integer (Int32)}
 */
export global DDHAL_SURFCB32_SETCLIPLIST := 4

/**
 * @type {Integer (Int32)}
 */
export global DDHAL_SURFCB32_LOCK := 8

/**
 * @type {Integer (Int32)}
 */
export global DDHAL_SURFCB32_UNLOCK := 16

/**
 * @type {Integer (Int32)}
 */
export global DDHAL_SURFCB32_BLT := 32

/**
 * @type {Integer (Int32)}
 */
export global DDHAL_SURFCB32_SETCOLORKEY := 64

/**
 * @type {Integer (Int32)}
 */
export global DDHAL_SURFCB32_ADDATTACHEDSURFACE := 128

/**
 * @type {Integer (Int32)}
 */
export global DDHAL_SURFCB32_GETBLTSTATUS := 256

/**
 * @type {Integer (Int32)}
 */
export global DDHAL_SURFCB32_GETFLIPSTATUS := 512

/**
 * @type {Integer (Int32)}
 */
export global DDHAL_SURFCB32_UPDATEOVERLAY := 1024

/**
 * @type {Integer (Int32)}
 */
export global DDHAL_SURFCB32_SETOVERLAYPOSITION := 2048

/**
 * @type {Integer (Int32)}
 */
export global DDHAL_SURFCB32_RESERVED4 := 4096

/**
 * @type {Integer (Int32)}
 */
export global DDHAL_SURFCB32_SETPALETTE := 8192

/**
 * @type {Integer (Int32)}
 */
export global DDHAL_MISCCB32_GETAVAILDRIVERMEMORY := 1

/**
 * @type {Integer (Int32)}
 */
export global DDHAL_MISCCB32_UPDATENONLOCALHEAP := 2

/**
 * @type {Integer (Int32)}
 */
export global DDHAL_MISCCB32_GETHEAPALIGNMENT := 4

/**
 * @type {Integer (Int32)}
 */
export global DDHAL_MISCCB32_GETSYSMEMBLTSTATUS := 8

/**
 * @type {Integer (Int32)}
 */
export global DDHAL_MISC2CB32_CREATESURFACEEX := 2

/**
 * @type {Integer (Int32)}
 */
export global DDHAL_MISC2CB32_GETDRIVERSTATE := 4

/**
 * @type {Integer (Int32)}
 */
export global DDHAL_MISC2CB32_DESTROYDDLOCAL := 8

/**
 * @type {Integer (Int32)}
 */
export global DDHAL_EXEBUFCB32_CANCREATEEXEBUF := 1

/**
 * @type {Integer (Int32)}
 */
export global DDHAL_EXEBUFCB32_CREATEEXEBUF := 2

/**
 * @type {Integer (Int32)}
 */
export global DDHAL_EXEBUFCB32_DESTROYEXEBUF := 4

/**
 * @type {Integer (Int32)}
 */
export global DDHAL_EXEBUFCB32_LOCKEXEBUF := 8

/**
 * @type {Integer (Int32)}
 */
export global DDHAL_EXEBUFCB32_UNLOCKEXEBUF := 16

/**
 * @type {Integer (Int32)}
 */
export global DDHAL_VPORT32_CANCREATEVIDEOPORT := 1

/**
 * @type {Integer (Int32)}
 */
export global DDHAL_VPORT32_CREATEVIDEOPORT := 2

/**
 * @type {Integer (Int32)}
 */
export global DDHAL_VPORT32_FLIP := 4

/**
 * @type {Integer (Int32)}
 */
export global DDHAL_VPORT32_GETBANDWIDTH := 8

/**
 * @type {Integer (Int32)}
 */
export global DDHAL_VPORT32_GETINPUTFORMATS := 16

/**
 * @type {Integer (Int32)}
 */
export global DDHAL_VPORT32_GETOUTPUTFORMATS := 32

/**
 * @type {Integer (Int32)}
 */
export global DDHAL_VPORT32_GETFIELD := 128

/**
 * @type {Integer (Int32)}
 */
export global DDHAL_VPORT32_GETLINE := 256

/**
 * @type {Integer (Int32)}
 */
export global DDHAL_VPORT32_GETCONNECT := 512

/**
 * @type {Integer (Int32)}
 */
export global DDHAL_VPORT32_DESTROY := 1024

/**
 * @type {Integer (Int32)}
 */
export global DDHAL_VPORT32_GETFLIPSTATUS := 2048

/**
 * @type {Integer (Int32)}
 */
export global DDHAL_VPORT32_UPDATE := 4096

/**
 * @type {Integer (Int32)}
 */
export global DDHAL_VPORT32_WAITFORSYNC := 8192

/**
 * @type {Integer (Int32)}
 */
export global DDHAL_VPORT32_GETSIGNALSTATUS := 16384

/**
 * @type {Integer (Int32)}
 */
export global DDHAL_VPORT32_COLORCONTROL := 32768

/**
 * @type {Integer (Int32)}
 */
export global DDHAL_COLOR_COLORCONTROL := 1

/**
 * @type {Integer (Int32)}
 */
export global DDHAL_KERNEL_SYNCSURFACEDATA := 1

/**
 * @type {Integer (Int32)}
 */
export global DDHAL_KERNEL_SYNCVIDEOPORTDATA := 2

/**
 * @type {Integer (UInt32)}
 */
export global DDHAL_MOCOMP32_GETGUIDS := 1

/**
 * @type {Integer (UInt32)}
 */
export global DDHAL_MOCOMP32_GETFORMATS := 2

/**
 * @type {Integer (UInt32)}
 */
export global DDHAL_MOCOMP32_CREATE := 4

/**
 * @type {Integer (UInt32)}
 */
export global DDHAL_MOCOMP32_GETCOMPBUFFINFO := 8

/**
 * @type {Integer (UInt32)}
 */
export global DDHAL_MOCOMP32_GETINTERNALINFO := 16

/**
 * @type {Integer (UInt32)}
 */
export global DDHAL_MOCOMP32_BEGINFRAME := 32

/**
 * @type {Integer (UInt32)}
 */
export global DDHAL_MOCOMP32_ENDFRAME := 64

/**
 * @type {Integer (UInt32)}
 */
export global DDHAL_MOCOMP32_RENDER := 128

/**
 * @type {Integer (UInt32)}
 */
export global DDHAL_MOCOMP32_QUERYSTATUS := 256

/**
 * @type {Integer (UInt32)}
 */
export global DDHAL_MOCOMP32_DESTROY := 512

/**
 * @type {Integer (Int32)}
 */
export global DDHAL_DRIVER_NOTHANDLED := 0

/**
 * @type {Integer (Int32)}
 */
export global DDHAL_DRIVER_HANDLED := 1

/**
 * @type {Integer (Int32)}
 */
export global DDHAL_DRIVER_NOCKEYHW := 2

/**
 * @type {Integer (Int32)}
 */
export global DDRAWIPAL_256 := 1

/**
 * @type {Integer (Int32)}
 */
export global DDRAWIPAL_16 := 2

/**
 * @type {Integer (Int32)}
 */
export global DDRAWIPAL_GDI := 4

/**
 * @type {Integer (Int32)}
 */
export global DDRAWIPAL_STORED_8 := 8

/**
 * @type {Integer (Int32)}
 */
export global DDRAWIPAL_STORED_16 := 16

/**
 * @type {Integer (Int32)}
 */
export global DDRAWIPAL_STORED_24 := 32

/**
 * @type {Integer (Int32)}
 */
export global DDRAWIPAL_EXCLUSIVE := 64

/**
 * @type {Integer (Int32)}
 */
export global DDRAWIPAL_INHEL := 128

/**
 * @type {Integer (Int32)}
 */
export global DDRAWIPAL_DIRTY := 256

/**
 * @type {Integer (Int32)}
 */
export global DDRAWIPAL_ALLOW256 := 512

/**
 * @type {Integer (Int32)}
 */
export global DDRAWIPAL_4 := 1024

/**
 * @type {Integer (Int32)}
 */
export global DDRAWIPAL_2 := 2048

/**
 * @type {Integer (Int32)}
 */
export global DDRAWIPAL_STORED_8INDEX := 4096

/**
 * @type {Integer (Int32)}
 */
export global DDRAWIPAL_ALPHA := 8192

/**
 * @type {Integer (Int32)}
 */
export global DDRAWICLIP_WATCHWINDOW := 1

/**
 * @type {Integer (Int32)}
 */
export global DDRAWICLIP_ISINITIALIZED := 2

/**
 * @type {Integer (Int32)}
 */
export global DDRAWICLIP_INMASTERSPRITELIST := 4

/**
 * @type {Integer (Int32)}
 */
export global DDAL_IMPLICIT := 1

/**
 * @type {Integer (Int32)}
 */
export global ACCESSRECT_VRAMSTYLE := 1

/**
 * @type {Integer (Int32)}
 */
export global ACCESSRECT_NOTHOLDINGWIN16LOCK := 2

/**
 * @type {Integer (Int32)}
 */
export global ACCESSRECT_BROKEN := 4

/**
 * @type {Integer (UInt32)}
 */
export global PFINDEX_UNINITIALIZED := 0

/**
 * @type {Integer (Int32)}
 */
export global DDRAWISURFGBL_MEMFREE := 1

/**
 * @type {Integer (Int32)}
 */
export global DDRAWISURFGBL_SYSMEMREQUESTED := 2

/**
 * @type {Integer (Int32)}
 */
export global DDRAWISURFGBL_ISGDISURFACE := 4

/**
 * @type {Integer (Int32)}
 */
export global DDRAWISURFGBL_SOFTWAREAUTOFLIP := 8

/**
 * @type {Integer (Int32)}
 */
export global DDRAWISURFGBL_LOCKNOTHOLDINGWIN16LOCK := 16

/**
 * @type {Integer (Int32)}
 */
export global DDRAWISURFGBL_LOCKVRAMSTYLE := 32

/**
 * @type {Integer (Int32)}
 */
export global DDRAWISURFGBL_LOCKBROKEN := 64

/**
 * @type {Integer (Int32)}
 */
export global DDRAWISURFGBL_IMPLICITHANDLE := 128

/**
 * @type {Integer (Int32)}
 */
export global DDRAWISURFGBL_ISCLIENTMEM := 256

/**
 * @type {Integer (Int32)}
 */
export global DDRAWISURFGBL_HARDWAREOPSOURCE := 512

/**
 * @type {Integer (Int32)}
 */
export global DDRAWISURFGBL_HARDWAREOPDEST := 1024

/**
 * @type {Integer (Int32)}
 */
export global DDRAWISURFGBL_VPORTINTERLEAVED := 2048

/**
 * @type {Integer (Int32)}
 */
export global DDRAWISURFGBL_VPORTDATA := 4096

/**
 * @type {Integer (Int32)}
 */
export global DDRAWISURFGBL_LATEALLOCATELINEAR := 8192

/**
 * @type {Integer (Int32)}
 */
export global DDRAWISURFGBL_SYSMEMEXECUTEBUFFER := 16384

/**
 * @type {Integer (Int32)}
 */
export global DDRAWISURFGBL_FASTLOCKHELD := 32768

/**
 * @type {Integer (Int32)}
 */
export global DDRAWISURFGBL_READONLYLOCKHELD := 65536

/**
 * @type {Integer (Int32)}
 */
export global DDRAWISURFGBL_DX8SURFACE := 524288

/**
 * @type {Integer (Int32)}
 */
export global DDRAWISURFGBL_DDHELDONTFREE := 1048576

/**
 * @type {Integer (Int32)}
 */
export global DDRAWISURFGBL_NOTIFYWHENUNLOCKED := 2097152

/**
 * @type {Integer (Int32)}
 */
export global DDRAWISURFGBL_RESERVED0 := -2147483648

/**
 * @type {Integer (Int32)}
 */
export global DDRAWISURF_ATTACHED := 1

/**
 * @type {Integer (Int32)}
 */
export global DDRAWISURF_IMPLICITCREATE := 2

/**
 * @type {Integer (Int32)}
 */
export global DDRAWISURF_ISFREE := 4

/**
 * @type {Integer (Int32)}
 */
export global DDRAWISURF_ATTACHED_FROM := 8

/**
 * @type {Integer (Int32)}
 */
export global DDRAWISURF_IMPLICITROOT := 16

/**
 * @type {Integer (Int32)}
 */
export global DDRAWISURF_PARTOFPRIMARYCHAIN := 32

/**
 * @type {Integer (Int32)}
 */
export global DDRAWISURF_DATAISALIASED := 64

/**
 * @type {Integer (Int32)}
 */
export global DDRAWISURF_HASDC := 128

/**
 * @type {Integer (Int32)}
 */
export global DDRAWISURF_HASCKEYDESTOVERLAY := 256

/**
 * @type {Integer (Int32)}
 */
export global DDRAWISURF_HASCKEYDESTBLT := 512

/**
 * @type {Integer (Int32)}
 */
export global DDRAWISURF_HASCKEYSRCOVERLAY := 1024

/**
 * @type {Integer (Int32)}
 */
export global DDRAWISURF_HASCKEYSRCBLT := 2048

/**
 * @type {Integer (Int32)}
 */
export global DDRAWISURF_LOCKEXCLUDEDCURSOR := 4096

/**
 * @type {Integer (Int32)}
 */
export global DDRAWISURF_HASPIXELFORMAT := 8192

/**
 * @type {Integer (Int32)}
 */
export global DDRAWISURF_HASOVERLAYDATA := 16384

/**
 * @type {Integer (Int32)}
 */
export global DDRAWISURF_SETGAMMA := 32768

/**
 * @type {Integer (Int32)}
 */
export global DDRAWISURF_SW_CKEYDESTOVERLAY := 65536

/**
 * @type {Integer (Int32)}
 */
export global DDRAWISURF_SW_CKEYDESTBLT := 131072

/**
 * @type {Integer (Int32)}
 */
export global DDRAWISURF_SW_CKEYSRCOVERLAY := 262144

/**
 * @type {Integer (Int32)}
 */
export global DDRAWISURF_SW_CKEYSRCBLT := 524288

/**
 * @type {Integer (Int32)}
 */
export global DDRAWISURF_HW_CKEYDESTOVERLAY := 1048576

/**
 * @type {Integer (Int32)}
 */
export global DDRAWISURF_HW_CKEYDESTBLT := 2097152

/**
 * @type {Integer (Int32)}
 */
export global DDRAWISURF_HW_CKEYSRCOVERLAY := 4194304

/**
 * @type {Integer (Int32)}
 */
export global DDRAWISURF_HW_CKEYSRCBLT := 8388608

/**
 * @type {Integer (Int32)}
 */
export global DDRAWISURF_INMASTERSPRITELIST := 16777216

/**
 * @type {Integer (Int32)}
 */
export global DDRAWISURF_HELCB := 33554432

/**
 * @type {Integer (Int32)}
 */
export global DDRAWISURF_FRONTBUFFER := 67108864

/**
 * @type {Integer (Int32)}
 */
export global DDRAWISURF_BACKBUFFER := 134217728

/**
 * @type {Integer (Int32)}
 */
export global DDRAWISURF_INVALID := 268435456

/**
 * @type {Integer (Int32)}
 */
export global DDRAWISURF_DCIBUSY := 536870912

/**
 * @type {Integer (Int32)}
 */
export global DDRAWISURF_GETDCNULL := 1073741824

/**
 * @type {Integer (Int32)}
 */
export global DDRAWISURF_STEREOSURFACELEFT := 536870912

/**
 * @type {Integer (Int32)}
 */
export global DDRAWISURF_DRIVERMANAGED := 1073741824

/**
 * @type {Integer (Int32)}
 */
export global DDRAWISURF_DCILOCK := -2147483648

/**
 * @type {Integer (Int32)}
 */
export global ROP_HAS_SOURCE := 1

/**
 * @type {Integer (Int32)}
 */
export global ROP_HAS_PATTERN := 2

/**
 * @type {Integer (UInt32)}
 */
export global DDMODEINFO_PALETTIZED := 1

/**
 * @type {Integer (UInt32)}
 */
export global DDMODEINFO_MODEX := 2

/**
 * @type {Integer (UInt32)}
 */
export global DDMODEINFO_UNSUPPORTED := 4

/**
 * @type {Integer (UInt32)}
 */
export global DDMODEINFO_STANDARDVGA := 8

/**
 * @type {Integer (UInt32)}
 */
export global DDMODEINFO_MAXREFRESH := 16

/**
 * @type {Integer (UInt32)}
 */
export global DDMODEINFO_STEREO := 32

/**
 * @type {Integer (Int32)}
 */
export global DDRAWILCL_HASEXCLUSIVEMODE := 1

/**
 * @type {Integer (Int32)}
 */
export global DDRAWILCL_ISFULLSCREEN := 2

/**
 * @type {Integer (Int32)}
 */
export global DDRAWILCL_SETCOOPCALLED := 4

/**
 * @type {Integer (Int32)}
 */
export global DDRAWILCL_ACTIVEYES := 8

/**
 * @type {Integer (Int32)}
 */
export global DDRAWILCL_ACTIVENO := 16

/**
 * @type {Integer (Int32)}
 */
export global DDRAWILCL_HOOKEDHWND := 32

/**
 * @type {Integer (Int32)}
 */
export global DDRAWILCL_ALLOWMODEX := 64

/**
 * @type {Integer (Int32)}
 */
export global DDRAWILCL_V1SCLBEHAVIOUR := 128

/**
 * @type {Integer (Int32)}
 */
export global DDRAWILCL_MODEHASBEENCHANGED := 256

/**
 * @type {Integer (Int32)}
 */
export global DDRAWILCL_CREATEDWINDOW := 512

/**
 * @type {Integer (Int32)}
 */
export global DDRAWILCL_DIRTYDC := 1024

/**
 * @type {Integer (Int32)}
 */
export global DDRAWILCL_DISABLEINACTIVATE := 2048

/**
 * @type {Integer (Int32)}
 */
export global DDRAWILCL_CURSORCLIPPED := 4096

/**
 * @type {Integer (Int32)}
 */
export global DDRAWILCL_EXPLICITMONITOR := 8192

/**
 * @type {Integer (Int32)}
 */
export global DDRAWILCL_MULTITHREADED := 16384

/**
 * @type {Integer (Int32)}
 */
export global DDRAWILCL_FPUSETUP := 32768

/**
 * @type {Integer (Int32)}
 */
export global DDRAWILCL_POWEREDDOWN := 65536

/**
 * @type {Integer (Int32)}
 */
export global DDRAWILCL_DIRECTDRAW7 := 131072

/**
 * @type {Integer (Int32)}
 */
export global DDRAWILCL_ATTEMPTEDD3DCONTEXT := 262144

/**
 * @type {Integer (Int32)}
 */
export global DDRAWILCL_FPUPRESERVE := 524288

/**
 * @type {Integer (Int32)}
 */
export global DDRAWILCL_DX8DRIVER := 1048576

/**
 * @type {Integer (Int32)}
 */
export global DDRAWILCL_DIRECTDRAW8 := 2097152

/**
 * @type {Integer (Int32)}
 */
export global DDRAWI_xxxxxxxxx1 := 1

/**
 * @type {Integer (Int32)}
 */
export global DDRAWI_xxxxxxxxx2 := 2

/**
 * @type {Integer (Int32)}
 */
export global DDRAWI_VIRTUALDESKTOP := 8

/**
 * @type {Integer (Int32)}
 */
export global DDRAWI_MODEX := 16

/**
 * @type {Integer (Int32)}
 */
export global DDRAWI_DISPLAYDRV := 32

/**
 * @type {Integer (Int32)}
 */
export global DDRAWI_FULLSCREEN := 64

/**
 * @type {Integer (Int32)}
 */
export global DDRAWI_MODECHANGED := 128

/**
 * @type {Integer (Int32)}
 */
export global DDRAWI_NOHARDWARE := 256

/**
 * @type {Integer (Int32)}
 */
export global DDRAWI_PALETTEINIT := 512

/**
 * @type {Integer (Int32)}
 */
export global DDRAWI_NOEMULATION := 1024

/**
 * @type {Integer (Int32)}
 */
export global DDRAWI_HASCKEYDESTOVERLAY := 2048

/**
 * @type {Integer (Int32)}
 */
export global DDRAWI_HASCKEYSRCOVERLAY := 4096

/**
 * @type {Integer (Int32)}
 */
export global DDRAWI_HASGDIPALETTE := 8192

/**
 * @type {Integer (Int32)}
 */
export global DDRAWI_EMULATIONINITIALIZED := 16384

/**
 * @type {Integer (Int32)}
 */
export global DDRAWI_HASGDIPALETTE_EXCLUSIVE := 32768

/**
 * @type {Integer (Int32)}
 */
export global DDRAWI_MODEXILLEGAL := 65536

/**
 * @type {Integer (Int32)}
 */
export global DDRAWI_FLIPPEDTOGDI := 131072

/**
 * @type {Integer (Int32)}
 */
export global DDRAWI_NEEDSWIN16FORVRAMLOCK := 262144

/**
 * @type {Integer (Int32)}
 */
export global DDRAWI_PDEVICEVRAMBITCLEARED := 524288

/**
 * @type {Integer (Int32)}
 */
export global DDRAWI_STANDARDVGA := 1048576

/**
 * @type {Integer (Int32)}
 */
export global DDRAWI_EXTENDEDALIGNMENT := 2097152

/**
 * @type {Integer (Int32)}
 */
export global DDRAWI_CHANGINGMODE := 4194304

/**
 * @type {Integer (Int32)}
 */
export global DDRAWI_GDIDRV := 8388608

/**
 * @type {Integer (Int32)}
 */
export global DDRAWI_ATTACHEDTODESKTOP := 16777216

/**
 * @type {Integer (Int32)}
 */
export global DDRAWI_UMODELOADED := 33554432

/**
 * @type {Integer (Int32)}
 */
export global DDRAWI_DDRAWDATANOTFETCHED := 67108864

/**
 * @type {Integer (Int32)}
 */
export global DDRAWI_SECONDARYDRIVERLOADED := 134217728

/**
 * @type {Integer (Int32)}
 */
export global DDRAWI_TESTINGMODES := 268435456

/**
 * @type {Integer (Int32)}
 */
export global DDRAWI_DRIVERINFO2 := 536870912

/**
 * @type {Integer (Int32)}
 */
export global DDRAWI_BADPDEV := 1073741824

/**
 * @type {Integer (UInt32)}
 */
export global DDRAWIVPORT_ON := 1

/**
 * @type {Integer (UInt32)}
 */
export global DDRAWIVPORT_SOFTWARE_AUTOFLIP := 2

/**
 * @type {Integer (UInt32)}
 */
export global DDRAWIVPORT_COLORKEYANDINTERP := 4

/**
 * @type {Integer (UInt32)}
 */
export global DDRAWIVPORT_NOKERNELHANDLES := 8

/**
 * @type {Integer (UInt32)}
 */
export global DDRAWIVPORT_SOFTWARE_BOB := 16

/**
 * @type {Integer (UInt32)}
 */
export global DDRAWIVPORT_VBION := 32

/**
 * @type {Integer (UInt32)}
 */
export global DDRAWIVPORT_VIDEOON := 64

/**
 * @type {Integer (Int32)}
 */
export global DDHALINFO_ISPRIMARYDISPLAY := 1

/**
 * @type {Integer (Int32)}
 */
export global DDHALINFO_MODEXILLEGAL := 2

/**
 * @type {Integer (Int32)}
 */
export global DDHALINFO_GETDRIVERINFOSET := 4

/**
 * @type {Integer (Int32)}
 */
export global DDHALINFO_GETDRIVERINFO2 := 8

/**
 * @type {Integer (Int32)}
 */
export global DDWAITVB_I_TESTVB := -2147483642

/**
 * @type {Integer (UInt32)}
 */
export global DDRAWI_VPORTSTART := 1

/**
 * @type {Integer (UInt32)}
 */
export global DDRAWI_VPORTSTOP := 2

/**
 * @type {Integer (UInt32)}
 */
export global DDRAWI_VPORTUPDATE := 3

/**
 * @type {Integer (UInt32)}
 */
export global DDRAWI_VPORTGETCOLOR := 1

/**
 * @type {Integer (UInt32)}
 */
export global DDRAWI_VPORTSETCOLOR := 2

/**
 * @type {Integer (UInt32)}
 */
export global DDRAWI_GETCOLOR := 1

/**
 * @type {Integer (UInt32)}
 */
export global DDRAWI_SETCOLOR := 2

/**
 * @type {Integer (UInt32)}
 */
export global DDMCQUERY_READ := 1

/**
 * @type {Guid}
 */
export global GUID_D3DCaps := Guid("{7bf06991-8794-11d0-9139-080036d2ef02}")

/**
 * @type {Guid}
 */
export global GUID_D3DCallbacks := Guid("{7bf06990-8794-11d0-9139-080036d2ef02}")

/**
 * @type {Guid}
 */
export global GUID_DDMoreCaps := Guid("{880baf30-b030-11d0-8ea7-00609797ea5b}")

/**
 * @type {Guid}
 */
export global GUID_NTCallbacks := Guid("{6fe9ecde-df89-11d1-9db0-0060082771ba}")

/**
 * @type {Guid}
 */
export global GUID_GetHeapAlignment := Guid("{42e02f16-7b41-11d2-8bff-00a0c983eaf6}")

/**
 * @type {Guid}
 */
export global GUID_UpdateNonLocalHeap := Guid("{42e02f17-7b41-11d2-8bff-00a0c983eaf6}")

/**
 * @type {Guid}
 */
export global GUID_NTPrivateDriverCaps := Guid("{fad16a23-7b66-11d2-83d7-00c04f7ce58c}")

/**
 * @type {Guid}
 */
export global GUID_VPE2Callbacks := Guid("{52882147-2d47-469a-a0d1-03455890f6c8}")

/**
 * @type {Integer (Int32)}
 */
export global DDSCAPS_COMMANDBUFFER := 1024

/**
 * @type {Integer (Int32)}
 */
export global DDHAL_PLEASEALLOC_USERMEM := 4

/**
 * @type {Integer (Int32)}
 */
export global DDHAL_CB32_MAPMEMORY := -2147483648

/**
 * @type {Integer (Int32)}
 */
export global DDHAL_MISC2CB32_ALPHABLT := 1

/**
 * @type {Integer (Int32)}
 */
export global DDHAL_CREATESURFACEEX_SWAPHANDLES := 1

/**
 * @type {Integer (Int32)}
 */
export global DDHAL_NTCB32_FREEDRIVERMEMORY := 1

/**
 * @type {Integer (Int32)}
 */
export global DDHAL_NTCB32_SETEXCLUSIVEMODE := 2

/**
 * @type {Integer (Int32)}
 */
export global DDHAL_NTCB32_FLIPTOGDISURFACE := 4

/**
 * @type {Integer (Int32)}
 */
export global DDHAL_VPORT32_GETAUTOFLIPSURF := 64

/**
 * @type {Integer (Int32)}
 */
export global DDHAL_D3DBUFCB32_CANCREATED3DBUF := 1

/**
 * @type {Integer (Int32)}
 */
export global DDHAL_D3DBUFCB32_CREATED3DBUF := 2

/**
 * @type {Integer (Int32)}
 */
export global DDHAL_D3DBUFCB32_DESTROYD3DBUF := 4

/**
 * @type {Integer (Int32)}
 */
export global DDHAL_D3DBUFCB32_LOCKD3DBUF := 8

/**
 * @type {Integer (Int32)}
 */
export global DDHAL_D3DBUFCB32_UNLOCKD3DBUF := 16

/**
 * @type {Integer (Int32)}
 */
export global DDHAL_PRIVATECAP_ATOMICSURFACECREATION := 1

/**
 * @type {Integer (Int32)}
 */
export global DDHAL_PRIVATECAP_NOTIFYPRIMARYCREATION := 2

/**
 * @type {Integer (Int32)}
 */
export global DDHAL_PRIVATECAP_RESERVED1 := 4

/**
 * @type {Integer (Int32)}
 */
export global DDBLT_AFLAGS := -2147483648

/**
 * @type {Integer (Int32)}
 */
export global DDABLT_SRCOVERDEST := 1

/**
 * @type {Integer (Int32)}
 */
export global DDKERNELCAPS_SKIPFIELDS := 1

/**
 * @type {Integer (Int32)}
 */
export global DDKERNELCAPS_AUTOFLIP := 2

/**
 * @type {Integer (Int32)}
 */
export global DDKERNELCAPS_SETSTATE := 4

/**
 * @type {Integer (Int32)}
 */
export global DDKERNELCAPS_LOCK := 8

/**
 * @type {Integer (Int32)}
 */
export global DDKERNELCAPS_FLIPVIDEOPORT := 16

/**
 * @type {Integer (Int32)}
 */
export global DDKERNELCAPS_FLIPOVERLAY := 32

/**
 * @type {Integer (Int32)}
 */
export global DDKERNELCAPS_CAPTURE_SYSMEM := 64

/**
 * @type {Integer (Int32)}
 */
export global DDKERNELCAPS_CAPTURE_NONLOCALVIDMEM := 128

/**
 * @type {Integer (Int32)}
 */
export global DDKERNELCAPS_FIELDPOLARITY := 256

/**
 * @type {Integer (Int32)}
 */
export global DDKERNELCAPS_CAPTURE_INVERTED := 512

/**
 * @type {Integer (Int32)}
 */
export global DDIRQ_DISPLAY_VSYNC := 1

/**
 * @type {Integer (Int32)}
 */
export global DDIRQ_RESERVED1 := 2

/**
 * @type {Integer (Int32)}
 */
export global DDIRQ_VPORT0_VSYNC := 4

/**
 * @type {Integer (Int32)}
 */
export global DDIRQ_VPORT0_LINE := 8

/**
 * @type {Integer (Int32)}
 */
export global DDIRQ_VPORT1_VSYNC := 16

/**
 * @type {Integer (Int32)}
 */
export global DDIRQ_VPORT1_LINE := 32

/**
 * @type {Integer (Int32)}
 */
export global DDIRQ_VPORT2_VSYNC := 64

/**
 * @type {Integer (Int32)}
 */
export global DDIRQ_VPORT2_LINE := 128

/**
 * @type {Integer (Int32)}
 */
export global DDIRQ_VPORT3_VSYNC := 256

/**
 * @type {Integer (Int32)}
 */
export global DDIRQ_VPORT3_LINE := 512

/**
 * @type {Integer (Int32)}
 */
export global DDIRQ_VPORT4_VSYNC := 1024

/**
 * @type {Integer (Int32)}
 */
export global DDIRQ_VPORT4_LINE := 2048

/**
 * @type {Integer (Int32)}
 */
export global DDIRQ_VPORT5_VSYNC := 4096

/**
 * @type {Integer (Int32)}
 */
export global DDIRQ_VPORT5_LINE := 8192

/**
 * @type {Integer (Int32)}
 */
export global DDIRQ_VPORT6_VSYNC := 16384

/**
 * @type {Integer (Int32)}
 */
export global DDIRQ_VPORT6_LINE := 32768

/**
 * @type {Integer (Int32)}
 */
export global DDIRQ_VPORT7_VSYNC := 65536

/**
 * @type {Integer (Int32)}
 */
export global DDIRQ_VPORT7_LINE := 131072

/**
 * @type {Integer (Int32)}
 */
export global DDIRQ_VPORT8_VSYNC := 262144

/**
 * @type {Integer (Int32)}
 */
export global DDIRQ_VPORT8_LINE := 524288

/**
 * @type {Integer (Int32)}
 */
export global DDIRQ_VPORT9_VSYNC := 65536

/**
 * @type {Integer (Int32)}
 */
export global DDIRQ_VPORT9_LINE := 131072

/**
 * @type {Integer (Int32)}
 */
export global SURFACEALIGN_DISCARDABLE := 1

/**
 * @type {Integer (Int32)}
 */
export global VMEMHEAP_LINEAR := 1

/**
 * @type {Integer (Int32)}
 */
export global VMEMHEAP_RECTANGULAR := 2

/**
 * @type {Integer (Int32)}
 */
export global VMEMHEAP_ALIGNMENT := 4

/**
 * @type {Guid}
 */
export global DDVPTYPE_E_HREFH_VREFH := Guid("{54f39980-da60-11cf-9b06-00a0c903a3b8}")

/**
 * @type {Guid}
 */
export global DDVPTYPE_E_HREFH_VREFL := Guid("{92783220-da60-11cf-9b06-00a0c903a3b8}")

/**
 * @type {Guid}
 */
export global DDVPTYPE_E_HREFL_VREFH := Guid("{a07a02e0-da60-11cf-9b06-00a0c903a3b8}")

/**
 * @type {Guid}
 */
export global DDVPTYPE_E_HREFL_VREFL := Guid("{e09c77e0-da60-11cf-9b06-00a0c903a3b8}")

/**
 * @type {Guid}
 */
export global DDVPTYPE_CCIR656 := Guid("{fca326a0-da60-11cf-9b06-00a0c903a3b8}")

/**
 * @type {Guid}
 */
export global DDVPTYPE_BROOKTREE := Guid("{1352a560-da61-11cf-9b06-00a0c903a3b8}")

/**
 * @type {Guid}
 */
export global DDVPTYPE_PHILIPS := Guid("{332cf160-da61-11cf-9b06-00a0c903a3b8}")

/**
 * @type {Integer (Int32)}
 */
export global DDVPD_WIDTH := 1

/**
 * @type {Integer (Int32)}
 */
export global DDVPD_HEIGHT := 2

/**
 * @type {Integer (Int32)}
 */
export global DDVPD_ID := 4

/**
 * @type {Integer (Int32)}
 */
export global DDVPD_CAPS := 8

/**
 * @type {Integer (Int32)}
 */
export global DDVPD_FX := 16

/**
 * @type {Integer (Int32)}
 */
export global DDVPD_AUTOFLIP := 32

/**
 * @type {Integer (Int32)}
 */
export global DDVPD_ALIGN := 64

/**
 * @type {Integer (Int32)}
 */
export global DDVPD_PREFERREDAUTOFLIP := 128

/**
 * @type {Integer (Int32)}
 */
export global DDVPD_FILTERQUALITY := 256

/**
 * @type {Integer (Int32)}
 */
export global DDVPCONNECT_DOUBLECLOCK := 1

/**
 * @type {Integer (Int32)}
 */
export global DDVPCONNECT_VACT := 2

/**
 * @type {Integer (Int32)}
 */
export global DDVPCONNECT_INVERTPOLARITY := 4

/**
 * @type {Integer (Int32)}
 */
export global DDVPCONNECT_DISCARDSVREFDATA := 8

/**
 * @type {Integer (Int32)}
 */
export global DDVPCONNECT_HALFLINE := 16

/**
 * @type {Integer (Int32)}
 */
export global DDVPCONNECT_INTERLACED := 32

/**
 * @type {Integer (Int32)}
 */
export global DDVPCONNECT_SHAREEVEN := 64

/**
 * @type {Integer (Int32)}
 */
export global DDVPCONNECT_SHAREODD := 128

/**
 * @type {Integer (Int32)}
 */
export global DDVPCAPS_AUTOFLIP := 1

/**
 * @type {Integer (Int32)}
 */
export global DDVPCAPS_INTERLACED := 2

/**
 * @type {Integer (Int32)}
 */
export global DDVPCAPS_NONINTERLACED := 4

/**
 * @type {Integer (Int32)}
 */
export global DDVPCAPS_READBACKFIELD := 8

/**
 * @type {Integer (Int32)}
 */
export global DDVPCAPS_READBACKLINE := 16

/**
 * @type {Integer (Int32)}
 */
export global DDVPCAPS_SHAREABLE := 32

/**
 * @type {Integer (Int32)}
 */
export global DDVPCAPS_SKIPEVENFIELDS := 64

/**
 * @type {Integer (Int32)}
 */
export global DDVPCAPS_SKIPODDFIELDS := 128

/**
 * @type {Integer (Int32)}
 */
export global DDVPCAPS_SYNCMASTER := 256

/**
 * @type {Integer (Int32)}
 */
export global DDVPCAPS_VBISURFACE := 512

/**
 * @type {Integer (Int32)}
 */
export global DDVPCAPS_COLORCONTROL := 1024

/**
 * @type {Integer (Int32)}
 */
export global DDVPCAPS_OVERSAMPLEDVBI := 2048

/**
 * @type {Integer (Int32)}
 */
export global DDVPCAPS_SYSTEMMEMORY := 4096

/**
 * @type {Integer (Int32)}
 */
export global DDVPCAPS_VBIANDVIDEOINDEPENDENT := 8192

/**
 * @type {Integer (Int32)}
 */
export global DDVPCAPS_HARDWAREDEINTERLACE := 16384

/**
 * @type {Integer (Int32)}
 */
export global DDVPFX_CROPTOPDATA := 1

/**
 * @type {Integer (Int32)}
 */
export global DDVPFX_CROPX := 2

/**
 * @type {Integer (Int32)}
 */
export global DDVPFX_CROPY := 4

/**
 * @type {Integer (Int32)}
 */
export global DDVPFX_INTERLEAVE := 8

/**
 * @type {Integer (Int32)}
 */
export global DDVPFX_MIRRORLEFTRIGHT := 16

/**
 * @type {Integer (Int32)}
 */
export global DDVPFX_MIRRORUPDOWN := 32

/**
 * @type {Integer (Int32)}
 */
export global DDVPFX_PRESHRINKX := 64

/**
 * @type {Integer (Int32)}
 */
export global DDVPFX_PRESHRINKY := 128

/**
 * @type {Integer (Int32)}
 */
export global DDVPFX_PRESHRINKXB := 256

/**
 * @type {Integer (Int32)}
 */
export global DDVPFX_PRESHRINKYB := 512

/**
 * @type {Integer (Int32)}
 */
export global DDVPFX_PRESHRINKXS := 1024

/**
 * @type {Integer (Int32)}
 */
export global DDVPFX_PRESHRINKYS := 2048

/**
 * @type {Integer (Int32)}
 */
export global DDVPFX_PRESTRETCHX := 4096

/**
 * @type {Integer (Int32)}
 */
export global DDVPFX_PRESTRETCHY := 8192

/**
 * @type {Integer (Int32)}
 */
export global DDVPFX_PRESTRETCHXN := 16384

/**
 * @type {Integer (Int32)}
 */
export global DDVPFX_PRESTRETCHYN := 32768

/**
 * @type {Integer (Int32)}
 */
export global DDVPFX_VBICONVERT := 65536

/**
 * @type {Integer (Int32)}
 */
export global DDVPFX_VBINOSCALE := 131072

/**
 * @type {Integer (Int32)}
 */
export global DDVPFX_IGNOREVBIXCROP := 262144

/**
 * @type {Integer (Int32)}
 */
export global DDVPFX_VBINOINTERLEAVE := 524288

/**
 * @type {Integer (Int32)}
 */
export global DDVP_AUTOFLIP := 1

/**
 * @type {Integer (Int32)}
 */
export global DDVP_CONVERT := 2

/**
 * @type {Integer (Int32)}
 */
export global DDVP_CROP := 4

/**
 * @type {Integer (Int32)}
 */
export global DDVP_INTERLEAVE := 8

/**
 * @type {Integer (Int32)}
 */
export global DDVP_MIRRORLEFTRIGHT := 16

/**
 * @type {Integer (Int32)}
 */
export global DDVP_MIRRORUPDOWN := 32

/**
 * @type {Integer (Int32)}
 */
export global DDVP_PRESCALE := 64

/**
 * @type {Integer (Int32)}
 */
export global DDVP_SKIPEVENFIELDS := 128

/**
 * @type {Integer (Int32)}
 */
export global DDVP_SKIPODDFIELDS := 256

/**
 * @type {Integer (Int32)}
 */
export global DDVP_SYNCMASTER := 512

/**
 * @type {Integer (Int32)}
 */
export global DDVP_VBICONVERT := 1024

/**
 * @type {Integer (Int32)}
 */
export global DDVP_VBINOSCALE := 2048

/**
 * @type {Integer (Int32)}
 */
export global DDVP_OVERRIDEBOBWEAVE := 4096

/**
 * @type {Integer (Int32)}
 */
export global DDVP_IGNOREVBIXCROP := 8192

/**
 * @type {Integer (Int32)}
 */
export global DDVP_VBINOINTERLEAVE := 16384

/**
 * @type {Integer (Int32)}
 */
export global DDVP_HARDWAREDEINTERLACE := 32768

/**
 * @type {Integer (Int32)}
 */
export global DDVPFORMAT_VIDEO := 1

/**
 * @type {Integer (Int32)}
 */
export global DDVPFORMAT_VBI := 2

/**
 * @type {Integer (Int32)}
 */
export global DDVPTARGET_VIDEO := 1

/**
 * @type {Integer (Int32)}
 */
export global DDVPTARGET_VBI := 2

/**
 * @type {Integer (Int32)}
 */
export global DDVPWAIT_BEGIN := 1

/**
 * @type {Integer (Int32)}
 */
export global DDVPWAIT_END := 2

/**
 * @type {Integer (Int32)}
 */
export global DDVPWAIT_LINE := 3

/**
 * @type {Integer (Int32)}
 */
export global DDVPFLIP_VIDEO := 1

/**
 * @type {Integer (Int32)}
 */
export global DDVPFLIP_VBI := 2

/**
 * @type {Integer (Int32)}
 */
export global DDVPSQ_NOSIGNAL := 1

/**
 * @type {Integer (Int32)}
 */
export global DDVPSQ_SIGNALOK := 2

/**
 * @type {Integer (Int32)}
 */
export global DDVPB_VIDEOPORT := 1

/**
 * @type {Integer (Int32)}
 */
export global DDVPB_OVERLAY := 2

/**
 * @type {Integer (Int32)}
 */
export global DDVPB_TYPE := 4

/**
 * @type {Integer (Int32)}
 */
export global DDVPBCAPS_SOURCE := 1

/**
 * @type {Integer (Int32)}
 */
export global DDVPBCAPS_DESTINATION := 2

/**
 * @type {Integer (Int32)}
 */
export global DDVPCREATE_VBIONLY := 1

/**
 * @type {Integer (Int32)}
 */
export global DDVPCREATE_VIDEOONLY := 2

/**
 * @type {Integer (Int32)}
 */
export global DDVPSTATUS_VBIONLY := 1

/**
 * @type {Integer (Int32)}
 */
export global DDVPSTATUS_VIDEOONLY := 2

/**
 * @type {Guid}
 */
export global GUID_DxApi := Guid("{8a79bef0-b915-11d0-9144-080036d2ef02}")

/**
 * @type {Integer (UInt32)}
 */
export global MDL_MAPPED_TO_SYSTEM_VA := 1

/**
 * @type {Integer (UInt32)}
 */
export global MDL_PAGES_LOCKED := 2

/**
 * @type {Integer (UInt32)}
 */
export global MDL_SOURCE_IS_NONPAGED_POOL := 4

/**
 * @type {Integer (UInt32)}
 */
export global MDL_ALLOCATED_FIXED_SIZE := 8

/**
 * @type {Integer (UInt32)}
 */
export global MDL_PARTIAL := 16

/**
 * @type {Integer (UInt32)}
 */
export global MDL_PARTIAL_HAS_BEEN_MAPPED := 32

/**
 * @type {Integer (UInt32)}
 */
export global MDL_IO_PAGE_READ := 64

/**
 * @type {Integer (UInt32)}
 */
export global MDL_WRITE_OPERATION := 128

/**
 * @type {Integer (UInt32)}
 */
export global MDL_PARENT_MAPPED_SYSTEM_VA := 256

/**
 * @type {Integer (UInt32)}
 */
export global MDL_LOCK_HELD := 512

/**
 * @type {Integer (UInt32)}
 */
export global MDL_SCATTER_GATHER_VA := 1024

/**
 * @type {Integer (UInt32)}
 */
export global MDL_IO_SPACE := 2048

/**
 * @type {Integer (UInt32)}
 */
export global MDL_NETWORK_HEADER := 4096

/**
 * @type {Integer (UInt32)}
 */
export global MDL_MAPPING_CAN_FAIL := 8192

/**
 * @type {Integer (UInt32)}
 */
export global MDL_ALLOCATED_MUST_SUCCEED := 16384

/**
 * @type {Integer (UInt32)}
 */
export global MDL_64_BIT_VA := 32768

/**
 * @type {Integer (UInt32)}
 */
export global DX_OK := 0

/**
 * @type {Integer (UInt32)}
 */
export global DXERR_UNSUPPORTED := 2147500033

/**
 * @type {Integer (UInt32)}
 */
export global DXERR_GENERIC := 2147500037

/**
 * @type {Integer (UInt32)}
 */
export global DXERR_OUTOFCAPS := 2289434984

/**
 * @type {Integer (Int32)}
 */
export global DDIRQ_BUSMASTER := 2

/**
 * @type {Integer (UInt32)}
 */
export global IRQINFO_HANDLED := 1

/**
 * @type {Integer (UInt32)}
 */
export global IRQINFO_NOTHANDLED := 2

/**
 * @type {Integer (UInt32)}
 */
export global DDSKIP_SKIPNEXT := 1

/**
 * @type {Integer (UInt32)}
 */
export global DDSKIP_ENABLENEXT := 2

/**
 * @type {Integer (UInt32)}
 */
export global DDTRANSFER_SYSTEMMEMORY := 1

/**
 * @type {Integer (UInt32)}
 */
export global DDTRANSFER_NONLOCALVIDMEM := 2

/**
 * @type {Integer (UInt32)}
 */
export global DDTRANSFER_INVERT := 4

/**
 * @type {Integer (UInt32)}
 */
export global DDTRANSFER_CANCEL := 128

/**
 * @type {Integer (UInt32)}
 */
export global DDTRANSFER_HALFLINES := 256

/**
 * @type {Integer (UInt32)}
 */
export global DXAPI_HALVERSION := 1
;@endregion Constants
