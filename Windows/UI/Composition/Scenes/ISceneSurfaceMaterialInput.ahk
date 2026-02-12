#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\ICompositionSurface.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Composition.Scenes
 * @version WindowsRuntime 1.4
 */
class ISceneSurfaceMaterialInput extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISceneSurfaceMaterialInput
     * @type {Guid}
     */
    static IID => Guid("{9937da5c-a9ca-4cfc-b3aa-088356518742}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_BitmapInterpolationMode", "put_BitmapInterpolationMode", "get_Surface", "put_Surface", "get_WrappingUMode", "put_WrappingUMode", "get_WrappingVMode", "put_WrappingVMode"]

    /**
     * @type {Integer} 
     */
    BitmapInterpolationMode {
        get => this.get_BitmapInterpolationMode()
        set => this.put_BitmapInterpolationMode(value)
    }

    /**
     * @type {ICompositionSurface} 
     */
    Surface {
        get => this.get_Surface()
        set => this.put_Surface(value)
    }

    /**
     * @type {Integer} 
     */
    WrappingUMode {
        get => this.get_WrappingUMode()
        set => this.put_WrappingUMode(value)
    }

    /**
     * @type {Integer} 
     */
    WrappingVMode {
        get => this.get_WrappingVMode()
        set => this.put_WrappingVMode(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BitmapInterpolationMode() {
        result := ComCall(6, this, "int*", &value := 0, "int")
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
    put_BitmapInterpolationMode(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {ICompositionSurface} 
     */
    get_Surface() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ICompositionSurface(value)
    }

    /**
     * 
     * @param {ICompositionSurface} value 
     * @returns {HRESULT} 
     */
    put_Surface(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_WrappingUMode() {
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
    put_WrappingUMode(value) {
        result := ComCall(11, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_WrappingVMode() {
        result := ComCall(12, this, "int*", &value := 0, "int")
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
    put_WrappingVMode(value) {
        result := ComCall(13, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
