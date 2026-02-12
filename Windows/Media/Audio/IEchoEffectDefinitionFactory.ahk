#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\EchoEffectDefinition.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Audio
 * @version WindowsRuntime 1.4
 */
class IEchoEffectDefinitionFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEchoEffectDefinitionFactory
     * @type {Guid}
     */
    static IID => Guid("{0d4e2257-aaf2-4e86-a54c-fb79db8f6c12}")

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
     * @returns {EchoEffectDefinition} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/extended-stored-procedures-programming/creating-extended-stored-procedures
     */
    Create(audioGraph_) {
        result := ComCall(6, this, "ptr", audioGraph_, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return EchoEffectDefinition(value)
    }
}
