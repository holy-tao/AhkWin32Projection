#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\EqualizerEffectDefinition.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Audio
 * @version WindowsRuntime 1.4
 */
class IEqualizerEffectDefinitionFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEqualizerEffectDefinitionFactory
     * @type {Guid}
     */
    static IID => Guid("{d2876fc4-d410-4eb5-9e69-c9aa1277eaf0}")

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
     * @returns {EqualizerEffectDefinition} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/extended-stored-procedures-programming/creating-extended-stored-procedures
     */
    Create(audioGraph_) {
        result := ComCall(6, this, "ptr", audioGraph_, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return EqualizerEffectDefinition(value)
    }
}
