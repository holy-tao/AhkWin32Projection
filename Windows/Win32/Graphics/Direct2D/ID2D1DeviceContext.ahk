#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID2D1Bitmap1.ahk
#Include .\ID2D1ColorContext.ahk
#Include .\ID2D1Effect.ahk
#Include .\ID2D1GradientStopCollection1.ahk
#Include .\ID2D1ImageBrush.ahk
#Include .\ID2D1BitmapBrush1.ahk
#Include .\ID2D1CommandList.ahk
#Include Common\D2D_RECT_F.ahk
#Include .\ID2D1RenderTarget.ahk

/**
 * Represents a set of state and command buffers that are used to render to a target.
 * @remarks
 * 
 *  Any resource created from a device context can be shared with any other resource created from a device context when both contexts are created on the same device.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d2d1_1/nn-d2d1_1-id2d1devicecontext
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class ID2D1DeviceContext extends ID2D1RenderTarget{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID2D1DeviceContext
     * @type {Guid}
     */
    static IID => Guid("{e8f7fe7a-191c-466d-ad95-975678bda998}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 57

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateBitmap", "CreateBitmapFromWicBitmap", "CreateColorContext", "CreateColorContextFromFilename", "CreateColorContextFromWicColorContext", "CreateBitmapFromDxgiSurface", "CreateEffect", "CreateGradientStopCollection", "CreateImageBrush", "CreateBitmapBrush", "CreateCommandList", "IsDxgiFormatSupported", "IsBufferPrecisionSupported", "GetImageLocalBounds", "GetImageWorldBounds", "GetGlyphRunWorldBounds", "GetDevice", "SetTarget", "GetTarget", "SetRenderingControls", "GetRenderingControls", "SetPrimitiveBlend", "GetPrimitiveBlend", "SetUnitMode", "GetUnitMode", "DrawGlyphRun", "DrawImage", "DrawGdiMetafile", "DrawBitmap", "PushLayer", "InvalidateEffectInputRectangle", "GetEffectInvalidRectangleCount", "GetEffectInvalidRectangles", "GetEffectRequiredInputRectangles", "FillOpacityMask"]

    /**
     * 
     * @param {D2D_SIZE_U} size 
     * @param {Pointer<Void>} sourceData 
     * @param {Integer} pitch 
     * @param {Pointer<D2D1_BITMAP_PROPERTIES1>} bitmapProperties 
     * @returns {ID2D1Bitmap1} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1devicecontext-createbitmap(d2d1_size_u_constvoid_uint32_constd2d1_bitmap_properties1_id2d1bitmap1)
     */
    CreateBitmap(size, sourceData, pitch, bitmapProperties) {
        sourceDataMarshal := sourceData is VarRef ? "ptr" : "ptr"

        result := ComCall(57, this, "ptr", size, sourceDataMarshal, sourceData, "uint", pitch, "ptr", bitmapProperties, "ptr*", &bitmap := 0, "HRESULT")
        return ID2D1Bitmap1(bitmap)
    }

    /**
     * 
     * @param {IWICBitmapSource} wicBitmapSource 
     * @param {Pointer<D2D1_BITMAP_PROPERTIES1>} bitmapProperties 
     * @returns {ID2D1Bitmap1} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1devicecontext-createbitmapfromwicbitmap(iwicbitmapsource_id2d1bitmap1)
     */
    CreateBitmapFromWicBitmap(wicBitmapSource, bitmapProperties) {
        result := ComCall(58, this, "ptr", wicBitmapSource, "ptr", bitmapProperties, "ptr*", &bitmap := 0, "HRESULT")
        return ID2D1Bitmap1(bitmap)
    }

    /**
     * Creates a color context.
     * @param {Integer} space Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/ne-d2d1_1-d2d1_color_space">D2D1_COLOR_SPACE</a></b>
     * 
     * The space  of color context to create.
     * @param {Pointer<Integer>} profile Type: <b>const BYTE*</b>
     * 
     * A buffer containing the ICC profile bytes used to initialize the color context when <i>space</i> is <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/ne-d2d1_1-d2d1_color_space">D2D1_COLOR_SPACE_CUSTOM</a>.  For other types, the parameter is ignored and should be set to <b>NULL</b>.
     * @param {Integer} profileSize Type: <b>UINT32</b>
     * 
     * The size in bytes of <i>Profile</i>.
     * @returns {ID2D1ColorContext} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nn-d2d1_1-id2d1colorcontext">ID2D1ColorContext</a>**</b>
     * 
     * When this method returns, contains the address of a pointer to a new color context object.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_1/nf-d2d1_1-id2d1devicecontext-createcolorcontext
     */
    CreateColorContext(space, profile, profileSize) {
        profileMarshal := profile is VarRef ? "char*" : "ptr"

        result := ComCall(59, this, "int", space, profileMarshal, profile, "uint", profileSize, "ptr*", &colorContext := 0, "HRESULT")
        return ID2D1ColorContext(colorContext)
    }

    /**
     * Creates a color context by loading it from the specified filename. The profile bytes are the contents of the file specified by Filename.
     * @param {PWSTR} filename Type: <b>PCWSTR</b>
     * 
     * The path to the file containing the profile bytes to initialize the color context with.
     * @returns {ID2D1ColorContext} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nn-d2d1_1-id2d1colorcontext">ID2D1ColorContext</a>**</b>
     * 
     * When this method returns, contains the address of a pointer to a new color context.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_1/nf-d2d1_1-id2d1devicecontext-createcolorcontextfromfilename
     */
    CreateColorContextFromFilename(filename) {
        filename := filename is String ? StrPtr(filename) : filename

        result := ComCall(60, this, "ptr", filename, "ptr*", &colorContext := 0, "HRESULT")
        return ID2D1ColorContext(colorContext)
    }

    /**
     * Creates a color context from an IWICColorContext. The D2D1ColorContext space of the resulting context varies, see Remarks for more info.
     * @param {IWICColorContext} wicColorContext Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwiccolorcontext">IWICColorContext</a>*</b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwiccolorcontext">IWICColorContext</a> used to initialize the color context.
     * @returns {ID2D1ColorContext} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nn-d2d1_1-id2d1colorcontext">ID2D1ColorContext</a>**</b>
     * 
     * When this method returns, contains the address of a pointer to a new color context.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_1/nf-d2d1_1-id2d1devicecontext-createcolorcontextfromwiccolorcontext
     */
    CreateColorContextFromWicColorContext(wicColorContext) {
        result := ComCall(61, this, "ptr", wicColorContext, "ptr*", &colorContext := 0, "HRESULT")
        return ID2D1ColorContext(colorContext)
    }

    /**
     * 
     * @param {IDXGISurface} surface 
     * @param {Pointer<D2D1_BITMAP_PROPERTIES1>} bitmapProperties 
     * @returns {ID2D1Bitmap1} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1devicecontext-createbitmapfromdxgisurface(idxgisurface_constd2d1_bitmap_properties1_id2d1bitmap1)
     */
    CreateBitmapFromDxgiSurface(surface, bitmapProperties) {
        result := ComCall(62, this, "ptr", surface, "ptr", bitmapProperties, "ptr*", &bitmap := 0, "HRESULT")
        return ID2D1Bitmap1(bitmap)
    }

    /**
     * Creates an effect for the specified class ID.
     * @param {Pointer<Guid>} effectId Type: <b>REFCLSID</b>
     * 
     * The class ID of the effect to create. See <a href="https://docs.microsoft.com/windows/desktop/Direct2D/built-in-effects">Built-in Effects</a> for a list of effect IDs.
     * @returns {ID2D1Effect} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nn-d2d1_1-id2d1effect">ID2D1Effect</a>**</b>
     * 
     * When this method returns, contains the address of a pointer to a new effect.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_1/nf-d2d1_1-id2d1devicecontext-createeffect
     */
    CreateEffect(effectId) {
        result := ComCall(63, this, "ptr", effectId, "ptr*", &effect := 0, "HRESULT")
        return ID2D1Effect(effect)
    }

    /**
     * Creates a gradient stop collection, enabling the gradient to contain color channels with values outside of [0,1] and also enabling rendering to a high-color render target with interpolation in sRGB space.
     * @param {Pointer<D2D1_GRADIENT_STOP>} straightAlphaGradientStops Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d2d1/ns-d2d1-d2d1_gradient_stop">D2D1_GRADIENT_STOP</a>*</b>
     * 
     * An array of color values and offsets.
     * @param {Integer} straightAlphaGradientStopsCount Type: <b>UINT</b>
     * 
     * The number of elements in the <i>gradientStops</i> array.
     * @param {Integer} preInterpolationSpace Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/ne-d2d1_1-d2d1_color_space">D2D1_COLOR_SPACE</a></b>
     * 
     * Specifies both the input color space and the space in which the color interpolation occurs.
     * @param {Integer} postInterpolationSpace Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/ne-d2d1_1-d2d1_color_space">D2D1_COLOR_SPACE</a></b>
     * 
     * The color space that colors will be converted to after interpolation occurs.
     * @param {Integer} bufferPrecision Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/ne-d2d1_1-d2d1_buffer_precision">D2D1_BUFFER_PRECISION</a></b>
     * 
     * The precision of the texture used to hold interpolated values.
     * 
     * <div class="alert"><b>Note</b>  This method will fail if the underlying Direct3D device does not support the requested buffer precision.  Use <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nf-d2d1_1-id2d1devicecontext-isbufferprecisionsupported">ID2D1DeviceContext::IsBufferPrecisionSupported</a> to determine what is supported.
     * </div>
     * <div> </div>
     * @param {Integer} extendMode Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1/ne-d2d1-d2d1_extend_mode">D2D1_EXTEND_MODE</a></b>
     * 
     * Defines how colors outside of the range defined by the stop collection are determined.
     * @param {Integer} colorInterpolationMode Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/ne-d2d1_1-d2d1_color_interpolation_mode">D2D1_COLOR_INTERPOLATION_MODE</a></b>
     * 
     * Defines how colors are interpolated.  D2D1_COLOR_INTERPOLATION_MODE_PREMULTIPLIED is the default, see Remarks for more info.
     * @returns {ID2D1GradientStopCollection1} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nn-d2d1_1-id2d1gradientstopcollection1">ID2D1GradientStopCollection1</a>**</b>
     * 
     * The new gradient stop collection.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_1/nf-d2d1_1-id2d1devicecontext-creategradientstopcollection
     */
    CreateGradientStopCollection(straightAlphaGradientStops, straightAlphaGradientStopsCount, preInterpolationSpace, postInterpolationSpace, bufferPrecision, extendMode, colorInterpolationMode) {
        result := ComCall(64, this, "ptr", straightAlphaGradientStops, "uint", straightAlphaGradientStopsCount, "int", preInterpolationSpace, "int", postInterpolationSpace, "int", bufferPrecision, "int", extendMode, "int", colorInterpolationMode, "ptr*", &gradientStopCollection1 := 0, "HRESULT")
        return ID2D1GradientStopCollection1(gradientStopCollection1)
    }

    /**
     * 
     * @param {ID2D1Image} image 
     * @param {Pointer<D2D1_IMAGE_BRUSH_PROPERTIES>} imageBrushProperties 
     * @param {Pointer<D2D1_BRUSH_PROPERTIES>} brushProperties 
     * @returns {ID2D1ImageBrush} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1devicecontext-createimagebrush(id2d1image_constd2d1_image_brush_properties__id2d1imagebrush)
     */
    CreateImageBrush(image, imageBrushProperties, brushProperties) {
        result := ComCall(65, this, "ptr", image, "ptr", imageBrushProperties, "ptr", brushProperties, "ptr*", &imageBrush := 0, "HRESULT")
        return ID2D1ImageBrush(imageBrush)
    }

    /**
     * 
     * @param {ID2D1Bitmap} bitmap 
     * @param {Pointer<D2D1_BITMAP_BRUSH_PROPERTIES1>} bitmapBrushProperties 
     * @param {Pointer<D2D1_BRUSH_PROPERTIES>} brushProperties 
     * @returns {ID2D1BitmapBrush1} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1devicecontext-createbitmapbrush(id2d1bitmap_constd2d1_bitmap_brush_properties1__constd2d1_brush_properties__id2d1bitmapbrush1)
     */
    CreateBitmapBrush(bitmap, bitmapBrushProperties, brushProperties) {
        result := ComCall(66, this, "ptr", bitmap, "ptr", bitmapBrushProperties, "ptr", brushProperties, "ptr*", &bitmapBrush := 0, "HRESULT")
        return ID2D1BitmapBrush1(bitmapBrush)
    }

    /**
     * Creates a ID2D1CommandList object.
     * @returns {ID2D1CommandList} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nn-d2d1_1-id2d1commandlist">ID2D1CommandList</a>**</b>
     * 
     * When this method returns, contains the address of a pointer to a command list.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_1/nf-d2d1_1-id2d1devicecontext-createcommandlist
     */
    CreateCommandList() {
        result := ComCall(67, this, "ptr*", &commandList := 0, "HRESULT")
        return ID2D1CommandList(commandList)
    }

    /**
     * Indicates whether the format is supported by the device context.
     * @param {Integer} format Type: <b>format</b>
     * 
     * The DXGI format to check.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * Returns TRUE if the format is supported.  Returns FALSE if the format is not supported.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_1/nf-d2d1_1-id2d1devicecontext-isdxgiformatsupported
     */
    IsDxgiFormatSupported(format) {
        result := ComCall(68, this, "int", format, "int")
        return result
    }

    /**
     * Indicates whether the buffer precision is supported by the underlying Direct3D device.
     * @param {Integer} bufferPrecision Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/ne-d2d1_1-d2d1_buffer_precision">D2D1_BUFFER_PRECISION</a></b>
     * 
     * The buffer precision to check.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * Returns TRUE if the buffer precision is supported.  Returns FALSE if the buffer precision is not supported.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_1/nf-d2d1_1-id2d1devicecontext-isbufferprecisionsupported
     */
    IsBufferPrecisionSupported(bufferPrecision) {
        result := ComCall(69, this, "int", bufferPrecision, "int")
        return result
    }

    /**
     * Gets the bounds of an image without the world transform of the context applied.
     * @param {ID2D1Image} image Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1/nn-d2d1-id2d1image">ID2D1Image</a>*</b>
     * 
     * The image whose bounds will be calculated.
     * @returns {D2D_RECT_F} Type: <b><a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-rect-f">D2D1_RECT_F</a>[1]</b>
     * 
     * When this method returns, contains a pointer to the bounds of the image in device independent pixels (DIPs) and in local space.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_1/nf-d2d1_1-id2d1devicecontext-getimagelocalbounds
     */
    GetImageLocalBounds(image) {
        localBounds := D2D_RECT_F()
        result := ComCall(70, this, "ptr", image, "ptr", localBounds, "HRESULT")
        return localBounds
    }

    /**
     * Gets the bounds of an image with the world transform of the context applied.
     * @param {ID2D1Image} image Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1/nn-d2d1-id2d1image">ID2D1Image</a>*</b>
     * 
     * The image whose bounds will be calculated.
     * @returns {D2D_RECT_F} Type: <b><a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-rect-f">D2D1_RECT_F</a>[1]</b>
     * 
     * When this method returns, contains a pointer to the bounds of the image in device independent pixels (DIPs).
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_1/nf-d2d1_1-id2d1devicecontext-getimageworldbounds
     */
    GetImageWorldBounds(image) {
        worldBounds := D2D_RECT_F()
        result := ComCall(71, this, "ptr", image, "ptr", worldBounds, "HRESULT")
        return worldBounds
    }

    /**
     * Gets the world-space bounds in DIPs of the glyph run using the device context DPI.
     * @param {D2D_POINT_2F} baselineOrigin Type: <b><a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-point-2f">D2D1_POINT_2F</a></b>
     * 
     * The origin of the baseline for the glyph run.
     * @param {Pointer<DWRITE_GLYPH_RUN>} glyphRun Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/dwrite/ns-dwrite-dwrite_glyph_run">DWRITE_GLYPH_RUN</a>*</b>
     * 
     * The glyph run to render.
     * @param {Integer} measuringMode Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcommon/ne-dcommon-dwrite_measuring_mode">DWRITE_MEASURING_MODE</a></b>
     * 
     * The DirectWrite measuring mode that indicates how glyph metrics are used to measure text when it is formatted.
     * @returns {D2D_RECT_F} Type: <b><a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-rect-f">D2D1_RECT_F</a>*</b>
     * 
     * The bounds of the glyph run in DIPs and in world space.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_1/nf-d2d1_1-id2d1devicecontext-getglyphrunworldbounds
     */
    GetGlyphRunWorldBounds(baselineOrigin, glyphRun, measuringMode) {
        bounds := D2D_RECT_F()
        result := ComCall(72, this, "ptr", baselineOrigin, "ptr", glyphRun, "int", measuringMode, "ptr", bounds, "HRESULT")
        return bounds
    }

    /**
     * Gets the device associated with a device context.
     * @remarks
     * 
     * The application can retrieve the device even if it is created from an earlier render target code-path. The application must use an <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nn-d2d1_1-id2d1devicecontext">ID2D1DeviceContext</a> interface and then call <b>GetDevice</b>. Some functionality for controlling all of the resources for a set of device contexts is maintained only on an <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nn-d2d1_1-id2d1device">ID2D1Device</a> object.
     * 
     * 
     * @param {Pointer<ID2D1Device>} device Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nn-d2d1_1-id2d1device">ID2D1Device</a>**</b>
     * 
     * When this method returns, contains the address of a pointer to a Direct2D device associated with this device context.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_1/nf-d2d1_1-id2d1devicecontext-getdevice
     */
    GetDevice(device) {
        ComCall(73, this, "ptr*", device)
    }

    /**
     * The bitmap or command list to which the Direct2D device context will now render.
     * @remarks
     * 
     * The target can be changed at any time, including while the context is drawing.
     * 
     * The target can be either a bitmap created with the <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/ne-d2d1_1-d2d1_bitmap_options">D2D1_BITMAP_OPTIONS_TARGET</a> flag, or it can be a command list. Other kinds of images cannot be set as a target. For example, you cannot set the output of an effect as target. If the target is not valid the context will enter the <b>D2DERR_INVALID_TARGET </b>error state.
     * 
     * You cannot  use <b>SetTarget</b> to render to a bitmap/command list from multiple device contexts simultaneously. An image is considered “being rendered to” if it has ever been set on a device context within a <a href="https://docs.microsoft.com/windows/desktop/api/d2d1/nf-d2d1-id2d1rendertarget-begindraw">BeginDraw</a>/<a href="https://docs.microsoft.com/windows/desktop/api/d2d1/nf-d2d1-id2d1rendertarget-enddraw">EndDraw</a> timespan. If an attempt is made to render to an image through multiple device contexts, all subsequent device contexts after the first will enter an error state.
     * 
     * 
     * 
     * Callers wishing to attach an image to a second device context should first call <a href="https://docs.microsoft.com/windows/desktop/api/d2d1/nf-d2d1-id2d1rendertarget-enddraw">EndDraw</a> on the first device context.
     * 
     * 
     * Here is an example of the correct calling order.
     * 
     * 
     * ```cpp
     * pDC1->BeginDraw();
     * pDC1->SetTarget(pImage);
     * // …
     * pDC1->EndDraw();
     * 
     * pDC2->BeginDraw();
     * pDC2->SetTarget(pImage);
     * // …
     * pDC2->EndDraw();
     * 
     * ```
     * 
     * 
     * Here is an example of the incorrect calling order.
     * 
     * 
     * ```cpp
     * pDC1->BeginDraw();
     * pDC2->BeginDraw();
     * 
     * pDC1->SetTarget(pImage);
     * 
     * // ...
     * 
     * pDC1->SetTarget(NULL);
     * 
     * pDC2->SetTarget(pImage); // This call is invalid, even though pImage is no longer set on pDC1.
     * 
     * // ...
     * 
     * pDC1->EndDraw(); // This EndDraw SUCCEEDs.
     * pDC2->EndDraw(); // This EndDraw FAILs
     * 
     * 
     * ```
     * 
     * 
     * <div class="alert"><b>Note</b>  Changing the target does not change the bitmap that an HWND render target presents from, nor does it change the bitmap that a DC render target blts to/from.</div>
     * <div> </div>
     * This API makes it easy for an application to use a bitmap as a source (like in <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nf-d2d1_1-id2d1commandsink-drawbitmap">DrawBitmap</a>) and as a destination at the same time.  Attempting to use a bitmap as a source on the same device context to which it is bound as a target will put the device context into the D2DERR_BITMAP_BOUND_AS_TARGET error state.
     * 
     * It is acceptable to have a bitmap bound as a target bitmap on multiple render targets at once.  Applications that do this must properly synchronize rendering with <a href="https://docs.microsoft.com/windows/desktop/api/d2d1/nf-d2d1-id2d1rendertarget-flush">Flush</a> or <a href="https://docs.microsoft.com/windows/desktop/api/d2d1/nf-d2d1-id2d1rendertarget-enddraw">EndDraw</a>.
     * 
     * You can change the target at any time, including while the context is drawing.
     * 
     * You can set the target to NULL, in which case drawing calls will put the device context into an error state with D2DERR_WRONG_STATE.  Calling <b>SetTarget</b> with a NULL target does not restore the original target bitmap to the device context.
     * 
     * If the device context has an outstanding HDC, the context will enter the <b>D2DERR_WRONG_STATE</b> error state.  The target will not be changed.
     * 
     * If the bitmap and the device context are not in the same resource domain, the context will enter <b>\\</b> error state.  The target will not be changed.
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d2d1/nf-d2d1-id2d1rendertarget-getpixelsize">ID2D1RenderTarget::GetPixelSize</a> returns the size of the current target bitmap (or 0, 0) if there is no bitmap bound).
     * <a href="https://docs.microsoft.com/windows/desktop/api/d2d1/nf-d2d1-id2d1rendertarget-getsize">ID2D1RenderTarget::GetSize</a> returns the pixel size of the current bitmap scaled by the DPI of the render target.
     * <b>SetTarget</b> does not affect the DPI of the render target.
     * 
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d2d1/nf-d2d1-id2d1rendertarget-getpixelformat">ID2D1RenderTarget::GetPixelFormat</a> returns the pixel format of the current target bitmap (or <a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT_UNKNOWN</a>, <a href="https://docs.microsoft.com/windows/desktop/api/dcommon/ne-dcommon-d2d1_alpha_mode">D2D1_ALPHA_MODE_UNKNOWN</a> if there is none).
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d2d1/nf-d2d1-id2d1bitmap-copyfromrendertarget">ID2D1Bitmap::CopyFromRenderTarget</a> copies from the currently bound target bitmap.
     * 
     * 
     * @param {ID2D1Image} image Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1/nn-d2d1-id2d1image">ID2D1Image</a>*</b>
     * 
     * The surface or command list to which the Direct2D device context will render.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_1/nf-d2d1_1-id2d1devicecontext-settarget
     */
    SetTarget(image) {
        ComCall(74, this, "ptr", image)
    }

    /**
     * Gets the target currently associated with the device context.
     * @remarks
     * 
     * If a target is not associated with the device context, <i>target</i> will contain <b>NULL</b> when the methods returns.
     * 
     * If the currently selected target is a bitmap rather than a command list, the application can gain access to the initial bitmaps created by using one of the following methods:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1factory-createhwndrendertarget(constd2d1_render_target_properties_constd2d1_hwnd_render_target_properties_id2d1hwndrendertarget)">CreateHwndRenderTarget</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1factory-createdxgisurfacerendertarget(idxgisurface_constd2d1_render_target_properties_id2d1rendertarget)">CreateDxgiSurfaceRenderTarget</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/Direct2D/id2d1factory-createwicbitmaprendertarget">CreateWicBitmapRenderTarget</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/d2d1/nf-d2d1-id2d1factory-createdcrendertarget">CreateDCRenderTarget</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/win32/direct2d/id2d1rendertarget-createcompatiblerendertarget">CreateCompatibleRenderTarget</a>
     * </li>
     * </ul>
     * It is not possible for an application to destroy these bitmaps.  All of these bitmaps are bindable as bitmap targets.  However not all of these bitmaps can be used as bitmap sources for  <a href="https://docs.microsoft.com/windows/desktop/api/d2d1/nn-d2d1-id2d1rendertarget">ID2D1RenderTarget</a> methods.
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1factory-createdxgisurfacerendertarget(idxgisurface_constd2d1_render_target_properties_id2d1rendertarget)">CreateDxgiSurfaceRenderTarget</a> will create a bitmap that is usable as a bitmap source if the DXGI surface is bindable as a shader resource view.
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/win32/direct2d/id2d1rendertarget-createcompatiblerendertarget">CreateCompatibleRenderTarget</a> will always create bitmaps that are usable as a bitmap source.
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/d2d1/nf-d2d1-id2d1rendertarget-begindraw">ID2D1RenderTarget::BeginDraw</a> will copy from the HDC to the original bitmap associated with it.  <a href="https://docs.microsoft.com/windows/desktop/api/d2d1/nf-d2d1-id2d1rendertarget-enddraw">ID2D1RenderTarget::EndDraw</a> will copy from the original bitmap to the HDC.  
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmap">IWICBitmap</a> objects will be locked in the following circumstances:
     * 
     * <ul>
     * <li>BeginDraw has been called and the currently selected target bitmap is a WIC bitmap.</li>
     * <li>A WIC bitmap is set as the target of a device context after BeginDraw has been called and before EndDraw has been called.</li>
     * <li>Any of the ID2D1Bitmap::Copy* methods are called with a WIC bitmap as either the source or destination.</li>
     * </ul>
     * IWICBitmap objects will be unlocked in the following circumstances:
     * 
     * <ul>
     * <li>EndDraw is called and the currently selected target bitmap is a WIC bitmap.</li>
     * <li>A WIC bitmap is removed as the target of a device context between the calls to BeginDraw and EndDraw.</li>
     * <li>Any of the ID2D1Bitmap::Copy* methods are called with a WIC bitmap as either the source or destination.</li>
     * </ul>
     * Direct2D will only lock bitmaps that are not currently locked.
     * 
     * Calling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> for <a href="https://docs.microsoft.com/windows/desktop/api/d2d1/nn-d2d1-id2d1gdiinteroprendertarget">ID2D1GdiInteropRenderTarget</a> will always succeed.  <a href="https://docs.microsoft.com/windows/desktop/api/d2d1/nf-d2d1-id2d1gdiinteroprendertarget-getdc">ID2D1GdiInteropRenderTarget::GetDC</a> will return a device context corresponding to the currently bound target bitmap.  GetDC will fail if the target bitmap was not created with the GDI_COMPATIBLE flag set.
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1hwndrendertarget-resize(constd2d1_size_u)">ID2D1HwndRenderTarget::Resize</a> will return <b>DXGI_ERROR_INVALID_CALL</b> if there are any outstanding references to the original target bitmap associated with the render target.
     * 
     * Although the target can be a command list, it cannot be any other type of image. It cannot be the output image of an effect.
     * 
     * 
     * @param {Pointer<ID2D1Image>} image Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1/nn-d2d1-id2d1image">ID2D1Image</a>**</b>
     * 
     * When this method returns, contains the address of a pointer to the target currently associated with the device context.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_1/nf-d2d1_1-id2d1devicecontext-gettarget
     */
    GetTarget(image) {
        ComCall(75, this, "ptr*", image)
    }

    /**
     * 
     * @param {Pointer<D2D1_RENDERING_CONTROLS>} renderingControls 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1devicecontext-setrenderingcontrols(constd2d1_rendering_controls_)
     */
    SetRenderingControls(renderingControls) {
        ComCall(76, this, "ptr", renderingControls)
    }

    /**
     * Gets the rendering controls that have been applied to the context.
     * @param {Pointer<D2D1_RENDERING_CONTROLS>} renderingControls Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/ns-d2d1_1-d2d1_rendering_controls">D2D1_RENDERING_CONTROLS</a>*</b>
     * 
     * When this method returns, contains a pointer to the rendering controls for this context.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_1/nf-d2d1_1-id2d1devicecontext-getrenderingcontrols
     */
    GetRenderingControls(renderingControls) {
        ComCall(77, this, "ptr", renderingControls)
    }

    /**
     * Changes the primitive blend mode that is used for all rendering operations in the device context.
     * @remarks
     * 
     * The primitive blend will apply to all of the primitive drawn on the context, unless this is overridden with the <i>compositeMode</i> parameter on the <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nf-d2d1_1-id2d1devicecontext-drawimage(id2d1effect_constd2d1_point_2f_constd2d1_rect_f_d2d1_interpolation_mode_d2d1_composite_mode)">DrawImage</a> API.
     * 
     * The primitive blend applies to the interior of any primitives drawn on the context. In the case of <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nf-d2d1_1-id2d1devicecontext-drawimage(id2d1effect_constd2d1_point_2f_constd2d1_rect_f_d2d1_interpolation_mode_d2d1_composite_mode)">DrawImage</a>, this will be implied by the image rectangle, offset and world transform.
     * 
     * If the primitive blend is anything other than <b>D2D1_PRIMITIVE_BLEND_SOURCE_OVER</b> then ClearType rendering will be turned off. If the application explicitly forces ClearType rendering in these modes, the drawing context will be placed in an error state. D2DERR_WRONG_STATE will be returned from either <a href="https://docs.microsoft.com/windows/desktop/api/d2d1/nf-d2d1-id2d1rendertarget-enddraw">EndDraw</a> or <a href="https://docs.microsoft.com/windows/desktop/api/d2d1/nf-d2d1-id2d1rendertarget-flush">Flush</a>.
     * 
     * 
     * @param {Integer} primitiveBlend Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/ne-d2d1_1-d2d1_primitive_blend">D2D1_PRIMITIVE_BLEND</a></b>
     * 
     * The primitive blend to use.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_1/nf-d2d1_1-id2d1devicecontext-setprimitiveblend
     */
    SetPrimitiveBlend(primitiveBlend) {
        ComCall(78, this, "int", primitiveBlend)
    }

    /**
     * Returns the currently set primitive blend used by the device context.
     * @returns {Integer} Type: <b><a href="/windows/desktop/api/d2d1_1/ne-d2d1_1-d2d1_primitive_blend">D2D1_PRIMITIVE_BLEND</a></b>
     * 
     * The current primitive blend. The default value is <b>D2D1_PRIMITIVE_BLEND_SOURCE_OVER</b>.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_1/nf-d2d1_1-id2d1devicecontext-getprimitiveblend
     */
    GetPrimitiveBlend() {
        result := ComCall(79, this, "int")
        return result
    }

    /**
     * Sets what units will be used to interpret values passed into the device context.
     * @remarks
     * 
     * This method will affect all properties and parameters affected by <a href="https://docs.microsoft.com/windows/desktop/api/d2d1/nf-d2d1-id2d1rendertarget-setdpi">SetDpi</a> 
     *         and <a href="https://docs.microsoft.com/windows/desktop/api/d2d1/nf-d2d1-id2d1rendertarget-getdpi">GetDpi</a>. This affects all coordinates, lengths, and other properties that are 
     *         not explicitly defined as being in another unit. For example:
     * 
     * <ul>
     * <li><b>SetUnitMode</b> will affect a coordinate passed 
     *             into <a href="https://docs.microsoft.com/windows/desktop/api/d2d1/nf-d2d1-id2d1rendertarget-drawline">ID2D1DeviceContext::DrawLine</a>, and the scaling of a 
     *             geometry passed into <a href="https://docs.microsoft.com/windows/desktop/api/d2d1/nf-d2d1-id2d1rendertarget-fillgeometry">ID2D1DeviceContext::FillGeometry</a>.
     *           </li>
     * <li><b>SetUnitMode</b> will not affect the value
     *             returned by <a href="https://docs.microsoft.com/windows/desktop/api/d2d1/nf-d2d1-id2d1bitmap-getpixelsize">ID2D1Bitmap::GetPixelSize</a>.
     *           </li>
     * </ul>
     * 
     * 
     * @param {Integer} unitMode Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/ne-d2d1_1-d2d1_unit_mode">D2D1_UNIT_MODE</a></b>
     * 
     * An enumeration defining how passed-in units will be interpreted by the device context.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_1/nf-d2d1_1-id2d1devicecontext-setunitmode
     */
    SetUnitMode(unitMode) {
        ComCall(80, this, "int", unitMode)
    }

    /**
     * Gets the mode that is being used to interpret values by the device context.
     * @returns {Integer} Type: <b><a href="/windows/desktop/api/d2d1_1/ne-d2d1_1-d2d1_unit_mode">D2D1_UNIT_MODE</a></b>
     * 
     * The  unit mode.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_1/nf-d2d1_1-id2d1devicecontext-getunitmode
     */
    GetUnitMode() {
        result := ComCall(81, this, "int")
        return result
    }

    /**
     * Draws a series of glyphs to the device context.
     * @remarks
     * 
     * The <i>glyphRunDescription</i> is ignored when rendering, but can be useful for printing and serialization of rendering commands, such as to an XPS or SVG file. This extends <a href="https://docs.microsoft.com/windows/desktop/api/d2d1/nf-d2d1-id2d1rendertarget-drawglyphrun">ID2D1RenderTarget::DrawGlyphRun</a>, which lacked the glyph run description.
     * 
     * 
     * @param {D2D_POINT_2F} baselineOrigin Type: <b><a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-point-2f">D2D1_POINT_2F</a></b>
     * 
     * Origin of first glyph in the series.
     * @param {Pointer<DWRITE_GLYPH_RUN>} glyphRun Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/dwrite/ns-dwrite-dwrite_glyph_run">DWRITE_GLYPH_RUN</a>*</b>
     * 
     * The glyphs to render.
     * @param {Pointer<DWRITE_GLYPH_RUN_DESCRIPTION>} glyphRunDescription Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/dwrite/ns-dwrite-dwrite_glyph_run_description">DWRITE_GLYPH_RUN_DESCRIPTION</a>*</b>
     * 
     * Supplementary glyph series information.
     * @param {ID2D1Brush} foregroundBrush Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1/nn-d2d1-id2d1brush">ID2D1Brush</a>*</b>
     * 
     * The brush that defines the text color.
     * @param {Integer} measuringMode Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcommon/ne-dcommon-dwrite_measuring_mode">DWRITE_MEASURING_MODE</a></b>
     * 
     * The measuring mode of the glyph series, used to determine the advances and offsets. The default value is DWRITE_MEASURING_MODE_NATURAL.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_1/nf-d2d1_1-id2d1devicecontext-drawglyphrun
     */
    DrawGlyphRun(baselineOrigin, glyphRun, glyphRunDescription, foregroundBrush, measuringMode) {
        ComCall(82, this, "ptr", baselineOrigin, "ptr", glyphRun, "ptr", glyphRunDescription, "ptr", foregroundBrush, "int", measuringMode)
    }

    /**
     * 
     * @param {ID2D1Image} image 
     * @param {Pointer<D2D_POINT_2F>} targetOffset 
     * @param {Pointer<D2D_RECT_F>} imageRectangle 
     * @param {Integer} interpolationMode 
     * @param {Integer} compositeMode 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1devicecontext-drawimage(id2d1image_constd2d1_point_2f_constd2d1_rect_f_d2d1_interpolation_mode_d2d1_composite_mode)
     */
    DrawImage(image, targetOffset, imageRectangle, interpolationMode, compositeMode) {
        ComCall(83, this, "ptr", image, "ptr", targetOffset, "ptr", imageRectangle, "int", interpolationMode, "int", compositeMode)
    }

    /**
     * 
     * @param {ID2D1GdiMetafile} gdiMetafile 
     * @param {Pointer<D2D_POINT_2F>} targetOffset 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1devicecontext-drawgdimetafile(id2d1gdimetafile_constd2d1_point_2f)
     */
    DrawGdiMetafile(gdiMetafile, targetOffset) {
        ComCall(84, this, "ptr", gdiMetafile, "ptr", targetOffset)
    }

    /**
     * 
     * @param {ID2D1Bitmap} bitmap 
     * @param {Pointer<D2D_RECT_F>} destinationRectangle 
     * @param {Float} opacity 
     * @param {Integer} interpolationMode 
     * @param {Pointer<D2D_RECT_F>} sourceRectangle 
     * @param {Pointer<D2D_MATRIX_4X4_F>} perspectiveTransform 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1devicecontext-drawbitmap(id2d1bitmap_constd2d1_rect_f_float_d2d1_interpolation_mode_constd2d1_rect_f_constd2d1_matrix_4x4_f)
     */
    DrawBitmap(bitmap, destinationRectangle, opacity, interpolationMode, sourceRectangle, perspectiveTransform) {
        ComCall(85, this, "ptr", bitmap, "ptr", destinationRectangle, "float", opacity, "int", interpolationMode, "ptr", sourceRectangle, "ptr", perspectiveTransform)
    }

    /**
     * 
     * @param {Pointer<D2D1_LAYER_PARAMETERS1>} layerParameters 
     * @param {ID2D1Layer} layer 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1devicecontext-pushlayer(constd2d1_layer_parameters1__id2d1layer)
     */
    PushLayer(layerParameters, layer) {
        ComCall(86, this, "ptr", layerParameters, "ptr", layer)
    }

    /**
     * This indicates that a portion of an effect's input is invalid. This method can be called many times.
     * @param {ID2D1Effect} effect Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nn-d2d1_1-id2d1effect">ID2D1Effect</a>*</b>
     * 
     * The effect to invalidate.
     * @param {Integer} input Type: <b>UINT32</b>
     * 
     * The input index.
     * @param {Pointer<D2D_RECT_F>} inputRectangle Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-rect-f">D2D1_RECT_F</a>*</b>
     * 
     * The rect to invalidate.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>HRESULT</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>S_OK</td>
     * <td>No error occurred.</td>
     * </tr>
     * <tr>
     * <td>E_OUTOFMEMORY</td>
     * <td>Direct2D could not allocate sufficient memory to complete the call.</td>
     * </tr>
     * <tr>
     * <td>E_INVALIDARG</td>
     * <td>An invalid parameter was passed to the returning function.</td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_1/nf-d2d1_1-id2d1devicecontext-invalidateeffectinputrectangle
     */
    InvalidateEffectInputRectangle(effect, input, inputRectangle) {
        result := ComCall(87, this, "ptr", effect, "uint", input, "ptr", inputRectangle, "HRESULT")
        return result
    }

    /**
     * Gets the number of invalid output rectangles that have accumulated on the effect.
     * @param {ID2D1Effect} effect Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nn-d2d1_1-id2d1effect">ID2D1Effect</a>*</b>
     * 
     * The effect to count the invalid rectangles on.
     * @returns {Integer} Type: <b>UINT32*</b>
     * 
     * The returned rectangle count.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_1/nf-d2d1_1-id2d1devicecontext-geteffectinvalidrectanglecount
     */
    GetEffectInvalidRectangleCount(effect) {
        result := ComCall(88, this, "ptr", effect, "uint*", &rectangleCount := 0, "HRESULT")
        return rectangleCount
    }

    /**
     * Gets the invalid rectangles that have accumulated since the last time the effect was drawn and EndDraw was then called on the device context.
     * @param {ID2D1Effect} effect Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nn-d2d1_1-id2d1effect">ID2D1Effect</a>*</b>
     * 
     * The effect to get the invalid rectangles from.
     * @param {Integer} rectanglesCount Type: <b>UINT32</b>
     * 
     * The number of rectangles to get.
     * @returns {D2D_RECT_F} Type: <b><a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-rect-f">D2D1_RECT_F</a>*</b>
     * 
     * An array of <a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-rect-f">D2D1_RECT_F</a> structures.  You must allocate this to the correct size.  You can get the count of the invalid rectangles using the <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nf-d2d1_1-id2d1devicecontext-geteffectinvalidrectanglecount">GetEffectInvalidRectangleCount</a> method.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_1/nf-d2d1_1-id2d1devicecontext-geteffectinvalidrectangles
     */
    GetEffectInvalidRectangles(effect, rectanglesCount) {
        rectangles := D2D_RECT_F()
        result := ComCall(89, this, "ptr", effect, "ptr", rectangles, "uint", rectanglesCount, "HRESULT")
        return rectangles
    }

    /**
     * Returns the input rectangles that are required to be supplied by the caller to produce the given output rectangle.
     * @param {ID2D1Effect} renderEffect Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nn-d2d1_1-id2d1effect">ID2D1Effect</a>*</b>
     * 
     * The image whose output is being rendered.
     * @param {Pointer<D2D_RECT_F>} renderImageRectangle Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-rect-f">D2D1_RECT_F</a>*</b>
     * 
     * The portion of the output image whose inputs are being inspected.
     * @param {Pointer<D2D1_EFFECT_INPUT_DESCRIPTION>} inputDescriptions Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/ns-d2d1_1-d2d1_effect_input_description">D2D1_EFFECT_INPUT_DESCRIPTION</a>*</b>
     * 
     * A list of the inputs whos rectangles are being queried.
     * @param {Integer} inputCount Type: <b>UINT32</b>
     * 
     * The number of inputs.
     * @returns {D2D_RECT_F} Type: <b><a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-rect-f">D2D1_RECT_F</a>*</b>
     * 
     * The input rectangles returned to the caller.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_1/nf-d2d1_1-id2d1devicecontext-geteffectrequiredinputrectangles
     */
    GetEffectRequiredInputRectangles(renderEffect, renderImageRectangle, inputDescriptions, inputCount) {
        requiredInputRects := D2D_RECT_F()
        result := ComCall(90, this, "ptr", renderEffect, "ptr", renderImageRectangle, "ptr", inputDescriptions, "ptr", requiredInputRects, "uint", inputCount, "HRESULT")
        return requiredInputRects
    }

    /**
     * 
     * @param {ID2D1Bitmap} opacityMask 
     * @param {ID2D1Brush} brush 
     * @param {Pointer<D2D_RECT_F>} destinationRectangle 
     * @param {Pointer<D2D_RECT_F>} sourceRectangle 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1devicecontext-fillopacitymask(id2d1bitmap_id2d1brush_constd2d1_rect_f__constd2d1_rect_f)
     */
    FillOpacityMask(opacityMask, brush, destinationRectangle, sourceRectangle) {
        ComCall(91, this, "ptr", opacityMask, "ptr", brush, "ptr", destinationRectangle, "ptr", sourceRectangle)
    }
}
