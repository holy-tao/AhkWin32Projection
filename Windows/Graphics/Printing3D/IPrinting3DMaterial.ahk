#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVector.ahk
#Include .\Printing3DBaseMaterialGroup.ahk
#Include .\Printing3DColorMaterialGroup.ahk
#Include .\Printing3DTexture2CoordMaterialGroup.ahk
#Include .\Printing3DCompositeMaterialGroup.ahk
#Include .\Printing3DMultiplePropertyMaterialGroup.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Printing3D
 * @version WindowsRuntime 1.4
 */
class IPrinting3DMaterial extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrinting3DMaterial
     * @type {Guid}
     */
    static IID => Guid("{378db256-ed62-4952-b85b-03567d7c465e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_BaseGroups", "get_ColorGroups", "get_Texture2CoordGroups", "get_CompositeGroups", "get_MultiplePropertyGroups"]

    /**
     * @type {IVector<Printing3DBaseMaterialGroup>} 
     */
    BaseGroups {
        get => this.get_BaseGroups()
    }

    /**
     * @type {IVector<Printing3DColorMaterialGroup>} 
     */
    ColorGroups {
        get => this.get_ColorGroups()
    }

    /**
     * @type {IVector<Printing3DTexture2CoordMaterialGroup>} 
     */
    Texture2CoordGroups {
        get => this.get_Texture2CoordGroups()
    }

    /**
     * @type {IVector<Printing3DCompositeMaterialGroup>} 
     */
    CompositeGroups {
        get => this.get_CompositeGroups()
    }

    /**
     * @type {IVector<Printing3DMultiplePropertyMaterialGroup>} 
     */
    MultiplePropertyGroups {
        get => this.get_MultiplePropertyGroups()
    }

    /**
     * 
     * @returns {IVector<Printing3DBaseMaterialGroup>} 
     */
    get_BaseGroups() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(Printing3DBaseMaterialGroup, value)
    }

    /**
     * 
     * @returns {IVector<Printing3DColorMaterialGroup>} 
     */
    get_ColorGroups() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(Printing3DColorMaterialGroup, value)
    }

    /**
     * 
     * @returns {IVector<Printing3DTexture2CoordMaterialGroup>} 
     */
    get_Texture2CoordGroups() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(Printing3DTexture2CoordMaterialGroup, value)
    }

    /**
     * 
     * @returns {IVector<Printing3DCompositeMaterialGroup>} 
     */
    get_CompositeGroups() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(Printing3DCompositeMaterialGroup, value)
    }

    /**
     * 
     * @returns {IVector<Printing3DMultiplePropertyMaterialGroup>} 
     */
    get_MultiplePropertyGroups() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(Printing3DMultiplePropertyMaterialGroup, value)
    }
}
