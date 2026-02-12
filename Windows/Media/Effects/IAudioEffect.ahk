#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Exposes the methods and properties of an [AudioEffectDefinition](audioeffectdefinition.md) object. Implement this interface when you create a custom audio effect definition.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.effects.iaudioeffectdefinition
 * @namespace Windows.Media.Effects
 * @version WindowsRuntime 1.4
 */
class IAudioEffect extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAudioEffect
     * @type {Guid}
     */
    static IID => Guid("{34aafa51-9207-4055-be93-6e5734a86ae4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AudioEffectType"]

    /**
     * @type {Integer} 
     */
    AudioEffectType {
        get => this.get_AudioEffectType()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AudioEffectType() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
