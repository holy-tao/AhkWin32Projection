#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HACCESSOR.ahk" { HACCESSOR }

/**
 * @namespace Windows.Win32.System.Search
 * @architecture X64, Arm64
 */
export default struct DBPARAMS {
    #StructPack 8

    pData : IntPtr

    cParamSets : IntPtr

    hAccessor : HACCESSOR

}
