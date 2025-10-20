#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID2D1RenderTarget.ahk

/**
 * Issues drawing commands to a GDI device context.
 * @remarks
 * 
  * <h3><a id="Creating_ID2D1DCRenderTarget_Objects"></a><a id="creating_id2d1dcrendertarget_objects"></a><a id="CREATING_ID2D1DCRENDERTARGET_OBJECTS"></a>Creating ID2D1DCRenderTarget Objects</h3>
  * To create an <b>ID2D1DCRenderTarget</b>, use the <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1factory-createdcrendertarget">ID2D1Factory::CreateDCRenderTarget</a> method.
  * 
  * Before you can render with the DC render target, you must use its <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1dcrendertarget-binddc">BindDC</a> method to associate it with a GDI DC.  You do this each time you  use a different DC, or the size of the area you want to draw to changes.
  * 
  * To enable the DC render target to work with GDI, set its pixel format to <a href="https://docs.microsoft.com/windows/win32/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT_B8G8R8A8_UNORM</a> and its alpha mode to <a href="https://docs.microsoft.com/windows/win32/api/dcommon/ne-dcommon-d2d1_alpha_mode">D2D1_ALPHA_MODE_PREMULTIPLIED</a> or <b>D2D1_ALPHA_MODE_IGNORE</b>.
  * 
  * Your application should create render targets once and hold onto them for the life of the application or until the render target's  <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1rendertarget-enddraw">EndDraw</a> method returns the <a href="https://docs.microsoft.com/windows/win32/Direct2D/direct2d-error-codes">D2DERR_RECREATE_TARGET</a>  error. When you receive this error, you need to recreate the render target (and any resources it created).
  * 
  * <h3><a id="ID2D1DCRenderTargets__GDI_Transforms__and_Right-to-Left_Language_Builds_of_Windows"></a><a id="id2d1dcrendertargets__gdi_transforms__and_right-to-left_language_builds_of_windows"></a><a id="ID2D1DCRENDERTARGETS__GDI_TRANSFORMS__AND_RIGHT-TO-LEFT_LANGUAGE_BUILDS_OF_WINDOWS"></a>ID2D1DCRenderTargets, GDI Transforms, and Right-to-Left Language Builds of Windows</h3>
  * When you use an <b>ID2D1DCRenderTarget</b>, it renders Direct2D content to an internal bitmap, and then renders the bitmap to the DC with GDI. 
  * 
  * It's possible for GDI to apply a GDI transform  (through the <a href="https://docs.microsoft.com/windows/win32/api/wingdi/nf-wingdi-setworldtransform">SetWorldTransform</a> method) or other effect to the same DC used by the render target, in which case GDI transforms the bitmap produced by Direct2D. Using a GDI transform to transform the Direct2D content has the potential to degrade the visual quality of the output, because you're transforming a bitmap for which antialiasing and subpixel positioning have already been calculated.
  * 
  * For example, suppose you use the render target to draw a scene that contains antialiased geometries and text. If you use a GDI transform to apply a scale transform to the DC and scale the scene so that it's 10 times larger, you'll see pixelization and jagged edges. (If, however, you applied a similar transform using Direct2D, the visual quality of the scene would not be degraded.)
  * 
  * In some cases, it might not be obvious that GDI is performing additional processing that might degrade the quality of the Direct2D content. For example, on a right-to-left (RTL) build of Windows, content rendered by an <b>ID2D1DCRenderTarget</b> might be horizontally inverted when GDI copies it to its destination.   Whether the content is actually inverted depends on the current settings of the DC.
  * 
  * Depending on the type of content being rendered, you might want to prevent the inversion. If the Direct2D content includes ClearType text, this inversion will degrade the quality of the text.
  * 
  * You can control RTL rendering behavior by using the <a href="https://docs.microsoft.com/windows/win32/api/wingdi/nf-wingdi-setlayout">SetLayout</a> GDI function.  To  prevent the mirroring, call the <b>SetLayout</b> GDI function and specify <b>LAYOUT_BITMAPORIENTATIONPRESERVED</b>as the only value for the second parameter (do not combine it with <b>LAYOUT_RTL</b>), as shown in the following example:
  * 
  * 
  * ```cpp
  * SetLayout(m_hwnd, LAYOUT_BITMAPORIENTATIONPRESERVED);
  * ```
  * 
  * 
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d2d1/nn-d2d1-id2d1dcrendertarget
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class ID2D1DCRenderTarget extends ID2D1RenderTarget{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID2D1DCRenderTarget
     * @type {Guid}
     */
    static IID => Guid("{1c51bc64-de61-46fd-9899-63a5d8f03950}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 57

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["BindDC"]

    /**
     * 
     * @param {HDC} hDC 
     * @param {Pointer<RECT>} pSubRect 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1dcrendertarget-binddc
     */
    BindDC(hDC, pSubRect) {
        hDC := hDC is Win32Handle ? NumGet(hDC, "ptr") : hDC

        result := ComCall(57, this, "ptr", hDC, "ptr", pSubRect, "HRESULT")
        return result
    }
}
