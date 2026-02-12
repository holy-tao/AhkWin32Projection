#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVector.ahk
#Include .\Printing3DCompositeMaterial.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Printing3D
 * @version WindowsRuntime 1.4
 */
class IPrinting3DCompositeMaterialGroup extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrinting3DCompositeMaterialGroup
     * @type {Guid}
     */
    static IID => Guid("{8d946a5b-40f1-496d-a5fb-340a5a678e30}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Composites", "get_MaterialGroupId", "get_MaterialIndices"]

    /**
     * @type {IVector<Printing3DCompositeMaterial>} 
     */
    Composites {
        get => this.get_Composites()
    }

    /**
     * @type {Integer} 
     */
    MaterialGroupId {
        get => this.get_MaterialGroupId()
    }

    /**
     * @type {IVector<Integer>} 
     */
    MaterialIndices {
        get => this.get_MaterialIndices()
    }

    /**
     * 
     * @returns {IVector<Printing3DCompositeMaterial>} 
     */
    get_Composites() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(Printing3DCompositeMaterial, value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaterialGroupId() {
        result := ComCall(7, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IVector<Integer>} 
     */
    get_MaterialIndices() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector((ptr) => IPropertyValue(ptr).GetUInt32(), value)
    }
}
