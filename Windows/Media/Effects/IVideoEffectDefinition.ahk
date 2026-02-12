#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\Collections\IPropertySet.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Exposes the methods and properties of a [VideoEffectDefinition](videoeffectdefinition.md) object. Implement this interface when you create a custom video effect definition.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.effects.ivideoeffectdefinition
 * @namespace Windows.Media.Effects
 * @version WindowsRuntime 1.4
 */
class IVideoEffectDefinition extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVideoEffectDefinition
     * @type {Guid}
     */
    static IID => Guid("{39f38cf0-8d0f-4f3e-84fc-2d46a5297943}")

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
     * The activatable class ID of the video effect definition.
     * @see https://learn.microsoft.com/uwp/api/windows.media.effects.ivideoeffectdefinition.activatableclassid
     * @type {HSTRING} 
     */
    ActivatableClassId {
        get => this.get_ActivatableClassId()
    }

    /**
     * The set of properties for configuring the [VideoEffectDefinition](videoeffectdefinition.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.media.effects.ivideoeffectdefinition.properties
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
