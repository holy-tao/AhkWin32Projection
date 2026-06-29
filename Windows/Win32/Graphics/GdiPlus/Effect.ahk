#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CGpEffect.ahk" { CGpEffect }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * A function is the building block for a shader created in the high-level language. If you prefer to write shaders in a C-style language instead of in assembly language, you will want to write functions.
 * @see https://learn.microsoft.com/windows/win32/direct3d9/functions
 * @namespace Windows.Win32.Graphics.GdiPlus
 */
export default struct Effect {
    #StructPack 8

    lpVtbl : IntPtr

    nativeEffect : CGpEffect.Ptr

    auxDataSize : Int32

    auxData : IntPtr

    useAuxData : BOOL

}
