#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\CompositionConditionalValue.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Composition.Interactions
 * @version WindowsRuntime 1.4
 */
class ICompositionConditionalValueStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICompositionConditionalValueStatics
     * @type {Guid}
     */
    static IID => Guid("{090c4b72-8467-4d0a-9065-ac46b80a5522}")

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
     * @returns {CompositionConditionalValue} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/extended-stored-procedures-programming/creating-extended-stored-procedures
     */
    Create(compositor_) {
        result := ComCall(6, this, "ptr", compositor_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CompositionConditionalValue(result_)
    }
}
