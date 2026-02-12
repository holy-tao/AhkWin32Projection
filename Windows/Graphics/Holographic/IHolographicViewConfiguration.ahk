#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\Foundation\SIZE.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include .\HolographicDisplay.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Holographic
 * @version WindowsRuntime 1.4
 */
class IHolographicViewConfiguration extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHolographicViewConfiguration
     * @type {Guid}
     */
    static IID => Guid("{5c1de6e6-67e9-5004-b02c-67a3a122b576}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_NativeRenderTargetSize", "get_RenderTargetSize", "RequestRenderTargetSize", "get_SupportedPixelFormats", "get_PixelFormat", "put_PixelFormat", "get_IsStereo", "get_RefreshRate", "get_Kind", "get_Display", "get_IsEnabled", "put_IsEnabled"]

    /**
     * @type {SIZE} 
     */
    NativeRenderTargetSize {
        get => this.get_NativeRenderTargetSize()
    }

    /**
     * @type {SIZE} 
     */
    RenderTargetSize {
        get => this.get_RenderTargetSize()
    }

    /**
     * @type {IVectorView<Integer>} 
     */
    SupportedPixelFormats {
        get => this.get_SupportedPixelFormats()
    }

    /**
     * @type {Integer} 
     */
    PixelFormat {
        get => this.get_PixelFormat()
        set => this.put_PixelFormat(value)
    }

    /**
     * @type {Boolean} 
     */
    IsStereo {
        get => this.get_IsStereo()
    }

    /**
     * @type {Float} 
     */
    RefreshRate {
        get => this.get_RefreshRate()
    }

    /**
     * @type {Integer} 
     */
    Kind {
        get => this.get_Kind()
    }

    /**
     * @type {HolographicDisplay} 
     */
    Display {
        get => this.get_Display()
    }

    /**
     * @type {Boolean} 
     */
    IsEnabled {
        get => this.get_IsEnabled()
        set => this.put_IsEnabled(value)
    }

    /**
     * 
     * @returns {SIZE} 
     */
    get_NativeRenderTargetSize() {
        value := SIZE()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {SIZE} 
     */
    get_RenderTargetSize() {
        value := SIZE()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {SIZE} size_ 
     * @returns {SIZE} 
     */
    RequestRenderTargetSize(size_) {
        result_ := SIZE()
        result := ComCall(8, this, "ptr", size_, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {IVectorView<Integer>} 
     */
    get_SupportedPixelFormats() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => IPropertyValue(ptr).GetInt32(), value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PixelFormat() {
        result := ComCall(10, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_PixelFormat(value) {
        result := ComCall(11, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsStereo() {
        result := ComCall(12, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_RefreshRate() {
        result := ComCall(13, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Kind() {
        result := ComCall(14, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HolographicDisplay} 
     */
    get_Display() {
        result := ComCall(15, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HolographicDisplay(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsEnabled() {
        result := ComCall(16, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsEnabled(value) {
        result := ComCall(17, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
