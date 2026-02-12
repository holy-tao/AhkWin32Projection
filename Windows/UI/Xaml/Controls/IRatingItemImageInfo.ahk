#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Media\ImageSource.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IRatingItemImageInfo extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRatingItemImageInfo
     * @type {Guid}
     */
    static IID => Guid("{25240e8c-e0d2-490e-b8f8-96c8ee0512b9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DisabledImage", "put_DisabledImage", "get_Image", "put_Image", "get_PlaceholderImage", "put_PlaceholderImage", "get_PointerOverImage", "put_PointerOverImage", "get_PointerOverPlaceholderImage", "put_PointerOverPlaceholderImage", "get_UnsetImage", "put_UnsetImage"]

    /**
     * @type {ImageSource} 
     */
    DisabledImage {
        get => this.get_DisabledImage()
        set => this.put_DisabledImage(value)
    }

    /**
     * @type {ImageSource} 
     */
    Image {
        get => this.get_Image()
        set => this.put_Image(value)
    }

    /**
     * @type {ImageSource} 
     */
    PlaceholderImage {
        get => this.get_PlaceholderImage()
        set => this.put_PlaceholderImage(value)
    }

    /**
     * @type {ImageSource} 
     */
    PointerOverImage {
        get => this.get_PointerOverImage()
        set => this.put_PointerOverImage(value)
    }

    /**
     * @type {ImageSource} 
     */
    PointerOverPlaceholderImage {
        get => this.get_PointerOverPlaceholderImage()
        set => this.put_PointerOverPlaceholderImage(value)
    }

    /**
     * @type {ImageSource} 
     */
    UnsetImage {
        get => this.get_UnsetImage()
        set => this.put_UnsetImage(value)
    }

    /**
     * 
     * @returns {ImageSource} 
     */
    get_DisabledImage() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ImageSource(value)
    }

    /**
     * 
     * @param {ImageSource} value 
     * @returns {HRESULT} 
     */
    put_DisabledImage(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {ImageSource} 
     */
    get_Image() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ImageSource(value)
    }

    /**
     * 
     * @param {ImageSource} value 
     * @returns {HRESULT} 
     */
    put_Image(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {ImageSource} 
     */
    get_PlaceholderImage() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ImageSource(value)
    }

    /**
     * 
     * @param {ImageSource} value 
     * @returns {HRESULT} 
     */
    put_PlaceholderImage(value) {
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {ImageSource} 
     */
    get_PointerOverImage() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ImageSource(value)
    }

    /**
     * 
     * @param {ImageSource} value 
     * @returns {HRESULT} 
     */
    put_PointerOverImage(value) {
        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {ImageSource} 
     */
    get_PointerOverPlaceholderImage() {
        result := ComCall(14, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ImageSource(value)
    }

    /**
     * 
     * @param {ImageSource} value 
     * @returns {HRESULT} 
     */
    put_PointerOverPlaceholderImage(value) {
        result := ComCall(15, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {ImageSource} 
     */
    get_UnsetImage() {
        result := ComCall(16, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ImageSource(value)
    }

    /**
     * 
     * @param {ImageSource} value 
     * @returns {HRESULT} 
     */
    put_UnsetImage(value) {
        result := ComCall(17, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
