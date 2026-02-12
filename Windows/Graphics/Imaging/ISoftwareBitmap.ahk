#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\BitmapBuffer.ahk
#Include .\SoftwareBitmap.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Represents a software bitmap.
 * @see https://learn.microsoft.com/windows/win32/api//content/windows.graphics.imaging.interop/nn-windows-graphics-imaging-interop-isoftwarebitmapnative
 * @namespace Windows.Graphics.Imaging
 * @version WindowsRuntime 1.4
 */
class ISoftwareBitmap extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISoftwareBitmap
     * @type {Guid}
     */
    static IID => Guid("{689e0708-7eef-483f-963f-da938818e073}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_BitmapPixelFormat", "get_BitmapAlphaMode", "get_PixelWidth", "get_PixelHeight", "get_IsReadOnly", "put_DpiX", "get_DpiX", "put_DpiY", "get_DpiY", "LockBuffer", "CopyTo", "CopyFromBuffer", "CopyToBuffer", "GetReadOnlyView"]

    /**
     * @type {Integer} 
     */
    BitmapPixelFormat {
        get => this.get_BitmapPixelFormat()
    }

    /**
     * @type {Integer} 
     */
    BitmapAlphaMode {
        get => this.get_BitmapAlphaMode()
    }

    /**
     * @type {Integer} 
     */
    PixelWidth {
        get => this.get_PixelWidth()
    }

    /**
     * @type {Integer} 
     */
    PixelHeight {
        get => this.get_PixelHeight()
    }

    /**
     * @type {Boolean} 
     */
    IsReadOnly {
        get => this.get_IsReadOnly()
    }

    /**
     * @type {Float} 
     */
    DpiX {
        get => this.get_DpiX()
        set => this.put_DpiX(value)
    }

    /**
     * @type {Float} 
     */
    DpiY {
        get => this.get_DpiY()
        set => this.put_DpiY(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BitmapPixelFormat() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BitmapAlphaMode() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PixelWidth() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PixelHeight() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsReadOnly() {
        result := ComCall(10, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_DpiX(value) {
        result := ComCall(11, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_DpiX() {
        result := ComCall(12, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_DpiY(value) {
        result := ComCall(13, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_DpiY() {
        result := ComCall(14, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} mode_ 
     * @returns {BitmapBuffer} 
     */
    LockBuffer(mode_) {
        result := ComCall(15, this, "int", mode_, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return BitmapBuffer(value)
    }

    /**
     * CopyTo Method (ADO)
     * @remarks
     * This method copies the specified number of characters or bytes, starting from the current position specified by the [Position](./position-property-ado.md) property. If the specified number is more than the available number of bytes until **EOS**, then only characters or bytes from the current position to **EOS** are copied. If the value of *NumChars* is -1, or omitted, all characters or bytes starting from the current position are copied.  
     *   
     *  If there are existing characters or bytes in the destination stream, all contents beyond the point where the copy ends remain, and are not truncated. **Position** becomes the byte immediately following the last byte copied. If you want to truncate these bytes, call [SetEOS](./seteos-method.md).  
     *   
     *  **CopyTo** should be used to copy data to a destination **Stream** of the same type as the source **Stream** (their **Type** property settings are both **adTypeText** or both **adTypeBinary**). For text **Stream** objects, you can change the [Charset](./charset-property-ado.md) property setting of the destination **Stream** to translate from one character set to another. Also, text **Stream** objects can be successfully copied into binary **Stream** objects, but binary **Stream** objects cannot be copied into text **Stream** objects.
     * @param {SoftwareBitmap} bitmap_ 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/ado/reference/ado-api/copyto-method-ado
     */
    CopyTo(bitmap_) {
        result := ComCall(16, this, "ptr", bitmap_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IBuffer} buffer_ 
     * @returns {HRESULT} 
     */
    CopyFromBuffer(buffer_) {
        result := ComCall(17, this, "ptr", buffer_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IBuffer} buffer_ 
     * @returns {HRESULT} 
     */
    CopyToBuffer(buffer_) {
        result := ComCall(18, this, "ptr", buffer_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {SoftwareBitmap} 
     */
    GetReadOnlyView() {
        result := ComCall(19, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SoftwareBitmap(value)
    }
}
