#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IReference.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Perception.Spatial
 * @version WindowsRuntime 1.4
 */
class ISpatialCoordinateSystem extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpatialCoordinateSystem
     * @type {Guid}
     */
    static IID => Guid("{69ebca4b-60a3-3586-a653-59a7bd676d07}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["TryGetTransformTo"]

    /**
     * 
     * @param {SpatialCoordinateSystem} target 
     * @returns {IReference<Matrix4x4>} 
     */
    TryGetTransformTo(target) {
        result := ComCall(6, this, "ptr", target, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetMatrix4x4(), value)
    }
}
