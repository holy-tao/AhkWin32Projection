#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ManipulationPivot.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Input
 * @version WindowsRuntime 1.4
 */
class IManipulationPivotFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IManipulationPivotFactory
     * @type {Guid}
     */
    static IID => Guid("{6d05b039-3702-4396-ad9b-a825efa63a3b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateInstanceWithCenterAndRadius"]

    /**
     * 
     * @param {POINT} center 
     * @param {Float} radius 
     * @returns {ManipulationPivot} 
     */
    CreateInstanceWithCenterAndRadius(center, radius) {
        result := ComCall(6, this, "ptr", center, "double", radius, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ManipulationPivot(value)
    }
}
