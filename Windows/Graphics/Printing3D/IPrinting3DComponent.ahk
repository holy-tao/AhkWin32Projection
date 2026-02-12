#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\Printing3DMesh.ahk
#Include ..\..\Foundation\Collections\IVector.ahk
#Include .\Printing3DComponentWithMatrix.ahk
#Include .\Printing3DTextureResource.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Printing3D
 * @version WindowsRuntime 1.4
 */
class IPrinting3DComponent extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrinting3DComponent
     * @type {Guid}
     */
    static IID => Guid("{7e287845-bf7f-4cdb-a27f-30a01437fede}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Mesh", "put_Mesh", "get_Components", "get_Thumbnail", "put_Thumbnail", "get_Type", "put_Type", "get_Name", "put_Name", "get_PartNumber", "put_PartNumber"]

    /**
     * @type {Printing3DMesh} 
     */
    Mesh {
        get => this.get_Mesh()
        set => this.put_Mesh(value)
    }

    /**
     * @type {IVector<Printing3DComponentWithMatrix>} 
     */
    Components {
        get => this.get_Components()
    }

    /**
     * @type {Printing3DTextureResource} 
     */
    Thumbnail {
        get => this.get_Thumbnail()
        set => this.put_Thumbnail(value)
    }

    /**
     * @type {Integer} 
     */
    Type {
        get => this.get_Type()
        set => this.put_Type(value)
    }

    /**
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
        set => this.put_Name(value)
    }

    /**
     * @type {HSTRING} 
     */
    PartNumber {
        get => this.get_PartNumber()
        set => this.put_PartNumber(value)
    }

    /**
     * 
     * @returns {Printing3DMesh} 
     */
    get_Mesh() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Printing3DMesh(value)
    }

    /**
     * 
     * @param {Printing3DMesh} value 
     * @returns {HRESULT} 
     */
    put_Mesh(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IVector<Printing3DComponentWithMatrix>} 
     */
    get_Components() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(Printing3DComponentWithMatrix, value)
    }

    /**
     * 
     * @returns {Printing3DTextureResource} 
     */
    get_Thumbnail() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
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
    put_Thumbnail(value) {
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Type() {
        result := ComCall(11, this, "int*", &value := 0, "int")
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
    put_Type(value) {
        result := ComCall(12, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Name() {
        value := HSTRING()
        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Name(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(14, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PartNumber() {
        value := HSTRING()
        result := ComCall(15, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_PartNumber(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(16, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
