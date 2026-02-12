#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVector.ahk
#Include .\Printing3DTexture2CoordMaterial.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Printing3D
 * @version WindowsRuntime 1.4
 */
class IPrinting3DTexture2CoordMaterialGroup extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrinting3DTexture2CoordMaterialGroup
     * @type {Guid}
     */
    static IID => Guid("{627d7ca7-6d90-4fb9-9fc4-9feff3dfa892}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Texture2Coords", "get_MaterialGroupId"]

    /**
     * @type {IVector<Printing3DTexture2CoordMaterial>} 
     */
    Texture2Coords {
        get => this.get_Texture2Coords()
    }

    /**
     * @type {Integer} 
     */
    MaterialGroupId {
        get => this.get_MaterialGroupId()
    }

    /**
     * 
     * @returns {IVector<Printing3DTexture2CoordMaterial>} 
     */
    get_Texture2Coords() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(Printing3DTexture2CoordMaterial, value)
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
}
