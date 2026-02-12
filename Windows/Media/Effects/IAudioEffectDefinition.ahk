#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\Collections\IPropertySet.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Exposes the methods and properties of an [AudioEffectDefinition](audioeffectdefinition.md) object. Implement this interface when you create a custom audio effect definition.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.effects.iaudioeffectdefinition
 * @namespace Windows.Media.Effects
 * @version WindowsRuntime 1.4
 */
class IAudioEffectDefinition extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAudioEffectDefinition
     * @type {Guid}
     */
    static IID => Guid("{e4d7f974-7d80-4f73-9089-e31c9db9c294}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ActivatableClassId", "get_Properties"]

    /**
     * The activatable class ID of the audio effect definition.
     * @see https://learn.microsoft.com/uwp/api/windows.media.effects.iaudioeffectdefinition.activatableclassid
     * @type {HSTRING} 
     */
    ActivatableClassId {
        get => this.get_ActivatableClassId()
    }

    /**
     * The set of properties for configuring an [AudioEffectDefinition](audioeffectdefinition.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.media.effects.iaudioeffectdefinition.properties
     * @type {IPropertySet} 
     */
    Properties {
        get => this.get_Properties()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ActivatableClassId() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IPropertySet} 
     */
    get_Properties() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IPropertySet(value)
    }
}
