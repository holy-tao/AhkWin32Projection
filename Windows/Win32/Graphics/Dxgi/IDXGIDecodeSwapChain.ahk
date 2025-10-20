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
     * 
     * @param {Integer} BufferToPresent 
     * @param {Integer} SyncInterval 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     */
    PresentBuffer(BufferToPresent, SyncInterval, Flags) {
        result := ComCall(3, this, "uint", BufferToPresent, "uint", SyncInterval, "uint", Flags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} pRect 
     * @returns {HRESULT} 
     */
    SetSourceRect(pRect) {
        result := ComCall(4, this, "ptr", pRect, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} pRect 
     * @returns {HRESULT} 
     */
    SetTargetRect(pRect) {
        result := ComCall(5, this, "ptr", pRect, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Width 
     * @param {Integer} Height 
     * @returns {HRESULT} 
     */
    SetDestSize(Width, Height) {
        result := ComCall(6, this, "uint", Width, "uint", Height, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} pRect 
     * @returns {HRESULT} 
     */
    GetSourceRect(pRect) {
        result := ComCall(7, this, "ptr", pRect, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} pRect 
     * @returns {HRESULT} 
     */
    GetTargetRect(pRect) {
        result := ComCall(8, this, "ptr", pRect, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pWidth 
     * @param {Pointer<UInt32>} pHeight 
     * @returns {HRESULT} 
     */
    GetDestSize(pWidth, pHeight) {
        result := ComCall(9, this, "uint*", pWidth, "uint*", pHeight, "int")
        if(result != 0)
            throw OSError(result)

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
        result := ComCall(10, this, "int", ColorSpace, "int")
        if(result != 0)
            throw OSError(result)

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
