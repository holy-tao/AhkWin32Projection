#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Display.Core
 * @version WindowsRuntime 1.4
 */
class IHdmiDisplayMode extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHdmiDisplayMode
     * @type {Guid}
     */
    static IID => Guid("{0c06d5ad-1b90-4f51-9981-ef5a1c0ddf66}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ResolutionWidthInRawPixels", "get_ResolutionHeightInRawPixels", "get_RefreshRate", "get_StereoEnabled", "get_BitsPerPixel", "IsEqual", "get_ColorSpace", "get_PixelEncoding", "get_IsSdrLuminanceSupported", "get_IsSmpte2084Supported", "get_Is2086MetadataSupported"]

    /**
     * @type {Integer} 
     */
    ResolutionWidthInRawPixels {
        get => this.get_ResolutionWidthInRawPixels()
    }

    /**
     * @type {Integer} 
     */
    ResolutionHeightInRawPixels {
        get => this.get_ResolutionHeightInRawPixels()
    }

    /**
     * @type {Float} 
     */
    RefreshRate {
        get => this.get_RefreshRate()
    }

    /**
     * @type {Boolean} 
     */
    StereoEnabled {
        get => this.get_StereoEnabled()
    }

    /**
     * @type {Integer} 
     */
    BitsPerPixel {
        get => this.get_BitsPerPixel()
    }

    /**
     * @type {Integer} 
     */
    ColorSpace {
        get => this.get_ColorSpace()
    }

    /**
     * @type {Integer} 
     */
    PixelEncoding {
        get => this.get_PixelEncoding()
    }

    /**
     * @type {Boolean} 
     */
    IsSdrLuminanceSupported {
        get => this.get_IsSdrLuminanceSupported()
    }

    /**
     * @type {Boolean} 
     */
    IsSmpte2084Supported {
        get => this.get_IsSmpte2084Supported()
    }

    /**
     * @type {Boolean} 
     */
    Is2086MetadataSupported {
        get => this.get_Is2086MetadataSupported()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ResolutionWidthInRawPixels() {
        result := ComCall(6, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ResolutionHeightInRawPixels() {
        result := ComCall(7, this, "uint*", &value := 0, "int")
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
        result := ComCall(8, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_StereoEnabled() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BitsPerPixel() {
        result := ComCall(10, this, "ushort*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Evaluates to a Boolean value that indicates whether two CLSIDs are equal.
     * @param {HdmiDisplayMode} mode_ 
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/windows/win32/api//content/guiddef/nf-guiddef-isequalclsid
     */
    IsEqual(mode_) {
        result := ComCall(11, this, "ptr", mode_, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ColorSpace() {
        result := ComCall(12, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PixelEncoding() {
        result := ComCall(13, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsSdrLuminanceSupported() {
        result := ComCall(14, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsSmpte2084Supported() {
        result := ComCall(15, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Is2086MetadataSupported() {
        result := ComCall(16, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
