#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents a swap chain that is used by desktop media apps to decode video data and show it on a DirectComposition surface.
 * @remarks
 * 
  * Decode swap chains are intended for use primarily with YUV surface formats. When using decode buffers created with an RGB surface format, the <i>TargetRect</i> and <i>DestSize</i> must be set equal to the buffer dimensions. <i>SourceRect</i> cannot exceed the buffer dimensions.
  *       
  * 
  * In clone mode, the decode swap chain is only guaranteed to be shown on the primary output.
  *       
  * 
  * Decode swap chains cannot be used with dirty rects.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//dxgi1_3/nn-dxgi1_3-idxgidecodeswapchain
 * @namespace Windows.Win32.Graphics.Dxgi
 * @version v4.0.30319
 */
class IDXGIDecodeSwapChain extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDXGIDecodeSwapChain
     * @type {Guid}
     */
    static IID => Guid("{2633066b-4514-4c7a-8fd8-12ea98059d18}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["PresentBuffer", "SetSourceRect", "SetTargetRect", "SetDestSize", "GetSourceRect", "GetTargetRect", "GetDestSize", "SetColorSpace", "GetColorSpace"]

    /**
     * 
     * @param {Integer} BufferToPresent 
     * @param {Integer} SyncInterval 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_3/nf-dxgi1_3-idxgidecodeswapchain-presentbuffer
     */
    PresentBuffer(BufferToPresent, SyncInterval, Flags) {
        result := ComCall(3, this, "uint", BufferToPresent, "uint", SyncInterval, "uint", Flags, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} pRect 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_3/nf-dxgi1_3-idxgidecodeswapchain-setsourcerect
     */
    SetSourceRect(pRect) {
        result := ComCall(4, this, "ptr", pRect, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} pRect 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_3/nf-dxgi1_3-idxgidecodeswapchain-settargetrect
     */
    SetTargetRect(pRect) {
        result := ComCall(5, this, "ptr", pRect, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Width 
     * @param {Integer} Height 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_3/nf-dxgi1_3-idxgidecodeswapchain-setdestsize
     */
    SetDestSize(Width, Height) {
        result := ComCall(6, this, "uint", Width, "uint", Height, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} pRect 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_3/nf-dxgi1_3-idxgidecodeswapchain-getsourcerect
     */
    GetSourceRect(pRect) {
        result := ComCall(7, this, "ptr", pRect, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} pRect 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_3/nf-dxgi1_3-idxgidecodeswapchain-gettargetrect
     */
    GetTargetRect(pRect) {
        result := ComCall(8, this, "ptr", pRect, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pWidth 
     * @param {Pointer<Integer>} pHeight 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgi1_3/nf-dxgi1_3-idxgidecodeswapchain-getdestsize
     */
    GetDestSize(pWidth, pHeight) {
        pWidthMarshal := pWidth is VarRef ? "uint*" : "ptr"
        pHeightMarshal := pHeight is VarRef ? "uint*" : "ptr"

        result := ComCall(9, this, pWidthMarshal, pWidth, pHeightMarshal, pHeight, "HRESULT")
        return result
    }

    /**
     * The SetColorSpace function defines the input color space for a given device context.
     * @param {Integer} ColorSpace 
     * @returns {HRESULT} If this function succeeds, the return value is a handle to the <i>hColorSpace</i> being replaced.
     * 
     * If this function fails, the return value is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-setcolorspace
     */
    SetColorSpace(ColorSpace) {
        result := ComCall(10, this, "int", ColorSpace, "HRESULT")
        return result
    }

    /**
     * The GetColorSpace function retrieves the handle to the input color space from a specified device context.
     * @returns {Integer} If the function succeeds, the return value is the current input color space handle.
     * 
     * If this function fails, the return value is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getcolorspace
     */
    GetColorSpace() {
        result := ComCall(11, this, "int")
        return result
    }
}
