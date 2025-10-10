#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes information about present that helps the operating system optimize presentation.
 * @remarks
 * 
  * This structure is used by the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nf-dxgi1_2-idxgiswapchain1-present1">Present1</a> method.
  * 
  * The scroll rectangle and the list of dirty rectangles could overlap.  In this situation, the dirty rectangles take priority. Applications can then have pieces of dynamic content on top of a scrolled area. For example, an application could scroll a page and play video at the same time.
  * 
  * The following diagram and coordinates illustrate this example.
  * 
  * <img alt="Illustration of scroll and dirty rectangles overlapping" border="" src="./images/DXGIPresentParam.png"/>
  * <pre class="syntax" xml:space="preserve"><code>DirtyRectsCount = 2
  * pDirtyRects[ 0 ] = { 10, 30, 40, 50 } // Video
  * pDirtyRects[ 1 ] = { 0, 70, 50, 80 } // New line
  * *pScrollRect = { 0, 0, 50, 70 }
  * *pScrollOffset = { 0, -10 }
  * </code></pre>
  * Parts of the previous frame and content that the application renders are combined to produce the final frame that the operating system presents on the display screen. Most of the window is scrolled from the previous frame. The  application must update the video frame with the new chunk of content that appears due to scrolling.
  * 
  * The dashed rectangle shows the scroll rectangle in the current frame. The scroll rectangle is  specified by the <b>pScrollRect</b> member.
  * The arrow shows the scroll offset. The scroll offset is specified by the <b>pScrollOffset</b> member.
  * Filled rectangles show dirty rectangles that the application updated with new content. The filled rectangles are specified by the <b>DirtyRectsCount</b> and <b>pDirtyRects</b> members.
  * 
  * The scroll rectangle and offset are not supported for the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/ne-dxgi-dxgi_swap_effect">DXGI_SWAP_EFFECT_DISCARD</a> or <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/ne-dxgi-dxgi_swap_effect">DXGI_SWAP_EFFECT_SEQUENTIAL</a> present option. Dirty rectangles and scroll rectangle are not supported for multisampled swap chains.
  * 
  * The actual implementation of composition and necessary bitblts is different for the bitblt model and the flip model. For more info about these models, see <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-flip-model">DXGI Flip Model</a>.
  * 
  * For more info about the flip-model swap chain and optimizing presentation, see <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-1-2-presentation-improvements">Enhancing presentation with the flip model, dirty rectangles, and scrolled areas</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//dxgi1_2/ns-dxgi1_2-dxgi_present_parameters
 * @namespace Windows.Win32.Graphics.Dxgi
 * @version v4.0.30319
 */
class DXGI_PRESENT_PARAMETERS extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * The number of updated rectangles that you update in the back buffer for the presented frame. The operating system uses this information to optimize presentation. You can set this member to 0 to indicate that you update the whole frame.
     * @type {Integer}
     */
    DirtyRectsCount {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A list of updated rectangles that you update in the back buffer for the presented frame. An application must update every single pixel in each rectangle that it reports to the runtime; the application cannot assume that the pixels are saved from the previous frame. For more information about updating dirty rectangles, see Remarks. You can set this member to <b>NULL</b> if <b>DirtyRectsCount</b> is 0. An application must not update any pixel outside of the dirty rectangles.
     * @type {Pointer<RECT>}
     */
    pDirtyRects {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * A pointer to the scrolled rectangle. The scrolled rectangle is the rectangle of the previous frame from which the runtime bit-block transfers (bitblts) content. The runtime also uses the scrolled rectangle to optimize presentation in terminal server and indirect display scenarios.
     * 
     * The scrolled rectangle also describes the destination rectangle, that is, the region on the current frame that is filled with scrolled content. You can set this member to <b>NULL</b> to indicate that no content is scrolled from the previous frame.
     * @type {Pointer<RECT>}
     */
    pScrollRect {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * A pointer to the offset of the scrolled area that goes from the source rectangle (of previous frame) to the destination rectangle (of current frame). You can set this member to <b>NULL</b> to indicate no offset.
     * @type {Pointer<POINT>}
     */
    pScrollOffset {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
