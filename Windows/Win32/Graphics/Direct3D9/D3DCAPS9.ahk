#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3DVSHADERCAPS2_0.ahk
#Include .\D3DPSHADERCAPS2_0.ahk

/**
 * Represents the capabilities of the hardware exposed through the Direct3D object.
 * @remarks
 * 
  * The MaxTextureBlendStages and MaxSimultaneousTextures members might seem similar, but they contain different information. The MaxTextureBlendStages member contains the total number of texture-blending stages supported by the current device, and the MaxSimultaneousTextures member describes how many of those stages can have textures bound to them by using the <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nf-d3d9helper-idirect3ddevice9-settexture">SetTexture</a> method.
  * 
  * When the driver fills this structure, it can set values for execute-buffer capabilities, even when the interface being used to retrieve the capabilities (such as <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3ddevice9">IDirect3DDevice9</a>) does not support execute buffers.
  * 
  * In general, performance problems may occur if you use a texture and then modify it during a scene. Ensure that no texture used in the current <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-beginscene">BeginScene</a> and <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-endscene">EndScene</a> block is evicted unless absolutely necessary. In the case of extremely high texture usage within a scene, the results are undefined. This occurs when you modify a texture that you have used in the scene and there is no spare texture memory available. For such systems, the contents of the z-buffer become invalid at EndScene. Applications should not call <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-updatesurface">UpdateSurface</a> to or from the back buffer on this type of hardware inside a BeginScene/EndScene pair. In addition, applications should not try to access the z-buffer if the D3DPRASTERCAPS_ZBUFFERLESSHSR capability flag is set. Finally, applications should not lock the back buffer or the z-buffer inside a BeginScene/EndScene pair.
  * 
  * The following flags concerning mipmapped textures are not supported in Direct3D 9. 
  * 
  * <ul>
  * <li>D3DPTFILTERCAPS_LINEAR</li>
  * <li>D3DPTFILTERCAPS_LINEARMIPLINEAR</li>
  * <li>D3DPTFILTERCAPS_LINEARMIPNEAREST</li>
  * <li>D3DPTFILTERCAPS_MIPNEAREST</li>
  * <li>D3DPTFILTERCAPS_NEAREST</li>
  * </ul>
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d9caps/ns-d3d9caps-d3dcaps9
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class D3DCAPS9 extends Win32Struct
{
    static sizeof => 304

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3ddevtype">D3DDEVTYPE</a></b>
     * 
     * Member of the <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3ddevtype">D3DDEVTYPE</a> enumerated type, which identifies what type of resources are used for processing vertices.
     * @type {Integer}
     */
    DeviceType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Adapter on which this Direct3D device was created. This ordinal is valid only to pass to methods of the <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3d9">IDirect3D9</a> interface that created this Direct3D device. The <b>IDirect3D9</b> interface can always be retrieved by calling <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-getdirect3d">GetDirect3D</a>.
     * @type {Integer}
     */
    AdapterOrdinal {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * The following driver-specific capability.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DCAPS_READ_SCANLINE"></a><a id="d3dcaps_read_scanline"></a><dl>
     * <dt><b>D3DCAPS_READ_SCANLINE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Display hardware is capable of returning the current scan line.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DCAPS_OVERLAY"></a><a id="d3dcaps_overlay"></a><dl>
     * <dt><b>D3DCAPS_OVERLAY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The display driver supports an overlay DDI that allows for verification of overlay capabilities. For more information about the overlay DDI, see <a href="https://www.microsoft.com/?ref=go">Overlay DDI</a>.
     * 
     * 
     * <table>
     * <tr>
     * <td>
     * Differences between Direct3D 9 and Direct3D 9Ex:
     * 
     * This flag is available in Direct3D 9Ex only.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    Caps {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Driver-specific capabilities identified in <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dcaps2">D3DCAPS2</a>.
     * @type {Integer}
     */
    Caps2 {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Driver-specific capabilities identified in <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dcaps3">D3DCAPS3</a>.
     * @type {Integer}
     */
    Caps3 {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * 
     * Bit mask of values representing what presentation swap intervals are available.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DPRESENT_INTERVAL_IMMEDIATE"></a><a id="d3dpresent_interval_immediate"></a><dl>
     * <dt><b>D3DPRESENT_INTERVAL_IMMEDIATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The driver supports an immediate presentation swap interval.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DPRESENT_INTERVAL_ONE"></a><a id="d3dpresent_interval_one"></a><dl>
     * <dt><b>D3DPRESENT_INTERVAL_ONE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The driver supports a presentation swap interval of every screen refresh.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DPRESENT_INTERVAL_TWO"></a><a id="d3dpresent_interval_two"></a><dl>
     * <dt><b>D3DPRESENT_INTERVAL_TWO</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The driver supports a presentation swap interval of every second screen refresh.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DPRESENT_INTERVAL_THREE"></a><a id="d3dpresent_interval_three"></a><dl>
     * <dt><b>D3DPRESENT_INTERVAL_THREE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The driver supports a presentation swap interval of every third screen refresh.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DPRESENT_INTERVAL_FOUR"></a><a id="d3dpresent_interval_four"></a><dl>
     * <dt><b>D3DPRESENT_INTERVAL_FOUR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The driver supports a presentation swap interval of every fourth screen refresh.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    PresentationIntervals {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * 
     * Bit mask indicating what hardware support is available for cursors. Direct3D 9 does not define alpha-blending cursor capabilities.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DCURSORCAPS_COLOR"></a><a id="d3dcursorcaps_color"></a><dl>
     * <dt><b>D3DCURSORCAPS_COLOR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A full-color cursor is supported in hardware. Specifically, this flag indicates that the driver supports at least a hardware color cursor in high-resolution modes (with scan lines greater than or equal to 400).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DCURSORCAPS_LOWRES"></a><a id="d3dcursorcaps_lowres"></a><dl>
     * <dt><b>D3DCURSORCAPS_LOWRES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A full-color cursor is supported in hardware. Specifically, this flag indicates that the driver supports a hardware color cursor in both high-resolution and low-resolution modes (with scan lines less than 400).
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    CursorCaps {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * 
     * Flags identifying the capabilities of the device.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DDEVCAPS_CANBLTSYSTONONLOCAL"></a><a id="d3ddevcaps_canbltsystononlocal"></a><dl>
     * <dt><b>D3DDEVCAPS_CANBLTSYSTONONLOCAL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Device supports blits from system-memory textures to nonlocal video-memory textures.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DDEVCAPS_CANRENDERAFTERFLIP"></a><a id="d3ddevcaps_canrenderafterflip"></a><dl>
     * <dt><b>D3DDEVCAPS_CANRENDERAFTERFLIP</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Device can queue rendering commands after a page flip. Applications do not change their behavior if this flag is set; this capability means that the device is relatively fast.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DDEVCAPS_DRAWPRIMITIVES2"></a><a id="d3ddevcaps_drawprimitives2"></a><dl>
     * <dt><b>D3DDEVCAPS_DRAWPRIMITIVES2</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Device can support at least a DirectX 5-compliant driver.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DDEVCAPS_DRAWPRIMITIVES2EX"></a><a id="d3ddevcaps_drawprimitives2ex"></a><dl>
     * <dt><b>D3DDEVCAPS_DRAWPRIMITIVES2EX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Device can support at least a DirectX 7-compliant driver.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DDEVCAPS_DRAWPRIMTLVERTEX"></a><a id="d3ddevcaps_drawprimtlvertex"></a><dl>
     * <dt><b>D3DDEVCAPS_DRAWPRIMTLVERTEX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Device exports an <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-drawindexedprimitive">IDirect3DDevice9::DrawPrimitive</a>-aware hal.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DDEVCAPS_EXECUTESYSTEMMEMORY"></a><a id="d3ddevcaps_executesystemmemory"></a><dl>
     * <dt><b>D3DDEVCAPS_EXECUTESYSTEMMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Device can use execute buffers from system memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DDEVCAPS_EXECUTEVIDEOMEMORY"></a><a id="d3ddevcaps_executevideomemory"></a><dl>
     * <dt><b>D3DDEVCAPS_EXECUTEVIDEOMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Device can use execute buffers from video memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DDEVCAPS_HWRASTERIZATION"></a><a id="d3ddevcaps_hwrasterization"></a><dl>
     * <dt><b>D3DDEVCAPS_HWRASTERIZATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Device has hardware acceleration for scene rasterization.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DDEVCAPS_HWTRANSFORMANDLIGHT"></a><a id="d3ddevcaps_hwtransformandlight"></a><dl>
     * <dt><b>D3DDEVCAPS_HWTRANSFORMANDLIGHT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Device can support transformation and lighting in hardware.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DDEVCAPS_NPATCHES"></a><a id="d3ddevcaps_npatches"></a><dl>
     * <dt><b>D3DDEVCAPS_NPATCHES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Device supports N patches.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DDEVCAPS_PUREDEVICE"></a><a id="d3ddevcaps_puredevice"></a><dl>
     * <dt><b>D3DDEVCAPS_PUREDEVICE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Device can support rasterization, transform, lighting, and shading in hardware.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DDEVCAPS_QUINTICRTPATCHES"></a><a id="d3ddevcaps_quinticrtpatches"></a><dl>
     * <dt><b>D3DDEVCAPS_QUINTICRTPATCHES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Device supports quintic Bézier curves and B-splines.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DDEVCAPS_RTPATCHES"></a><a id="d3ddevcaps_rtpatches"></a><dl>
     * <dt><b>D3DDEVCAPS_RTPATCHES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Device supports rectangular and triangular patches.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DDEVCAPS_RTPATCHHANDLEZERO"></a><a id="d3ddevcaps_rtpatchhandlezero"></a><dl>
     * <dt><b>D3DDEVCAPS_RTPATCHHANDLEZERO</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * When this device capability is set, the hardware architecture does not require caching of any information, and uncached patches (handle zero) will be drawn as efficiently as cached ones. Note that setting D3DDEVCAPS_RTPATCHHANDLEZERO does not mean that a patch with handle zero can be drawn. A handle-zero patch can always be drawn whether this cap is set or not.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DDEVCAPS_SEPARATETEXTUREMEMORIES"></a><a id="d3ddevcaps_separatetexturememories"></a><dl>
     * <dt><b>D3DDEVCAPS_SEPARATETEXTUREMEMORIES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Device is texturing from separate memory pools.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DDEVCAPS_TEXTURENONLOCALVIDMEM"></a><a id="d3ddevcaps_texturenonlocalvidmem"></a><dl>
     * <dt><b>D3DDEVCAPS_TEXTURENONLOCALVIDMEM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Device can retrieve textures from non-local video memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DDEVCAPS_TEXTURESYSTEMMEMORY"></a><a id="d3ddevcaps_texturesystemmemory"></a><dl>
     * <dt><b>D3DDEVCAPS_TEXTURESYSTEMMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Device can retrieve textures from system memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DDEVCAPS_TEXTUREVIDEOMEMORY"></a><a id="d3ddevcaps_texturevideomemory"></a><dl>
     * <dt><b>D3DDEVCAPS_TEXTUREVIDEOMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Device can retrieve textures from device memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DDEVCAPS_TLVERTEXSYSTEMMEMORY"></a><a id="d3ddevcaps_tlvertexsystemmemory"></a><dl>
     * <dt><b>D3DDEVCAPS_TLVERTEXSYSTEMMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Device can use buffers from system memory for transformed and lit vertices.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DDEVCAPS_TLVERTEXVIDEOMEMORY"></a><a id="d3ddevcaps_tlvertexvideomemory"></a><dl>
     * <dt><b>D3DDEVCAPS_TLVERTEXVIDEOMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Device can use buffers from video memory for transformed and lit vertices.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    DevCaps {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Miscellaneous driver primitive capabilities. See <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dpmisccaps">D3DPMISCCAPS</a>.
     * @type {Integer}
     */
    PrimitiveMiscCaps {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * 
     * Information on raster-drawing capabilities. This member can be one or more of the following flags.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DPRASTERCAPS_ANISOTROPY"></a><a id="d3dprastercaps_anisotropy"></a><dl>
     * <dt><b>D3DPRASTERCAPS_ANISOTROPY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Device supports anisotropic filtering.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DPRASTERCAPS_COLORPERSPECTIVE"></a><a id="d3dprastercaps_colorperspective"></a><dl>
     * <dt><b>D3DPRASTERCAPS_COLORPERSPECTIVE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Device iterates colors perspective correctly.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DPRASTERCAPS_DITHER"></a><a id="d3dprastercaps_dither"></a><dl>
     * <dt><b>D3DPRASTERCAPS_DITHER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Device can dither to improve color resolution.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DPRASTERCAPS_DEPTHBIAS"></a><a id="d3dprastercaps_depthbias"></a><dl>
     * <dt><b>D3DPRASTERCAPS_DEPTHBIAS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Device supports legacy depth bias. For true depth bias, see D3DPRASTERCAPS_SLOPESCALEDEPTHBIAS.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DPRASTERCAPS_FOGRANGE"></a><a id="d3dprastercaps_fogrange"></a><dl>
     * <dt><b>D3DPRASTERCAPS_FOGRANGE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Device supports range-based fog. In range-based fog, the distance of an object from the viewer is used to compute fog effects, not the depth of the object (that is, the z-coordinate) in the scene.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DPRASTERCAPS_FOGTABLE"></a><a id="d3dprastercaps_fogtable"></a><dl>
     * <dt><b>D3DPRASTERCAPS_FOGTABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Device calculates the fog value by referring to a lookup table containing fog values that are indexed to the depth of a given pixel.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DPRASTERCAPS_FOGVERTEX"></a><a id="d3dprastercaps_fogvertex"></a><dl>
     * <dt><b>D3DPRASTERCAPS_FOGVERTEX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Device calculates the fog value during the lighting operation and interpolates the fog value during rasterization.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DPRASTERCAPS_MIPMAPLODBIAS"></a><a id="d3dprastercaps_mipmaplodbias"></a><dl>
     * <dt><b>D3DPRASTERCAPS_MIPMAPLODBIAS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Device supports level-of-detail bias adjustments. These bias adjustments enable an application to make a mipmap appear crisper or less sharp than it normally would. For more information about level-of-detail bias in mipmaps, see D3DSAMP_MIPMAPLODBIAS.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DPRASTERCAPS_MULTISAMPLE_TOGGLE"></a><a id="d3dprastercaps_multisample_toggle"></a><dl>
     * <dt><b>D3DPRASTERCAPS_MULTISAMPLE_TOGGLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Device supports toggling multisampling on and off between <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-beginscene">IDirect3DDevice9::BeginScene</a> and <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-endscene">IDirect3DDevice9::EndScene</a> (using D3DRS_MULTISAMPLEANTIALIAS).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DPRASTERCAPS_SCISSORTEST"></a><a id="d3dprastercaps_scissortest"></a><dl>
     * <dt><b>D3DPRASTERCAPS_SCISSORTEST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Device supports scissor test. See <a href="https://docs.microsoft.com/windows/desktop/direct3d9/scissor-test">Scissor Test (Direct3D 9)</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DPRASTERCAPS_SLOPESCALEDEPTHBIAS"></a><a id="d3dprastercaps_slopescaledepthbias"></a><dl>
     * <dt><b>D3DPRASTERCAPS_SLOPESCALEDEPTHBIAS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Device performs true slope-scale based depth bias. This is in contrast to the legacy style depth bias.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DPRASTERCAPS_WBUFFER"></a><a id="d3dprastercaps_wbuffer"></a><dl>
     * <dt><b>D3DPRASTERCAPS_WBUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Device supports depth buffering using w.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DPRASTERCAPS_WFOG"></a><a id="d3dprastercaps_wfog"></a><dl>
     * <dt><b>D3DPRASTERCAPS_WFOG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Device supports w-based fog. W-based fog is used when a perspective projection matrix is specified, but affine projections still use z-based fog. The system considers a projection matrix that contains a nonzero value in the [3][4] element to be a perspective projection matrix.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DPRASTERCAPS_ZBUFFERLESSHSR"></a><a id="d3dprastercaps_zbufferlesshsr"></a><dl>
     * <dt><b>D3DPRASTERCAPS_ZBUFFERLESSHSR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Device can perform hidden-surface removal (HSR) without requiring the application to sort polygons and without requiring the allocation of a depth-buffer. This leaves more video memory for textures. The method used to perform HSR is hardware-dependent and is transparent to the application.
     * 
     * Z-bufferless HSR is performed if no depth-buffer surface is associated with the rendering-target surface and the depth-buffer comparison test is enabled (that is, when the state value associated with the <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3drenderstatetype">D3DRS_ZENABLE</a> enumeration constant is set to <b>TRUE</b>).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DPRASTERCAPS_ZFOG"></a><a id="d3dprastercaps_zfog"></a><dl>
     * <dt><b>D3DPRASTERCAPS_ZFOG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Device supports z-based fog.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DPRASTERCAPS_ZTEST"></a><a id="d3dprastercaps_ztest"></a><dl>
     * <dt><b>D3DPRASTERCAPS_ZTEST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Device can perform z-test operations. This effectively renders a primitive and indicates whether any z pixels have been rendered.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    RasterCaps {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * 
     * Z-buffer comparison capabilities. This member can be one or more of the following flags.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DPCMPCAPS_ALWAYS"></a><a id="d3dpcmpcaps_always"></a><dl>
     * <dt><b>D3DPCMPCAPS_ALWAYS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Always pass the z-test.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DPCMPCAPS_EQUAL"></a><a id="d3dpcmpcaps_equal"></a><dl>
     * <dt><b>D3DPCMPCAPS_EQUAL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Pass the z-test if the new z equals the current z.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DPCMPCAPS_GREATER"></a><a id="d3dpcmpcaps_greater"></a><dl>
     * <dt><b>D3DPCMPCAPS_GREATER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Pass the z-test if the new z is greater than the current z.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DPCMPCAPS_GREATEREQUAL"></a><a id="d3dpcmpcaps_greaterequal"></a><dl>
     * <dt><b>D3DPCMPCAPS_GREATEREQUAL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Pass the z-test if the new z is greater than or equal to the current z.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DPCMPCAPS_LESS"></a><a id="d3dpcmpcaps_less"></a><dl>
     * <dt><b>D3DPCMPCAPS_LESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Pass the z-test if the new z is less than the current z.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DPCMPCAPS_LESSEQUAL"></a><a id="d3dpcmpcaps_lessequal"></a><dl>
     * <dt><b>D3DPCMPCAPS_LESSEQUAL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Pass the z-test if the new z is less than or equal to the current z.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DPCMPCAPS_NEVER"></a><a id="d3dpcmpcaps_never"></a><dl>
     * <dt><b>D3DPCMPCAPS_NEVER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Always fail the z-test.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DPCMPCAPS_NOTEQUAL"></a><a id="d3dpcmpcaps_notequal"></a><dl>
     * <dt><b>D3DPCMPCAPS_NOTEQUAL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Pass the z-test if the new z does not equal the current z.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    ZCmpCaps {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * 
     * Source-blending capabilities. This member can be one or more of the following flags. (The RGBA values of the source and destination are indicated by the subscripts s and d.)
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DPBLENDCAPS_BLENDFACTOR"></a><a id="d3dpblendcaps_blendfactor"></a><dl>
     * <dt><b>D3DPBLENDCAPS_BLENDFACTOR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The driver supports both D3DBLEND_BLENDFACTOR and D3DBLEND_INVBLENDFACTOR. See <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dblend">D3DBLEND</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DPBLENDCAPS_BOTHINVSRCALPHA"></a><a id="d3dpblendcaps_bothinvsrcalpha"></a><dl>
     * <dt><b>D3DPBLENDCAPS_BOTHINVSRCALPHA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Source blend factor is (1 - Aₛ, 1 - Aₛ, 1 - Aₛ, 1 - Aₛ) and destination blend factor is (Aₛ, Aₛ, Aₛ, Aₛ); the destination blend selection is overridden.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DPBLENDCAPS_BOTHSRCALPHA"></a><a id="d3dpblendcaps_bothsrcalpha"></a><dl>
     * <dt><b>D3DPBLENDCAPS_BOTHSRCALPHA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The driver supports the D3DBLEND_BOTHSRCALPHA blend mode. (This blend mode is obsolete. For more information, see D3DBLEND.)
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DPBLENDCAPS_DESTALPHA"></a><a id="d3dpblendcaps_destalpha"></a><dl>
     * <dt><b>D3DPBLENDCAPS_DESTALPHA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Blend factor is (A<sub>d</sub>, A<sub>d</sub>, A<sub>d</sub>, A<sub>d</sub>).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DPBLENDCAPS_DESTCOLOR"></a><a id="d3dpblendcaps_destcolor"></a><dl>
     * <dt><b>D3DPBLENDCAPS_DESTCOLOR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Blend factor is (R<sub>d</sub>, G<sub>d</sub>, B<sub>d</sub>, A<sub>d</sub>).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DPBLENDCAPS_INVDESTALPHA"></a><a id="d3dpblendcaps_invdestalpha"></a><dl>
     * <dt><b>D3DPBLENDCAPS_INVDESTALPHA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Blend factor is (1 - A<sub>d</sub>, 1 - A<sub>d</sub>, 1 - A<sub>d</sub>, 1 - A<sub>d</sub>).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DPBLENDCAPS_INVDESTCOLOR"></a><a id="d3dpblendcaps_invdestcolor"></a><dl>
     * <dt><b>D3DPBLENDCAPS_INVDESTCOLOR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Blend factor is (1 - R<sub>d</sub>, 1 - G<sub>d</sub>, 1 - B<sub>d</sub>, 1 - A<sub>d</sub>).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DPBLENDCAPS_INVSRCALPHA"></a><a id="d3dpblendcaps_invsrcalpha"></a><dl>
     * <dt><b>D3DPBLENDCAPS_INVSRCALPHA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Blend factor is (1 - Aₛ, 1 - Aₛ, 1 - Aₛ, 1 - Aₛ).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DPBLENDCAPS_INVSRCCOLOR"></a><a id="d3dpblendcaps_invsrccolor"></a><dl>
     * <dt><b>D3DPBLENDCAPS_INVSRCCOLOR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Blend factor is (1 - Rₛ, 1 - Gₛ, 1 - Bₛ, 1 - Aₛ).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DPBLENDCAPS_INVSRCCOLOR2"></a><a id="d3dpblendcaps_invsrccolor2"></a><dl>
     * <dt><b>D3DPBLENDCAPS_INVSRCCOLOR2</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Blend factor is (1 - PSOutColor[1]<sub>r</sub>, 1 - PSOutColor[1]<sub>g</sub>, 1 - PSOutColor[1]<sub>b</sub>, not used)). See <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dblend">Render Target Blending</a>.
     * 
     * 
     * <table>
     * <tr>
     * <td>
     * Differences between Direct3D 9 and Direct3D 9Ex:
     * 
     * This flag is available in Direct3D 9Ex only.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DPBLENDCAPS_ONE"></a><a id="d3dpblendcaps_one"></a><dl>
     * <dt><b>D3DPBLENDCAPS_ONE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Blend factor is (1, 1, 1, 1).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DPBLENDCAPS_SRCALPHA"></a><a id="d3dpblendcaps_srcalpha"></a><dl>
     * <dt><b>D3DPBLENDCAPS_SRCALPHA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Blend factor is (Aₛ, Aₛ, Aₛ, Aₛ).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DPBLENDCAPS_SRCALPHASAT"></a><a id="d3dpblendcaps_srcalphasat"></a><dl>
     * <dt><b>D3DPBLENDCAPS_SRCALPHASAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Blend factor is (f, f, f, 1); f = min(Aₛ, 1 - A<sub>d</sub>).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DPBLENDCAPS_SRCCOLOR"></a><a id="d3dpblendcaps_srccolor"></a><dl>
     * <dt><b>D3DPBLENDCAPS_SRCCOLOR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Blend factor is (Rₛ, Gₛ, Bₛ, Aₛ).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DPBLENDCAPS_SRCCOLOR2"></a><a id="d3dpblendcaps_srccolor2"></a><dl>
     * <dt><b>D3DPBLENDCAPS_SRCCOLOR2</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Blend factor is (PSOutColor[1]<sub>r</sub>, PSOutColor[1]<sub>g</sub>, PSOutColor[1]<sub>b</sub>, not used). See <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dblend">Render Target Blending</a>.
     * 
     * 
     * <table>
     * <tr>
     * <td>
     * Differences between Direct3D 9 and Direct3D 9Ex:
     * 
     * This flag is available in Direct3D 9Ex only.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DPBLENDCAPS_ZERO"></a><a id="d3dpblendcaps_zero"></a><dl>
     * <dt><b>D3DPBLENDCAPS_ZERO</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Blend factor is (0, 0, 0, 0).
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    SrcBlendCaps {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Destination-blending capabilities. This member can be the same capabilities that are defined for the SrcBlendCaps member.
     * @type {Integer}
     */
    DestBlendCaps {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Alpha-test comparison capabilities. This member can include the same capability flags defined for the ZCmpCaps member. If this member contains only the D3DPCMPCAPS_ALWAYS capability or only the D3DPCMPCAPS_NEVER capability, the driver does not support alpha tests. Otherwise, the flags identify the individual comparisons that are supported for alpha testing.
     * @type {Integer}
     */
    AlphaCmpCaps {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Shading operations capabilities. It is assumed, in general, that if a device supports a given command at all, it supports the D3DSHADE_FLAT mode (as specified in the <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dshademode">D3DSHADEMODE</a> enumerated type). This flag specifies whether the driver can also support Gouraud shading and whether alpha color components are supported. When alpha components are not supported, the alpha value of colors generated is implicitly 255. This is the maximum possible alpha (that is, the alpha component is at full intensity). 
     * 
     * The color, specular highlights, fog, and alpha interpolants of a triangle each have capability flags that an application can use to find out how they are implemented by the device driver.
     * 
     * 
     * This member can be one or more of the following flags.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DPSHADECAPS_ALPHAGOURAUDBLEND"></a><a id="d3dpshadecaps_alphagouraudblend"></a><dl>
     * <dt><b>D3DPSHADECAPS_ALPHAGOURAUDBLEND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Device can support an alpha component for Gouraud-blended transparency (the D3DSHADE_GOURAUD state for the D3DSHADEMODE enumerated type). In this mode, the alpha color component of a primitive is provided at vertices and interpolated across a face along with the other color components.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DPSHADECAPS_COLORGOURAUDRGB"></a><a id="d3dpshadecaps_colorgouraudrgb"></a><dl>
     * <dt><b>D3DPSHADECAPS_COLORGOURAUDRGB</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Device can support colored Gouraud shading. In this mode, the per-vertex color components (red, green, and blue) are interpolated across a triangle face.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DPSHADECAPS_FOGGOURAUD"></a><a id="d3dpshadecaps_foggouraud"></a><dl>
     * <dt><b>D3DPSHADECAPS_FOGGOURAUD</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Device can support fog in the Gouraud shading mode.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DPSHADECAPS_SPECULARGOURAUDRGB"></a><a id="d3dpshadecaps_speculargouraudrgb"></a><dl>
     * <dt><b>D3DPSHADECAPS_SPECULARGOURAUDRGB</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Device supports Gouraud shading of specular highlights.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    ShadeCaps {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * 
     * Miscellaneous texture-mapping capabilities. This member can be one or more of the following flags.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DPTEXTURECAPS_ALPHA"></a><a id="d3dptexturecaps_alpha"></a><dl>
     * <dt><b>D3DPTEXTURECAPS_ALPHA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Alpha in texture pixels is supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DPTEXTURECAPS_ALPHAPALETTE"></a><a id="d3dptexturecaps_alphapalette"></a><dl>
     * <dt><b>D3DPTEXTURECAPS_ALPHAPALETTE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Device can draw alpha from texture palettes.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DPTEXTURECAPS_CUBEMAP"></a><a id="d3dptexturecaps_cubemap"></a><dl>
     * <dt><b>D3DPTEXTURECAPS_CUBEMAP</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Supports cube textures.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DPTEXTURECAPS_CUBEMAP_POW2"></a><a id="d3dptexturecaps_cubemap_pow2"></a><dl>
     * <dt><b>D3DPTEXTURECAPS_CUBEMAP_POW2</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Device requires that cube texture maps have dimensions specified as powers of two.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DPTEXTURECAPS_MIPCUBEMAP"></a><a id="d3dptexturecaps_mipcubemap"></a><dl>
     * <dt><b>D3DPTEXTURECAPS_MIPCUBEMAP</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Device supports mipmapped cube textures.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DPTEXTURECAPS_MIPMAP"></a><a id="d3dptexturecaps_mipmap"></a><dl>
     * <dt><b>D3DPTEXTURECAPS_MIPMAP</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Device supports mipmapped textures.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DPTEXTURECAPS_MIPVOLUMEMAP"></a><a id="d3dptexturecaps_mipvolumemap"></a><dl>
     * <dt><b>D3DPTEXTURECAPS_MIPVOLUMEMAP</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Device supports mipmapped volume textures.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DPTEXTURECAPS_NONPOW2CONDITIONAL"></a><a id="d3dptexturecaps_nonpow2conditional"></a><dl>
     * <dt><b>D3DPTEXTURECAPS_NONPOW2CONDITIONAL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * D3DPTEXTURECAPS_POW2 is also set, conditionally supports the use of 2D textures with dimensions that are not powers of two. A device that exposes this capability can use such a texture if all of the following requirements are met.
     * 
     * 
     * <ul>
     * <li>The texture addressing mode for the texture stage is set to D3DTADDRESS_CLAMP.</li>
     * <li>Texture wrapping for the texture stage is disabled (<a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3drenderstatetype">D3DRS_WRAP</a> n set to 0).</li>
     * <li>Mipmapping is not in use (use magnification filter only).</li>
     * <li>Texture formats must not be <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dformat">D3DFMT_DXT1</a> through D3DFMT_DXT5.</li>
     * </ul>
     * 
     * 
     * If this flag is not set, and D3DPTEXTURECAPS_POW2 is also not set, then unconditional support is provided for 2D textures with dimensions that are not powers of two.
     * 
     * A texture that is not a power of two cannot be set at a stage that will be read based on a shader computation (such as the <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/bem---ps">bem - ps</a> and <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/texm3x3---ps">texm3x3 - ps</a> instructions in pixel shaders versions 1_0 to 1_3). For example, these textures can be used to store bumps that will be fed into texture reads, but not the environment maps that are used in <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/texbem---ps">texbem - ps</a>, <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/texbeml---ps">texbeml - ps</a>, and <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/texm3x3spec---ps">texm3x3spec - ps</a>. This means that a texture with dimensions that are not powers of two cannot be addressed or sampled using texture coordinates computed within the shader. This type of operation is known as a dependent read and cannot be performed on these types of textures.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DPTEXTURECAPS_NOPROJECTEDBUMPENV"></a><a id="d3dptexturecaps_noprojectedbumpenv"></a><dl>
     * <dt><b>D3DPTEXTURECAPS_NOPROJECTEDBUMPENV</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Device does not support a projected bump-environment loopkup operation in programmable and fixed function shaders.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DPTEXTURECAPS_PERSPECTIVE"></a><a id="d3dptexturecaps_perspective"></a><dl>
     * <dt><b>D3DPTEXTURECAPS_PERSPECTIVE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Perspective correction texturing is supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DPTEXTURECAPS_POW2"></a><a id="d3dptexturecaps_pow2"></a><dl>
     * <dt><b>D3DPTEXTURECAPS_POW2</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If D3DPTEXTURECAPS_NONPOW2CONDITIONAL is not set, all textures must have widths and heights specified as powers of two. This requirement does not apply to either cube textures or volume textures.
     * 
     * If D3DPTEXTURECAPS_NONPOW2CONDITIONAL is also set, conditionally supports the use of 2D textures with dimensions that are not powers of two. See D3DPTEXTURECAPS_NONPOW2CONDITIONAL description.
     * 
     * If this flag is not set, and D3DPTEXTURECAPS_NONPOW2CONDITIONAL is also not set, then unconditional support is provided for 2D textures with dimensions that are not powers of two.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DPTEXTURECAPS_PROJECTED"></a><a id="d3dptexturecaps_projected"></a><dl>
     * <dt><b>D3DPTEXTURECAPS_PROJECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Supports the D3DTTFF_PROJECTED texture transformation flag. When applied, the device divides transformed texture coordinates by the last texture coordinate. If this capability is present, then the projective divide occurs per pixel. If this capability is not present, but the projective divide needs to occur anyway, then it is performed on a per-vertex basis by the Direct3D runtime.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DPTEXTURECAPS_SQUAREONLY"></a><a id="d3dptexturecaps_squareonly"></a><dl>
     * <dt><b>D3DPTEXTURECAPS_SQUAREONLY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * All textures must be square.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DPTEXTURECAPS_TEXREPEATNOTSCALEDBYSIZE"></a><a id="d3dptexturecaps_texrepeatnotscaledbysize"></a><dl>
     * <dt><b>D3DPTEXTURECAPS_TEXREPEATNOTSCALEDBYSIZE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Texture indices are not scaled by the texture size prior to interpolation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DPTEXTURECAPS_VOLUMEMAP"></a><a id="d3dptexturecaps_volumemap"></a><dl>
     * <dt><b>D3DPTEXTURECAPS_VOLUMEMAP</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Device supports volume textures.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DPTEXTURECAPS_VOLUMEMAP_POW2"></a><a id="d3dptexturecaps_volumemap_pow2"></a><dl>
     * <dt><b>D3DPTEXTURECAPS_VOLUMEMAP_POW2</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Device requires that volume texture maps have dimensions specified as powers of two.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    TextureCaps {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Texture-filtering capabilities for a texture. Per-stage filtering capabilities reflect which filtering modes are supported for texture stages when performing multiple-texture blending. This member can be any combination of the per-stage texture-filtering flags defined in <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dptfiltercaps">D3DPTFILTERCAPS</a>.
     * @type {Integer}
     */
    TextureFilterCaps {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Texture-filtering capabilities for a cube texture. Per-stage filtering capabilities reflect which filtering modes are supported for texture stages when performing multiple-texture blending. This member can be any combination of the per-stage texture-filtering flags defined in <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dptfiltercaps">D3DPTFILTERCAPS</a>.
     * @type {Integer}
     */
    CubeTextureFilterCaps {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Texture-filtering capabilities for a volume texture. Per-stage filtering capabilities reflect which filtering modes are supported for texture stages when performing multiple-texture blending. This member can be any combination of the per-stage texture-filtering flags defined in <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dptfiltercaps">D3DPTFILTERCAPS</a>.
     * @type {Integer}
     */
    VolumeTextureFilterCaps {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * 
     * Texture-addressing capabilities for texture objects. This member can be one or more of the following flags.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DPTADDRESSCAPS_BORDER"></a><a id="d3dptaddresscaps_border"></a><dl>
     * <dt><b>D3DPTADDRESSCAPS_BORDER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Device supports setting coordinates outside the range [0.0, 1.0] to the border color, as specified by the D3DSAMP_BORDERCOLOR texture-stage state.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DPTADDRESSCAPS_CLAMP"></a><a id="d3dptaddresscaps_clamp"></a><dl>
     * <dt><b>D3DPTADDRESSCAPS_CLAMP</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Device can clamp textures to addresses.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DPTADDRESSCAPS_INDEPENDENTUV"></a><a id="d3dptaddresscaps_independentuv"></a><dl>
     * <dt><b>D3DPTADDRESSCAPS_INDEPENDENTUV</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Device can separate the texture-addressing modes of the u and v coordinates of the texture. This ability corresponds to the D3DSAMP_ADDRESSU and D3DSAMP_ADDRESSV render-state values.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DPTADDRESSCAPS_MIRROR"></a><a id="d3dptaddresscaps_mirror"></a><dl>
     * <dt><b>D3DPTADDRESSCAPS_MIRROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Device can mirror textures to addresses.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DPTADDRESSCAPS_MIRRORONCE"></a><a id="d3dptaddresscaps_mirroronce"></a><dl>
     * <dt><b>D3DPTADDRESSCAPS_MIRRORONCE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Device can take the absolute value of the texture coordinate (thus, mirroring around 0) and then clamp to the maximum value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DPTADDRESSCAPS_WRAP"></a><a id="d3dptaddresscaps_wrap"></a><dl>
     * <dt><b>D3DPTADDRESSCAPS_WRAP</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Device can wrap textures to addresses.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    TextureAddressCaps {
        get => NumGet(this, 76, "uint")
        set => NumPut("uint", value, this, 76)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Texture-addressing capabilities for a volume texture. This member can be one or more of the flags defined for the TextureAddressCaps member.
     * @type {Integer}
     */
    VolumeTextureAddressCaps {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * 
     * Defines the capabilities for line-drawing primitives.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DLINECAPS_ALPHACMP"></a><a id="d3dlinecaps_alphacmp"></a><dl>
     * <dt><b>D3DLINECAPS_ALPHACMP</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Supports alpha-test comparisons.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DLINECAPS_ANTIALIAS"></a><a id="d3dlinecaps_antialias"></a><dl>
     * <dt><b>D3DLINECAPS_ANTIALIAS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Antialiased lines are supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DLINECAPS_BLEND"></a><a id="d3dlinecaps_blend"></a><dl>
     * <dt><b>D3DLINECAPS_BLEND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Supports source-blending.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DLINECAPS_FOG"></a><a id="d3dlinecaps_fog"></a><dl>
     * <dt><b>D3DLINECAPS_FOG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Supports fog.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DLINECAPS_TEXTURE"></a><a id="d3dlinecaps_texture"></a><dl>
     * <dt><b>D3DLINECAPS_TEXTURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Supports texture-mapping.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DLINECAPS_ZTEST"></a><a id="d3dlinecaps_ztest"></a><dl>
     * <dt><b>D3DLINECAPS_ZTEST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Supports z-buffer comparisons.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    LineCaps {
        get => NumGet(this, 84, "uint")
        set => NumPut("uint", value, this, 84)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Maximum texture width for this device.
     * @type {Integer}
     */
    MaxTextureWidth {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Maximum texture height for this device.
     * @type {Integer}
     */
    MaxTextureHeight {
        get => NumGet(this, 92, "uint")
        set => NumPut("uint", value, this, 92)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Maximum value for any of the three dimensions (width, height, and depth) of a volume texture.
     * @type {Integer}
     */
    MaxVolumeExtent {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * This number represents the maximum range of the integer bits of the post-normalized texture coordinates. A texture coordinate is stored as a 32-bit signed integer using 27 bits to store the integer part and 5 bits for the floating point fraction. The maximum integer index, 2²⁷, is used to determine the maximum texture coordinate, depending on how the hardware does texture-coordinate scaling.
     * 
     * Some hardware reports the cap D3DPTEXTURECAPS_TEXREPEATNOTSCALEDBYSIZE. For this case, the device defers scaling texture coordinates by the texture size until after interpolation and application of the texture address mode, so the number of times a texture can be wrapped is given by the integer value in MaxTextureRepeat.
     * 
     * Less desirably, on some hardware D3DPTEXTURECAPS_TEXREPEATNOTSCALEDBYSIZE is not set and the device scales the texture coordinates by the texture size (using the highest level of detail) prior to interpolation. This limits the number of times a texture can be wrapped to MaxTextureRepeat / texture size.
     * 
     * For example, assume that MaxTextureRepeat is equal to 32k and the size of the texture is 4k. If the hardware sets D3DPTEXTURECAPS_TEXREPEATNOTSCALEDBYSIZE, then the number of times a texture can be wrapped is equal to MaxTextureRepeat, which is 32k in this example. Otherwise, the number of times a texture can be wrapped is equal to MaxTextureRepeat divided by texture size, which is 32k/4k in this example.
     * @type {Integer}
     */
    MaxTextureRepeat {
        get => NumGet(this, 100, "uint")
        set => NumPut("uint", value, this, 100)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Maximum texture aspect ratio supported by the hardware, typically a power of 2.
     * @type {Integer}
     */
    MaxTextureAspectRatio {
        get => NumGet(this, 104, "uint")
        set => NumPut("uint", value, this, 104)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Maximum valid value for the D3DSAMP_MAXANISOTROPY texture-stage state.
     * @type {Integer}
     */
    MaxAnisotropy {
        get => NumGet(this, 108, "uint")
        set => NumPut("uint", value, this, 108)
    }

    /**
     * Type: <b>float</b>
     * 
     * Maximum W-based depth value that the device supports.
     * @type {Float}
     */
    MaxVertexW {
        get => NumGet(this, 112, "float")
        set => NumPut("float", value, this, 112)
    }

    /**
     * Type: <b>float</b>
     * 
     * Screen-space coordinate of the guard-band clipping region. Coordinates inside this rectangle but outside the viewport rectangle are automatically clipped.
     * @type {Float}
     */
    GuardBandLeft {
        get => NumGet(this, 116, "float")
        set => NumPut("float", value, this, 116)
    }

    /**
     * Type: <b>float</b>
     * 
     * Screen-space coordinate of the guard-band clipping region. Coordinates inside this rectangle but outside the viewport rectangle are automatically clipped.
     * @type {Float}
     */
    GuardBandTop {
        get => NumGet(this, 120, "float")
        set => NumPut("float", value, this, 120)
    }

    /**
     * Type: <b>float</b>
     * 
     * Screen-space coordinate of the guard-band clipping region. Coordinates inside this rectangle but outside the viewport rectangle are automatically clipped.
     * @type {Float}
     */
    GuardBandRight {
        get => NumGet(this, 124, "float")
        set => NumPut("float", value, this, 124)
    }

    /**
     * Type: <b>float</b>
     * 
     * Screen-space coordinate of the guard-band clipping region. Coordinates inside this rectangle but outside the viewport rectangle are automatically clipped.
     * @type {Float}
     */
    GuardBandBottom {
        get => NumGet(this, 128, "float")
        set => NumPut("float", value, this, 128)
    }

    /**
     * Type: <b>float</b>
     * 
     * Number of pixels to adjust the extents rectangle outward to accommodate antialiasing kernels.
     * @type {Float}
     */
    ExtentsAdjust {
        get => NumGet(this, 132, "float")
        set => NumPut("float", value, this, 132)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Flags specifying supported stencil-buffer operations. Stencil operations are assumed to be valid for all three stencil-buffer operation render states (D3DRS_STENCILFAIL, D3DRS_STENCILPASS, and D3DRS_STENCILZFAIL).
     * 
     * For more information, see <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dstencilcaps">D3DSTENCILCAPS</a>.
     * @type {Integer}
     */
    StencilCaps {
        get => NumGet(this, 136, "uint")
        set => NumPut("uint", value, this, 136)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * 
     * Flexible vertex format capabilities.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DFVFCAPS_DONOTSTRIPELEMENTS"></a><a id="d3dfvfcaps_donotstripelements"></a><dl>
     * <dt><b>D3DFVFCAPS_DONOTSTRIPELEMENTS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * It is preferable that vertex elements not be stripped. That is, if the vertex format contains elements that are not used with the current render states, there is no need to regenerate the vertices. If this capability flag is not present, stripping extraneous elements from the vertex format provides better performance.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DFVFCAPS_PSIZE"></a><a id="d3dfvfcaps_psize"></a><dl>
     * <dt><b>D3DFVFCAPS_PSIZE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Point size is determined by either the render state or the vertex data. If an FVF is used, point size can come from point size data in the vertex declaration. Otherwise, point size is determined by the render state D3DRS_POINTSIZE. If the application provides point size in both (the render state and the vertex declaration), the vertex data overrides the render-state data.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DFVFCAPS_TEXCOORDCOUNTMASK"></a><a id="d3dfvfcaps_texcoordcountmask"></a><dl>
     * <dt><b>D3DFVFCAPS_TEXCOORDCOUNTMASK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Masks the low WORD of FVFCaps. These bits, cast to the WORD data type, describe the total number of texture coordinate sets that the device can simultaneously use for multiple texture blending. (You can use up to eight texture coordinate sets for any vertex, but the device can blend using only the specified number of texture coordinate sets.)
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    FVFCaps {
        get => NumGet(this, 140, "uint")
        set => NumPut("uint", value, this, 140)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * 
     * Combination of flags describing the texture operations supported by this device. The following flags are defined.
     * 
     * 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DTEXOPCAPS_ADD"></a><a id="d3dtexopcaps_add"></a><dl>
     * <dt><b>D3DTEXOPCAPS_ADD</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The D3DTOP_ADD texture-blending operation is supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DTEXOPCAPS_ADDSIGNED"></a><a id="d3dtexopcaps_addsigned"></a><dl>
     * <dt><b>D3DTEXOPCAPS_ADDSIGNED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The D3DTOP_ADDSIGNED texture-blending operation is supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DTEXOPCAPS_ADDSIGNED2X"></a><a id="d3dtexopcaps_addsigned2x"></a><dl>
     * <dt><b>D3DTEXOPCAPS_ADDSIGNED2X</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The D3DTOP_ADDSIGNED2X texture-blending operation is supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DTEXOPCAPS_ADDSMOOTH"></a><a id="d3dtexopcaps_addsmooth"></a><dl>
     * <dt><b>D3DTEXOPCAPS_ADDSMOOTH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The D3DTOP_ADDSMOOTH texture-blending operation is supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DTEXOPCAPS_BLENDCURRENTALPHA"></a><a id="d3dtexopcaps_blendcurrentalpha"></a><dl>
     * <dt><b>D3DTEXOPCAPS_BLENDCURRENTALPHA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The D3DTOP_BLENDCURRENTALPHA texture-blending operation is supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DTEXOPCAPS_BLENDDIFFUSEALPHA"></a><a id="d3dtexopcaps_blenddiffusealpha"></a><dl>
     * <dt><b>D3DTEXOPCAPS_BLENDDIFFUSEALPHA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The D3DTOP_BLENDDIFFUSEALPHA texture-blending operation is supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DTEXOPCAPS_BLENDFACTORALPHA"></a><a id="d3dtexopcaps_blendfactoralpha"></a><dl>
     * <dt><b>D3DTEXOPCAPS_BLENDFACTORALPHA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The D3DTOP_BLENDFACTORALPHA texture-blending operation is supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DTEXOPCAPS_BLENDTEXTUREALPHA"></a><a id="d3dtexopcaps_blendtexturealpha"></a><dl>
     * <dt><b>D3DTEXOPCAPS_BLENDTEXTUREALPHA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The D3DTOP_BLENDTEXTUREALPHA texture-blending operation is supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DTEXOPCAPS_BLENDTEXTUREALPHAPM"></a><a id="d3dtexopcaps_blendtexturealphapm"></a><dl>
     * <dt><b>D3DTEXOPCAPS_BLENDTEXTUREALPHAPM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The D3DTOP_BLENDTEXTUREALPHAPM texture-blending operation is supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DTEXOPCAPS_BUMPENVMAP"></a><a id="d3dtexopcaps_bumpenvmap"></a><dl>
     * <dt><b>D3DTEXOPCAPS_BUMPENVMAP</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The D3DTOP_BUMPENVMAP texture-blending operation is supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DTEXOPCAPS_BUMPENVMAPLUMINANCE"></a><a id="d3dtexopcaps_bumpenvmapluminance"></a><dl>
     * <dt><b>D3DTEXOPCAPS_BUMPENVMAPLUMINANCE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The D3DTOP_BUMPENVMAPLUMINANCE texture-blending operation is supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DTEXOPCAPS_DISABLE"></a><a id="d3dtexopcaps_disable"></a><dl>
     * <dt><b>D3DTEXOPCAPS_DISABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The D3DTOP_DISABLE texture-blending operation is supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DTEXOPCAPS_DOTPRODUCT3"></a><a id="d3dtexopcaps_dotproduct3"></a><dl>
     * <dt><b>D3DTEXOPCAPS_DOTPRODUCT3</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The D3DTOP_DOTPRODUCT3 texture-blending operation is supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DTEXOPCAPS_LERP"></a><a id="d3dtexopcaps_lerp"></a><dl>
     * <dt><b>D3DTEXOPCAPS_LERP</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The D3DTOP_LERP texture-blending operation is supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DTEXOPCAPS_MODULATE"></a><a id="d3dtexopcaps_modulate"></a><dl>
     * <dt><b>D3DTEXOPCAPS_MODULATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The D3DTOP_MODULATE texture-blending operation is supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DTEXOPCAPS_MODULATE2X"></a><a id="d3dtexopcaps_modulate2x"></a><dl>
     * <dt><b>D3DTEXOPCAPS_MODULATE2X</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The D3DTOP_MODULATE2X texture-blending operation is supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DTEXOPCAPS_MODULATE4X"></a><a id="d3dtexopcaps_modulate4x"></a><dl>
     * <dt><b>D3DTEXOPCAPS_MODULATE4X</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The D3DTOP_MODULATE4X texture-blending operation is supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DTEXOPCAPS_MODULATEALPHA_ADDCOLOR"></a><a id="d3dtexopcaps_modulatealpha_addcolor"></a><dl>
     * <dt><b>D3DTEXOPCAPS_MODULATEALPHA_ADDCOLOR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The D3DTOP_MODULATEALPHA_ADDCOLOR texture-blending operation is supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DTEXOPCAPS_MODULATECOLOR_ADDALPHA"></a><a id="d3dtexopcaps_modulatecolor_addalpha"></a><dl>
     * <dt><b>D3DTEXOPCAPS_MODULATECOLOR_ADDALPHA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The D3DTOP_MODULATECOLOR_ADDALPHA texture-blending operation is supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DTEXOPCAPS_MODULATEINVALPHA_ADDCOLOR"></a><a id="d3dtexopcaps_modulateinvalpha_addcolor"></a><dl>
     * <dt><b>D3DTEXOPCAPS_MODULATEINVALPHA_ADDCOLOR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The D3DTOP_MODULATEINVALPHA_ADDCOLOR texture-blending operation is supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DTEXOPCAPS_MODULATEINVCOLOR_ADDALPHA"></a><a id="d3dtexopcaps_modulateinvcolor_addalpha"></a><dl>
     * <dt><b>D3DTEXOPCAPS_MODULATEINVCOLOR_ADDALPHA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The D3DTOP_MODULATEINVCOLOR_ADDALPHA texture-blending operation is supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DTEXOPCAPS_MULTIPLYADD"></a><a id="d3dtexopcaps_multiplyadd"></a><dl>
     * <dt><b>D3DTEXOPCAPS_MULTIPLYADD</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The D3DTOP_MULTIPLYADD texture-blending operation is supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DTEXOPCAPS_PREMODULATE"></a><a id="d3dtexopcaps_premodulate"></a><dl>
     * <dt><b>D3DTEXOPCAPS_PREMODULATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The D3DTOP_PREMODULATE texture-blending operation is supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DTEXOPCAPS_SELECTARG1"></a><a id="d3dtexopcaps_selectarg1"></a><dl>
     * <dt><b>D3DTEXOPCAPS_SELECTARG1</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The D3DTOP_SELECTARG1 texture-blending operation is supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DTEXOPCAPS_SELECTARG2"></a><a id="d3dtexopcaps_selectarg2"></a><dl>
     * <dt><b>D3DTEXOPCAPS_SELECTARG2</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The D3DTOP_SELECTARG2 texture-blending operation is supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="D3DTEXOPCAPS_SUBTRACT"></a><a id="d3dtexopcaps_subtract"></a><dl>
     * <dt><b>D3DTEXOPCAPS_SUBTRACT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The D3DTOP_SUBTRACT texture-blending operation is supported.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    TextureOpCaps {
        get => NumGet(this, 144, "uint")
        set => NumPut("uint", value, this, 144)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Maximum number of texture-blending stages supported in the fixed function pipeline. This value is the number of blenders available. In the programmable pixel pipeline, this corresponds to the number of unique texture registers used by pixel shader instructions.
     * @type {Integer}
     */
    MaxTextureBlendStages {
        get => NumGet(this, 148, "uint")
        set => NumPut("uint", value, this, 148)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Maximum number of textures that can be simultaneously bound to the fixed-function pipeline sampler stages. If the same texture is bound to two sampler stages, it counts as two textures. 
     * 
     * This value has no meaning in the programmable pipeline where the number of sampler stages is determined by each pixel shader version. Each pixel shader version also determines the number of texture declaration instructions. See <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/dx9-graphics-reference-asm-ps">Pixel Shaders</a>.
     * @type {Integer}
     */
    MaxSimultaneousTextures {
        get => NumGet(this, 152, "uint")
        set => NumPut("uint", value, this, 152)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Vertex processing capabilities. For a given physical device, this capability might vary across Direct3D devices depending on the parameters supplied to <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3d9-createdevice">CreateDevice</a>. See <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dvtxpcaps">D3DVTXPCAPS</a>.
     * @type {Integer}
     */
    VertexProcessingCaps {
        get => NumGet(this, 156, "uint")
        set => NumPut("uint", value, this, 156)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Maximum number of lights that can be active simultaneously. For a given physical device, this capability might vary across Direct3D devices depending on the parameters supplied to <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3d9-createdevice">CreateDevice</a>.
     * @type {Integer}
     */
    MaxActiveLights {
        get => NumGet(this, 160, "uint")
        set => NumPut("uint", value, this, 160)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Maximum number of user-defined clipping planes supported. This member can be 0. For a given physical device, this capability may vary across Direct3D devices depending on the parameters supplied to <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3d9-createdevice">CreateDevice</a>.
     * @type {Integer}
     */
    MaxUserClipPlanes {
        get => NumGet(this, 164, "uint")
        set => NumPut("uint", value, this, 164)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Maximum number of matrices that this device can apply when performing multimatrix vertex blending. For a given physical device, this capability may vary across Direct3D devices depending on the parameters supplied to <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3d9-createdevice">CreateDevice</a>.
     * @type {Integer}
     */
    MaxVertexBlendMatrices {
        get => NumGet(this, 168, "uint")
        set => NumPut("uint", value, this, 168)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * DWORD value that specifies the maximum matrix index that can be indexed into using the per-vertex indices. The number of matrices is MaxVertexBlendMatrixIndex + 1, which is the size of the matrix palette. If normals are present in the vertex data that needs to be blended for lighting, then the number of matrices is half the number specified by this capability flag. If MaxVertexBlendMatrixIndex is set to zero, the driver does not support indexed vertex blending. If this value is not zero then the valid range of indices is zero through MaxVertexBlendMatrixIndex. 
     * 
     * A zero value for MaxVertexBlendMatrixIndex indicates that the driver does not support indexed matrices.
     * 
     * When software vertex processing is used, 256 matrices could be used for indexed vertex blending, with or without normal blending.
     * 
     * For a given physical device, this capability may vary across Direct3D devices depending on the parameters supplied to <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3d9-createdevice">CreateDevice</a>.
     * @type {Integer}
     */
    MaxVertexBlendMatrixIndex {
        get => NumGet(this, 172, "uint")
        set => NumPut("uint", value, this, 172)
    }

    /**
     * Type: <b>float</b>
     * 
     * Maximum size of a point primitive. If set to 1.0f then device does not support point size control. The range is greater than or equal to 1.0f.
     * @type {Float}
     */
    MaxPointSize {
        get => NumGet(this, 176, "float")
        set => NumPut("float", value, this, 176)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Maximum number of primitives for each <a href="https://docs.microsoft.com/windows/desktop/api/d3d9/nf-d3d9-idirect3ddevice9-drawprimitive">DrawPrimitive</a> call. There are two cases:
     * 
     * 
     * <ul>
     * <li>If MaxPrimitiveCount is not equal to 0xffff, you can draw at most MaxPrimitiveCount primitives with each draw call.</li>
     * <li>However, if MaxPrimitiveCount equals 0xffff, you can still draw at most MaxPrimitiveCount primitive, but you may also use no more than MaxPrimitiveCount unique vertices (since each primitive can potentially use three different vertices).</li>
     * </ul>
     * @type {Integer}
     */
    MaxPrimitiveCount {
        get => NumGet(this, 180, "uint")
        set => NumPut("uint", value, this, 180)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Maximum size of indices supported for hardware vertex processing. It is possible to create 32-bit index buffers; however, you will not be able to render with the index buffer unless this value is greater than 0x0000FFFF.
     * @type {Integer}
     */
    MaxVertexIndex {
        get => NumGet(this, 184, "uint")
        set => NumPut("uint", value, this, 184)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Maximum number of concurrent data streams for <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nf-d3d9helper-idirect3ddevice9-setstreamsource">SetStreamSource</a>. The valid range is 1 to 16. Note that if this value is 0, then the driver is not a Direct3D 9 driver.
     * @type {Integer}
     */
    MaxStreams {
        get => NumGet(this, 188, "uint")
        set => NumPut("uint", value, this, 188)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Maximum stride for <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nf-d3d9helper-idirect3ddevice9-setstreamsource">SetStreamSource</a>.
     * @type {Integer}
     */
    MaxStreamStride {
        get => NumGet(this, 192, "uint")
        set => NumPut("uint", value, this, 192)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Two numbers that represent the vertex shader main and sub versions. For more information about the instructions supported for each vertex shader version, see <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/dx9-graphics-reference-asm-vs-instructions-vs-1-1">Version 1_x</a>, <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/dx9-graphics-reference-asm-vs-instructions-vs-2-0">Version 2_0</a>, <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/dx9-graphics-reference-asm-vs-instructions-vs-2-x">Version 2_0 Extended</a>, or <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/dx9-graphics-reference-asm-vs-instructions-vs-3-0">Version 3_0</a>.
     * @type {Integer}
     */
    VertexShaderVersion {
        get => NumGet(this, 196, "uint")
        set => NumPut("uint", value, this, 196)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * The number of vertex shader <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/dx9-graphics-reference-asm-vs-registers">Vertex Shader Registers</a> that are reserved for constants.
     * @type {Integer}
     */
    MaxVertexShaderConst {
        get => NumGet(this, 200, "uint")
        set => NumPut("uint", value, this, 200)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Two numbers that represent the pixel shader main and sub versions. For more information about the instructions supported for each pixel shader version, see <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/dx9-graphics-reference-asm-ps-instructions-ps-1-x">Version 1_x</a>, <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/dx9-graphics-reference-asm-ps-instructions-ps-2-0">Version 2_0</a>, <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/dx9-graphics-reference-asm-ps-instructions-ps-2-x">Version 2_0 Extended</a>, or <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/dx9-graphics-reference-asm-ps-instructions-ps-3-0">Version 3_0</a>.
     * @type {Integer}
     */
    PixelShaderVersion {
        get => NumGet(this, 204, "uint")
        set => NumPut("uint", value, this, 204)
    }

    /**
     * Type: <b>float</b>
     * 
     * Maximum value of pixel shader arithmetic component. This value indicates the internal range of values supported for pixel color blending operations. Within the range that they report to, implementations must allow data to pass through pixel processing unmodified (unclamped). Normally, the value of this member is an absolute value. For example, a 1.0 indicates that the range is -1.0 to 1, and an 8.0 indicates that the range is -8.0 to 8.0. The value must be &gt;= 1.0 for any hardware that supports pixel shaders.
     * @type {Float}
     */
    PixelShader1xMaxValue {
        get => NumGet(this, 208, "float")
        set => NumPut("float", value, this, 208)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Device driver capabilities for adaptive tessellation. For more information, see <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3ddevcaps2">D3DDEVCAPS2</a>
     * @type {Integer}
     */
    DevCaps2 {
        get => NumGet(this, 212, "uint")
        set => NumPut("uint", value, this, 212)
    }

    /**
     * TBD
     * @type {Float}
     */
    MaxNpatchTessellationLevel {
        get => NumGet(this, 216, "float")
        set => NumPut("float", value, this, 216)
    }

    /**
     * TBD
     * @type {Integer}
     */
    Reserved5 {
        get => NumGet(this, 220, "uint")
        set => NumPut("uint", value, this, 220)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * This number indicates which device is the master for this subordinate. This number is taken from the same space as the adapter values.
     * 
     * For multihead support, one head will be denoted the master head, and all other heads on the same card will be denoted subordinate heads. If more than one multihead adapter is present in a system, the master and its subordinates from one multihead adapter are called a group.
     * @type {Integer}
     */
    MasterAdapterOrdinal {
        get => NumGet(this, 224, "uint")
        set => NumPut("uint", value, this, 224)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * This number indicates the order in which heads are referenced by the API. The value for the master adapter is always 0. These values do not correspond to the adapter ordinals. They apply only to heads within a group.
     * @type {Integer}
     */
    AdapterOrdinalInGroup {
        get => NumGet(this, 228, "uint")
        set => NumPut("uint", value, this, 228)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of adapters in this adapter group (only if master). This will be 1 for conventional adapters. The value will be greater than 1 for the master adapter of a  multihead card. The value will be 0 for a subordinate adapter of a multihead card. Each card can have at most one master, but may have many subordinates.
     * @type {Integer}
     */
    NumberOfAdaptersInGroup {
        get => NumGet(this, 232, "uint")
        set => NumPut("uint", value, this, 232)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * A combination of one or more data types contained in a vertex declaration. See <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3ddtcaps">D3DDTCAPS</a>.
     * @type {Integer}
     */
    DeclTypes {
        get => NumGet(this, 236, "uint")
        set => NumPut("uint", value, this, 236)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Number of simultaneous render targets. This number must be at least one.
     * @type {Integer}
     */
    NumSimultaneousRTs {
        get => NumGet(this, 240, "uint")
        set => NumPut("uint", value, this, 240)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Combination of constants that describe the operations supported by <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nf-d3d9helper-idirect3ddevice9-stretchrect">StretchRect</a>. The flags that may be set in this field are:
     * 
     * <table>
     * <tr>
     * <th>Constant</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>D3DPTFILTERCAPS_MINFPOINT</td>
     * <td>Device supports point-sample filtering for minifying rectangles.  This filter type is requested by calling <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nf-d3d9helper-idirect3ddevice9-stretchrect">StretchRect</a> using D3DTEXF_POINT.</td>
     * </tr>
     * <tr>
     * <td>D3DPTFILTERCAPS_MAGFPOINT</td>
     * <td>Device supports point-sample filtering for magnifying rectangles.  This filter type is requested by calling <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nf-d3d9helper-idirect3ddevice9-stretchrect">StretchRect</a> using D3DTEXF_POINT.</td>
     * </tr>
     * <tr>
     * <td>D3DPTFILTERCAPS_MINFLINEAR</td>
     * <td>Device supports bilinear interpolation filtering for minifying rectangles.  This filter type is requested by calling <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nf-d3d9helper-idirect3ddevice9-stretchrect">StretchRect</a> using D3DTEXF_LINEAR.</td>
     * </tr>
     * <tr>
     * <td>D3DPTFILTERCAPS_MAGFLINEAR</td>
     * <td>Device supports bilinear interpolation filtering for magnifying rectangles.  This filter type is requested by calling <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nf-d3d9helper-idirect3ddevice9-stretchrect">StretchRect</a> using D3DTEXF_LINEAR.</td>
     * </tr>
     * </table>
     *  
     * 
     * For more information, see <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dtexturefiltertype">D3DTEXTUREFILTERTYPE</a> and <b>D3DTEXTUREFILTERTYPE</b>.
     * @type {Integer}
     */
    StretchRectFilterCaps {
        get => NumGet(this, 244, "uint")
        set => NumPut("uint", value, this, 244)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d9caps/ns-d3d9caps-d3dvshadercaps2_0">D3DVSHADERCAPS2_0</a></b>
     * 
     * Device supports vertex shader version 2_0 extended capability. See <a href="https://docs.microsoft.com/windows/desktop/api/d3d9caps/ns-d3d9caps-d3dvshadercaps2_0">D3DVSHADERCAPS2_0</a>.
     * @type {D3DVSHADERCAPS2_0}
     */
    VS20Caps{
        get {
            if(!this.HasProp("__VS20Caps"))
                this.__VS20Caps := D3DVSHADERCAPS2_0(248, this)
            return this.__VS20Caps
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d9caps/ns-d3d9caps-d3dpshadercaps2_0">D3DPSHADERCAPS2_0</a></b>
     * 
     * Device supports pixel shader version 2_0 extended capability. See <a href="https://docs.microsoft.com/windows/desktop/api/d3d9caps/ns-d3d9caps-d3dpshadercaps2_0">D3DPSHADERCAPS2_0</a>.
     * @type {D3DPSHADERCAPS2_0}
     */
    PS20Caps{
        get {
            if(!this.HasProp("__PS20Caps"))
                this.__PS20Caps := D3DPSHADERCAPS2_0(264, this)
            return this.__PS20Caps
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Device supports vertex shader texture filter capability. See <a href="https://docs.microsoft.com/windows/desktop/direct3d9/d3dptfiltercaps">D3DPTFILTERCAPS</a>.
     * @type {Integer}
     */
    VertexTextureFilterCaps {
        get => NumGet(this, 284, "uint")
        set => NumPut("uint", value, this, 284)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Maximum number of vertex shader instructions that can be run when using flow control. The maximum number of instructions that can be programmed is MaxVertexShader30InstructionSlots.
     * @type {Integer}
     */
    MaxVShaderInstructionsExecuted {
        get => NumGet(this, 288, "uint")
        set => NumPut("uint", value, this, 288)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Maximum number of pixel shader instructions that can be run when using flow control. The maximum number of instructions that can be programmed is MaxPixelShader30InstructionSlots.
     * @type {Integer}
     */
    MaxPShaderInstructionsExecuted {
        get => NumGet(this, 292, "uint")
        set => NumPut("uint", value, this, 292)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Maximum number of vertex shader instruction slots supported. The maximum value that can be set on this cap is 32768. Devices that support vs_3_0 are required to support at least 512 instruction slots.
     * @type {Integer}
     */
    MaxVertexShader30InstructionSlots {
        get => NumGet(this, 296, "uint")
        set => NumPut("uint", value, this, 296)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Maximum number of pixel shader instruction slots supported. The maximum value that can be set on this cap is 32768. Devices that support ps_3_0 are required to support at least 512 instruction slots.
     * @type {Integer}
     */
    MaxPixelShader30InstructionSlots {
        get => NumGet(this, 300, "uint")
        set => NumPut("uint", value, this, 300)
    }
}
