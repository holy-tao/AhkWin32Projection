#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Storage\Streams\IBuffer.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Perception.Spatial.Surfaces
 * @version WindowsRuntime 1.4
 */
class ISpatialSurfaceMeshBuffer extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpatialSurfaceMeshBuffer
     * @type {Guid}
     */
    static IID => Guid("{93cf59e0-871f-33f8-98b2-03d101458f6f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Format", "get_Stride", "get_ElementCount", "get_Data"]

    /**
     * @type {Integer} 
     */
    Format {
        get => this.get_Format()
    }

    /**
     * @type {Integer} 
     */
    Stride {
        get => this.get_Stride()
    }

    /**
     * @type {Integer} 
     */
    ElementCount {
        get => this.get_ElementCount()
    }

    /**
     * @type {IBuffer} 
     */
    Data {
        get => this.get_Data()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Format() {
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
    get_Stride() {
        result := ComCall(7, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ElementCount() {
        result := ComCall(8, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_Data() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IBuffer(value)
    }
}
