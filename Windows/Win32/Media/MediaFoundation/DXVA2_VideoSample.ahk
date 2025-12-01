#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DXVA2_ExtendedFormat.ahk
#Include ..\..\Foundation\RECT.ahk
#Include .\DXVA2_AYUVSample8.ahk
#Include .\DXVA2_Fixed32.ahk

/**
 * Specifies an input sample for the IDirectXVideoProcessor::VideoProcessBlt method.
 * @see https://learn.microsoft.com/windows/win32/api/dxva2api/ns-dxva2api-dxva2_videosample
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class DXVA2_VideoSample extends Win32Struct
{
    static sizeof => 200

    static packingSize => 8

    /**
     * Start time of the sample, in 100-nanosecond units. For video substream samples, the value is zero.
     * @type {Integer}
     */
    Start {
        get => NumGet(this, 0, "int64")
        set => NumPut("int64", value, this, 0)
    }

    /**
     * End time of the sample, in 100-nanosecond units. For video substream samples, the value is zero.
     * @type {Integer}
     */
    End {
        get => NumGet(this, 8, "int64")
        set => NumPut("int64", value, this, 8)
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/ns-dxva2api-dxva2_extendedformat">DXVA2_ExtendedFormat</a> structure that describes the interlacing and extended color information for the sample.
     * @type {DXVA2_ExtendedFormat}
     */
    SampleFormat{
        get {
            if(!this.HasProp("__SampleFormat"))
                this.__SampleFormat := DXVA2_ExtendedFormat(16, this)
            return this.__SampleFormat
        }
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/d3d9helper/nn-d3d9helper-idirect3dsurface9">IDirect3DSurface9</a> interface of the Direct3D surface that contains the sample.
     * @type {IDirect3DSurface9}
     */
    SrcSurface {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Source rectangle. The source rectangle defines which portion of the input sample is copied to the destination surface. The source rectangle is specified using pixel coordinates on the input surface.
     * @type {RECT}
     */
    SrcRect{
        get {
            if(!this.HasProp("__SrcRect"))
                this.__SrcRect := RECT(32, this)
            return this.__SrcRect
        }
    }

    /**
     * Destination rectangle. The destination rectangle defines the portion of the destination surface where the source rectangle is copied. The destination rectangle is specified using pixel coordinates on the destination surface.
     * @type {RECT}
     */
    DstRect{
        get {
            if(!this.HasProp("__DstRect"))
                this.__DstRect := RECT(48, this)
            return this.__DstRect
        }
    }

    /**
     * If the input sample is for a substream and uses a palettized YUV color format, this member contains an array of <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/ns-dxva2api-dxva2_ayuvsample8">DXVA2_AYUVSample8</a> structures that define the palette entries. For non-palettized pixel formats, the array elements should all be zero.
     * @type {Array<DXVA2_AYUVSample8>}
     */
    Pal{
        get {
            if(!this.HasProp("__PalProxyArray"))
                this.__PalProxyArray := Win32FixedArray(this.ptr + 64, 16, DXVA2_AYUVSample8, "")
            return this.__PalProxyArray
        }
    }

    /**
     * Alpha value that will be applied to this input sample when it is composited.
     * @type {DXVA2_Fixed32}
     */
    PlanarAlpha{
        get {
            if(!this.HasProp("__PlanarAlpha"))
                this.__PlanarAlpha := DXVA2_Fixed32(192, this)
            return this.__PlanarAlpha
        }
    }

    /**
     * Contains additional flags. The following flags are defined.
     *           
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DXVA2_SampleData_RFF"></a><a id="dxva2_sampledata_rff"></a><a id="DXVA2_SAMPLEDATA_RFF"></a><dl>
     * <dt><b>DXVA2_SampleData_RFF</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Repeat first field (RFF) bit.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DXVA2_SampleData_TFF"></a><a id="dxva2_sampledata_tff"></a><a id="DXVA2_SAMPLEDATA_TFF"></a><dl>
     * <dt><b>DXVA2_SampleData_TFF</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Top field first (TFF) bit.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DXVA2_SampleData_RFF_TFF_Present"></a><a id="dxva2_sampledata_rff_tff_present"></a><a id="DXVA2_SAMPLEDATA_RFF_TFF_PRESENT"></a><dl>
     * <dt><b>DXVA2_SampleData_RFF_TFF_Present</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If set, the RFF and TFF flags are used.
     *               
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * These flags provide a hint to the deinterlacer when it performs inverse telecine.
     * @type {Integer}
     */
    SampleData {
        get => NumGet(this, 196, "uint")
        set => NumPut("uint", value, this, 196)
    }
}
