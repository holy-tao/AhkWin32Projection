#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WINDOW_ACTION_KINDS.ahk" { WINDOW_ACTION_KINDS }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\POINT.ahk" { POINT }
#Import ".\WINDOW_PLACEMENT_STATE.ahk" { WINDOW_PLACEMENT_STATE }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\RECT.ahk" { RECT }
#Import "..\..\Foundation\SIZE.ahk" { SIZE }
#Import ".\WINDOW_ACTION_MODIFIERS.ahk" { WINDOW_ACTION_MODIFIERS }

/**
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */
export default struct WINDOW_ACTION {
    #StructPack 8

    kinds : WINDOW_ACTION_KINDS

    modifiers : WINDOW_ACTION_MODIFIERS

    visible : BOOL

    position : POINT

    size : SIZE

    insertAfter : HWND

    placementState : WINDOW_PLACEMENT_STATE

    normalRect : RECT

    workArea : RECT

    dpi : UInt32

    pointOnMonitor : POINT

    monitorTopologyId : UInt32

}
