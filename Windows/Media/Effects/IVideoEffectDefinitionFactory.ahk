#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\VideoEffectDefinition.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Effects
 * @version WindowsRuntime 1.4
 */
class IVideoEffectDefinitionFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVideoEffectDefinitionFactory
     * @type {Guid}
     */
    static IID => Guid("{81439b4e-6e33-428f-9d21-b5aafef7617c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Create", "CreateWithProperties"]

    /**
     * Create Extended Stored Procedures
     * @param {HSTRING} activatableClassId 
     * @returns {VideoEffectDefinition} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/extended-stored-procedures-programming/creating-extended-stored-procedures
     */
    Create(activatableClassId) {
        if(activatableClassId is String) {
            pin := HSTRING.Create(activatableClassId)
            activatableClassId := pin.Value
        }
        activatableClassId := activatableClassId is Win32Handle ? NumGet(activatableClassId, "ptr") : activatableClassId

        result := ComCall(6, this, "ptr", activatableClassId, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return VideoEffectDefinition(value)
    }

    /**
     * 
     * @param {HSTRING} activatableClassId 
     * @param {IPropertySet} props 
     * @returns {VideoEffectDefinition} 
     */
    CreateWithProperties(activatableClassId, props) {
        if(activatableClassId is String) {
            pin := HSTRING.Create(activatableClassId)
            activatableClassId := pin.Value
        }
        activatableClassId := activatableClassId is Win32Handle ? NumGet(activatableClassId, "ptr") : activatableClassId

        result := ComCall(7, this, "ptr", activatableClassId, "ptr", props, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return VideoEffectDefinition(value)
    }
}
