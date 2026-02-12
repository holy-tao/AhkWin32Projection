#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\LimiterEffectDefinition.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Audio
 * @version WindowsRuntime 1.4
 */
class ILimiterEffectDefinitionFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILimiterEffectDefinitionFactory
     * @type {Guid}
     */
    static IID => Guid("{ecbae6f1-61ff-45ef-b8f5-48659a57c72d}")

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
     * @param {AudioGraph} audioGraph_ 
     * @returns {LimiterEffectDefinition} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/extended-stored-procedures-programming/creating-extended-stored-procedures
     */
    Create(audioGraph_) {
        result := ComCall(6, this, "ptr", audioGraph_, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return LimiterEffectDefinition(value)
    }
}
