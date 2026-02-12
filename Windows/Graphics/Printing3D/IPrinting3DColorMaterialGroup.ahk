#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVector.ahk
#Include .\Printing3DColorMaterial.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Printing3D
 * @version WindowsRuntime 1.4
 */
class IPrinting3DColorMaterialGroup extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrinting3DColorMaterialGroup
     * @type {Guid}
     */
    static IID => Guid("{001a6bd0-aadf-4226-afe9-f369a0b45004}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Colors", "get_MaterialGroupId"]

    /**
     * @type {IVector<Printing3DColorMaterial>} 
     */
    Colors {
        get => this.get_Colors()
    }

    /**
     * @type {Integer} 
     */
    MaterialGroupId {
        get => this.get_MaterialGroupId()
    }

    /**
     * 
     * @returns {IVector<Printing3DColorMaterial>} 
     */
    get_Colors() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(Printing3DColorMaterial, value)
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
