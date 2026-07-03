#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\M128A.ahk" { M128A }
#Import ".\XSAVE_AREA_HEADER.ahk" { XSAVE_AREA_HEADER }
#Import ".\XSAVE_FORMAT.ahk" { XSAVE_FORMAT }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct XSAVE_AREA {
    #StructPack 8

    LegacyState : XSAVE_FORMAT

    Header : XSAVE_AREA_HEADER

}
