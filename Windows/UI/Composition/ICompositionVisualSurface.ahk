#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\Visual.ahk
#Include ..\..\Foundation\Numerics\Vector2.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class ICompositionVisualSurface extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICompositionVisualSurface
     * @type {Guid}
     */
    static IID => Guid("{b224d803-4f6e-4a3f-8cae-3dc1cda74fc6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SourceVisual", "put_SourceVisual", "get_SourceOffset", "put_SourceOffset", "get_SourceSize", "put_SourceSize"]

    /**
     * @type {Visual} 
     */
    SourceVisual {
        get => this.get_SourceVisual()
        set => this.put_SourceVisual(value)
    }

    /**
     * @type {Vector2} 
     */
    SourceOffset {
        get => this.get_SourceOffset()
        set => this.put_SourceOffset(value)
    }

    /**
     * @type {Vector2} 
     */
    SourceSize {
        get => this.get_SourceSize()
        set => this.put_SourceSize(value)
    }

    /**
     * 
     * @returns {Visual} 
     */
    get_SourceVisual() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Visual(value)
    }

    /**
     * 
     * @param {Visual} value 
     * @returns {HRESULT} 
     */
    put_SourceVisual(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Vector2} 
     */
    get_SourceOffset() {
        value := Vector2()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Vector2} value 
     * @returns {HRESULT} 
     */
    put_SourceOffset(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Vector2} 
     */
    get_SourceSize() {
        value := Vector2()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Vector2} value 
     * @returns {HRESULT} 
     */
    put_SourceSize(value) {
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
