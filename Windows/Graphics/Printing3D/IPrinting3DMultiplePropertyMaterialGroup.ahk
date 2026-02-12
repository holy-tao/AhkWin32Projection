#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVector.ahk
#Include .\Printing3DMultiplePropertyMaterial.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Printing3D
 * @version WindowsRuntime 1.4
 */
class IPrinting3DMultiplePropertyMaterialGroup extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrinting3DMultiplePropertyMaterialGroup
     * @type {Guid}
     */
    static IID => Guid("{f0950519-aeb9-4515-a39b-a088fbbb277c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_MultipleProperties", "get_MaterialGroupIndices", "get_MaterialGroupId"]

    /**
     * @type {IVector<Printing3DMultiplePropertyMaterial>} 
     */
    MultipleProperties {
        get => this.get_MultipleProperties()
    }

    /**
     * @type {IVector<Integer>} 
     */
    MaterialGroupIndices {
        get => this.get_MaterialGroupIndices()
    }

    /**
     * @type {Integer} 
     */
    MaterialGroupId {
        get => this.get_MaterialGroupId()
    }

    /**
     * 
     * @returns {IVector<Printing3DMultiplePropertyMaterial>} 
     */
    get_MultipleProperties() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(Printing3DMultiplePropertyMaterial, value)
    }

    /**
     * 
     * @returns {IVector<Integer>} 
     */
    get_MaterialGroupIndices() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector((ptr) => IPropertyValue(ptr).GetUInt32(), value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaterialGroupId() {
        result := ComCall(8, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
