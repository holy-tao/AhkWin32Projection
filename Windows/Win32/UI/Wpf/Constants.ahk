#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.UI.Wpf
 */

;@region Constants

/**
 * @type {Integer (UInt32)}
 */
export global MILBITMAPEFFECT_SDK_VERSION := 16777216

/**
 * @type {Guid}
 */
export global CLSID_MILBitmapEffectGroup := Guid("{ac9c1a9a-7e18-4f64-ac7e-47cf7f051e95}")

/**
 * @type {Guid}
 */
export global CLSID_MILBitmapEffectBlur := Guid("{a924df87-225d-4373-8f5b-b90ec85ae3de}")

/**
 * @type {Guid}
 */
export global CLSID_MILBitmapEffectDropShadow := Guid("{459a3fbe-d8ac-4692-874b-7a265715aa16}")

/**
 * @type {Guid}
 */
export global CLSID_MILBitmapEffectOuterGlow := Guid("{e2161bdd-7eb6-4725-9c0b-8a2a1b4f0667}")

/**
 * @type {Guid}
 */
export global CLSID_MILBitmapEffectBevel := Guid("{fd361dbe-6c9b-4de0-8290-f6400c2737ed}")

/**
 * @type {Guid}
 */
export global CLSID_MILBitmapEffectEmboss := Guid("{cd299846-824f-47ec-a007-12aa767f2816}")
;@endregion Constants
