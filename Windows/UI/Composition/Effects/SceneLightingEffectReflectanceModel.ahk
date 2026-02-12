#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify how the reflectance of a [SceneLightingEffect](scenelightingeffect.md) is modeled.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.effects.scenelightingeffectreflectancemodel
 * @namespace Windows.UI.Composition.Effects
 * @version WindowsRuntime 1.4
 */
class SceneLightingEffectReflectanceModel extends Win32Enum{

    /**
     * The BlinnPhong model is used.
     * @type {Integer (Int32)}
     */
    static BlinnPhong => 0

    /**
     * The PhysicallyBasedBlinnPhong model is used.
     * @type {Integer (Int32)}
     */
    static PhysicallyBasedBlinnPhong => 1
}
