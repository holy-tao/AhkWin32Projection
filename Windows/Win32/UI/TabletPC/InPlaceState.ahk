#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the In-Place state values of the Tablet PC Input Panel.
 * @remarks
 * 
 * The system default is for the In-Place Input Panel to appear in the hover state unless Input Panel is already visible in the expanded state, in which case Input Panel remains expanded.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//peninputpanel/ne-peninputpanel-inplacestate
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class InPlaceState extends Win32Enum{

    /**
     * The system decides which In-Place state of the Input Panel is the most appropriate.
     * @type {Integer (Int32)}
     */
    static InPlaceState_Auto => 0

    /**
     * The Input Panel Icon appears. The expanded Input Panel will not appear.
     * @type {Integer (Int32)}
     */
    static InPlaceState_HoverTarget => 1

    /**
     * The In-Place Input Panel always appears expanded, rather than the Input Panel Icon appearing first and then requiring the user to tap the Input Panel Icon before Input Panel expands.
     * @type {Integer (Int32)}
     */
    static InPlaceState_Expanded => 2
}
