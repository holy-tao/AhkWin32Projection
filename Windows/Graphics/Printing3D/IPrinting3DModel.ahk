#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVector.ahk
#Include .\Printing3DModelTexture.ahk
#Include .\Printing3DMesh.ahk
#Include .\Printing3DComponent.ahk
#Include .\Printing3DMaterial.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Foundation\Collections\IMap.ahk
#Include ..\..\Foundation\IAsyncAction.ahk
#Include .\Printing3DModel.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Printing3D
 * @version WindowsRuntime 1.4
 */
class IPrinting3DModel extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrinting3DModel
     * @type {Guid}
     */
    static IID => Guid("{2d012ef0-52fb-919a-77b0-4b1a3b80324f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Unit", "put_Unit", "get_Textures", "get_Meshes", "get_Components", "get_Material", "put_Material", "get_Build", "put_Build", "get_Version", "put_Version", "get_RequiredExtensions", "get_Metadata", "RepairAsync", "Clone"]

    /**
     * @type {Integer} 
     */
    Unit {
        get => this.get_Unit()
        set => this.put_Unit(value)
    }

    /**
     * @type {IVector<Printing3DModelTexture>} 
     */
    Textures {
        get => this.get_Textures()
    }

    /**
     * @type {IVector<Printing3DMesh>} 
     */
    Meshes {
        get => this.get_Meshes()
    }

    /**
     * @type {IVector<Printing3DComponent>} 
     */
    Components {
        get => this.get_Components()
    }

    /**
     * @type {Printing3DMaterial} 
     */
    Material {
        get => this.get_Material()
        set => this.put_Material(value)
    }

    /**
     * @type {Printing3DComponent} 
     */
    Build {
        get => this.get_Build()
        set => this.put_Build(value)
    }

    /**
     * @type {HSTRING} 
     */
    Version {
        get => this.get_Version()
        set => this.put_Version(value)
    }

    /**
     * @type {IVector<HSTRING>} 
     */
    RequiredExtensions {
        get => this.get_RequiredExtensions()
    }

    /**
     * @type {IMap<HSTRING, HSTRING>} 
     */
    Metadata {
        get => this.get_Metadata()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Unit() {
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
    put_Unit(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IVector<Printing3DModelTexture>} 
     */
    get_Textures() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(Printing3DModelTexture, value)
    }

    /**
     * 
     * @returns {IVector<Printing3DMesh>} 
     */
    get_Meshes() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(Printing3DMesh, value)
    }

    /**
     * 
     * @returns {IVector<Printing3DComponent>} 
     */
    get_Components() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(Printing3DComponent, value)
    }

    /**
     * 
     * @returns {Printing3DMaterial} 
     */
    get_Material() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Printing3DMaterial(value)
    }

    /**
     * 
     * @param {Printing3DMaterial} value 
     * @returns {HRESULT} 
     */
    put_Material(value) {
        result := ComCall(12, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Printing3DComponent} 
     */
    get_Build() {
        result := ComCall(13, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Printing3DComponent(value)
    }

    /**
     * 
     * @param {Printing3DComponent} value 
     * @returns {HRESULT} 
     */
    put_Build(value) {
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
    get_Version() {
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
    put_Version(value) {
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

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_RequiredExtensions() {
        result := ComCall(17, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector((ptr) => HSTRING({ Value: ptr }), value)
    }

    /**
     * 
     * @returns {IMap<HSTRING, HSTRING>} 
     */
    get_Metadata() {
        result := ComCall(18, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMap((ptr) => HSTRING({ Value: ptr }), (ptr) => HSTRING({ Value: ptr }), value)
    }

    /**
     * 
     * @returns {IAsyncAction} 
     */
    RepairAsync() {
        result := ComCall(19, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }

    /**
     * Clone Method Example (VC++)
     * @returns {Printing3DModel} 
     * @see https://learn.microsoft.com/sql/ocs/docs/ado/reference/ado-api/clone-method-example-vc
     */
    Clone() {
        result := ComCall(20, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Printing3DModel(value)
    }
}
