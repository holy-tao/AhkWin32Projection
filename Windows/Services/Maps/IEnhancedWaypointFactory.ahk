#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\EnhancedWaypoint.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Services.Maps
 * @version WindowsRuntime 1.4
 */
class IEnhancedWaypointFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnhancedWaypointFactory
     * @type {Guid}
     */
    static IID => Guid("{af868477-a2aa-46dd-b645-23b31b8aa6c7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Create"]

    /**
     * Create Extended Stored Procedures
     * @param {Geopoint} point_ 
     * @param {Integer} kind 
     * @returns {EnhancedWaypoint} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/extended-stored-procedures-programming/creating-extended-stored-procedures
     */
    Create(point_, kind) {
        result := ComCall(6, this, "ptr", point_, "int", kind, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return EnhancedWaypoint(value)
    }
}
