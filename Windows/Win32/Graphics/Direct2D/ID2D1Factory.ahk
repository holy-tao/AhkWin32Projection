#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID2D1RectangleGeometry.ahk
#Include .\ID2D1RoundedRectangleGeometry.ahk
#Include .\ID2D1EllipseGeometry.ahk
#Include .\ID2D1GeometryGroup.ahk
#Include .\ID2D1TransformedGeometry.ahk
#Include .\ID2D1PathGeometry.ahk
#Include .\ID2D1StrokeStyle.ahk
#Include .\ID2D1DrawingStateBlock.ahk
#Include .\ID2D1RenderTarget.ahk
#Include .\ID2D1HwndRenderTarget.ahk
#Include .\ID2D1DCRenderTarget.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Creates Direct2D resources. (ID2D1Factory)
 * @remarks
 * The <b>ID2D1Factory</b> interface is the starting point for using Direct2D; it's what you use to create other Direct2D resources that you can use to draw or describe shapes.   
 * 
 * A factory defines a set of Create<i>Resource</i> methods that can produce the following drawing resources:
 * 
 * 
 * <ul>
 * <li>Render targets: objects that render drawing commands.</li>
 * <li>Drawing state blocks: objects that store drawing state information, such as the current transformation and antialiasing mode.</li>
 * <li>Geometries: objects that represent simple and potentially complex shapes.</li>
 * </ul>
 * 
 * 
 * To create an <b>ID2D1Factory</b>, you use one of the <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-d2d1createfactory">CreateFactory</a> methods. You should retain the <b>ID2D1Factory</b> instance for as long as you use Direct2D resources; in general, you shouldn't need to recreate it when the application is running. For more information about Direct2D resources, see the <a href="https://docs.microsoft.com/windows/win32/Direct2D/resources-and-resource-domains">Resources Overview</a>.
 * 
 * <h3><a id="Singlethreaded_and_Multithreaded_Factories"></a><a id="singlethreaded_and_multithreaded_factories"></a><a id="SINGLETHREADED_AND_MULTITHREADED_FACTORIES"></a>Singlethreaded and Multithreaded Factories</h3>
 * When you create a factory, you can specify whether it is multithreaded or singlethreaded. A singlethreaded factory provides no serialization against any other single threaded instance within Direct2D, so, this mechanism provides a very large degree of scaling on the CPU.
 * 
 * You can also create a multithreaded factory instance. In this case, the factory and all derived objects can be used from any thread and each render target can be rendered to independently. Direct2D serializes calls to these objects, so a single multithreaded Direct2D instance won't scale as well on the CPU as many single threaded instances. However, the resources can be shared within the multithreaded instance.
 * 
 * Note that the qualifier "On the CPU": GPUs generally take advantage of fine-grained parallelism more so than CPUs. For example, multithreaded calls from the CPU might still end up being serialized when being sent to the GPU, however, a whole bank of pixel and vertex shaders will run in parallel to perform the rendering.
 * 
 * 
 * 
 * See <a href="https://docs.microsoft.com/windows/win32/Direct2D/multi-threaded-direct2d-apps">Multithreaded Direct2D Apps</a> for more info.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1factory
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class ID2D1Factory extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID2D1Factory
     * @type {Guid}
     */
    static IID => Guid("{06152247-6f50-465a-9245-118bfd3b6007}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ReloadSystemMetrics", "GetDesktopDpi", "CreateRectangleGeometry", "CreateRoundedRectangleGeometry", "CreateEllipseGeometry", "CreateGeometryGroup", "CreateTransformedGeometry", "CreatePathGeometry", "CreateStrokeStyle", "CreateDrawingStateBlock", "CreateWicBitmapRenderTarget", "CreateHwndRenderTarget", "CreateDxgiSurfaceRenderTarget", "CreateDCRenderTarget"]

    /**
     * Forces the factory to refresh any system defaults that it might have changed since factory creation.
     * @remarks
     * To ensure that the system DPI is current, you should call **ID2D1Factory.ReloadSystemMetrics** before calling the [GetDesktopDpi](/windows/win32/api/d2d1/nf-d2d1-id2d1factory-getdesktopdpi) method.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an [**HRESULT**](/windows/desktop/com/structure-of-com-error-codes) error code.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1factory-reloadsystemmetrics
     */
    ReloadSystemMetrics() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * Retrieves the current desktop dots per inch (DPI). To refresh this value, call ReloadSystemMetrics.
     * @remarks
     * Use this method to obtain the system DPI when setting physical pixel values, such as when you specify the size of a window.
     * @param {Pointer<Float>} dpiX Type: <b>FLOAT*</b>
     * 
     * When this method returns, contains the horizontal DPI of the desktop. You must allocate storage for this parameter.
     * @param {Pointer<Float>} dpiY Type: <b>FLOAT*</b>
     * 
     * When this method returns, contains the vertical DPI of the desktop. You must allocate storage for this parameter.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1factory-getdesktopdpi
     * @deprecated Deprecated. Use DisplayInformation::LogicalDpi for Windows Store Apps or GetDpiForWindow for desktop apps.
     */
    GetDesktopDpi(dpiX, dpiY) {
        dpiXMarshal := dpiX is VarRef ? "float*" : "ptr"
        dpiYMarshal := dpiY is VarRef ? "float*" : "ptr"

        ComCall(4, this, dpiXMarshal, dpiX, dpiYMarshal, dpiY)
    }

    /**
     * Creates an ID2D1RectangleGeometry.
     * @param {Pointer<D2D_RECT_F>} rectangle 
     * @returns {ID2D1RectangleGeometry} 
     * @see https://learn.microsoft.com/windows/win32/Direct2D/id2d1factory-createrectanglegeometry
     */
    CreateRectangleGeometry(rectangle) {
        result := ComCall(5, this, "ptr", rectangle, "ptr*", &rectangleGeometry := 0, "HRESULT")
        return ID2D1RectangleGeometry(rectangleGeometry)
    }

    /**
     * Creates an ID2D1RoundedRectangleGeometry.
     * @param {Pointer<D2D1_ROUNDED_RECT>} roundedRectangle 
     * @returns {ID2D1RoundedRectangleGeometry} 
     * @see https://learn.microsoft.com/windows/win32/Direct2D/id2d1factory-createroundedrectanglegeometry
     */
    CreateRoundedRectangleGeometry(roundedRectangle) {
        result := ComCall(6, this, "ptr", roundedRectangle, "ptr*", &roundedRectangleGeometry := 0, "HRESULT")
        return ID2D1RoundedRectangleGeometry(roundedRectangleGeometry)
    }

    /**
     * Creates an ID2D1EllipseGeometry.
     * @param {Pointer<D2D1_ELLIPSE>} ellipse 
     * @returns {ID2D1EllipseGeometry} 
     * @see https://learn.microsoft.com/windows/win32/Direct2D/id2d1factory-createellipsegeometry
     */
    CreateEllipseGeometry(ellipse) {
        result := ComCall(7, this, "ptr", ellipse, "ptr*", &ellipseGeometry := 0, "HRESULT")
        return ID2D1EllipseGeometry(ellipseGeometry)
    }

    /**
     * Creates an ID2D1GeometryGroup, which is an object that holds other geometries.
     * @remarks
     * Geometry groups are a convenient way to group several geometries simultaneously so all figures of several distinct geometries are concatenated into one. To create a  <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1geometrygroup">ID2D1GeometryGroup</a> object, call  the <b>CreateGeometryGroup</b> method on the <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1factory">ID2D1Factory</a> object, passing in the <i>fillMode</i> with possible values of   <a href="https://docs.microsoft.com/windows/win32/api/d2d1/ne-d2d1-d2d1_fill_mode">D2D1_FILL_MODE_ALTERNATE</a> (alternate) and <b>D2D1_FILL_MODE_WINDING</b>, an array of geometry objects to add to the geometry group, and the number of elements in this array.
     * @param {Integer} _fillMode 
     * @param {Pointer<ID2D1Geometry>} geometries Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1geometry">ID2D1Geometry</a>**</b>
     * 
     * An array containing the geometry objects to add to the geometry group. The number of elements in this array is indicated by the <i>geometriesCount</i> parameter.
     * @param {Integer} geometriesCount Type: <b>UINT</b>
     * 
     * The number of elements in <i>geometries</i>.
     * @returns {ID2D1GeometryGroup} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1geometrygroup">ID2D1GeometryGroup</a>**</b>
     * 
     * When this method returns, contains the address of a pointer to the geometry group created by this method.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1factory-creategeometrygroup
     */
    CreateGeometryGroup(_fillMode, geometries, geometriesCount) {
        result := ComCall(8, this, "int", _fillMode, "ptr*", geometries, "uint", geometriesCount, "ptr*", &geometryGroup := 0, "HRESULT")
        return ID2D1GeometryGroup(geometryGroup)
    }

    /**
     * Transforms the specified geometry and stores the result as an ID2D1TransformedGeometry object.
     * @remarks
     * Like other resources, a transformed geometry inherits the resource space and threading policy of the factory that created it. This object is immutable.
     * 
     * When stroking a transformed geometry with the [**DrawGeometry**](/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-drawgeometry) method, the stroke width is not affected by the transform applied to the geometry. The stroke width is only affected by the world transform.
     * @param {ID2D1Geometry} sourceGeometry 
     * @param {Pointer<D2D_MATRIX_3X2_F>} transform 
     * @returns {ID2D1TransformedGeometry} 
     * @see https://learn.microsoft.com/windows/win32/Direct2D/id2d1factory-createtransformedgeometry
     */
    CreateTransformedGeometry(sourceGeometry, transform) {
        result := ComCall(9, this, "ptr", sourceGeometry, "ptr", transform, "ptr*", &transformedGeometry := 0, "HRESULT")
        return ID2D1TransformedGeometry(transformedGeometry)
    }

    /**
     * Creates an empty ID2D1PathGeometry.
     * @returns {ID2D1PathGeometry} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1pathgeometry">ID2D1PathGeometry</a>**</b>
     * 
     * When this method returns, contains the address to a pointer to the path geometry created by this method.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1factory-createpathgeometry
     */
    CreatePathGeometry() {
        result := ComCall(10, this, "ptr*", &pathGeometry := 0, "HRESULT")
        return ID2D1PathGeometry(pathGeometry)
    }

    /**
     * Creates an ID2D1StrokeStyle that describes start cap, dash pattern, and other features of a stroke.
     * @param {Pointer<D2D1_STROKE_STYLE_PROPERTIES>} strokeStyleProperties 
     * @param {Pointer<Float>} dashes 
     * @param {Integer} dashesCount 
     * @returns {ID2D1StrokeStyle} 
     * @see https://learn.microsoft.com/windows/win32/Direct2D/id2d1factory-createstrokestyle
     */
    CreateStrokeStyle(strokeStyleProperties, dashes, dashesCount) {
        dashesMarshal := dashes is VarRef ? "float*" : "ptr"

        result := ComCall(11, this, "ptr", strokeStyleProperties, dashesMarshal, dashes, "uint", dashesCount, "ptr*", &strokeStyle := 0, "HRESULT")
        return ID2D1StrokeStyle(strokeStyle)
    }

    /**
     * Creates an ID2D1DrawingStateBlock that can be used with the SaveDrawingState and RestoreDrawingState methods of a render target.
     * @param {Pointer<D2D1_DRAWING_STATE_DESCRIPTION>} drawingStateDescription 
     * @param {IDWriteRenderingParams} textRenderingParams 
     * @returns {ID2D1DrawingStateBlock} 
     * @see https://learn.microsoft.com/windows/win32/Direct2D/id2d1factory-createdrawingstateblock
     */
    CreateDrawingStateBlock(drawingStateDescription, textRenderingParams) {
        result := ComCall(12, this, "ptr", drawingStateDescription, "ptr", textRenderingParams, "ptr*", &drawingStateBlock := 0, "HRESULT")
        return ID2D1DrawingStateBlock(drawingStateBlock)
    }

    /**
     * Creates a render target that renders to a Microsoft Windows Imaging Component (WIC) bitmap.
     * @remarks
     * Your application should create render targets once and hold onto them for the life of the application or until the [**D2DERR\_RECREATE\_TARGET**](direct2d-error-codes.md) error is received. When you receive this error, you need to recreate the render target (and any resources it created).
     * 
     * **Note**   This method isn't supported on Windows Phone and will fail when called on a device with error code 0x8899000b ( There is no hardware rendering device available for this operation ). Because the Windows Phone Emulator supports WARP rendering, this method will fail when called on the emulator with a different error code, 0x88982f80 (wincodec\_err\_unsupportedpixelformat).
     * @param {IWICBitmap} target 
     * @param {Pointer<D2D1_RENDER_TARGET_PROPERTIES>} renderTargetProperties 
     * @returns {ID2D1RenderTarget} 
     * @see https://learn.microsoft.com/windows/win32/Direct2D/id2d1factory-createwicbitmaprendertarget
     */
    CreateWicBitmapRenderTarget(target, renderTargetProperties) {
        result := ComCall(13, this, "ptr", target, "ptr", renderTargetProperties, "ptr*", &renderTarget := 0, "HRESULT")
        return ID2D1RenderTarget(renderTarget)
    }

    /**
     * Creates an ID2D1HwndRenderTarget, a render target that renders to a window.
     * @remarks
     * When you create a render target and hardware acceleration is available, you allocate resources on the computer's GPU. By creating a render target once and retaining it as long as possible, you gain performance benefits. Your application should create render targets once and hold onto them for the life of the application or until the [**D2DERR\_RECREATE\_TARGET**](direct2d-error-codes.md) error is received. When you receive this error, you need to recreate the render target (and any resources it created).
     * @param {Pointer<D2D1_RENDER_TARGET_PROPERTIES>} renderTargetProperties 
     * @param {Pointer<D2D1_HWND_RENDER_TARGET_PROPERTIES>} hwndRenderTargetProperties 
     * @returns {ID2D1HwndRenderTarget} 
     * @see https://learn.microsoft.com/windows/win32/Direct2D/id2d1factory-createhwndrendertarget
     */
    CreateHwndRenderTarget(renderTargetProperties, hwndRenderTargetProperties) {
        result := ComCall(14, this, "ptr", renderTargetProperties, "ptr", hwndRenderTargetProperties, "ptr*", &hwndRenderTarget := 0, "HRESULT")
        return ID2D1HwndRenderTarget(hwndRenderTarget)
    }

    /**
     * Creates a render target that draws to a DirectX Graphics Infrastructure (DXGI) surface. (overload 1/2)
     * @remarks
     * To write to a Direct3D surface, you obtain an <a href="https://docs.microsoft.com/windows/win32/api/dxgi/nn-dxgi-idxgisurface">IDXGISurface</a> and pass it to the CreateDxgiSurfaceRenderTarget method to create a DXGI surface render target; you can then use the DXGI surface render target to draw 2-D content to the DXGI surface.  
     * 
     * A DXGI surface render target is a type of <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1rendertarget">ID2D1RenderTarget</a>. Like other Direct2D render targets, you can use it to create resources and issue drawing commands. 
     * 
     * The DXGI surface render target and the DXGI surface must use the same DXGI format. If you specify the <a href="https://docs.microsoft.com/windows/win32/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT_UNKOWN</a> format when you create the render target, it will automatically use the surface's format.
     * 
     * The DXGI surface render target does not perform DXGI surface synchronization. 
     * 
     * For more information about creating and using DXGI surface render targets, see the <a href="https://docs.microsoft.com/windows/win32/Direct2D/direct2d-and-direct3d-interoperation-overview">Direct2D and Direct3D Interoperability Overview</a>.
     * 
     * To work with Direct2D, the Direct3D device that provides the <a href="https://docs.microsoft.com/windows/win32/api/dxgi/nn-dxgi-idxgisurface">IDXGISurface</a> must be created with the <b>D3D10_CREATE_DEVICE_BGRA_SUPPORT</b> flag.
     * 
     * When you create a render target and hardware acceleration is available, you allocate resources on the computer's GPU. By creating a render target once and retaining it as long as possible, you gain performance benefits. Your application should create render targets once and hold onto them for the life of the application or until the render target's <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-enddraw">EndDraw</a> method returns the <a href="https://docs.microsoft.com/windows/win32/Direct2D/direct2d-error-codes">D2DERR_RECREATE_TARGET</a>  error. When you receive this error, you need to recreate the render target (and any resources it created).
     * @param {IDXGISurface} dxgiSurface Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dxgi/nn-dxgi-idxgisurface">IDXGISurface</a>*</b>
     * 
     * The IDXGISurface to which the render target will draw.
     * @param {Pointer<D2D1_RENDER_TARGET_PROPERTIES>} renderTargetProperties Type: <b>const <a href="https://docs.microsoft.com/windows/win32/api/d2d1/ns-d2d1-d2d1_render_target_properties">D2D1_RENDER_TARGET_PROPERTIES</a> &</b>
     * 
     * The rendering mode, pixel format, remoting options, DPI information, and the minimum DirectX support required for hardware rendering. For information about supported pixel formats, see  <a href="https://docs.microsoft.com/windows/win32/Direct2D/supported-pixel-formats-and-alpha-modes">Supported Pixel  Formats and Alpha Modes</a>.
     * @returns {ID2D1RenderTarget} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1rendertarget">ID2D1RenderTarget</a>**</b>
     * 
     * When this method returns, contains the address of the pointer to the <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1rendertarget">ID2D1RenderTarget</a> object created by this method.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1factory-createdxgisurfacerendertarget(idxgisurface_constd2d1_render_target_properties__id2d1rendertarget)
     */
    CreateDxgiSurfaceRenderTarget(dxgiSurface, renderTargetProperties) {
        result := ComCall(15, this, "ptr", dxgiSurface, "ptr", renderTargetProperties, "ptr*", &renderTarget := 0, "HRESULT")
        return ID2D1RenderTarget(renderTarget)
    }

    /**
     * Creates a render target that draws to a Windows Graphics Device Interface (GDI) device context.
     * @remarks
     * Before you can render with a DC render target, you must use the render target's <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1dcrendertarget-binddc">BindDC</a> method to associate it with a GDI DC.  Do this for each different DC and whenever there is a change in the size of the area you want to draw to.
     * 
     * To enable the DC render target to work with GDI, set the render target's DXGI format to <a href="https://docs.microsoft.com/windows/win32/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT_B8G8R8A8_UNORM</a> and alpha mode to <a href="https://docs.microsoft.com/windows/win32/api/dcommon/ne-dcommon-d2d1_alpha_mode">D2D1_ALPHA_MODE_PREMULTIPLIED</a> or <b>D2D1_ALPHA_MODE_IGNORE</b>.
     * 
     * Your application should create render targets once and hold on to them for the life of the application or until the render target's  <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-enddraw">EndDraw</a> method returns the <a href="https://docs.microsoft.com/windows/win32/Direct2D/direct2d-error-codes">D2DERR_RECREATE_TARGET</a>  error. When you receive this error, recreate the render target (and any resources it created).
     * @param {Pointer<D2D1_RENDER_TARGET_PROPERTIES>} renderTargetProperties Type: <b>const <a href="https://docs.microsoft.com/windows/win32/api/d2d1/ns-d2d1-d2d1_render_target_properties">D2D1_RENDER_TARGET_PROPERTIES</a>*</b>
     * 
     * The rendering mode, pixel format, remoting options, DPI information, and the minimum DirectX support required for hardware rendering.  To enable the device context (DC) render target to work with GDI, set the DXGI format to <a href="https://docs.microsoft.com/windows/win32/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT_B8G8R8A8_UNORM</a> and the alpha mode to <a href="https://docs.microsoft.com/windows/win32/api/dcommon/ne-dcommon-d2d1_alpha_mode">D2D1_ALPHA_MODE_PREMULTIPLIED</a> or <b>D2D1_ALPHA_MODE_IGNORE</b>. For more information about pixel formats, see  <a href="https://docs.microsoft.com/windows/win32/Direct2D/supported-pixel-formats-and-alpha-modes">Supported Pixel  Formats and Alpha Modes</a>.
     * @returns {ID2D1DCRenderTarget} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1dcrendertarget">ID2D1DCRenderTarget</a>**</b>
     * 
     * When this method returns, <i>dcRenderTarget</i> contains the address of the pointer to the  <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1dcrendertarget">ID2D1DCRenderTarget</a> created by the method.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1factory-createdcrendertarget
     */
    CreateDCRenderTarget(renderTargetProperties) {
        result := ComCall(16, this, "ptr", renderTargetProperties, "ptr*", &dcRenderTarget := 0, "HRESULT")
        return ID2D1DCRenderTarget(dcRenderTarget)
    }
}
