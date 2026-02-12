#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\Printing3DTextureResource.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Printing3D
 * @version WindowsRuntime 1.4
 */
class IPrinting3DModelTexture extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrinting3DModelTexture
     * @type {Guid}
     */
    static IID => Guid("{5dafcf01-b59d-483c-97bb-a4d546d1c75c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_TextureResource", "put_TextureResource", "get_TileStyleU", "put_TileStyleU", "get_TileStyleV", "put_TileStyleV"]

    /**
     * @type {Printing3DTextureResource} 
     */
    TextureResource {
        get => this.get_TextureResource()
        set => this.put_TextureResource(value)
    }

    /**
     * @type {Integer} 
     */
    TileStyleU {
        get => this.get_TileStyleU()
        set => this.put_TileStyleU(value)
    }

    /**
     * @type {Integer} 
     */
    TileStyleV {
        get => this.get_TileStyleV()
        set => this.put_TileStyleV(value)
    }

    /**
     * 
     * @returns {Printing3DTextureResource} 
     */
    get_TextureResource() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Printing3DTextureResource(value)
    }

    /**
     * 
     * @param {Printing3DTextureResource} value 
     * @returns {HRESULT} 
     */
    put_TextureResource(value) {
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
    get_TileStyleU() {
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
    put_TileStyleU(value) {
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
    get_TileStyleV() {
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
    put_TileStyleV(value) {
        result := ComCall(11, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
