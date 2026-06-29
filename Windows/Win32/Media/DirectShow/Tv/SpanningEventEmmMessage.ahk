#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct SpanningEventEmmMessage {
    #StructPack 2

    bCAbroadcasterGroupId : Int8

    bMessageControl : Int8

    wServiceId : UInt16

    wTableIdExtension : UInt16

    bDeletionStatus : Int8

    bDisplayingDuration1 : Int8

    bDisplayingDuration2 : Int8

    bDisplayingDuration3 : Int8

    bDisplayingCycle : Int8

    bFormatVersion : Int8

    bDisplayPosition : Int8

    wMessageLength : UInt16

    szMessageArea : WCHAR[1]

}
