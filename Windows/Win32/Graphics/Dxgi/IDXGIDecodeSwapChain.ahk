#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\DXGI_PRESENT.ahk" { DXGI_PRESENT }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\RECT.ahk" { RECT }
#Import ".\DXGI_MULTIPLANE_OVERLAY_YCbCr_FLAGS.ahk" { DXGI_MULTIPLANE_OVERLAY_YCbCr_FLAGS }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Represents a swap chain that is used by desktop media apps to decode video data and show it on a DirectComposition surface.
 * @remarks
 * Decode swap chains are intended for use primarily with YUV surface formats. When using decode buffers created with an RGB surface format, the <i>TargetRect</i> and <i>DestSize</i> must be set equal to the buffer dimensions. <i>SourceRect</i> cannot exceed the buffer dimensions.
 *       
 * 
 * In clone mode, the decode swap chain is only guaranteed to be shown on the primary output.
 *       
 * 
 * Decode swap chains cannot be used with dirty rects.
 * @see https://learn.microsoft.com/windows/win32/api/dxgi1_3/nn-dxgi1_3-idxgidecodeswapchain
 * @namespace Windows.Win32.Graphics.Dxgi
 */
export default struct IDXGIDecodeSwapChain extends IUnknown {
    /**
     * The interface identifier for IDXGIDecodeSwapChain
     * @type {Guid}
     */
    static IID := Guid("{2633066b-4514-4c7a-8fd8-12ea98059d18}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDXGIDecodeSwapChain interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        PresentBuffer : IntPtr
        SetSourceRect : IntPtr
        SetTargetRect : IntPtr
        SetDestSize   : IntPtr
        GetSourceRect : IntPtr
        GetTargetRect : IntPtr
        GetDestSize   : IntPtr
        SetColorSpace : IntPtr
        GetColorSpace : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDXGIDecodeSwapChain.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Presents a frame on the output adapter.
     * @param {Integer} BufferToPresent An index indicating which member of the subresource array to present.
     * @param {Integer} SyncInterval An integer that specifies how to synchronize presentation of a frame with the vertical blank.
     * 
     * 
     * For the bit-block transfer (bitblt) model (<a href="https://docs.microsoft.com/windows/desktop/api/dxgi/ne-dxgi-dxgi_swap_effect">DXGI_SWAP_EFFECT_DISCARD</a> or <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/ne-dxgi-dxgi_swap_effect">DXGI_SWAP_EFFECT_SEQUENTIAL</a>), values are:
     * 
     * <ul>
     * <li>0 - The presentation occurs immediately, there is no synchronization.</li>
     * <li>1,2,3,4 - Synchronize presentation after the <i>n</i>th vertical blank.</li>
     * </ul>
     * For the flip model (<a href="https://docs.microsoft.com/windows/desktop/api/dxgi/ne-dxgi-dxgi_swap_effect">DXGI_SWAP_EFFECT_FLIP_SEQUENTIAL</a>), values are:
     * 
     * <ul>
     * <li>0 - Cancel the remaining time on the previously presented frame and discard this frame if a newer frame is queued.
     * </li>
     * <li>n &gt; 0 - Synchronize presentation for at least <i>n</i> vertical blanks.</li>
     * </ul>
     * @param {DXGI_PRESENT} Flags An integer value that contains swap-chain presentation options. These options are defined by the <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-present">DXGI_PRESENT</a> constants.
     * 
     * The <b>DXGI_PRESENT_USE_DURATION</b> flag must be set if a custom present duration (custom refresh rate) is being used.
     * @returns {HRESULT} This method returns <b>S_OK</b> on success, or it returns one of the following error codes:
     * 
     * <ul>
     * <li><a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-error">DXGI_ERROR_DEVICE_REMOVED</a></li>
     * <li><a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-status">DXGI_STATUS_OCCLUDED</a></li>
     * <li><a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-error">DXGI_ERROR_INVALID_CALL</a></li>
     * <li><b>E_OUTOFMEMORY</b></li>
     * </ul>
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_3/nf-dxgi1_3-idxgidecodeswapchain-presentbuffer
     */
    PresentBuffer(BufferToPresent, SyncInterval, Flags) {
        result := ComCall(3, this, "uint", BufferToPresent, "uint", SyncInterval, DXGI_PRESENT, Flags, Int32)
        return result
    }

    /**
     * Sets the rectangle that defines the source region for the video processing blit operation.
     * @param {Pointer<RECT>} pRect A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure 
     *         that contains the source region to set for the swap chain.
     * @returns {HRESULT} This method returns S_OK on success, or it returns one of the error codes that are described in the <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-error">DXGI_ERROR</a> topic.
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_3/nf-dxgi1_3-idxgidecodeswapchain-setsourcerect
     */
    SetSourceRect(pRect) {
        result := ComCall(4, this, RECT.Ptr, pRect, "HRESULT")
        return result
    }

    /**
     * Sets the rectangle that defines the target region for the video processing blit operation.
     * @param {Pointer<RECT>} pRect A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure 
     *         that contains the target region to set for the swap chain.
     * @returns {HRESULT} This method returns S_OK on success, or it returns one of the error codes that are described in the <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-error">DXGI_ERROR</a> topic.
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_3/nf-dxgi1_3-idxgidecodeswapchain-settargetrect
     */
    SetTargetRect(pRect) {
        result := ComCall(5, this, RECT.Ptr, pRect, "HRESULT")
        return result
    }

    /**
     * Sets the size of the destination surface to use for the video processing blit operation.
     * @param {Integer} Width The width of the destination size, in pixels.
     * @param {Integer} Height The height of the destination size, in pixels.
     * @returns {HRESULT} This method returns S_OK on success, or it returns one of the error codes that are described in the <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-error">DXGI_ERROR</a> topic.
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_3/nf-dxgi1_3-idxgidecodeswapchain-setdestsize
     */
    SetDestSize(Width, Height) {
        result := ComCall(6, this, "uint", Width, "uint", Height, "HRESULT")
        return result
    }

    /**
     * Gets the source region that is used for the swap chain.
     * @returns {RECT} A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure 
     *         that receives the source region for the swap chain.
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_3/nf-dxgi1_3-idxgidecodeswapchain-getsourcerect
     */
    GetSourceRect() {
        pRect := RECT()
        result := ComCall(7, this, RECT.Ptr, pRect, "HRESULT")
        return pRect
    }

    /**
     * Gets the rectangle that defines the target region for the video processing blit operation.
     * @returns {RECT} A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure 
     *         that receives the target region for the swap chain.
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_3/nf-dxgi1_3-idxgidecodeswapchain-gettargetrect
     */
    GetTargetRect() {
        pRect := RECT()
        result := ComCall(8, this, RECT.Ptr, pRect, "HRESULT")
        return pRect
    }

    /**
     * Gets the size of the destination surface to use for the video processing blit operation.
     * @param {Pointer<Integer>} pWidth A pointer to a variable that receives the width in pixels.
     * @param {Pointer<Integer>} pHeight A pointer to a variable that receives the height in pixels.
     * @returns {HRESULT} This method returns S_OK on success, or it returns one of the error codes that are described in the <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-error">DXGI_ERROR</a> topic.
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_3/nf-dxgi1_3-idxgidecodeswapchain-getdestsize
     */
    GetDestSize(pWidth, pHeight) {
        pWidthMarshal := pWidth is VarRef ? "uint*" : "ptr"
        pHeightMarshal := pHeight is VarRef ? "uint*" : "ptr"

        result := ComCall(9, this, pWidthMarshal, pWidth, pHeightMarshal, pHeight, "HRESULT")
        return result
    }

    /**
     * Sets the color space used by the swap chain. (IDXGIDecodeSwapChain.SetColorSpace)
     * @param {DXGI_MULTIPLANE_OVERLAY_YCbCr_FLAGS} ColorSpace A pointer to a combination of <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_3/ne-dxgi1_3-dxgi_multiplane_overlay_ycbcr_flags">DXGI_MULTIPLANE_OVERLAY_YCbCr_FLAGS</a>-typed values that are combined by using a bitwise OR operation. The resulting value specifies the color space to set for the swap chain.
     * @returns {HRESULT} This method returns S_OK on success, or it returns one of the error codes that are described in the <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-error">DXGI_ERROR</a> topic.
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_3/nf-dxgi1_3-idxgidecodeswapchain-setcolorspace
     */
    SetColorSpace(ColorSpace) {
        result := ComCall(10, this, DXGI_MULTIPLANE_OVERLAY_YCbCr_FLAGS, ColorSpace, "HRESULT")
        return result
    }

    /**
     * Gets the color space used by the swap chain.
     * @returns {DXGI_MULTIPLANE_OVERLAY_YCbCr_FLAGS} A combination of <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_3/ne-dxgi1_3-dxgi_multiplane_overlay_ycbcr_flags">DXGI_MULTIPLANE_OVERLAY_YCbCr_FLAGS</a>-typed values that are combined by using a bitwise OR operation. The resulting value specifies the color space for the swap chain.
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_3/nf-dxgi1_3-idxgidecodeswapchain-getcolorspace
     */
    GetColorSpace() {
        result := ComCall(11, this, DXGI_MULTIPLANE_OVERLAY_YCbCr_FLAGS)
        return result
    }

    Query(iid) {
        if (IDXGIDecodeSwapChain.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.PresentBuffer := CallbackCreate(GetMethod(implObj, "PresentBuffer"), flags, 4)
        this.vtbl.SetSourceRect := CallbackCreate(GetMethod(implObj, "SetSourceRect"), flags, 2)
        this.vtbl.SetTargetRect := CallbackCreate(GetMethod(implObj, "SetTargetRect"), flags, 2)
        this.vtbl.SetDestSize := CallbackCreate(GetMethod(implObj, "SetDestSize"), flags, 3)
        this.vtbl.GetSourceRect := CallbackCreate(GetMethod(implObj, "GetSourceRect"), flags, 2)
        this.vtbl.GetTargetRect := CallbackCreate(GetMethod(implObj, "GetTargetRect"), flags, 2)
        this.vtbl.GetDestSize := CallbackCreate(GetMethod(implObj, "GetDestSize"), flags, 3)
        this.vtbl.SetColorSpace := CallbackCreate(GetMethod(implObj, "SetColorSpace"), flags, 2)
        this.vtbl.GetColorSpace := CallbackCreate(GetMethod(implObj, "GetColorSpace"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.PresentBuffer)
        CallbackFree(this.vtbl.SetSourceRect)
        CallbackFree(this.vtbl.SetTargetRect)
        CallbackFree(this.vtbl.SetDestSize)
        CallbackFree(this.vtbl.GetSourceRect)
        CallbackFree(this.vtbl.GetTargetRect)
        CallbackFree(this.vtbl.GetDestSize)
        CallbackFree(this.vtbl.SetColorSpace)
        CallbackFree(this.vtbl.GetColorSpace)
    }
}
