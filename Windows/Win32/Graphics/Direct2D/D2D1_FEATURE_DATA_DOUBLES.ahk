#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes the support for doubles in shaders.
 * @remarks
 * 
 * Fill this structure by passing a D2D1_FEATURE_DOUBLES structure to <a href="https://docs.microsoft.com/windows/desktop/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1effectcontext-checkfeaturesupport">ID2D1EffectContext::CheckFeatureSupport</a>.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d2d1effectauthor/ns-d2d1effectauthor-d2d1_feature_data_doubles
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_FEATURE_DATA_DOUBLES extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * TRUE is doubles are supported within the shaders.
     * @type {BOOL}
     */
    doublePrecisionFloatShaderOps {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }
}
