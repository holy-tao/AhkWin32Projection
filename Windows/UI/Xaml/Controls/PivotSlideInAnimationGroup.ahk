#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify the different slide-in animation groups that [Pivot](pivot.md) elements can belong to.
 * @remarks
 * These values are used by the [Pivot.SlideInAnimationGroup](/uwp/api/windows.ui.xaml.controls.pivot.slideinanimationgroup) attached property.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.pivotslideinanimationgroup
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class PivotSlideInAnimationGroup extends Win32Enum{

    /**
     * The element belongs to the default animation group. It slides in after the [Pivot](pivot.md) header.
     * @type {Integer (Int32)}
     */
    static Default => 0

    /**
     * The element belongs to the first animation group. It slides in after elements in the default group.
     * @type {Integer (Int32)}
     */
    static GroupOne => 1

    /**
     * The element belongs to the second animation group. It slides in after elements in the first group.
     * @type {Integer (Int32)}
     */
    static GroupTwo => 2

    /**
     * The element belongs to the third animation group. It slides in after elements in the second group.
     * @type {Integer (Int32)}
     */
    static GroupThree => 3
}
