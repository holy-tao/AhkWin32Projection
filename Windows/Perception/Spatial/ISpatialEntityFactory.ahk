#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\SpatialEntity.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Perception.Spatial
 * @version WindowsRuntime 1.4
 */
class ISpatialEntityFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpatialEntityFactory
     * @type {Guid}
     */
    static IID => Guid("{e1f1e325-349f-4225-a2f3-4b01c15fe056}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateWithSpatialAnchor", "CreateWithSpatialAnchorAndProperties"]

    /**
     * 
     * @param {SpatialAnchor} spatialAnchor_ 
     * @returns {SpatialEntity} 
     */
    CreateWithSpatialAnchor(spatialAnchor_) {
        result := ComCall(6, this, "ptr", spatialAnchor_, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SpatialEntity(value)
    }

    /**
     * 
     * @param {SpatialAnchor} spatialAnchor_ 
     * @param {ValueSet} propertySet_ 
     * @returns {SpatialEntity} 
     */
    CreateWithSpatialAnchorAndProperties(spatialAnchor_, propertySet_) {
        result := ComCall(7, this, "ptr", spatialAnchor_, "ptr", propertySet_, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SpatialEntity(value)
    }
}
