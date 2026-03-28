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
 * Any resource created from a device context can be shared with any other resource created from a device context when both contexts are created on the same device.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nn-d2d1_1-id2d1devicecontext
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
     * Creates a bitmap that can be used as a target surface, for reading back to the CPU, or as a source for the DrawBitmap and ID2D1BitmapBrush APIs. In addition, color context information can be passed to the bitmap. (overload 2/2)
     * @remarks
     * The new bitmap can be used as a target for <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nf-d2d1_1-id2d1devicecontext-settarget">SetTarget</a> if it is created with <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/ne-d2d1_1-d2d1_bitmap_options">D2D1_BITMAP_OPTIONS_TARGET</a>.
     * @param {D2D_SIZE_U} _size 
     * @param {Pointer<Void>} sourceData Type: <b>const void*</b>
     * 
     * The initial data that will be loaded into the bitmap.
     * @param {Integer} pitch Type: <b>UINT32</b>
     * 
     * The pitch of the source data, if specified.
     * @param {Pointer<D2D1_BITMAP_PROPERTIES1>} bitmapProperties Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/ns-d2d1_1-d2d1_bitmap_properties1">D2D1_BITMAP_PROPERTIES1</a></b>
     * 
     * The properties of the bitmap to be created.
     * @returns {ID2D1Bitmap1} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1devicecontext-createbitmap(d2d1_size_u_constvoid_uint32_constd2d1_bitmap_properties1_id2d1bitmap1)
     */
    CreateBitmap(_size, sourceData, pitch, bitmapProperties) {
        sourceDataMarshal := sourceData is VarRef ? "ptr" : "ptr"

        result := ComCall(57, this, "ptr", _size, sourceDataMarshal, sourceData, "uint", pitch, "ptr", bitmapProperties, "ptr*", &_bitmap := 0, "HRESULT")
        return ID2D1Bitmap1(_bitmap)
    }

    /**
     * Creates an ID2D1Bitmap by copying the specified Microsoft Windows Imaging Component (WIC) bitmap. (overload 1/4)
     * @param {IWICBitmapSource} wicBitmapSource Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapsource">IWICBitmapSource</a>*</b>
     * 
     * The WIC bitmap to copy.
     * @param {Pointer<D2D1_BITMAP_PROPERTIES1>} bitmapProperties 
     * @returns {ID2D1Bitmap1} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1devicecontext-createbitmapfromwicbitmap(iwicbitmapsource_id2d1bitmap1)
     */
    CreateBitmapFromWicBitmap(wicBitmapSource, bitmapProperties) {
        result := ComCall(58, this, "ptr", wicBitmapSource, "ptr", bitmapProperties, "ptr*", &_bitmap := 0, "HRESULT")
        return ID2D1Bitmap1(_bitmap)
    }

    /**
     * Creates a color context.
     * @remarks
     * The new color context can be used in <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/ns-d2d1_1-d2d1_bitmap_properties1">D2D1_BITMAP_PROPERTIES1</a> to initialize the color context of a created bitmap.
     * 
     * When <i>space</i> is <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/ne-d2d1_1-d2d1_color_space">D2D1_COLOR_SPACE_CUSTOM</a>, <i>profile</i> and <i>profileSize</i> must be specified.  Otherwise, these parameters should be set to <b>NULL</b> and zero respectively.  When the space is D2D1_COLOR_SPACE_CUSTOM, the model field of the profile header is inspected to determine if this profile is sRGB or scRGB and the color space is updated respectively.  Otherwise the space remains custom.
     * @param {Integer} space Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/ne-d2d1_1-d2d1_color_space">D2D1_COLOR_SPACE</a></b>
     * 
     * The space  of color context to create.
     * @param {Pointer<Integer>} _profile 
     * @param {Integer} profileSize Type: <b>UINT32</b>
     * 
     * The size in bytes of <i>Profile</i>.
     * @returns {ID2D1ColorContext} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nn-d2d1_1-id2d1colorcontext">ID2D1ColorContext</a>**</b>
     * 
     * When this method returns, contains the address of a pointer to a new color context object.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1devicecontext-createcolorcontext
     */
    CreateColorContext(space, _profile, profileSize) {
        _profileMarshal := _profile is VarRef ? "char*" : "ptr"

        result := ComCall(59, this, "int", space, _profileMarshal, _profile, "uint", profileSize, "ptr*", &colorContext := 0, "HRESULT")
        return ID2D1ColorContext(colorContext)
    }

    /**
     * Creates a color context by loading it from the specified filename. The profile bytes are the contents of the file specified by Filename.
     * @remarks
     * The new color context can be used in <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/ns-d2d1_1-d2d1_bitmap_properties1">D2D1_BITMAP_PROPERTIES1</a> to initialize the color context of a created bitmap.  The model field of the profile header is inspected to determine whether this profile is sRGB or scRGB and the color space is updated respectively.  Otherwise the space is  custom.
     * @param {PWSTR} filename Type: <b>PCWSTR</b>
     * 
     * The path to the file containing the profile bytes to initialize the color context with.
     * @returns {ID2D1ColorContext} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nn-d2d1_1-id2d1colorcontext">ID2D1ColorContext</a>**</b>
     * 
     * When this method returns, contains the address of a pointer to a new color context.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1devicecontext-createcolorcontextfromfilename
     */
    CreateColorContextFromFilename(filename) {
        filename := filename is String ? StrPtr(filename) : filename

        result := ComCall(60, this, "ptr", filename, "ptr*", &colorContext := 0, "HRESULT")
        return ID2D1ColorContext(colorContext)
    }

    /**
     * Creates a color context from an IWICColorContext. The D2D1ColorContext space of the resulting context varies, see Remarks for more info. (ID2D1DeviceContext.CreateColorContextFromWicColorContext)
     * @remarks
     * The new color context can be used in <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/ns-d2d1_1-d2d1_bitmap_properties1">D2D1_BITMAP_PROPERTIES1</a> to initialize the color context of a created bitmap.  The model field of the profile header is inspected to determine whether this profile is sRGB or scRGB and the color space is updated respectively.  Otherwise the space is  custom.
     * @param {IWICColorContext} wicColorContext Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwiccolorcontext">IWICColorContext</a>*</b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwiccolorcontext">IWICColorContext</a> used to initialize the color context.
     * @returns {ID2D1ColorContext} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nn-d2d1_1-id2d1colorcontext">ID2D1ColorContext</a>**</b>
     * 
     * When this method returns, contains the address of a pointer to a new color context.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1devicecontext-createcolorcontextfromwiccolorcontext
     */
    CreateColorContextFromWicColorContext(wicColorContext) {
        result := ComCall(61, this, "ptr", wicColorContext, "ptr*", &colorContext := 0, "HRESULT")
        return ID2D1ColorContext(colorContext)
    }

    /**
     * Creates a bitmap from a DXGI surface that can be set as a target surface or have additional color context information specified. (overload 1/2)
     * @remarks
     * If the bitmap properties are not specified, the following information is assumed: 
     * 
     * <ul>
     * <li>The bitmap DPI is 96.</li>
     * <li>The pixel format matches that of the surface.</li>
     * <li>The returned bitmap will inherit the bind flags of the DXGI surface.<ul>
     * <li>However, only the subset of flags meaningful to Direct2D will be inherited. For example, D3D10_USAGE_DYNAMIC is not compatible with any public Direct2D flags.</li>
     * </ul>
     * </li>
     * <li>The color context is unknown.</li>
     * <li>The alpha mode of the bitmap will be premultiplied (common case) or straight (A8).
     * </li>
     * </ul>
     * If the bitmap properties are specified, the bitmap properties will be used as follows:
     * 
     * <ul>
     * <li>The bitmap DPI will be specified by the bitmap properties.</li>
     * <li>If both dpiX and dpiY are 0, the bitmap DPI will be 96.</li>
     * <li>The pixel format must be compatible with the shader resource view or render target view of the surface.</li>
     * <li>The bitmap options must be compatible with the bind flags of the DXGI surface. However, they may be a subset. This will influence what resource views are created by the bitmap.</li>
     * <li>The color context information will be used from the bitmap properties, if specified.</li>
     * </ul>
     * @param {IDXGISurface} surface Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgisurface">IDXGISurface</a>*</b>
     * 
     * The DXGI surface from which the bitmap can be created.  
     * 
     * <div class="alert"><b>Note</b>  The DXGI surface must have been created from the same Direct3D device that the Direct2D device context is associated with.
     * </div>
     * <div> </div>
     * @param {Pointer<D2D1_BITMAP_PROPERTIES1>} bitmapProperties Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/ns-d2d1_1-d2d1_bitmap_properties1">D2D1_BITMAP_PROPERTIES1</a>*</b>
     * 
     * The bitmap properties specified in addition to the surface.
     * @returns {ID2D1Bitmap1} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1devicecontext-createbitmapfromdxgisurface(idxgisurface_constd2d1_bitmap_properties1_id2d1bitmap1)
     */
    CreateBitmapFromDxgiSurface(surface, bitmapProperties) {
        result := ComCall(62, this, "ptr", surface, "ptr", bitmapProperties, "ptr*", &_bitmap := 0, "HRESULT")
        return ID2D1Bitmap1(_bitmap)
    }

    /**
     * Creates an effect for the specified class ID.
     * @remarks
     * If the  created effect is a custom effect that is implemented in a DLL, this doesn't increment the reference count for that DLL. 
     *         If the application deletes an effect while that effect is loaded, the resulting behavior is unpredictable.
     * @param {Pointer<Guid>} effectId Type: <b>REFCLSID</b>
     * 
     * The class ID of the effect to create. See <a href="https://docs.microsoft.com/windows/desktop/Direct2D/built-in-effects">Built-in Effects</a> for a list of effect IDs.
     * @returns {ID2D1Effect} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1devicecontext-createeffect
     */
    CreateEffect(effectId) {
        result := ComCall(63, this, "ptr", effectId, "ptr*", &_effect := 0, "HRESULT")
        return ID2D1Effect(_effect)
    }

    /**
     * Creates a gradient stop collection, enabling the gradient to contain color channels with values outside of [0,1] and also enabling rendering to a high-color render target with interpolation in sRGB space.
     * @remarks
     * This method linearly interpolates between the color stops. An optional color space conversion is applied post-interpolation. Whether and how this gamma conversion is applied is determined by the pre- and post-interpolation. This method will fail if the device context does not support the requested buffer precision.
     * 
     * In order to get the desired result, you need to ensure that the inputs are specified in the correct color space. 
     * 
     * 
     * You must always specify colors in straight alpha, regardless of interpolation mode being premultiplied or straight. The interpolation mode only affects the interpolated values. Likewise, the stops returned by <a href="https://docs.microsoft.com/windows/desktop/api/d2d1/nf-d2d1-id2d1gradientstopcollection-getgradientstops">ID2D1GradientStopCollection::GetGradientStops</a> will always have straight alpha. 
     * 
     * If you specify <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/ne-d2d1_1-d2d1_color_interpolation_mode">D2D1_COLOR_INTERPOLATION_MODE_PREMULTIPLIED</a>, then all stops are premultiplied before interpolation, and then un-premultiplied before color conversion.
     * 
     * 
     * Starting with Windows 8, the interpolation behavior of this method has changed.  
     * 
     * The table here shows the behavior in Windows 7 and earlier.
     * 
     * <table>
     * <tr>
     * <th>Gamma</th>
     * <th>Before Interpolation Behavior</th>
     * <th>After Interpolation Behavior</th>
     * <th>GetColorInteroplationGamma
     * (output color space)
     * </th>
     * </tr>
     * <tr>
     * <td>1.0</td>
     * <td>Clamps the inputs and then converts from sRGB to scRGB.</td>
     * <td>Converts from scRGB to sRGB post-interpolation.</td>
     * <td>1.0</td>
     * </tr>
     * <tr>
     * <td>2.2</td>
     * <td>Clamps the inputs.</td>
     * <td>No Operation</td>
     * <td>2.2</td>
     * </tr>
     * </table>
     *  
     * 
     * The table here shows the behavior in Windows 8 and later.
     * 
     * <table>
     * <tr>
     * <th>Gamma</th>
     * <th>Before Interpolation Behavior</th>
     * <th>After Interpolation Behavior</th>
     * <th>GetColorInteroplationGamma
     * (output color space)
     * </th>
     * </tr>
     * <tr>
     * <td>sRGB to scRGB</td>
     * <td>No Operation</td>
     * <td>Clamps the outputs and then converts from sRGB to scRGB.</td>
     * <td>1.0</td>
     * </tr>
     * <tr>
     * <td>scRGB to sRGB</td>
     * <td>No Operation</td>
     * <td>Clamps the outputs and then converts from sRGB to scRGB.</td>
     * <td>2.2</td>
     * </tr>
     * <tr>
     * <td>sRGB to sRGB</td>
     * <td>No Operation</td>
     * <td>No Operation</td>
     * <td>2.2</td>
     * </tr>
     * <tr>
     * <td>scRGB to scRGB</td>
     * <td>No Operation</td>
     * <td>No Operation</td>
     * <td>1.0</td>
     * </tr>
     * </table>
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
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1devicecontext-creategradientstopcollection
     */
    CreateGradientStopCollection(straightAlphaGradientStops, straightAlphaGradientStopsCount, preInterpolationSpace, postInterpolationSpace, bufferPrecision, extendMode, colorInterpolationMode) {
        result := ComCall(64, this, "ptr", straightAlphaGradientStops, "uint", straightAlphaGradientStopsCount, "int", preInterpolationSpace, "int", postInterpolationSpace, "int", bufferPrecision, "int", extendMode, "int", colorInterpolationMode, "ptr*", &gradientStopCollection1 := 0, "HRESULT")
        return ID2D1GradientStopCollection1(gradientStopCollection1)
    }

    /**
     * Creates an image brush. The input image can be any type of image, including a bitmap, effect, or a command list. (overload 3/3)
     * @remarks
     * The image brush can be used to fill an arbitrary geometry, an opacity mask or text.
     * 
     * This sample illustrates drawing a rectangle with an image brush.
     * 
     * 
     * ```cpp
     * HRESULT
     * CreatePatternBrush(
     *      __in ID2D1DeviceContext *pDeviceContext,
     *      __deref_out ID2D1ImageBrush **ppImageBrush
     *      )
     * {
     *     HRESULT hr = S_OK;
     *     ID2D1Image *pOldTarget = NULL;
     *     pDeviceContext->GetTarget(&pOldTarget);
     * 
     *     ID2D1CommandList *pCommandList = NULL;
     *     hr = pDeviceContext->CreateCommandList(&pCommandList);
     *      
     *     if (SUCCEEDED(hr))
     *     {   
     *         pDeviceContext->SetTarget(pCommandList);
     *         hr = RenderPatternToCommandList(pDeviceContext);
     *     }
     * 
     *     pDeviceContext->SetTarget(pOldTarget);
     * 
     *     ID2D1ImageBrush *pImageBrush = NULL;
     * 
     *     if (SUCCEEDED(hr))
     *     {        
     *          hr = pDeviceContext->CreateImageBrush(
     *             pCommandList,
     *             D2D1::ImageBrushProperties(
     *                 D2D1::RectF(198, 298, 370, 470),
     *                 D2D1_EXTEND_MODE_WRAP,
     *                 D2D1_EXTEND_MODE_WRAP,
     *                 D2D1_INTERPOLATION_MODE_LINEAR
     *                 ),
     *             &pImageBrush
     *             );
     *     }
     *     
     *     // Fill a rectangle with the image brush.
     *     if (SUCCEEDED(hr))
     *     {
     *         pDeviceContext->FillRectangle(
     *             D2D1::RectF(0, 0, 100, 100), pImageBrush);
     *     }
     * 
     *     SafeRelease(&pImageBrush);
     *     SafeRelease(&pCommandList);
     *     SafeRelease(&pOldTarget);
     *     return hr;
     * }
     * ```
     * @param {ID2D1Image} _image 
     * @param {Pointer<D2D1_IMAGE_BRUSH_PROPERTIES>} imageBrushProperties Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/ns-d2d1_1-d2d1_image_brush_properties">D2D1_IMAGE_BRUSH_PROPERTIES</a></b>
     * 
     * The properties specific to an image brush.
     * @param {Pointer<D2D1_BRUSH_PROPERTIES>} brushProperties 
     * @returns {ID2D1ImageBrush} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nn-d2d1_1-id2d1imagebrush">ID2D1ImageBrush</a>**</b>
     * 
     * When this method returns, contains the address of a pointer to the  input rectangles.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1devicecontext-createimagebrush(id2d1image_constd2d1_image_brush_properties__id2d1imagebrush)
     */
    CreateImageBrush(_image, imageBrushProperties, brushProperties) {
        result := ComCall(65, this, "ptr", _image, "ptr", imageBrushProperties, "ptr", brushProperties, "ptr*", &imageBrush := 0, "HRESULT")
        return ID2D1ImageBrush(imageBrush)
    }

    /**
     * Creates a bitmap brush, the input image is a Direct2D bitmap object. (overload 4/4)
     * @param {ID2D1Bitmap} _bitmap 
     * @param {Pointer<D2D1_BITMAP_BRUSH_PROPERTIES1>} bitmapBrushProperties Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/ns-d2d1_1-d2d1_bitmap_brush_properties1">D2D1_BITMAP_BRUSH_PROPERTIES1</a>*</b>
     * 
     * A bitmap brush properties structure.
     * @param {Pointer<D2D1_BRUSH_PROPERTIES>} brushProperties Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1/ns-d2d1-d2d1_brush_properties">D2D1_BRUSH_PROPERTIES</a>*</b>
     * 
     * A brush properties structure.
     * @returns {ID2D1BitmapBrush1} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nn-d2d1_1-id2d1bitmapbrush1">ID2D1BitmapBrush1</a>**</b>
     * 
     * The address of the newly created bitmap brush object.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1devicecontext-createbitmapbrush(id2d1bitmap_constd2d1_bitmap_brush_properties1__constd2d1_brush_properties__id2d1bitmapbrush1)
     */
    CreateBitmapBrush(_bitmap, bitmapBrushProperties, brushProperties) {
        result := ComCall(66, this, "ptr", _bitmap, "ptr", bitmapBrushProperties, "ptr", brushProperties, "ptr*", &bitmapBrush := 0, "HRESULT")
        return ID2D1BitmapBrush1(bitmapBrush)
    }

    /**
     * Creates a ID2D1CommandList object.
     * @remarks
     * A <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nn-d2d1_1-id2d1commandlist">ID2D1CommandList</a> can store Direct2D commands to be displayed later through <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nf-d2d1_1-id2d1devicecontext-drawimage(id2d1effect_constd2d1_point_2f_constd2d1_rect_f_d2d1_interpolation_mode_d2d1_composite_mode)">ID2D1DeviceContext::DrawImage</a> or through an image brush.
     * @returns {ID2D1CommandList} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nn-d2d1_1-id2d1commandlist">ID2D1CommandList</a>**</b>
     * 
     * When this method returns, contains the address of a pointer to a command list.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1devicecontext-createcommandlist
     */
    CreateCommandList() {
        result := ComCall(67, this, "ptr*", &commandList := 0, "HRESULT")
        return ID2D1CommandList(commandList)
    }

    /**
     * Indicates whether the format is supported by the device context.
     * @remarks
     * You can use supported formats in the <a href="https://docs.microsoft.com/windows/desktop/api/dcommon/ns-dcommon-d2d1_pixel_format">D2D1_PIXEL_FORMAT</a> structure to create bitmaps and render targets.
     * 
     * Direct2D doesn't support all DXGI formats, even though they may have some level of Direct3D support by the hardware.
     * @param {Integer} format Type: <b>format</b>
     * 
     * The DXGI format to check.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * Returns TRUE if the format is supported.  Returns FALSE if the format is not supported.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1devicecontext-isdxgiformatsupported
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
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1devicecontext-isbufferprecisionsupported
     */
    IsBufferPrecisionSupported(bufferPrecision) {
        result := ComCall(69, this, "int", bufferPrecision, "int")
        return result
    }

    /**
     * Gets the bounds of an image without the world transform of the context applied.
     * @remarks
     * The image bounds don't include multiplication by the world transform.  They do reflect the current DPI, unit mode, and interpolation mode of the context.  
     *       To get the bounds that include the world transform, use <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nf-d2d1_1-id2d1devicecontext-getimageworldbounds">ID2D1DeviceContext::GetImageWorldBounds</a>.
     * 
     * The returned bounds reflect which pixels would be impacted by calling <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nf-d2d1_1-id2d1commandsink-drawimage">DrawImage</a> with a 
     *       target offset of (0,0) and an identity world transform matrix. They do not reflect the current clip rectangle set on the device context or the extent of the context's current target image.
     * @param {ID2D1Image} _image 
     * @returns {D2D_RECT_F} Type: <b><a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-rect-f">D2D1_RECT_F</a>[1]</b>
     * 
     * When this method returns, contains a pointer to the bounds of the image in device independent pixels (DIPs) and in local space.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1devicecontext-getimagelocalbounds
     */
    GetImageLocalBounds(_image) {
        localBounds := D2D_RECT_F()
        result := ComCall(70, this, "ptr", _image, "ptr", localBounds, "HRESULT")
        return localBounds
    }

    /**
     * Gets the bounds of an image with the world transform of the context applied.
     * @remarks
     * The image bounds reflect the current DPI, unit mode, and world transform of the context.  To get bounds which don't include the world transform, use <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nf-d2d1_1-id2d1devicecontext-getimagelocalbounds">ID2D1DeviceContext::GetImageLocalBounds</a>.
     * 
     * 
     * 
     * 
     * The returned bounds reflect which pixels would be impacted by calling <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nf-d2d1_1-id2d1devicecontext-drawimage(id2d1effect_constd2d1_point_2f_constd2d1_rect_f_d2d1_interpolation_mode_d2d1_composite_mode)">DrawImage</a> with the same image and a target offset of (0,0).  They do not reflect the current clip rectangle set on the device context or the extent of the context’s current target image.
     * @param {ID2D1Image} _image 
     * @returns {D2D_RECT_F} Type: <b><a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-rect-f">D2D1_RECT_F</a>[1]</b>
     * 
     * When this method returns, contains a pointer to the bounds of the image in device independent pixels (DIPs).
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1devicecontext-getimageworldbounds
     */
    GetImageWorldBounds(_image) {
        worldBounds := D2D_RECT_F()
        result := ComCall(71, this, "ptr", _image, "ptr", worldBounds, "HRESULT")
        return worldBounds
    }

    /**
     * Gets the world-space bounds in DIPs of the glyph run using the device context DPI.
     * @remarks
     * The image bounds reflect the current DPI, unit mode, and world transform of the context.
     * @param {D2D_POINT_2F} baselineOrigin Type: <b><a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-point-2f">D2D1_POINT_2F</a></b>
     * 
     * The origin of the baseline for the glyph run.
     * @param {Pointer<DWRITE_GLYPH_RUN>} _glyphRun 
     * @param {Integer} measuringMode Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dcommon/ne-dcommon-dwrite_measuring_mode">DWRITE_MEASURING_MODE</a></b>
     * 
     * The DirectWrite measuring mode that indicates how glyph metrics are used to measure text when it is formatted.
     * @returns {D2D_RECT_F} Type: <b><a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-rect-f">D2D1_RECT_F</a>*</b>
     * 
     * The bounds of the glyph run in DIPs and in world space.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1devicecontext-getglyphrunworldbounds
     */
    GetGlyphRunWorldBounds(baselineOrigin, _glyphRun, measuringMode) {
        bounds := D2D_RECT_F()
        result := ComCall(72, this, "ptr", baselineOrigin, "ptr", _glyphRun, "int", measuringMode, "ptr", bounds, "HRESULT")
        return bounds
    }

    /**
     * Gets the device associated with a device context.
     * @remarks
     * The application can retrieve the device even if it is created from an earlier render target code-path. The application must use an <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nn-d2d1_1-id2d1devicecontext">ID2D1DeviceContext</a> interface and then call <b>GetDevice</b>. Some functionality for controlling all of the resources for a set of device contexts is maintained only on an <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nn-d2d1_1-id2d1device">ID2D1Device</a> object.
     * @param {Pointer<ID2D1Device>} device Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nn-d2d1_1-id2d1device">ID2D1Device</a>**</b>
     * 
     * When this method returns, contains the address of a pointer to a Direct2D device associated with this device context.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1devicecontext-getdevice
     */
    GetDevice(device) {
        ComCall(73, this, "ptr*", device)
    }

    /**
     * The bitmap or command list to which the Direct2D device context will now render.
     * @remarks
     * The target can be changed at any time, including while the context is drawing.
     * 
     * The target can be either a bitmap created with the <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/ne-d2d1_1-d2d1_bitmap_options">D2D1_BITMAP_OPTIONS_TARGET</a> flag, or it can be a command list. Other kinds of images cannot be set as a target. For example, you cannot set the output of an effect as target. If the target is not valid the context will enter the <b>D2DERR_INVALID_TARGET </b> error state.
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
     * @param {ID2D1Image} _image 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1devicecontext-settarget
     */
    SetTarget(_image) {
        ComCall(74, this, "ptr", _image)
    }

    /**
     * Gets the target currently associated with the device context.
     * @remarks
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
     * @param {Pointer<ID2D1Image>} _image 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1devicecontext-gettarget
     */
    GetTarget(_image) {
        ComCall(75, this, "ptr*", _image)
    }

    /**
     * Sets the rendering controls for the given device context. (overload 1/2)
     * @remarks
     * The rendering controls allow the  application to tune the precision, performance, and resource usage of rendering operations.
     * @param {Pointer<D2D1_RENDERING_CONTROLS>} renderingControls Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/ns-d2d1_1-d2d1_rendering_controls">D2D1_RENDERING_CONTROLS</a>*</b>
     * 
     * The rendering controls to be applied.
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
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1devicecontext-getrenderingcontrols
     */
    GetRenderingControls(renderingControls) {
        ComCall(77, this, "ptr", renderingControls)
    }

    /**
     * Changes the primitive blend mode that is used for all rendering operations in the device context.
     * @remarks
     * The primitive blend will apply to all of the primitive drawn on the context, unless this is overridden with the <i>compositeMode</i> parameter on the <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nf-d2d1_1-id2d1devicecontext-drawimage(id2d1effect_constd2d1_point_2f_constd2d1_rect_f_d2d1_interpolation_mode_d2d1_composite_mode)">DrawImage</a> API.
     * 
     * The primitive blend applies to the interior of any primitives drawn on the context. In the case of <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nf-d2d1_1-id2d1devicecontext-drawimage(id2d1effect_constd2d1_point_2f_constd2d1_rect_f_d2d1_interpolation_mode_d2d1_composite_mode)">DrawImage</a>, this will be implied by the image rectangle, offset and world transform.
     * 
     * If the primitive blend is anything other than <b>D2D1_PRIMITIVE_BLEND_SOURCE_OVER</b> then ClearType rendering will be turned off. If the application explicitly forces ClearType rendering in these modes, the drawing context will be placed in an error state. D2DERR_WRONG_STATE will be returned from either <a href="https://docs.microsoft.com/windows/desktop/api/d2d1/nf-d2d1-id2d1rendertarget-enddraw">EndDraw</a> or <a href="https://docs.microsoft.com/windows/desktop/api/d2d1/nf-d2d1-id2d1rendertarget-flush">Flush</a>.
     * @param {Integer} primitiveBlend Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/ne-d2d1_1-d2d1_primitive_blend">D2D1_PRIMITIVE_BLEND</a></b>
     * 
     * The primitive blend to use.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1devicecontext-setprimitiveblend
     */
    SetPrimitiveBlend(primitiveBlend) {
        ComCall(78, this, "int", primitiveBlend)
    }

    /**
     * Returns the currently set primitive blend used by the device context.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/ne-d2d1_1-d2d1_primitive_blend">D2D1_PRIMITIVE_BLEND</a></b>
     * 
     * The current primitive blend. The default value is <b>D2D1_PRIMITIVE_BLEND_SOURCE_OVER</b>.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1devicecontext-getprimitiveblend
     */
    GetPrimitiveBlend() {
        result := ComCall(79, this, "int")
        return result
    }

    /**
     * Sets what units will be used to interpret values passed into the device context.
     * @remarks
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
     * @param {Integer} unitMode Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/ne-d2d1_1-d2d1_unit_mode">D2D1_UNIT_MODE</a></b>
     * 
     * An enumeration defining how passed-in units will be interpreted by the device context.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1devicecontext-setunitmode
     */
    SetUnitMode(unitMode) {
        ComCall(80, this, "int", unitMode)
    }

    /**
     * Gets the mode that is being used to interpret values by the device context.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/ne-d2d1_1-d2d1_unit_mode">D2D1_UNIT_MODE</a></b>
     * 
     * The  unit mode.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1devicecontext-getunitmode
     */
    GetUnitMode() {
        result := ComCall(81, this, "int")
        return result
    }

    /**
     * Draws a series of glyphs to the device context.
     * @remarks
     * The <i>glyphRunDescription</i> is ignored when rendering, but can be useful for printing and serialization of rendering commands, such as to an XPS or SVG file. This extends <a href="https://docs.microsoft.com/windows/desktop/api/d2d1/nf-d2d1-id2d1rendertarget-drawglyphrun">ID2D1RenderTarget::DrawGlyphRun</a>, which lacked the glyph run description.
     * @param {D2D_POINT_2F} baselineOrigin Type: <b><a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-point-2f">D2D1_POINT_2F</a></b>
     * 
     * Origin of first glyph in the series.
     * @param {Pointer<DWRITE_GLYPH_RUN>} _glyphRun 
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
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1devicecontext-drawglyphrun
     */
    DrawGlyphRun(baselineOrigin, _glyphRun, glyphRunDescription, foregroundBrush, measuringMode) {
        ComCall(82, this, "ptr", baselineOrigin, "ptr", _glyphRun, "ptr", glyphRunDescription, "ptr", foregroundBrush, "int", measuringMode)
    }

    /**
     * Draws an image to the device context. (overload 6/8)
     * @remarks
     * If <i>interpolationMode</i> is <b>D2D1_INTERPOLATION_MODE_HIGH_QUALITY</b>, different scalers will be used depending on the scale factor implied by the world transform.
     * 
     * Any invalid rectangles accumulated on any effect that is drawn by this call will be discarded regardless of which portion of the image rectangle is drawn.
     * 
     * If <i>compositeMode</i> is <b>D2D1_COMPOSITE_MODE_SOURCE_OVER</b>, <b>DrawImage</b> will use the currently selected primitive blend specified by <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nf-d2d1_1-id2d1devicecontext-setprimitiveblend">ID2D1DeviceContext::SetPrimitiveBlend</a>. If <i>compositeMode</i> is not <b>D2D1_COMPOSITE_MODE_SOURCE_OVER</b>, the image will be extended to transparent up to the current axis-aligned clip.
     * 
     * If there is an image rectangle and a world transform, this is equivalent to inserting a clip effect to represent the image rectangle and a 2D affine transform to take into account the world transform.
     * @param {ID2D1Image} _image 
     * @param {Pointer<D2D_POINT_2F>} targetOffset Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-point-2f">D2D1_POINT_2F</a>*</b>
     * 
     * The  offset in the destination space that the image will be rendered to. The entire logical extent of the image will be rendered to the corresponding destination. If not specified, the destination origin will be (0, 0). The top-left corner of the image will be mapped to the target offset. This will not necessarily be the origin. This default value is <i>NULL</i>.
     * @param {Pointer<D2D_RECT_F>} imageRectangle Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-rect-f">D2D1_RECT_F</a>*</b>
     * 
     * The corresponding rectangle in the image space will be mapped to the given origins when processing the image. This default value is <i>NULL</i>.
     * @param {Integer} _interpolationMode 
     * @param {Integer} compositeMode Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/ne-d2d1_1-d2d1_composite_mode">D2D1_COMPOSITE_MODE</a></b>
     * 
     * The composite mode that will be applied to the limits of the currently selected clip. The default value is <b>D2D1_COMPOSITE_MODE_SOURCE_OVER</b>
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1devicecontext-drawimage(id2d1image_constd2d1_point_2f_constd2d1_rect_f_d2d1_interpolation_mode_d2d1_composite_mode)
     */
    DrawImage(_image, targetOffset, imageRectangle, _interpolationMode, compositeMode) {
        ComCall(83, this, "ptr", _image, "ptr", targetOffset, "ptr", imageRectangle, "int", _interpolationMode, "int", compositeMode)
    }

    /**
     * Draw a metafile to the device context. (overload 1/3)
     * @param {ID2D1GdiMetafile} gdiMetafile Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nn-d2d1_1-id2d1gdimetafile">ID2D1GdiMetafile</a>*</b>
     * 
     * The metafile to draw.
     * @param {Pointer<D2D_POINT_2F>} targetOffset Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-point-2f">D2D1_POINT_2F</a>*</b>
     * 
     * The offset from the upper left corner of the render target.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1devicecontext-drawgdimetafile(id2d1gdimetafile_constd2d1_point_2f)
     */
    DrawGdiMetafile(gdiMetafile, targetOffset) {
        ComCall(84, this, "ptr", gdiMetafile, "ptr", targetOffset)
    }

    /**
     * Draws a bitmap to the render target. (overload 1/5)
     * @remarks
     * The destinationRectangle parameter defines the rectangle in the target where the bitmap will appear (in device-independent pixels (DIPs)).  This is affected by the currently set transform and the perspective transform, if set.  If NULL is specified, then the destination rectangle is (left=0, top=0, right = width(sourceRectangle), bottom = height(sourceRectangle)).
     * 
     * 
     * 
     * The <i>sourceRectangle</i> parameter defines the sub-rectangle of the source bitmap (in DIPs).  <b>DrawBitmap</b> will clip this rectangle to the size of the source bitmap, thus making it impossible to sample outside of the bitmap.  If NULL is specified, then the source rectangle is taken to be the size of the source bitmap.
     * 
     * 
     * 
     * If you specify <i>perspectiveTransform</i> it is applied to the rect in addition to the transform set on the render target.
     * @param {ID2D1Bitmap} _bitmap 
     * @param {Pointer<D2D_RECT_F>} destinationRectangle Type: <b><a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-rect-f">D2D1_RECT_F</a>*</b>
     * 
     * The destination rectangle. The default is the size of the bitmap and the location is the upper left corner of the render target.
     * @param {Float} opacity Type: <b>FLOAT</b>
     * 
     * The opacity of the bitmap.
     * @param {Integer} _interpolationMode 
     * @param {Pointer<D2D_RECT_F>} sourceRectangle Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-rect-f">D2D1_RECT_F</a></b>
     * 
     * An optional source rectangle.
     * @param {Pointer<D2D_MATRIX_4X4_F>} perspectiveTransform Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-matrix-4x4-f">D2D1_MATRIX_4X4_F</a></b>
     * 
     * An optional perspective transform.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1devicecontext-drawbitmap(id2d1bitmap_constd2d1_rect_f_float_d2d1_interpolation_mode_constd2d1_rect_f_constd2d1_matrix_4x4_f)
     */
    DrawBitmap(_bitmap, destinationRectangle, opacity, _interpolationMode, sourceRectangle, perspectiveTransform) {
        ComCall(85, this, "ptr", _bitmap, "ptr", destinationRectangle, "float", opacity, "int", _interpolationMode, "ptr", sourceRectangle, "ptr", perspectiveTransform)
    }

    /**
     * Push a layer onto the clip and layer stack of the device context. (overload 2/2)
     * @param {Pointer<D2D1_LAYER_PARAMETERS1>} layerParameters Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/ns-d2d1_1-d2d1_layer_parameters1">D2D1_LAYER_PARAMETERS1</a>*</b>
     * 
     * The parameters that defines the layer.
     * @param {ID2D1Layer} layer Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1/nn-d2d1-id2d1layer">ID2D1Layer</a>*</b>
     * 
     * The layer resource to push on the device context that receives subsequent drawing operations. 
     * 
     * <div class="alert"><b>Note</b>  If a layer is not specified, Direct2D manages the layer resource automatically.</div>
     * <div> </div>
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1devicecontext-pushlayer(constd2d1_layer_parameters1__id2d1layer)
     */
    PushLayer(layerParameters, layer) {
        ComCall(86, this, "ptr", layerParameters, "ptr", layer)
    }

    /**
     * This indicates that a portion of an effect's input is invalid. This method can be called many times.
     * @param {ID2D1Effect} _effect 
     * @param {Integer} _input 
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
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1devicecontext-invalidateeffectinputrectangle
     */
    InvalidateEffectInputRectangle(_effect, _input, inputRectangle) {
        result := ComCall(87, this, "ptr", _effect, "uint", _input, "ptr", inputRectangle, "HRESULT")
        return result
    }

    /**
     * Gets the number of invalid output rectangles that have accumulated on the effect.
     * @param {ID2D1Effect} _effect 
     * @returns {Integer} Type: <b>UINT32*</b>
     * 
     * The returned rectangle count.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1devicecontext-geteffectinvalidrectanglecount
     */
    GetEffectInvalidRectangleCount(_effect) {
        result := ComCall(88, this, "ptr", _effect, "uint*", &rectangleCount := 0, "HRESULT")
        return rectangleCount
    }

    /**
     * Gets the invalid rectangles that have accumulated since the last time the effect was drawn and EndDraw was then called on the device context.
     * @remarks
     * <div class="alert"><b>Note</b>  Direct2D does not automatically use these invalid rectangles to reduce the region of an effect that is rendered.</div>
     * <div> </div>
     * 
     * 
     * You can use the <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nf-d2d1_1-id2d1devicecontext-invalidateeffectinputrectangle">InvalidateEffectInputRectangle</a> method to specify invalidated rectangles for Direct2D to propagate through an effect graph.
     * 
     * If multiple invalid rectangles are requested, the rectangles that this method returns may overlap. When this is the case, the rectangle count might be lower than the count that <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nf-d2d1_1-id2d1devicecontext-geteffectinvalidrectanglecount">GetEffectInvalidRectangleCount</a>.
     * @param {ID2D1Effect} _effect 
     * @param {Integer} rectanglesCount Type: <b>UINT32</b>
     * 
     * The number of rectangles to get.
     * @returns {D2D_RECT_F} Type: <b><a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-rect-f">D2D1_RECT_F</a>*</b>
     * 
     * An array of <a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-rect-f">D2D1_RECT_F</a> structures.  You must allocate this to the correct size.  You can get the count of the invalid rectangles using the <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nf-d2d1_1-id2d1devicecontext-geteffectinvalidrectanglecount">GetEffectInvalidRectangleCount</a> method.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1devicecontext-geteffectinvalidrectangles
     */
    GetEffectInvalidRectangles(_effect, rectanglesCount) {
        rectangles := D2D_RECT_F()
        result := ComCall(89, this, "ptr", _effect, "ptr", rectangles, "uint", rectanglesCount, "HRESULT")
        return rectangles
    }

    /**
     * Returns the input rectangles that are required to be supplied by the caller to produce the given output rectangle.
     * @remarks
     * The caller should be very careful not to place a reliance on the required input rectangles returned. 
     *       Small changes for correctness to an effect's behavior can result in different rectangles being returned. 
     *       In addition, different kinds of optimization applied inside the render can also influence the result.
     * @param {ID2D1Effect} renderEffect Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nn-d2d1_1-id2d1effect">ID2D1Effect</a>*</b>
     * 
     * The image whose output is being rendered.
     * @param {Pointer<D2D_RECT_F>} renderImageRectangle Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-rect-f">D2D1_RECT_F</a>*</b>
     * 
     * The portion of the output image whose inputs are being inspected.
     * @param {Pointer<D2D1_EFFECT_INPUT_DESCRIPTION>} inputDescriptions Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/ns-d2d1_1-d2d1_effect_input_description">D2D1_EFFECT_INPUT_DESCRIPTION</a>*</b>
     * 
     * A list of the inputs whose rectangles are being queried.
     * @param {Integer} inputCount Type: <b>UINT32</b>
     * 
     * The number of inputs.
     * @returns {D2D_RECT_F} Type: <b><a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-rect-f">D2D1_RECT_F</a>*</b>
     * 
     * The input rectangles returned to the caller.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1devicecontext-geteffectrequiredinputrectangles
     */
    GetEffectRequiredInputRectangles(renderEffect, renderImageRectangle, inputDescriptions, inputCount) {
        requiredInputRects := D2D_RECT_F()
        result := ComCall(90, this, "ptr", renderEffect, "ptr", renderImageRectangle, "ptr", inputDescriptions, "ptr", requiredInputRects, "uint", inputCount, "HRESULT")
        return requiredInputRects
    }

    /**
     * Fill using the alpha channel of the supplied opacity mask bitmap. The brush opacity will be modulated by the mask. The render target antialiasing mode must be set to aliased. (overload 1/3)
     * @param {ID2D1Bitmap} opacityMask Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1/nn-d2d1-id2d1bitmap">ID2D1Bitmap</a>*</b>
     * 
     * The bitmap that acts as the opacity mask
     * @param {ID2D1Brush} brush Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1/nn-d2d1-id2d1brush">ID2D1Brush</a>*</b>
     * 
     * The brush to use for filling the primitive.
     * @param {Pointer<D2D_RECT_F>} destinationRectangle Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-rect-f">D2D1_RECT_F</a></b>
     * 
     * The destination rectangle to output to in the render target
     * @param {Pointer<D2D_RECT_F>} sourceRectangle Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-rect-f">D2D1_RECT_F</a>*</b>
     * 
     * The source rectangle from the opacity mask bitmap.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1devicecontext-fillopacitymask(id2d1bitmap_id2d1brush_constd2d1_rect_f__constd2d1_rect_f)
     */
    FillOpacityMask(opacityMask, brush, destinationRectangle, sourceRectangle) {
        ComCall(91, this, "ptr", opacityMask, "ptr", brush, "ptr", destinationRectangle, "ptr", sourceRectangle)
    }
}
