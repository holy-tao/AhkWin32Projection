#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Describes the support for doubles in shaders.
 * @remarks
 * Fill this structure by passing a D2D1_FEATURE_DOUBLES structure to <a href="https://docs.microsoft.com/windows/desktop/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1effectcontext-checkfeaturesupport">ID2D1EffectContext::CheckFeatureSupport</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/ns-d2d1effectauthor-d2d1_feature_data_doubles
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct D2D1_FEATURE_DATA_DOUBLES {
    #StructPack 4

    /**
     * TRUE is doubles are supported within the shaders.
     */
    doublePrecisionFloatShaderOps : BOOL

}
