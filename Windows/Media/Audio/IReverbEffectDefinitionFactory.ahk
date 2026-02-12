#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\ReverbEffectDefinition.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Audio
 * @version WindowsRuntime 1.4
 */
class IReverbEffectDefinitionFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IReverbEffectDefinitionFactory
     * @type {Guid}
     */
    static IID => Guid("{a7d5cbfe-100b-4ff0-9da6-dc4e05a759f0}")

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
     * @returns {ReverbEffectDefinition} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/extended-stored-procedures-programming/creating-extended-stored-procedures
     */
    Create(audioGraph_) {
        result := ComCall(6, this, "ptr", audioGraph_, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ReverbEffectDefinition(value)
    }
}
