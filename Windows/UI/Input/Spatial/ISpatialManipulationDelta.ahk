#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\Numerics\Vector3.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Input.Spatial
 * @version WindowsRuntime 1.4
 */
class ISpatialManipulationDelta extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpatialManipulationDelta
     * @type {Guid}
     */
    static IID => Guid("{a7ec967a-d123-3a81-a15b-992923dcbe91}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Translation"]

    /**
     * @type {Vector3} 
     */
    Translation {
        get => this.get_Translation()
    }

    /**
     * 
     * @returns {Vector3} 
     */
    get_Translation() {
        value := Vector3()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
