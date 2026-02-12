#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\SceneSurfaceMaterialInput.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Composition.Scenes
 * @version WindowsRuntime 1.4
 */
class ISceneSurfaceMaterialInputStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISceneSurfaceMaterialInputStatics
     * @type {Guid}
     */
    static IID => Guid("{5a2394d3-6429-4589-bbcf-b84f4f3cfbfe}")

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
     * @param {Compositor} compositor_ 
     * @returns {SceneSurfaceMaterialInput} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/extended-stored-procedures-programming/creating-extended-stored-procedures
     */
    Create(compositor_) {
        result := ComCall(6, this, "ptr", compositor_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SceneSurfaceMaterialInput(result_)
    }
}
