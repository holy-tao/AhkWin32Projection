#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\IReference.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include .\SpatialInteractionSourceLocation.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Input.Spatial
 * @version WindowsRuntime 1.4
 */
class ISpatialInteractionSourceProperties extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpatialInteractionSourceProperties
     * @type {Guid}
     */
    static IID => Guid("{05604542-3ef7-3222-9f53-63c9cb7e3bc7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["TryGetSourceLossMitigationDirection", "get_SourceLossRisk", "TryGetLocation"]

    /**
     * @type {Float} 
     */
    SourceLossRisk {
        get => this.get_SourceLossRisk()
    }

    /**
     * 
     * @param {SpatialCoordinateSystem} coordinateSystem 
     * @returns {IReference<Vector3>} 
     */
    TryGetSourceLossMitigationDirection(coordinateSystem) {
        result := ComCall(6, this, "ptr", coordinateSystem, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetVector3(), value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_SourceLossRisk() {
        result := ComCall(7, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {SpatialCoordinateSystem} coordinateSystem 
     * @returns {SpatialInteractionSourceLocation} 
     */
    TryGetLocation(coordinateSystem) {
        result := ComCall(8, this, "ptr", coordinateSystem, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SpatialInteractionSourceLocation(value)
    }
}
