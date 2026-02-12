#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Graphics\SizeInt32.ahk
#Include .\CompositionDrawingSurface.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class ICompositionMipmapSurface extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICompositionMipmapSurface
     * @type {Guid}
     */
    static IID => Guid("{4863675c-cf4a-4b1c-9ece-c5ec0c2b2fe6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_LevelCount", "get_AlphaMode", "get_PixelFormat", "get_SizeInt32", "GetDrawingSurfaceForLevel"]

    /**
     * @type {Integer} 
     */
    LevelCount {
        get => this.get_LevelCount()
    }

    /**
     * @type {Integer} 
     */
    AlphaMode {
        get => this.get_AlphaMode()
    }

    /**
     * @type {Integer} 
     */
    PixelFormat {
        get => this.get_PixelFormat()
    }

    /**
     * @type {SizeInt32} 
     */
    SizeInt32 {
        get => this.get_SizeInt32()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LevelCount() {
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
    get_AlphaMode() {
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
    get_PixelFormat() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {SizeInt32} 
     */
    get_SizeInt32() {
        value := SizeInt32()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} level 
     * @returns {CompositionDrawingSurface} 
     */
    GetDrawingSurfaceForLevel(level) {
        result := ComCall(10, this, "uint", level, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CompositionDrawingSurface(result_)
    }
}
