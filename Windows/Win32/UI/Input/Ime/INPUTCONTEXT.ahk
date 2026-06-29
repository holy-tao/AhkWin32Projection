#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Graphics\Gdi\FONT_CLIP_PRECISION.ahk" { FONT_CLIP_PRECISION }
#Import ".\CANDIDATEFORM.ahk" { CANDIDATEFORM }
#Import "..\..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\..\Foundation\POINT.ahk" { POINT }
#Import "..\..\..\Graphics\Gdi\FONT_QUALITY.ahk" { FONT_QUALITY }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\HIMCC.ahk" { HIMCC }
#Import ".\COMPOSITIONFORM.ahk" { COMPOSITIONFORM }
#Import "..\..\..\Graphics\Gdi\LOGFONTW.ahk" { LOGFONTW }
#Import "..\..\..\Graphics\Gdi\FONT_OUTPUT_PRECISION.ahk" { FONT_OUTPUT_PRECISION }
#Import "..\..\..\Graphics\Gdi\FONT_CHARSET.ahk" { FONT_CHARSET }
#Import "..\..\..\Graphics\Gdi\LOGFONTA.ahk" { LOGFONTA }
#Import "..\..\..\Foundation\RECT.ahk" { RECT }
#Import "..\..\..\Foundation\CHAR.ahk" { CHAR }
#Import "..\..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.UI.Input.Ime
 */
export default struct INPUTCONTEXT {
    #StructPack 8


    struct _lfFont {
        A : LOGFONTA

        static __New() {
            DefineProp(this.Prototype, 'W', { type: LOGFONTW, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    hWnd : HWND

    fOpen : BOOL

    ptStatusWndPos : POINT

    ptSoftKbdPos : POINT

    fdwConversion : UInt32

    fdwSentence : UInt32

    lfFont : INPUTCONTEXT._lfFont

    cfCompForm : COMPOSITIONFORM

    cfCandForm : CANDIDATEFORM[4]

    hCompStr : HIMCC

    hCandInfo : HIMCC

    hGuideLine : HIMCC

    hPrivate : HIMCC

    dwNumMsgBuf : UInt32

    hMsgBuf : HIMCC

    fdwInit : UInt32

    dwReserve : UInt32[3]

}
