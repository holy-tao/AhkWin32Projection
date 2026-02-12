#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVector.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Printing3D
 * @version WindowsRuntime 1.4
 */
class IPrinting3DMultiplePropertyMaterial extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrinting3DMultiplePropertyMaterial
     * @type {Guid}
     */
    static IID => Guid("{25a6254b-c6e9-484d-a214-a25e5776ba62}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_MaterialIndices"]

    /**
     * @type {IVector<Integer>} 
     */
    MaterialIndices {
        get => this.get_MaterialIndices()
    }

    /**
     * 
     * @returns {IVector<Integer>} 
     */
    get_MaterialIndices() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector((ptr) => IPropertyValue(ptr).GetUInt32(), value)
    }
}
