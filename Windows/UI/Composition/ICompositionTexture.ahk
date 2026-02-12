#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Graphics\RectInt32.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class ICompositionTexture extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICompositionTexture
     * @type {Guid}
     */
    static IID => Guid("{347d03a0-1c0a-4c0b-b232-8570b2b1a4ea}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SourceRect", "put_SourceRect", "get_AlphaMode", "put_AlphaMode", "get_ColorSpace", "put_ColorSpace"]

    /**
     * @type {RectInt32} 
     */
    SourceRect {
        get => this.get_SourceRect()
        set => this.put_SourceRect(value)
    }

    /**
     * @type {Integer} 
     */
    AlphaMode {
        get => this.get_AlphaMode()
        set => this.put_AlphaMode(value)
    }

    /**
     * @type {Integer} 
     */
    ColorSpace {
        get => this.get_ColorSpace()
        set => this.put_ColorSpace(value)
    }

    /**
     * 
     * @returns {RectInt32} 
     */
    get_SourceRect() {
        value := RectInt32()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {RectInt32} value 
     * @returns {HRESULT} 
     */
    put_SourceRect(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AlphaMode() {
        result := ComCall(8, this, "int*", &value := 0, "int")
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
    put_AlphaMode(value) {
        result := ComCall(9, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ColorSpace() {
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
    put_ColorSpace(value) {
        result := ComCall(11, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
