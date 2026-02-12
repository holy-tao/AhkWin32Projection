#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\InteractionTrackerInertiaNaturalMotion.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Composition.Interactions
 * @version WindowsRuntime 1.4
 */
class IInteractionTrackerInertiaNaturalMotionStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInteractionTrackerInertiaNaturalMotionStatics
     * @type {Guid}
     */
    static IID => Guid("{cfda55b0-5e3e-4289-932d-ee5f50e74283}")

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
     * @returns {InteractionTrackerInertiaNaturalMotion} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/extended-stored-procedures-programming/creating-extended-stored-procedures
     */
    Create(compositor_) {
        result := ComCall(6, this, "ptr", compositor_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return InteractionTrackerInertiaNaturalMotion(result_)
    }
}
