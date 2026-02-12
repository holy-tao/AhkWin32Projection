#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\Printing3DModelTexture.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Printing3D
 * @version WindowsRuntime 1.4
 */
class IPrinting3DTexture2CoordMaterial extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrinting3DTexture2CoordMaterial
     * @type {Guid}
     */
    static IID => Guid("{8d844bfb-07e9-4986-9833-8dd3d48c6859}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Texture", "put_Texture", "get_U", "put_U", "get_V", "put_V"]

    /**
     * @type {Printing3DModelTexture} 
     */
    Texture {
        get => this.get_Texture()
        set => this.put_Texture(value)
    }

    /**
     * @type {Float} 
     */
    U {
        get => this.get_U()
        set => this.put_U(value)
    }

    /**
     * @type {Float} 
     */
    V {
        get => this.get_V()
        set => this.put_V(value)
    }

    /**
     * 
     * @returns {Printing3DModelTexture} 
     */
    get_Texture() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Printing3DModelTexture(value)
    }

    /**
     * 
     * @param {Printing3DModelTexture} value 
     * @returns {HRESULT} 
     */
    put_Texture(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_U() {
        result := ComCall(8, this, "double*", &value := 0, "int")
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
    put_U(value) {
        result := ComCall(9, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_V() {
        result := ComCall(10, this, "double*", &value := 0, "int")
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
    put_V(value) {
        result := ComCall(11, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
