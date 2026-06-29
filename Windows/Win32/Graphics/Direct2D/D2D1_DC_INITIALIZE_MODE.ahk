#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies how a device context is initialized for GDI rendering when it is retrieved from the render target.
 * @remarks
 * Use this enumeration with the <a href="https://docs.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1gdiinteroprendertarget-getdc">ID2D1GdiInteropRenderTarget::GetDC</a> method to specify how the device context is  initialized for GDI rendering.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1/ne-d2d1-d2d1_dc_initialize_mode
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct D2D1_DC_INITIALIZE_MODE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The current contents of the render target are copied to the device context when it is initialized.
     * @type {Integer (Int32)}
     */
    static D2D1_DC_INITIALIZE_MODE_COPY => 0

    /**
     * The device context is cleared to transparent black when it is initialized.
     * @type {Integer (Int32)}
     */
    static D2D1_DC_INITIALIZE_MODE_CLEAR => 1
}
