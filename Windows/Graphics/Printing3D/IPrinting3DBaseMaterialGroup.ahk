#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVector.ahk
#Include .\Printing3DBaseMaterial.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Printing3D
 * @version WindowsRuntime 1.4
 */
class IPrinting3DBaseMaterialGroup extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrinting3DBaseMaterialGroup
     * @type {Guid}
     */
    static IID => Guid("{94f070b8-2515-4a8d-a1f0-d0fc13d06021}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Bases", "get_MaterialGroupId"]

    /**
     * @type {IVector<Printing3DBaseMaterial>} 
     */
    Bases {
        get => this.get_Bases()
    }

    /**
     * @type {Integer} 
     */
    MaterialGroupId {
        get => this.get_MaterialGroupId()
    }

    /**
     * 
     * @returns {IVector<Printing3DBaseMaterial>} 
     */
    get_Bases() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(Printing3DBaseMaterial, value)
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
