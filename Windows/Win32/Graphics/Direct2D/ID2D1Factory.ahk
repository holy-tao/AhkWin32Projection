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
 * Creates Direct2D resources.
 * @remarks
 * 
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
 * 
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d2d1/nn-d2d1-id2d1factory
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
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1factory-reloadsystemmetrics
     */
    ReloadSystemMetrics() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} dpiX 
     * @param {Pointer<Float>} dpiY 
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
     * 
     * @param {Pointer<D2D_RECT_F>} rectangle 
     * @returns {ID2D1RectangleGeometry} 
     * @see https://learn.microsoft.com/windows/win32/Direct2D/id2d1factory-createrectanglegeometry
     */
    CreateRectangleGeometry(rectangle) {
        result := ComCall(5, this, "ptr", rectangle, "ptr*", &rectangleGeometry := 0, "HRESULT")
        return ID2D1RectangleGeometry(rectangleGeometry)
    }

    /**
     * 
     * @param {Pointer<D2D1_ROUNDED_RECT>} roundedRectangle 
     * @returns {ID2D1RoundedRectangleGeometry} 
     * @see https://learn.microsoft.com/windows/win32/Direct2D/id2d1factory-createroundedrectanglegeometry
     */
    CreateRoundedRectangleGeometry(roundedRectangle) {
        result := ComCall(6, this, "ptr", roundedRectangle, "ptr*", &roundedRectangleGeometry := 0, "HRESULT")
        return ID2D1RoundedRectangleGeometry(roundedRectangleGeometry)
    }

    /**
     * 
     * @param {Pointer<D2D1_ELLIPSE>} ellipse 
     * @returns {ID2D1EllipseGeometry} 
     * @see https://learn.microsoft.com/windows/win32/Direct2D/id2d1factory-createellipsegeometry
     */
    CreateEllipseGeometry(ellipse) {
        result := ComCall(7, this, "ptr", ellipse, "ptr*", &ellipseGeometry := 0, "HRESULT")
        return ID2D1EllipseGeometry(ellipseGeometry)
    }

    /**
     * 
     * @param {Integer} fillMode 
     * @param {Pointer<ID2D1Geometry>} geometries 
     * @param {Integer} geometriesCount 
     * @returns {ID2D1GeometryGroup} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1factory-creategeometrygroup
     */
    CreateGeometryGroup(fillMode, geometries, geometriesCount) {
        result := ComCall(8, this, "int", fillMode, "ptr*", geometries, "uint", geometriesCount, "ptr*", &geometryGroup := 0, "HRESULT")
        return ID2D1GeometryGroup(geometryGroup)
    }

    /**
     * 
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
     * 
     * @returns {ID2D1PathGeometry} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1factory-createpathgeometry
     */
    CreatePathGeometry() {
        result := ComCall(10, this, "ptr*", &pathGeometry := 0, "HRESULT")
        return ID2D1PathGeometry(pathGeometry)
    }

    /**
     * 
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
     * 
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
     * 
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
     * 
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
     * 
     * @param {IDXGISurface} dxgiSurface 
     * @param {Pointer<D2D1_RENDER_TARGET_PROPERTIES>} renderTargetProperties 
     * @returns {ID2D1RenderTarget} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1factory-createdxgisurfacerendertarget(idxgisurface_constd2d1_render_target_properties__id2d1rendertarget)
     */
    CreateDxgiSurfaceRenderTarget(dxgiSurface, renderTargetProperties) {
        result := ComCall(15, this, "ptr", dxgiSurface, "ptr", renderTargetProperties, "ptr*", &renderTarget := 0, "HRESULT")
        return ID2D1RenderTarget(renderTarget)
    }

    /**
     * 
     * @param {Pointer<D2D1_RENDER_TARGET_PROPERTIES>} renderTargetProperties 
     * @returns {ID2D1DCRenderTarget} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1factory-createdcrendertarget
     */
    CreateDCRenderTarget(renderTargetProperties) {
        result := ComCall(16, this, "ptr", renderTargetProperties, "ptr*", &dcRenderTarget := 0, "HRESULT")
        return ID2D1DCRenderTarget(dcRenderTarget)
    }
}
