#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\DXGI_MAPPED_RECT.ahk
#Include .\IDXGIObject.ahk

/**
 * The IDXGIOutputDuplication interface accesses and manipulates the duplicated desktop image.
 * @remarks
 * 
  * A collaboration application can use <b>IDXGIOutputDuplication</b> to access the desktop image. <b>IDXGIOutputDuplication</b> is supported in Desktop Window Manager (DWM) on non-8bpp DirectX full-screen modes and non-8bpp OpenGL full-screen modes. 16-bit or 32-bit GDI non-DWM desktop modes are not supported.
  *         
  * 
  * An application can use <b>IDXGIOutputDuplication</b> on a separate thread to receive the desktop images and to feed them into their specific image-processing pipeline.  The application uses <b>IDXGIOutputDuplication</b> to perform the following operations:
  *           
  * 
  * <ol>
  * <li>Acquire the next desktop image.</li>
  * <li>Retrieve the information that describes the image.</li>
  * <li>Perform an operation on the image. This operation can be as simple as copying the image to a staging buffer so that the application can read the pixel data on the image. The application reads the pixel data  after the application calls <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgisurface-map">IDXGISurface::Map</a>. Alternatively, this operation can be more complex. For example, the application can run some pixel shaders on the updated regions of the image to encode those regions for transmission to a client.
  *           </li>
  * <li>After the application finishes  processing each desktop image, it releases the image, loops to step 1, and repeats the steps. The application repeats these steps until it is finished processing desktop images.</li>
  * </ol>
  * The following components of the operating system can generate the desktop image:
  * 
  * <ul>
  * <li>The DWM by composing the desktop image
  *           </li>
  * <li>A full-screen DirectX or OpenGL application</li>
  * <li>An application by switching to a separate desktop, for example, the secure desktop that is used to display the login screen</li>
  * </ul>
  * All current <b>IDXGIOutputDuplication</b> interfaces become invalid when the operating system switches to a different component that produces the desktop image or when a mode change occurs.  In these situations, the application must destroy its current <b>IDXGIOutputDuplication</b> interface and create a new <b>IDXGIOutputDuplication</b> interface.
  *         
  * 
  * Examples of situations in which <b>IDXGIOutputDuplication</b> becomes invalid are:
  *           
  * 
  * <ul>
  * <li>Desktop switch</li>
  * <li>Mode change</li>
  * <li>Switch from DWM on, DWM off, or other full-screen application
  *           </li>
  * </ul>
  * In these situations, the application must release the <b>IDXGIOutputDuplication</b> interface and must create a new <b>IDXGIOutputDuplication</b> interface for the new content.  If the application does not have the appropriate privilege to the new desktop image, its call to the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgioutput1-duplicateoutput">IDXGIOutput1::DuplicateOutput</a> method fails.
  *         
  * 
  * While the application processes each desktop image, the operating system accumulates all the desktop image updates into a single update. For more information about desktop updates, see <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/desktop-dup-api">Updating the desktop image data</a>.
  *         
  * 
  * The desktop image is always in the <a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT_B8G8R8A8_UNORM</a> format.
  *         
  * 
  * The <b>IDXGIOutputDuplication</b> interface does not exist for Windows Store apps.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//dxgi1_2/nn-dxgi1_2-idxgioutputduplication
 * @namespace Windows.Win32.Graphics.Dxgi
 * @version v4.0.30319
 */
class IDXGIOutputDuplication extends IDXGIObject{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDXGIOutputDuplication
     * @type {Guid}
     */
    static IID => Guid("{191cfac3-a341-470d-b26e-a864f428319c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDesc", "AcquireNextFrame", "GetFrameDirtyRects", "GetFrameMoveRects", "GetFramePointerShape", "MapDesktopSurface", "UnMapDesktopSurface", "ReleaseFrame"]

    /**
     * 
     * @param {Pointer<DXGI_OUTDUPL_DESC>} pDesc 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_2/nf-dxgi1_2-idxgioutputduplication-getdesc
     */
    GetDesc(pDesc) {
        ComCall(7, this, "ptr", pDesc)
    }

    /**
     * 
     * @param {Integer} TimeoutInMilliseconds 
     * @param {Pointer<DXGI_OUTDUPL_FRAME_INFO>} pFrameInfo 
     * @param {Pointer<IDXGIResource>} ppDesktopResource 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_2/nf-dxgi1_2-idxgioutputduplication-acquirenextframe
     */
    AcquireNextFrame(TimeoutInMilliseconds, pFrameInfo, ppDesktopResource) {
        result := ComCall(8, this, "uint", TimeoutInMilliseconds, "ptr", pFrameInfo, "ptr*", ppDesktopResource, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} DirtyRectsBufferSize 
     * @param {Pointer} pDirtyRectsBuffer 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_2/nf-dxgi1_2-idxgioutputduplication-getframedirtyrects
     */
    GetFrameDirtyRects(DirtyRectsBufferSize, pDirtyRectsBuffer) {
        result := ComCall(9, this, "uint", DirtyRectsBufferSize, "ptr", pDirtyRectsBuffer, "uint*", &pDirtyRectsBufferSizeRequired := 0, "HRESULT")
        return pDirtyRectsBufferSizeRequired
    }

    /**
     * 
     * @param {Integer} MoveRectsBufferSize 
     * @param {Pointer} pMoveRectBuffer 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_2/nf-dxgi1_2-idxgioutputduplication-getframemoverects
     */
    GetFrameMoveRects(MoveRectsBufferSize, pMoveRectBuffer) {
        result := ComCall(10, this, "uint", MoveRectsBufferSize, "ptr", pMoveRectBuffer, "uint*", &pMoveRectsBufferSizeRequired := 0, "HRESULT")
        return pMoveRectsBufferSizeRequired
    }

    /**
     * 
     * @param {Integer} PointerShapeBufferSize 
     * @param {Pointer} pPointerShapeBuffer 
     * @param {Pointer<Integer>} pPointerShapeBufferSizeRequired 
     * @param {Pointer<DXGI_OUTDUPL_POINTER_SHAPE_INFO>} pPointerShapeInfo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_2/nf-dxgi1_2-idxgioutputduplication-getframepointershape
     */
    GetFramePointerShape(PointerShapeBufferSize, pPointerShapeBuffer, pPointerShapeBufferSizeRequired, pPointerShapeInfo) {
        pPointerShapeBufferSizeRequiredMarshal := pPointerShapeBufferSizeRequired is VarRef ? "uint*" : "ptr"

        result := ComCall(11, this, "uint", PointerShapeBufferSize, "ptr", pPointerShapeBuffer, pPointerShapeBufferSizeRequiredMarshal, pPointerShapeBufferSizeRequired, "ptr", pPointerShapeInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {DXGI_MAPPED_RECT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_2/nf-dxgi1_2-idxgioutputduplication-mapdesktopsurface
     */
    MapDesktopSurface() {
        pLockedRect := DXGI_MAPPED_RECT()
        result := ComCall(12, this, "ptr", pLockedRect, "HRESULT")
        return pLockedRect
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_2/nf-dxgi1_2-idxgioutputduplication-unmapdesktopsurface
     */
    UnMapDesktopSurface() {
        result := ComCall(13, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_2/nf-dxgi1_2-idxgioutputduplication-releaseframe
     */
    ReleaseFrame() {
        result := ComCall(14, this, "HRESULT")
        return result
    }
}
