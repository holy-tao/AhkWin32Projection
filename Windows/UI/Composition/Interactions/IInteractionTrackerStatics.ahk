#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\InteractionTracker.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Composition.Interactions
 * @version WindowsRuntime 1.4
 */
class IInteractionTrackerStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInteractionTrackerStatics
     * @type {Guid}
     */
    static IID => Guid("{bba5d7b7-6590-4498-8d6c-eb62b514c92a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Create", "CreateWithOwner"]

    /**
     * Create Extended Stored Procedures
     * @param {Compositor} compositor_ 
     * @returns {InteractionTracker} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/extended-stored-procedures-programming/creating-extended-stored-procedures
     */
    Create(compositor_) {
        result := ComCall(6, this, "ptr", compositor_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return InteractionTracker(result_)
    }

    /**
     * 
     * @param {Compositor} compositor_ 
     * @param {IInteractionTrackerOwner} owner 
     * @returns {InteractionTracker} 
     */
    CreateWithOwner(compositor_, owner) {
        result := ComCall(7, this, "ptr", compositor_, "ptr", owner, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return InteractionTracker(result_)
    }
}
