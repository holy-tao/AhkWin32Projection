#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\Panel.ahk
#Include .\IRelativePanel.ahk
#Include .\IRelativePanel2.ahk
#Include .\IRelativePanelStatics.ahk
#Include .\IRelativePanelFactory.ahk
#Include .\IRelativePanelStatics2.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Defines an area within which you can position and align child objects in relation to each other or the parent panel.
 * @remarks
 * RelativePanel is a layout container that is useful for creating UI that do not have a clear linear pattern; that is, layouts that are not fundamentally stacked, wrapped, or tabular, where you might naturally use a [StackPanel](stackpanel.md) or [Grid](grid.md).
 * 
 * If your UI consists of multiple nested panels, RelativePanel is a good option to consider.
 * 
 * Here's an example of a UI using a RelativePanel for its layout:
 * 
 * <img alt="Relative panel control" src="images/controls/RelativePanelBasic.png" />
 * 
 * ```xaml
 * <RelativePanel BorderBrush="Gray" BorderThickness="10">
 *     <Rectangle x:Name="RedRect" Fill="Red" MinHeight="100" MinWidth="100"/>
 *     <Rectangle x:Name="BlueRect" Fill="Blue" MinHeight="100" MinWidth="100" 
 *                RelativePanel.RightOf="RedRect"/>
 *     <!-- Width is not set on the green and yellow rectangles.
 *          It's determined by the RelativePanel properties. -->
 *     <Rectangle x:Name="GreenRect" Fill="Green" MinHeight="100" Margin="0,5,0,0" 
 *                RelativePanel.Below="RedRect" 
 *                RelativePanel.AlignLeftWith="RedRect" 
 *                RelativePanel.AlignRightWith="BlueRect"/>
 *     <Rectangle Fill="Yellow" MinHeight="100" 
 *                RelativePanel.Below="GreenRect" 
 *                RelativePanel.AlignLeftWith="BlueRect" 
 *                RelativePanel.AlignRightWithPanel="True"/>
 * </RelativePanel>
 * ```
 * 
 * RelativePanel, used in conjunction with [AdaptiveTrigger](../windows.ui.xaml/adaptivetrigger.md) s, can be a powerful tool to create responsive UI that scales well across different screen sizes. For more examples, see the [XAML Responsive Techniques sample](https://github.com/Microsoft/Windows-universal-samples/tree/master/Samples/XamlResponsiveTechniques?amp;amp;clcid=0x409).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.relativepanel
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class RelativePanel extends Panel {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRelativePanel

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRelativePanel.IID

    /**
     * Identifies the [RelativePanel.LeftOf](relativepanel_leftof.md) XAML attached property.
     * @remarks
     * This property is only an identifier for the property system, and isn't used in most app scenarios. In most cases you set the [RelativePanel.LeftOf](relativepanel_leftof.md) XAML attached property in XAML and won't need this identifier.
     * 
     * To access the [RelativePanel.LeftOf](relativepanel_leftof.md) attached property in code, you can use the dependency property system, calling either [GetValue](../windows.ui.xaml/dependencyobject_getvalue_1188551207.md) or [SetValue](../windows.ui.xaml/dependencyobject_setvalue_52578133.md) and passing RelativePanel.LeftOfProperty as the dependency property identifier. Another way to get or set the value in code is to use [GetLeftOf](relativepanel_getleftof_695637359.md) and [SetLeftOf](relativepanel_setleftof_1820572917.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.relativepanel.leftofproperty
     * @type {DependencyProperty} 
     */
    static LeftOfProperty {
        get => RelativePanel.get_LeftOfProperty()
    }

    /**
     * Identifies the [RelativePanel.Above](relativepanel_above.md) XAML attached property.
     * @remarks
     * This property is only an identifier for the property system, and isn't used in most app scenarios. In most cases you set the [RelativePanel.Above](relativepanel_above.md) XAML attached property in XAML and won't need this identifier.
     * 
     * To access the [RelativePanel.Above](relativepanel_above.md) attached property in code, you can use the dependency property system, calling either [GetValue](../windows.ui.xaml/dependencyobject_getvalue_1188551207.md) or [SetValue](../windows.ui.xaml/dependencyobject_setvalue_52578133.md) and passing RelativePanel.AboveProperty as the dependency property identifier. Another way to get or set the value in code is to use [GetAbove](relativepanel_getabove_1952075081.md) and [SetAbove](relativepanel_setabove_833606851.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.relativepanel.aboveproperty
     * @type {DependencyProperty} 
     */
    static AboveProperty {
        get => RelativePanel.get_AboveProperty()
    }

    /**
     * Identifies the [RelativePanel.RightOf](relativepanel_rightof.md) XAML attached property.
     * @remarks
     * This property is only an identifier for the property system, and isn't used in most app scenarios. In most cases you set the [RelativePanel.RightOf](relativepanel_rightof.md) XAML attached property in XAML and won't need this identifier.
     * 
     * To access the [RelativePanel.RightOf](relativepanel_rightof.md) attached property in code, you can use the dependency property system, calling either [GetValue](../windows.ui.xaml/dependencyobject_getvalue_1188551207.md) or [SetValue](../windows.ui.xaml/dependencyobject_setvalue_52578133.md) and passing RelativePanel.RightOfProperty as the dependency property identifier. Another way to get or set the value in code is to use [GetRightOf](relativepanel_getrightof_486944752.md) and [SetRightOf](relativepanel_setrightof_1492320934.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.relativepanel.rightofproperty
     * @type {DependencyProperty} 
     */
    static RightOfProperty {
        get => RelativePanel.get_RightOfProperty()
    }

    /**
     * Identifies the [RelativePanel.Below](relativepanel_below.md) XAML attached property.
     * @remarks
     * This property is only an identifier for the property system, and isn't used in most app scenarios. In most cases you set the [RelativePanel.Below](relativepanel_below.md) XAML attached property in XAML and won't need this identifier.
     * 
     * To access the [RelativePanel.Below](relativepanel_below.md) attached property in code, you can use the dependency property system, calling either [GetValue](../windows.ui.xaml/dependencyobject_getvalue_1188551207.md) or [SetValue](../windows.ui.xaml/dependencyobject_setvalue_52578133.md) and passing RelativePanel.BelowProperty as the dependency property identifier. Another way to get or set the value in code is to use [GetBelow](relativepanel_getbelow_1283281353.md) and [SetBelow](relativepanel_setbelow_159953939.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.relativepanel.belowproperty
     * @type {DependencyProperty} 
     */
    static BelowProperty {
        get => RelativePanel.get_BelowProperty()
    }

    /**
     * Gets the value of the [RelativePanel.AlignHorizontalCenterWith](relativepanel_alignhorizontalcenterwith.md) XAML attached property for the target element.
     * @remarks
     * This property is only an identifier for the property system, and isn't used in most app scenarios. In most cases you set the [RelativePanel.AlignHorizontalCenterWith](relativepanel_alignhorizontalcenterwith.md) XAML attached property in XAML and won't need this identifier.
     * 
     * To access the [RelativePanel.AlignHorizontalCenterWith](relativepanel_alignhorizontalcenterwith.md) attached property in code, you can use the dependency property system, calling either [GetValue](../windows.ui.xaml/dependencyobject_getvalue_1188551207.md) or [SetValue](../windows.ui.xaml/dependencyobject_setvalue_52578133.md) and passing RelativePanel.AlignHorizontalCenterWithProperty as the dependency property identifier. Another way to get or set the value in code is to use [GetAlignHorizontalCenterWith](relativepanel_getalignhorizontalcenterwith_273101317.md) and [SetAlignHorizontalCenterWith](relativepanel_setalignhorizontalcenterwith_1128810433.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.relativepanel.alignhorizontalcenterwithproperty
     * @type {DependencyProperty} 
     */
    static AlignHorizontalCenterWithProperty {
        get => RelativePanel.get_AlignHorizontalCenterWithProperty()
    }

    /**
     * Gets the value of the [RelativePanel.AlignVerticalCenterWith](relativepanel_alignverticalcenterwith.md) XAML attached property for the target element.
     * @remarks
     * This property is only an identifier for the property system, and isn't used in most app scenarios. In most cases you set the [RelativePanel.AlignVerticalCenterWith](relativepanel_alignverticalcenterwith.md) XAML attached property in XAML and won't need this identifier.
     * 
     * To access the [RelativePanel.AlignVerticalCenterWith](relativepanel_alignverticalcenterwith.md) attached property in code, you can use the dependency property system, calling either [GetValue](../windows.ui.xaml/dependencyobject_getvalue_1188551207.md) or [SetValue](../windows.ui.xaml/dependencyobject_setvalue_52578133.md) and passing RelativePanel.AlignVerticalCenterWithProperty as the dependency property identifier. Another way to get or set the value in code is to use [GetAlignVerticalCenterWith](relativepanel_getalignverticalcenterwith_137079489.md) and [SetAlignVerticalCenterWith](relativepanel_setalignverticalcenterwith_629994335.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.relativepanel.alignverticalcenterwithproperty
     * @type {DependencyProperty} 
     */
    static AlignVerticalCenterWithProperty {
        get => RelativePanel.get_AlignVerticalCenterWithProperty()
    }

    /**
     * Identifies the [RelativePanel.AlignLeftWith](relativepanel_alignleftwith.md) XAML attached property.
     * @remarks
     * This property is only an identifier for the property system, and isn't used in most app scenarios. In most cases you set the [RelativePanel.AlignBottomWith](relativepanel_alignleftwith.md) XAML attached property in XAML and won't need this identifier.
     * 
     * To access the [RelativePanel.AlignLeftWith](relativepanel_alignleftwith.md) attached property in code, you can use the dependency property system, calling either [GetValue](../windows.ui.xaml/dependencyobject_getvalue_1188551207.md) or [SetValue](../windows.ui.xaml/dependencyobject_setvalue_52578133.md) and passing RelativePanel.AlignLeftWithProperty as the dependency property identifier. Another way to get or set the value in code is to use [GetAlignLeftWith](relativepanel_getalignleftwith_2107664912.md) and [SetAlignLeftWith](relativepanel_setalignleftwith_945797910.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.relativepanel.alignleftwithproperty
     * @type {DependencyProperty} 
     */
    static AlignLeftWithProperty {
        get => RelativePanel.get_AlignLeftWithProperty()
    }

    /**
     * Identifies the [RelativePanel.AlignTopWith](relativepanel_aligntopwith.md) XAML attached property.
     * @remarks
     * This property is only an identifier for the property system, and isn't used in most app scenarios. In most cases you set the [RelativePanel.AlignTopWith](relativepanel_aligntopwith.md) XAML attached property in XAML and won't need this identifier.
     * 
     * To access the [RelativePanel.AlignTopWith](relativepanel_aligntopwith.md) attached property in code, you can use the dependency property system, calling either [GetValue](../windows.ui.xaml/dependencyobject_getvalue_1188551207.md) or [SetValue](../windows.ui.xaml/dependencyobject_setvalue_52578133.md) and passing RelativePanel.AlignTopWithProperty as the dependency property identifier. Another way to get or set the value in code is to use [GetAlignTopWith](relativepanel_getaligntopwith_1785728020.md) and [SetAlignTopWith](relativepanel_setaligntopwith_800343274.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.relativepanel.aligntopwithproperty
     * @type {DependencyProperty} 
     */
    static AlignTopWithProperty {
        get => RelativePanel.get_AlignTopWithProperty()
    }

    /**
     * Identifies the [RelativePanel.AlignRightWith](relativepanel_alignrightwith.md) XAML attached property.
     * @remarks
     * This property is only an identifier for the property system, and isn't used in most app scenarios. In most cases you set the [RelativePanel.AlignRightWith](relativepanel_alignrightwith.md) XAML attached property in XAML and won't need this identifier.
     * 
     * To access the [RelativePanel.AlignRightWith](relativepanel_alignrightwith.md) attached property in code, you can use the dependency property system, calling either [GetValue](../windows.ui.xaml/dependencyobject_getvalue_1188551207.md) or [SetValue](../windows.ui.xaml/dependencyobject_setvalue_52578133.md) and passing RelativePanel.AlignRightWithProperty as the dependency property identifier. Another way to get or set the value in code is to use [GetAlignRightWith](relativepanel_getalignrightwith_417295312.md) and [SetAlignRightWith](relativepanel_setalignrightwith_1370938510.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.relativepanel.alignrightwithproperty
     * @type {DependencyProperty} 
     */
    static AlignRightWithProperty {
        get => RelativePanel.get_AlignRightWithProperty()
    }

    /**
     * Identifies the [RelativePanel.AlignBottomWith](relativepanel_alignbottomwith.md) XAML attached property.
     * @remarks
     * This property is only an identifier for the property system, and isn't used in most app scenarios. In most cases you set the [RelativePanel.AlignBottomWith](relativepanel_alignbottomwith.md) XAML attached property in XAML and won't need this identifier.
     * 
     * To access the [RelativePanel.AlignBottomWith](relativepanel_alignbottomwith.md) attached property in code, you can use the dependency property system, calling either [GetValue](../windows.ui.xaml/dependencyobject_getvalue_1188551207.md) or [SetValue](../windows.ui.xaml/dependencyobject_setvalue_52578133.md) and passing RelativePanel.AlignBottomWithProperty as the dependency property identifier. Another way to get or set the value in code is to use [GetAlignBottomWith](relativepanel_getalignbottomwith_1017903772.md) and [SetAlignBottomWith](relativepanel_setalignbottomwith_1729742442.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.relativepanel.alignbottomwithproperty
     * @type {DependencyProperty} 
     */
    static AlignBottomWithProperty {
        get => RelativePanel.get_AlignBottomWithProperty()
    }

    /**
     * Identifies the [RelativePanel.AlignLeftWithPanel](relativepanel_alignleftwithpanel.md) XAML attached property.
     * @remarks
     * This property is only an identifier for the property system, and isn't used in most app scenarios. In most cases you set the [RelativePanel.AlignLeftWithPanel](relativepanel_alignleftwithpanel.md) XAML attached property in XAML and won't need this identifier.
     * 
     * To access the [RelativePanel.AlignLeftWithPanel](relativepanel_alignleftwithpanel.md) attached property in code, you can use the dependency property system, calling either [GetValue](../windows.ui.xaml/dependencyobject_getvalue_1188551207.md) or [SetValue](../windows.ui.xaml/dependencyobject_setvalue_52578133.md) and passing RelativePanel.AlignLeftWithPanelProperty as the dependency property identifier. Another way to get or set the value in code is to use [GetAlignLeftWithPanel](relativepanel_getalignleftwithpanel_412880722.md) and [SetAlignLeftWithPanel](relativepanel_setalignleftwithpanel_776086966.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.relativepanel.alignleftwithpanelproperty
     * @type {DependencyProperty} 
     */
    static AlignLeftWithPanelProperty {
        get => RelativePanel.get_AlignLeftWithPanelProperty()
    }

    /**
     * Identifies the [RelativePanel.AlignTopWithPanel](relativepanel_aligntopwithpanel.md) XAML attached property.
     * @remarks
     * This property is only an identifier for the property system, and isn't used in most app scenarios. In most cases you set the [RelativePanel.AlignTopWithPanel](relativepanel_aligntopwithpanel.md) XAML attached property in XAML and won't need this identifier.
     * 
     * To access the [RelativePanel.Above](relativepanel_aligntopwithpanel.md) attached property in code, you can use the dependency property system, calling either [GetValue](../windows.ui.xaml/dependencyobject_getvalue_1188551207.md) or [SetValue](../windows.ui.xaml/dependencyobject_setvalue_52578133.md) and passing RelativePanel.AlignTopWithPanelProperty as the dependency property identifier. Another way to get or set the value in code is to use [GetAlignTopWithPanel](relativepanel_getaligntopwithpanel_1754862754.md) and [SetAlignTopWithPanel](relativepanel_setaligntopwithpanel_2004747354.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.relativepanel.aligntopwithpanelproperty
     * @type {DependencyProperty} 
     */
    static AlignTopWithPanelProperty {
        get => RelativePanel.get_AlignTopWithPanelProperty()
    }

    /**
     * Identifies the [RelativePanel.AlignRightWithPanel](relativepanel_alignrightwithpanel.md) XAML attached property.
     * @remarks
     * This property is only an identifier for the property system, and isn't used in most app scenarios. In most cases you set the [RelativePanel.AlignRightWithPanel](relativepanel_alignrightwithpanel.md) XAML attached property in XAML and won't need this identifier.
     * 
     * To access the [RelativePanel.AlignRightWithPanel](relativepanel_alignrightwithpanel.md) attached property in code, you can use the dependency property system, calling either [GetValue](../windows.ui.xaml/dependencyobject_getvalue_1188551207.md) or [SetValue](../windows.ui.xaml/dependencyobject_setvalue_52578133.md) and passing RelativePanel.AlignRightWithPanelProperty as the dependency property identifier. Another way to get or set the value in code is to use [GetAlignRightWithPanel](relativepanel_getalignrightwithpanel_1263039459.md) and [SetAlignRightWithPanel](relativepanel_setalignrightwithpanel_957360060.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.relativepanel.alignrightwithpanelproperty
     * @type {DependencyProperty} 
     */
    static AlignRightWithPanelProperty {
        get => RelativePanel.get_AlignRightWithPanelProperty()
    }

    /**
     * Identifies the [RelativePanel.AlignBottomWithPanel](relativepanel_alignbottomwithpanel.md) XAML attached property.
     * @remarks
     * This property is only an identifier for the property system, and isn't used in most app scenarios. In most cases you set the [RelativePanel.AlignBottomWithPanel](relativepanel_alignbottomwithpanel.md) XAML attached property in XAML and won't need this identifier.
     * 
     * To access the [RelativePanel.AlignBottomWithPanel](relativepanel_alignbottomwithpanel.md) attached property in code, you can use the dependency property system, calling either [GetValue](../windows.ui.xaml/dependencyobject_getvalue_1188551207.md) or [SetValue](../windows.ui.xaml/dependencyobject_setvalue_52578133.md) and passing RelativePanel.AlignBottomWithPanelProperty as the dependency property identifier. Another way to get or set the value in code is to use [GetAlignBottomWithPanel](relativepanel_getalignbottomwithpanel_1516633148.md) and [SetAlignBottomWithPanel](relativepanel_setalignbottomwithpanel_1908110608.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.relativepanel.alignbottomwithpanelproperty
     * @type {DependencyProperty} 
     */
    static AlignBottomWithPanelProperty {
        get => RelativePanel.get_AlignBottomWithPanelProperty()
    }

    /**
     * Identifies the [RelativePanel.AlignHorizontalCenterWithPanel](relativepanel_alignhorizontalcenterwithpanel.md) XAML attached property.
     * @remarks
     * This property is only an identifier for the property system, and isn't used in most app scenarios. In most cases you set the [RelativePanel.AlignHorizontalCenterWithPanel](relativepanel_alignhorizontalcenterwithpanel.md) XAML attached property in XAML and won't need this identifier.
     * 
     * To access the [RelativePanel.AlignHorizontalCenterWithPanel](relativepanel_alignhorizontalcenterwithpanel.md) attached property in code, you can use the dependency property system, calling either [GetValue](../windows.ui.xaml/dependencyobject_getvalue_1188551207.md) or [SetValue](../windows.ui.xaml/dependencyobject_setvalue_52578133.md) and passing RelativePanel.AlignHorizontalCenterWithPanelProperty as the dependency property identifier. Another way to get or set the value in code is to use [GetAlignHorizontalCenterWithPanel](relativepanel_getalignhorizontalcenterwithpanel_193369043.md) and [SetAlignHorizontalCenterWithPanel](relativepanel_setalignhorizontalcenterwithpanel_1933437509.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.relativepanel.alignhorizontalcenterwithpanelproperty
     * @type {DependencyProperty} 
     */
    static AlignHorizontalCenterWithPanelProperty {
        get => RelativePanel.get_AlignHorizontalCenterWithPanelProperty()
    }

    /**
     * Identifies the [RelativePanel.AlignVerticalCenterWithPanel](relativepanel_alignverticalcenterwithpanel.md) XAML attached property.
     * @remarks
     * This property is only an identifier for the property system, and isn't used in most app scenarios. In most cases you set the [RelativePanel.AlignVerticalCenterWithPanel](relativepanel_alignverticalcenterwithpanel.md) XAML attached property in XAML and won't need this identifier.
     * 
     * To access the [RelativePanel.AlignVerticalCenterWithPanel](relativepanel_alignverticalcenterwithpanel.md) attached property in code, you can use the dependency property system, calling either [GetValue](../windows.ui.xaml/dependencyobject_getvalue_1188551207.md) or [SetValue](../windows.ui.xaml/dependencyobject_setvalue_52578133.md) and passing RelativePanel.AlignVerticalCenterWithPanelProperty as the dependency property identifier. Another way to get or set the value in code is to use [GetAlignVerticalCenterWithPanel](relativepanel_getalignverticalcenterwithpanel_1330844298.md) and [SetAlignVerticalCenterWithPanel](relativepanel_setalignverticalcenterwithpanel_1861744551.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.relativepanel.alignverticalcenterwithpanelproperty
     * @type {DependencyProperty} 
     */
    static AlignVerticalCenterWithPanelProperty {
        get => RelativePanel.get_AlignVerticalCenterWithPanelProperty()
    }

    /**
     * Identifies the [BorderBrush](relativepanel_borderbrush.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.relativepanel.borderbrushproperty
     * @type {DependencyProperty} 
     */
    static BorderBrushProperty {
        get => RelativePanel.get_BorderBrushProperty()
    }

    /**
     * Identifies the [BorderThickness](relativepanel_borderthickness.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.relativepanel.borderthicknessproperty
     * @type {DependencyProperty} 
     */
    static BorderThicknessProperty {
        get => RelativePanel.get_BorderThicknessProperty()
    }

    /**
     * Identifies the [CornerRadius](relativepanel_cornerradius.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.relativepanel.cornerradiusproperty
     * @type {DependencyProperty} 
     */
    static CornerRadiusProperty {
        get => RelativePanel.get_CornerRadiusProperty()
    }

    /**
     * Identifies the [Padding](relativepanel_padding.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.relativepanel.paddingproperty
     * @type {DependencyProperty} 
     */
    static PaddingProperty {
        get => RelativePanel.get_PaddingProperty()
    }

    /**
     * Identifies the BackgroundSizing dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.relativepanel.backgroundsizingproperty
     * @type {DependencyProperty} 
     */
    static BackgroundSizingProperty {
        get => RelativePanel.get_BackgroundSizingProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_LeftOfProperty() {
        if (!RelativePanel.HasProp("__IRelativePanelStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RelativePanel")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRelativePanelStatics.IID)
            RelativePanel.__IRelativePanelStatics := IRelativePanelStatics(factoryPtr)
        }

        return RelativePanel.__IRelativePanelStatics.get_LeftOfProperty()
    }

    /**
     * Gets the value of the [RelativePanel.LeftOf](relativepanel_leftof.md) XAML attached property for the target element.
     * @remarks
     * This method is a utility method for the property system, and isn't used in most app scenarios. In most cases you set the [RelativePanel.LeftOf](relativepanel_leftof.md) XAML attached property in XAML and won't need this method. For more info, see the [RelativePanel.LeftOf](relativepanel_leftof.md) attached property.
     * @param {UIElement} element The object from which the property value is read.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.relativepanel.getleftof
     */
    static GetLeftOf(element) {
        if (!RelativePanel.HasProp("__IRelativePanelStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RelativePanel")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRelativePanelStatics.IID)
            RelativePanel.__IRelativePanelStatics := IRelativePanelStatics(factoryPtr)
        }

        return RelativePanel.__IRelativePanelStatics.GetLeftOf(element)
    }

    /**
     * Sets the value of the [RelativePanel.LeftOf](relativepanel_leftof.md) XAML attached property for a target element.
     * @remarks
     * This method is a utility method for the property system, and isn't used in most app scenarios. In most cases you set the [RelativePanel.LeftOf](relativepanel_leftof.md) XAML attached property in XAML and won't need this method. For more info, see the [RelativePanel.LeftOf](relativepanel_leftof.md) attached property.
     * @param {UIElement} element The object to which the property value is written.
     * @param {IInspectable} value The value to set. (The element to position this element to the left of.)
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.relativepanel.setleftof
     */
    static SetLeftOf(element, value) {
        if (!RelativePanel.HasProp("__IRelativePanelStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RelativePanel")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRelativePanelStatics.IID)
            RelativePanel.__IRelativePanelStatics := IRelativePanelStatics(factoryPtr)
        }

        return RelativePanel.__IRelativePanelStatics.SetLeftOf(element, value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_AboveProperty() {
        if (!RelativePanel.HasProp("__IRelativePanelStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RelativePanel")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRelativePanelStatics.IID)
            RelativePanel.__IRelativePanelStatics := IRelativePanelStatics(factoryPtr)
        }

        return RelativePanel.__IRelativePanelStatics.get_AboveProperty()
    }

    /**
     * Gets the value of the [RelativePanel.Above](relativepanel_above.md) XAML attached property for the target element.
     * @remarks
     * This method is a utility method for the property system, and isn't used in most app scenarios. In most cases you set the [RelativePanel.Above](relativepanel_above.md) XAML attached property in XAML and won't need this method. For more info, see the [RelativePanel.Above](relativepanel_above.md) attached property.
     * @param {UIElement} element The object from which the property value is read.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.relativepanel.getabove
     */
    static GetAbove(element) {
        if (!RelativePanel.HasProp("__IRelativePanelStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RelativePanel")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRelativePanelStatics.IID)
            RelativePanel.__IRelativePanelStatics := IRelativePanelStatics(factoryPtr)
        }

        return RelativePanel.__IRelativePanelStatics.GetAbove(element)
    }

    /**
     * Sets the value of the [RelativePanel.Above](relativepanel_above.md) XAML attached property for a target element.
     * @remarks
     * This method is a utility method for the property system, and isn't used in most app scenarios. In most cases you set the [RelativePanel.Above](relativepanel_above.md) XAML attached property in XAML and won't need this method. For more info, see the [RelativePanel.Above](relativepanel_above.md) attached property.
     * @param {UIElement} element The object to which the property value is written.
     * @param {IInspectable} value The value to set. (The element to position this element above.)
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.relativepanel.setabove
     */
    static SetAbove(element, value) {
        if (!RelativePanel.HasProp("__IRelativePanelStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RelativePanel")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRelativePanelStatics.IID)
            RelativePanel.__IRelativePanelStatics := IRelativePanelStatics(factoryPtr)
        }

        return RelativePanel.__IRelativePanelStatics.SetAbove(element, value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_RightOfProperty() {
        if (!RelativePanel.HasProp("__IRelativePanelStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RelativePanel")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRelativePanelStatics.IID)
            RelativePanel.__IRelativePanelStatics := IRelativePanelStatics(factoryPtr)
        }

        return RelativePanel.__IRelativePanelStatics.get_RightOfProperty()
    }

    /**
     * Gets the value of the [RelativePanel.RightOf](relativepanel_rightof.md) XAML attached property for the target element.
     * @remarks
     * This method is a utility method for the property system, and isn't used in most app scenarios. In most cases you set the [RelativePanel.RightOf](relativepanel_rightof.md) XAML attached property in XAML and won't need this method. For more info, see the [RelativePanel.RightOf](relativepanel_rightof.md) attached property.
     * @param {UIElement} element The object from which the property value is read.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.relativepanel.getrightof
     */
    static GetRightOf(element) {
        if (!RelativePanel.HasProp("__IRelativePanelStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RelativePanel")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRelativePanelStatics.IID)
            RelativePanel.__IRelativePanelStatics := IRelativePanelStatics(factoryPtr)
        }

        return RelativePanel.__IRelativePanelStatics.GetRightOf(element)
    }

    /**
     * Sets the value of the [RelativePanel.RightOf](relativepanel_rightof.md) XAML attached property for a target element.
     * @remarks
     * This method is a utility method for the property system, and isn't used in most app scenarios. In most cases you set the [RelativePanel.RightOf](relativepanel_rightof.md) XAML attached property in XAML and won't need this method. For more info, see the [RelativePanel.RightOf](relativepanel_rightof.md) attached property.
     * @param {UIElement} element The object to which the property value is written.
     * @param {IInspectable} value The value to set. (The element to position this element to the right of.)
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.relativepanel.setrightof
     */
    static SetRightOf(element, value) {
        if (!RelativePanel.HasProp("__IRelativePanelStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RelativePanel")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRelativePanelStatics.IID)
            RelativePanel.__IRelativePanelStatics := IRelativePanelStatics(factoryPtr)
        }

        return RelativePanel.__IRelativePanelStatics.SetRightOf(element, value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_BelowProperty() {
        if (!RelativePanel.HasProp("__IRelativePanelStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RelativePanel")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRelativePanelStatics.IID)
            RelativePanel.__IRelativePanelStatics := IRelativePanelStatics(factoryPtr)
        }

        return RelativePanel.__IRelativePanelStatics.get_BelowProperty()
    }

    /**
     * Gets the value of the [RelativePanel.Below](relativepanel_below.md) XAML attached property for the target element.
     * @remarks
     * This method is a utility method for the property system, and isn't used in most app scenarios. In most cases you set the [RelativePanel.Below](relativepanel_below.md) XAML attached property in XAML and won't need this method. For more info, see the [RelativePanel.Below](relativepanel_below.md) attached property.
     * @param {UIElement} element The object from which the property value is read.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.relativepanel.getbelow
     */
    static GetBelow(element) {
        if (!RelativePanel.HasProp("__IRelativePanelStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RelativePanel")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRelativePanelStatics.IID)
            RelativePanel.__IRelativePanelStatics := IRelativePanelStatics(factoryPtr)
        }

        return RelativePanel.__IRelativePanelStatics.GetBelow(element)
    }

    /**
     * Sets the value of the [RelativePanel.Below](relativepanel_below.md) XAML attached property for a target element.
     * @remarks
     * This method is a utility method for the property system, and isn't used in most app scenarios. In most cases you set the [RelativePanel.Below](relativepanel_below.md) XAML attached property in XAML and won't need this method. For more info, see the [RelativePanel.Below](relativepanel_below.md) attached property.
     * @param {UIElement} element The object to which the property value is written.
     * @param {IInspectable} value The value to set. (The element to position this element below.)
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.relativepanel.setbelow
     */
    static SetBelow(element, value) {
        if (!RelativePanel.HasProp("__IRelativePanelStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RelativePanel")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRelativePanelStatics.IID)
            RelativePanel.__IRelativePanelStatics := IRelativePanelStatics(factoryPtr)
        }

        return RelativePanel.__IRelativePanelStatics.SetBelow(element, value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_AlignHorizontalCenterWithProperty() {
        if (!RelativePanel.HasProp("__IRelativePanelStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RelativePanel")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRelativePanelStatics.IID)
            RelativePanel.__IRelativePanelStatics := IRelativePanelStatics(factoryPtr)
        }

        return RelativePanel.__IRelativePanelStatics.get_AlignHorizontalCenterWithProperty()
    }

    /**
     * Gets the value of the [RelativePanel.AlignHorizontalCenterWith](relativepanel_alignhorizontalcenterwith.md) XAML attached property for the target element.
     * @remarks
     * This method is a utility method for the property system, and isn't used in most app scenarios. In most cases you set the [RelativePanel.AlignHorizontalCenterWith](relativepanel_alignhorizontalcenterwith.md) XAML attached property in XAML and won't need this method. For more info, see the [RelativePanel.AlignHorizontalCenterWith](relativepanel_alignhorizontalcenterwith.md) attached property.
     * @param {UIElement} element The object from which the property value is read.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.relativepanel.getalignhorizontalcenterwith
     */
    static GetAlignHorizontalCenterWith(element) {
        if (!RelativePanel.HasProp("__IRelativePanelStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RelativePanel")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRelativePanelStatics.IID)
            RelativePanel.__IRelativePanelStatics := IRelativePanelStatics(factoryPtr)
        }

        return RelativePanel.__IRelativePanelStatics.GetAlignHorizontalCenterWith(element)
    }

    /**
     * Sets the value of the [RelativePanel.AlignHorizontalCenterWith](relativepanel_alignhorizontalcenterwith.md) XAML attached property for a target element.
     * @remarks
     * This method is a utility method for the property system, and isn't used in most app scenarios. In most cases you set the [RelativePanel.AlignHorizontalCenterWith](relativepanel_alignhorizontalcenterwith.md) XAML attached property in XAML and won't need this method. For more info, see the [RelativePanel.AlignHorizontalCenterWith](relativepanel_alignhorizontalcenterwith.md) attached property.
     * @param {UIElement} element The object to which the property value is written.
     * @param {IInspectable} value The value to set. (The element to align this element's horizontal center with.)
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.relativepanel.setalignhorizontalcenterwith
     */
    static SetAlignHorizontalCenterWith(element, value) {
        if (!RelativePanel.HasProp("__IRelativePanelStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RelativePanel")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRelativePanelStatics.IID)
            RelativePanel.__IRelativePanelStatics := IRelativePanelStatics(factoryPtr)
        }

        return RelativePanel.__IRelativePanelStatics.SetAlignHorizontalCenterWith(element, value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_AlignVerticalCenterWithProperty() {
        if (!RelativePanel.HasProp("__IRelativePanelStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RelativePanel")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRelativePanelStatics.IID)
            RelativePanel.__IRelativePanelStatics := IRelativePanelStatics(factoryPtr)
        }

        return RelativePanel.__IRelativePanelStatics.get_AlignVerticalCenterWithProperty()
    }

    /**
     * Gets the value of the [RelativePanel.AlignVerticalCenterWith](relativepanel_alignverticalcenterwith.md) XAML attached property for the target element.
     * @remarks
     * This method is a utility method for the property system, and isn't used in most app scenarios. In most cases you set the [RelativePanel.AlignVerticalCenterWith](relativepanel_alignverticalcenterwith.md) XAML attached property in XAML and won't need this method. For more info, see the [RelativePanel.AlignVerticalCenterWith](relativepanel_alignverticalcenterwith.md) attached property.
     * @param {UIElement} element The object from which the property value is read.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.relativepanel.getalignverticalcenterwith
     */
    static GetAlignVerticalCenterWith(element) {
        if (!RelativePanel.HasProp("__IRelativePanelStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RelativePanel")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRelativePanelStatics.IID)
            RelativePanel.__IRelativePanelStatics := IRelativePanelStatics(factoryPtr)
        }

        return RelativePanel.__IRelativePanelStatics.GetAlignVerticalCenterWith(element)
    }

    /**
     * Sets the value of the [RelativePanel.AlignVerticalCenterWith](relativepanel_alignverticalcenterwith.md) XAML attached property for a target element.
     * @remarks
     * This method is a utility method for the property system, and isn't used in most app scenarios. In most cases you set the [RelativePanel.AlignVerticalCenterWith](relativepanel_alignverticalcenterwith.md) XAML attached property in XAML and won't need this method. For more info, see the [RelativePanel.AlignVerticalCenterWith](relativepanel_alignverticalcenterwith.md) attached property.
     * @param {UIElement} element The object to which the property value is written.
     * @param {IInspectable} value The value to set. (The element to align this element's horizontal center with.)
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.relativepanel.setalignverticalcenterwith
     */
    static SetAlignVerticalCenterWith(element, value) {
        if (!RelativePanel.HasProp("__IRelativePanelStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RelativePanel")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRelativePanelStatics.IID)
            RelativePanel.__IRelativePanelStatics := IRelativePanelStatics(factoryPtr)
        }

        return RelativePanel.__IRelativePanelStatics.SetAlignVerticalCenterWith(element, value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_AlignLeftWithProperty() {
        if (!RelativePanel.HasProp("__IRelativePanelStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RelativePanel")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRelativePanelStatics.IID)
            RelativePanel.__IRelativePanelStatics := IRelativePanelStatics(factoryPtr)
        }

        return RelativePanel.__IRelativePanelStatics.get_AlignLeftWithProperty()
    }

    /**
     * Gets the value of the [RelativePanel.AlignLeftWith](relativepanel_alignleftwith.md) XAML attached property for the target element.
     * @remarks
     * This method is a utility method for the property system, and isn't used in most app scenarios. In most cases you set the [RelativePanel.AlignLeftWith](relativepanel_alignleftwith.md) XAML attached property in XAML and won't need this method. For more info, see the [RelativePanel.AlignLeftWith](relativepanel_alignleftwith.md) attached property.
     * @param {UIElement} element The object from which the property value is read.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.relativepanel.getalignleftwith
     */
    static GetAlignLeftWith(element) {
        if (!RelativePanel.HasProp("__IRelativePanelStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RelativePanel")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRelativePanelStatics.IID)
            RelativePanel.__IRelativePanelStatics := IRelativePanelStatics(factoryPtr)
        }

        return RelativePanel.__IRelativePanelStatics.GetAlignLeftWith(element)
    }

    /**
     * Sets the value of the [RelativePanel.AlignLeftWith](relativepanel_alignleftwith.md) XAML attached property for a target element.
     * @remarks
     * This method is a utility method for the property system, and isn't used in most app scenarios. In most cases you set the [RelativePanel.AlignLeftWith](relativepanel_alignleftwith.md) XAML attached property in XAML and won't need this method. For more info, see the [RelativePanel.AlignLeftWith](relativepanel_alignleftwith.md) attached property.
     * @param {UIElement} element The object to which the property value is written.
     * @param {IInspectable} value The value to set. (The element to align this element's left edge with.)
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.relativepanel.setalignleftwith
     */
    static SetAlignLeftWith(element, value) {
        if (!RelativePanel.HasProp("__IRelativePanelStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RelativePanel")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRelativePanelStatics.IID)
            RelativePanel.__IRelativePanelStatics := IRelativePanelStatics(factoryPtr)
        }

        return RelativePanel.__IRelativePanelStatics.SetAlignLeftWith(element, value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_AlignTopWithProperty() {
        if (!RelativePanel.HasProp("__IRelativePanelStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RelativePanel")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRelativePanelStatics.IID)
            RelativePanel.__IRelativePanelStatics := IRelativePanelStatics(factoryPtr)
        }

        return RelativePanel.__IRelativePanelStatics.get_AlignTopWithProperty()
    }

    /**
     * Gets the value of the [RelativePanel.AlignTopWith](relativepanel_aligntopwith.md) XAML attached property for the target element.
     * @remarks
     * This method is a utility method for the property system, and isn't used in most app scenarios. In most cases you set the [RelativePanel.AlignTopWith](relativepanel_aligntopwith.md) XAML attached property in XAML and won't need this method. For more info, see the [RelativePanel.AlignTopWith](relativepanel_aligntopwith.md) attached property.
     * @param {UIElement} element The object from which the property value is read.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.relativepanel.getaligntopwith
     */
    static GetAlignTopWith(element) {
        if (!RelativePanel.HasProp("__IRelativePanelStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RelativePanel")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRelativePanelStatics.IID)
            RelativePanel.__IRelativePanelStatics := IRelativePanelStatics(factoryPtr)
        }

        return RelativePanel.__IRelativePanelStatics.GetAlignTopWith(element)
    }

    /**
     * Sets the value of the [RelativePanel.AlignTopWith](relativepanel_aligntopwith.md) XAML attached property for a target element.
     * @remarks
     * This method is a utility method for the property system, and isn't used in most app scenarios. In most cases you set the [RelativePanel.AlignTopWith](relativepanel_aligntopwith.md) XAML attached property in XAML and won't need this method. For more info, see the [RelativePanel.AlignTopWith](relativepanel_aligntopwith.md) attached property.
     * @param {UIElement} element The object to which the property value is written.
     * @param {IInspectable} value The value to set. (The element to align this element's top edge with.)
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.relativepanel.setaligntopwith
     */
    static SetAlignTopWith(element, value) {
        if (!RelativePanel.HasProp("__IRelativePanelStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RelativePanel")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRelativePanelStatics.IID)
            RelativePanel.__IRelativePanelStatics := IRelativePanelStatics(factoryPtr)
        }

        return RelativePanel.__IRelativePanelStatics.SetAlignTopWith(element, value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_AlignRightWithProperty() {
        if (!RelativePanel.HasProp("__IRelativePanelStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RelativePanel")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRelativePanelStatics.IID)
            RelativePanel.__IRelativePanelStatics := IRelativePanelStatics(factoryPtr)
        }

        return RelativePanel.__IRelativePanelStatics.get_AlignRightWithProperty()
    }

    /**
     * Gets the value of the [RelativePanel.AlignRightWith](relativepanel_alignrightwith.md) XAML attached property for the target element.
     * @remarks
     * This method is a utility method for the property system, and isn't used in most app scenarios. In most cases you set the [RelativePanel.AlignRightWith](relativepanel_alignrightwith.md) XAML attached property in XAML and won't need this method. For more info, see the [RelativePanel.AlignRightWith](relativepanel_alignrightwith.md) attached property.
     * @param {UIElement} element The object from which the property value is read.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.relativepanel.getalignrightwith
     */
    static GetAlignRightWith(element) {
        if (!RelativePanel.HasProp("__IRelativePanelStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RelativePanel")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRelativePanelStatics.IID)
            RelativePanel.__IRelativePanelStatics := IRelativePanelStatics(factoryPtr)
        }

        return RelativePanel.__IRelativePanelStatics.GetAlignRightWith(element)
    }

    /**
     * Sets the value of the [RelativePanel.AlignRightWith](relativepanel_alignrightwith.md) XAML attached property for a target element.
     * @remarks
     * This method is a utility method for the property system, and isn't used in most app scenarios. In most cases you set the [RelativePanel.AlignRightWith](relativepanel_alignrightwith.md) XAML attached property in XAML and won't need this method. For more info, see the [RelativePanel.AlignRightWith](relativepanel_alignrightwith.md) attached property.
     * @param {UIElement} element The object to which the property value is written.
     * @param {IInspectable} value The value to set. (The element to align this element's right edge with.)
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.relativepanel.setalignrightwith
     */
    static SetAlignRightWith(element, value) {
        if (!RelativePanel.HasProp("__IRelativePanelStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RelativePanel")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRelativePanelStatics.IID)
            RelativePanel.__IRelativePanelStatics := IRelativePanelStatics(factoryPtr)
        }

        return RelativePanel.__IRelativePanelStatics.SetAlignRightWith(element, value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_AlignBottomWithProperty() {
        if (!RelativePanel.HasProp("__IRelativePanelStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RelativePanel")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRelativePanelStatics.IID)
            RelativePanel.__IRelativePanelStatics := IRelativePanelStatics(factoryPtr)
        }

        return RelativePanel.__IRelativePanelStatics.get_AlignBottomWithProperty()
    }

    /**
     * Gets the value of the [RelativePanel.AlignBottomWith](relativepanel_alignbottomwith.md) XAML attached property for the target element.
     * @remarks
     * This method is a utility method for the property system, and isn't used in most app scenarios. In most cases you set the [RelativePanel.AlignBottomWith](relativepanel_alignbottomwith.md) XAML attached property in XAML and won't need this method. For more info, see the [RelativePanel.AlignBottomWith](relativepanel_alignbottomwith.md) attached property.
     * @param {UIElement} element The object from which the property value is read.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.relativepanel.getalignbottomwith
     */
    static GetAlignBottomWith(element) {
        if (!RelativePanel.HasProp("__IRelativePanelStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RelativePanel")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRelativePanelStatics.IID)
            RelativePanel.__IRelativePanelStatics := IRelativePanelStatics(factoryPtr)
        }

        return RelativePanel.__IRelativePanelStatics.GetAlignBottomWith(element)
    }

    /**
     * Sets the value of the [RelativePanel.AlignBottomWith](relativepanel_alignbottomwith.md) XAML attached property for the target element.
     * @remarks
     * This method is a utility method for the property system, and isn't used in most app scenarios. In most cases you set the [RelativePanel.AlignBottomWith](relativepanel_alignbottomwith.md) XAML attached property in XAML and won't need this method. For more info, see the [RelativePanel.AlignBottomWith](relativepanel_alignbottomwith.md) attached property.
     * @param {UIElement} element The object to which the property value is written.
     * @param {IInspectable} value The value to set. (The element to align this element's bottom edge with.)
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.relativepanel.setalignbottomwith
     */
    static SetAlignBottomWith(element, value) {
        if (!RelativePanel.HasProp("__IRelativePanelStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RelativePanel")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRelativePanelStatics.IID)
            RelativePanel.__IRelativePanelStatics := IRelativePanelStatics(factoryPtr)
        }

        return RelativePanel.__IRelativePanelStatics.SetAlignBottomWith(element, value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_AlignLeftWithPanelProperty() {
        if (!RelativePanel.HasProp("__IRelativePanelStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RelativePanel")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRelativePanelStatics.IID)
            RelativePanel.__IRelativePanelStatics := IRelativePanelStatics(factoryPtr)
        }

        return RelativePanel.__IRelativePanelStatics.get_AlignLeftWithPanelProperty()
    }

    /**
     * Gets the value of the [RelativePanel.AlignLeftWithPanel](relativepanel_alignleftwithpanel.md) XAML attached property for the target element.
     * @remarks
     * This method is a utility method for the property system, and isn't used in most app scenarios. In most cases you set the [RelativePanel.AlignLeftWithPanel](relativepanel_alignleftwithpanel.md) XAML attached property in XAML and won't need this method. For more info, see the [RelativePanel.AlignLeftWithPanel](relativepanel_alignleftwithpanel.md) attached property.
     * @param {UIElement} element The object from which the property value is read.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.relativepanel.getalignleftwithpanel
     */
    static GetAlignLeftWithPanel(element) {
        if (!RelativePanel.HasProp("__IRelativePanelStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RelativePanel")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRelativePanelStatics.IID)
            RelativePanel.__IRelativePanelStatics := IRelativePanelStatics(factoryPtr)
        }

        return RelativePanel.__IRelativePanelStatics.GetAlignLeftWithPanel(element)
    }

    /**
     * Sets the value of the [RelativePanel.AlignLeftWithPanel](relativepanel_alignleftwithpanel.md) XAML attached property for a target element.
     * @remarks
     * This method is a utility method for the property system, and isn't used in most app scenarios. In most cases you set the [RelativePanel.AlignLeftWithPanel](relativepanel_alignleftwithpanel.md) XAML attached property in XAML and won't need this method. For more info, see the [RelativePanel.AlignLeftWithPanel](relativepanel_alignleftwithpanel.md) attached property.
     * @param {UIElement} element The object to which the property value is written.
     * @param {Boolean} value The value to set. (**true** to align this element's left edge with the panel's left edge; otherwise, **false**.)
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.relativepanel.setalignleftwithpanel
     */
    static SetAlignLeftWithPanel(element, value) {
        if (!RelativePanel.HasProp("__IRelativePanelStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RelativePanel")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRelativePanelStatics.IID)
            RelativePanel.__IRelativePanelStatics := IRelativePanelStatics(factoryPtr)
        }

        return RelativePanel.__IRelativePanelStatics.SetAlignLeftWithPanel(element, value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_AlignTopWithPanelProperty() {
        if (!RelativePanel.HasProp("__IRelativePanelStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RelativePanel")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRelativePanelStatics.IID)
            RelativePanel.__IRelativePanelStatics := IRelativePanelStatics(factoryPtr)
        }

        return RelativePanel.__IRelativePanelStatics.get_AlignTopWithPanelProperty()
    }

    /**
     * Gets the value of the [RelativePanel.AlignTopWithPanel](relativepanel_aligntopwithpanel.md) XAML attached property for the target element.
     * @remarks
     * This method is a utility method for the property system, and isn't used in most app scenarios. In most cases you set the [RelativePanel.AlignTopWithPanel](relativepanel_aligntopwithpanel.md) XAML attached property in XAML and won't need this method. For more info, see the [RelativePanel.AlignTopWithPanel](relativepanel_aligntopwithpanel.md) attached property.
     * @param {UIElement} element The object from which the property value is read.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.relativepanel.getaligntopwithpanel
     */
    static GetAlignTopWithPanel(element) {
        if (!RelativePanel.HasProp("__IRelativePanelStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RelativePanel")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRelativePanelStatics.IID)
            RelativePanel.__IRelativePanelStatics := IRelativePanelStatics(factoryPtr)
        }

        return RelativePanel.__IRelativePanelStatics.GetAlignTopWithPanel(element)
    }

    /**
     * Sets the value of the [RelativePanel.AlignTopWithPanel](relativepanel_aligntopwithpanel.md) XAML attached property for a target element.
     * @remarks
     * This method is a utility method for the property system, and isn't used in most app scenarios. In most cases you set the [RelativePanel.AlignTopWithPanel](relativepanel_aligntopwithpanel.md) XAML attached property in XAML and won't need this method. For more info, see the [RelativePanel.AlignTopWithPanel](relativepanel_aligntopwithpanel.md) attached property.
     * @param {UIElement} element The object to which the property value is written.
     * @param {Boolean} value The value to set. (**true** to align this element's top edge with the panel's top edge; otherwise, **false**.)
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.relativepanel.setaligntopwithpanel
     */
    static SetAlignTopWithPanel(element, value) {
        if (!RelativePanel.HasProp("__IRelativePanelStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RelativePanel")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRelativePanelStatics.IID)
            RelativePanel.__IRelativePanelStatics := IRelativePanelStatics(factoryPtr)
        }

        return RelativePanel.__IRelativePanelStatics.SetAlignTopWithPanel(element, value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_AlignRightWithPanelProperty() {
        if (!RelativePanel.HasProp("__IRelativePanelStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RelativePanel")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRelativePanelStatics.IID)
            RelativePanel.__IRelativePanelStatics := IRelativePanelStatics(factoryPtr)
        }

        return RelativePanel.__IRelativePanelStatics.get_AlignRightWithPanelProperty()
    }

    /**
     * Gets the value of the [RelativePanel.AlignRightWithPanel](relativepanel_alignrightwithpanel.md) XAML attached property for the target element.
     * @remarks
     * This method is a utility method for the property system, and isn't used in most app scenarios. In most cases you set the [RelativePanel.AlignRightWithPanel](relativepanel_alignrightwithpanel.md) XAML attached property in XAML and won't need this method. For more info, see the [RelativePanel.AlignRightWithPanel](relativepanel_alignrightwithpanel.md) attached property.
     * @param {UIElement} element The object from which the property value is read.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.relativepanel.getalignrightwithpanel
     */
    static GetAlignRightWithPanel(element) {
        if (!RelativePanel.HasProp("__IRelativePanelStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RelativePanel")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRelativePanelStatics.IID)
            RelativePanel.__IRelativePanelStatics := IRelativePanelStatics(factoryPtr)
        }

        return RelativePanel.__IRelativePanelStatics.GetAlignRightWithPanel(element)
    }

    /**
     * Sets the value of the [RelativePanel.AlignRightWithPanel](relativepanel_alignrightwithpanel.md) XAML attached property for a target element.
     * @remarks
     * This method is a utility method for the property system, and isn't used in most app scenarios. In most cases you set the [RelativePanel.AlignRightWithPanel](relativepanel_alignrightwithpanel.md) XAML attached property in XAML and won't need this method. For more info, see the [RelativePanel.AlignRightWithPanel](relativepanel_alignrightwithpanel.md) attached property.
     * @param {UIElement} element The object to which the property value is written.
     * @param {Boolean} value The value to set. (**true** to align this element's right edge with the panel's right edge; otherwise, **false**.)
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.relativepanel.setalignrightwithpanel
     */
    static SetAlignRightWithPanel(element, value) {
        if (!RelativePanel.HasProp("__IRelativePanelStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RelativePanel")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRelativePanelStatics.IID)
            RelativePanel.__IRelativePanelStatics := IRelativePanelStatics(factoryPtr)
        }

        return RelativePanel.__IRelativePanelStatics.SetAlignRightWithPanel(element, value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_AlignBottomWithPanelProperty() {
        if (!RelativePanel.HasProp("__IRelativePanelStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RelativePanel")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRelativePanelStatics.IID)
            RelativePanel.__IRelativePanelStatics := IRelativePanelStatics(factoryPtr)
        }

        return RelativePanel.__IRelativePanelStatics.get_AlignBottomWithPanelProperty()
    }

    /**
     * Gets the value of the [RelativePanel.AlignBottomWithPanel](relativepanel_alignbottomwithpanel.md) XAML attached property for the target element.
     * @remarks
     * This method is a utility method for the property system, and isn't used in most app scenarios. In most cases you set the [RelativePanel.AlignBottomWithPanel](relativepanel_alignbottomwithpanel.md) XAML attached property in XAML and won't need this method. For more info, see the [RelativePanel.AlignBottomWithPanel](relativepanel_alignbottomwithpanel.md) attached property.
     * @param {UIElement} element The object from which the property value is read.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.relativepanel.getalignbottomwithpanel
     */
    static GetAlignBottomWithPanel(element) {
        if (!RelativePanel.HasProp("__IRelativePanelStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RelativePanel")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRelativePanelStatics.IID)
            RelativePanel.__IRelativePanelStatics := IRelativePanelStatics(factoryPtr)
        }

        return RelativePanel.__IRelativePanelStatics.GetAlignBottomWithPanel(element)
    }

    /**
     * Sets the value of the [RelativePanel.AlignBottomWithPanel](relativepanel_alignbottomwithpanel.md) XAML attached property for a target element.
     * @remarks
     * This method is a utility method for the property system, and isn't used in most app scenarios. In most cases you set the [RelativePanel.AlignBottomWithPanel](relativepanel_alignbottomwithpanel.md) XAML attached property in XAML and won't need this method. For more info, see the [RelativePanel.AlignBottomWithPanel](relativepanel_alignbottomwithpanel.md) attached property.
     * @param {UIElement} element The object to which the property value is written.
     * @param {Boolean} value The value to set. (**true** to align this element's bottom edge with the panel's bottom edge; otherwise, **false**.)
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.relativepanel.setalignbottomwithpanel
     */
    static SetAlignBottomWithPanel(element, value) {
        if (!RelativePanel.HasProp("__IRelativePanelStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RelativePanel")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRelativePanelStatics.IID)
            RelativePanel.__IRelativePanelStatics := IRelativePanelStatics(factoryPtr)
        }

        return RelativePanel.__IRelativePanelStatics.SetAlignBottomWithPanel(element, value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_AlignHorizontalCenterWithPanelProperty() {
        if (!RelativePanel.HasProp("__IRelativePanelStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RelativePanel")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRelativePanelStatics.IID)
            RelativePanel.__IRelativePanelStatics := IRelativePanelStatics(factoryPtr)
        }

        return RelativePanel.__IRelativePanelStatics.get_AlignHorizontalCenterWithPanelProperty()
    }

    /**
     * Gets the value of the [RelativePanel.AlignHorizontalCenterWithPanel](relativepanel_alignhorizontalcenterwithpanel.md) XAML attached property for the target element.
     * @remarks
     * This method is a utility method for the property system, and isn't used in most app scenarios. In most cases you set the [RelativePanel.AlignHorizontalCenterWithPanel](relativepanel_alignhorizontalcenterwithpanel.md) XAML attached property in XAML and won't need this method. For more info, see the [RelativePanel.AlignHorizontalCenterWithPanel](relativepanel_alignhorizontalcenterwithpanel.md) attached property.
     * @param {UIElement} element The object from which the property value is read.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.relativepanel.getalignhorizontalcenterwithpanel
     */
    static GetAlignHorizontalCenterWithPanel(element) {
        if (!RelativePanel.HasProp("__IRelativePanelStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RelativePanel")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRelativePanelStatics.IID)
            RelativePanel.__IRelativePanelStatics := IRelativePanelStatics(factoryPtr)
        }

        return RelativePanel.__IRelativePanelStatics.GetAlignHorizontalCenterWithPanel(element)
    }

    /**
     * Sets the value of the [RelativePanel.AlignHorizontalCenterWithPanel](relativepanel_alignhorizontalcenterwithpanel.md) XAML attached property for a target element.
     * @remarks
     * This method is a utility method for the property system, and isn't used in most app scenarios. In most cases you set the [RelativePanel.AlignHorizontalCenterWithPanel](relativepanel_alignhorizontalcenterwithpanel.md) XAML attached property in XAML and won't need this method. For more info, see the [RelativePanel.AlignHorizontalCenterWithPanel](relativepanel_alignhorizontalcenterwithpanel.md) attached property.
     * @param {UIElement} element The object to which the property value is written.
     * @param {Boolean} value The value to set. (**true** to horizontally center this element in the panel; otherwise, **false**.)
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.relativepanel.setalignhorizontalcenterwithpanel
     */
    static SetAlignHorizontalCenterWithPanel(element, value) {
        if (!RelativePanel.HasProp("__IRelativePanelStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RelativePanel")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRelativePanelStatics.IID)
            RelativePanel.__IRelativePanelStatics := IRelativePanelStatics(factoryPtr)
        }

        return RelativePanel.__IRelativePanelStatics.SetAlignHorizontalCenterWithPanel(element, value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_AlignVerticalCenterWithPanelProperty() {
        if (!RelativePanel.HasProp("__IRelativePanelStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RelativePanel")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRelativePanelStatics.IID)
            RelativePanel.__IRelativePanelStatics := IRelativePanelStatics(factoryPtr)
        }

        return RelativePanel.__IRelativePanelStatics.get_AlignVerticalCenterWithPanelProperty()
    }

    /**
     * Gets the value of the [RelativePanel.AlignVerticalCenterWithPanel](relativepanel_alignverticalcenterwithpanel.md) XAML attached property for the target element.
     * @remarks
     * This method is a utility method for the property system, and isn't used in most app scenarios. In most cases you set the [RelativePanel.AlignVerticalCenterWithPanel](relativepanel_alignverticalcenterwithpanel.md) XAML attached property in XAML and won't need this method. For more info, see the [RelativePanel.AlignVerticalCenterWithPanel](relativepanel_alignverticalcenterwithpanel.md) attached property.
     * @param {UIElement} element The object from which the property value is read.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.relativepanel.getalignverticalcenterwithpanel
     */
    static GetAlignVerticalCenterWithPanel(element) {
        if (!RelativePanel.HasProp("__IRelativePanelStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RelativePanel")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRelativePanelStatics.IID)
            RelativePanel.__IRelativePanelStatics := IRelativePanelStatics(factoryPtr)
        }

        return RelativePanel.__IRelativePanelStatics.GetAlignVerticalCenterWithPanel(element)
    }

    /**
     * Sets the value of the [RelativePanel.AlignVerticalCenterWithPanel](relativepanel_alignverticalcenterwithpanel.md) XAML attached property for a target element.
     * @remarks
     * This method is a utility method for the property system, and isn't used in most app scenarios. In most cases you set the [RelativePanel.AlignVerticalCenterWithPanel](relativepanel_alignverticalcenterwithpanel.md) XAML attached property in XAML and won't need this method. For more info, see the [RelativePanel.AlignVerticalCenterWithPanel](relativepanel_alignverticalcenterwithpanel.md) attached property.
     * @param {UIElement} element The object to which the property value is written.
     * @param {Boolean} value The value to set. (**true** to vertically center this element in the panel; otherwise, **false**.)
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.relativepanel.setalignverticalcenterwithpanel
     */
    static SetAlignVerticalCenterWithPanel(element, value) {
        if (!RelativePanel.HasProp("__IRelativePanelStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RelativePanel")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRelativePanelStatics.IID)
            RelativePanel.__IRelativePanelStatics := IRelativePanelStatics(factoryPtr)
        }

        return RelativePanel.__IRelativePanelStatics.SetAlignVerticalCenterWithPanel(element, value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_BorderBrushProperty() {
        if (!RelativePanel.HasProp("__IRelativePanelStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RelativePanel")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRelativePanelStatics.IID)
            RelativePanel.__IRelativePanelStatics := IRelativePanelStatics(factoryPtr)
        }

        return RelativePanel.__IRelativePanelStatics.get_BorderBrushProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_BorderThicknessProperty() {
        if (!RelativePanel.HasProp("__IRelativePanelStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RelativePanel")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRelativePanelStatics.IID)
            RelativePanel.__IRelativePanelStatics := IRelativePanelStatics(factoryPtr)
        }

        return RelativePanel.__IRelativePanelStatics.get_BorderThicknessProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_CornerRadiusProperty() {
        if (!RelativePanel.HasProp("__IRelativePanelStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RelativePanel")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRelativePanelStatics.IID)
            RelativePanel.__IRelativePanelStatics := IRelativePanelStatics(factoryPtr)
        }

        return RelativePanel.__IRelativePanelStatics.get_CornerRadiusProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_PaddingProperty() {
        if (!RelativePanel.HasProp("__IRelativePanelStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RelativePanel")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRelativePanelStatics.IID)
            RelativePanel.__IRelativePanelStatics := IRelativePanelStatics(factoryPtr)
        }

        return RelativePanel.__IRelativePanelStatics.get_PaddingProperty()
    }

    /**
     * 
     * @returns {RelativePanel} 
     */
    static CreateInstance() {
        if (!RelativePanel.HasProp("__IRelativePanelFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RelativePanel")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRelativePanelFactory.IID)
            RelativePanel.__IRelativePanelFactory := IRelativePanelFactory(factoryPtr)
        }

        return RelativePanel.__IRelativePanelFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_BackgroundSizingProperty() {
        if (!RelativePanel.HasProp("__IRelativePanelStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RelativePanel")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRelativePanelStatics2.IID)
            RelativePanel.__IRelativePanelStatics2 := IRelativePanelStatics2(factoryPtr)
        }

        return RelativePanel.__IRelativePanelStatics2.get_BackgroundSizingProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets a brush that describes the border fill of the panel.
     * @remarks
     * The [BorderThickness](relativepanel_borderthickness.md) value must be greater than 0 in order to see the BorderBrush value take effect.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.relativepanel.borderbrush
     * @type {Brush} 
     */
    BorderBrush {
        get => this.get_BorderBrush()
        set => this.put_BorderBrush(value)
    }

    /**
     * Gets or sets the border thickness of the panel.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.relativepanel.borderthickness
     * @type {Thickness} 
     */
    BorderThickness {
        get => this.get_BorderThickness()
        set => this.put_BorderThickness(value)
    }

    /**
     * Gets or sets the radius for the corners of the panel's border.
     * @remarks
     * Member components of a [CornerRadius](../windows.ui.xaml/cornerradius.md) value cannot be negative.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.relativepanel.cornerradius
     * @type {CornerRadius} 
     */
    CornerRadius {
        get => this.get_CornerRadius()
        set => this.put_CornerRadius(value)
    }

    /**
     * Gets or sets the distance between the border and its child object.
     * @remarks
     * A related property is [Margin](../windows.ui.xaml/frameworkelement_margin.md) (a property of [FrameworkElement](../windows.ui.xaml/frameworkelement.md)). For more info about the relationship between margin and padding, see [Alignment, margin, and padding](/windows/uwp/layout/alignment-margin-padding) or [Define layouts with XAML](/windows/uwp/layout/layouts-with-xaml).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.relativepanel.padding
     * @type {Thickness} 
     */
    Padding {
        get => this.get_Padding()
        set => this.put_Padding(value)
    }

    /**
     * Gets or sets a value that indicates how far the background extends in relation to this element's border.
     * @remarks
     * You can set this property to **OuterBorderEdge** to make the element's background extend under the border. If the border is transparent, the background will show through it.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.relativepanel.backgroundsizing
     * @type {Integer} 
     */
    BackgroundSizing {
        get => this.get_BackgroundSizing()
        set => this.put_BackgroundSizing(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_BorderBrush() {
        if (!this.HasProp("__IRelativePanel")) {
            if ((queryResult := this.QueryInterface(IRelativePanel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRelativePanel := IRelativePanel(outPtr)
        }

        return this.__IRelativePanel.get_BorderBrush()
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_BorderBrush(value) {
        if (!this.HasProp("__IRelativePanel")) {
            if ((queryResult := this.QueryInterface(IRelativePanel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRelativePanel := IRelativePanel(outPtr)
        }

        return this.__IRelativePanel.put_BorderBrush(value)
    }

    /**
     * 
     * @returns {Thickness} 
     */
    get_BorderThickness() {
        if (!this.HasProp("__IRelativePanel")) {
            if ((queryResult := this.QueryInterface(IRelativePanel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRelativePanel := IRelativePanel(outPtr)
        }

        return this.__IRelativePanel.get_BorderThickness()
    }

    /**
     * 
     * @param {Thickness} value 
     * @returns {HRESULT} 
     */
    put_BorderThickness(value) {
        if (!this.HasProp("__IRelativePanel")) {
            if ((queryResult := this.QueryInterface(IRelativePanel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRelativePanel := IRelativePanel(outPtr)
        }

        return this.__IRelativePanel.put_BorderThickness(value)
    }

    /**
     * 
     * @returns {CornerRadius} 
     */
    get_CornerRadius() {
        if (!this.HasProp("__IRelativePanel")) {
            if ((queryResult := this.QueryInterface(IRelativePanel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRelativePanel := IRelativePanel(outPtr)
        }

        return this.__IRelativePanel.get_CornerRadius()
    }

    /**
     * 
     * @param {CornerRadius} value 
     * @returns {HRESULT} 
     */
    put_CornerRadius(value) {
        if (!this.HasProp("__IRelativePanel")) {
            if ((queryResult := this.QueryInterface(IRelativePanel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRelativePanel := IRelativePanel(outPtr)
        }

        return this.__IRelativePanel.put_CornerRadius(value)
    }

    /**
     * 
     * @returns {Thickness} 
     */
    get_Padding() {
        if (!this.HasProp("__IRelativePanel")) {
            if ((queryResult := this.QueryInterface(IRelativePanel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRelativePanel := IRelativePanel(outPtr)
        }

        return this.__IRelativePanel.get_Padding()
    }

    /**
     * 
     * @param {Thickness} value 
     * @returns {HRESULT} 
     */
    put_Padding(value) {
        if (!this.HasProp("__IRelativePanel")) {
            if ((queryResult := this.QueryInterface(IRelativePanel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRelativePanel := IRelativePanel(outPtr)
        }

        return this.__IRelativePanel.put_Padding(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BackgroundSizing() {
        if (!this.HasProp("__IRelativePanel2")) {
            if ((queryResult := this.QueryInterface(IRelativePanel2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRelativePanel2 := IRelativePanel2(outPtr)
        }

        return this.__IRelativePanel2.get_BackgroundSizing()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_BackgroundSizing(value) {
        if (!this.HasProp("__IRelativePanel2")) {
            if ((queryResult := this.QueryInterface(IRelativePanel2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRelativePanel2 := IRelativePanel2(outPtr)
        }

        return this.__IRelativePanel2.put_BackgroundSizing(value)
    }

;@endregion Instance Methods
}
