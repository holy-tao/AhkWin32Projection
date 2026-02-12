#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\DependencyObject.ahk
#Include .\ISplitViewTemplateSettings.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Provides calculated values that can be referenced as **TemplatedParent** sources when defining templates for a [SplitView](../windows.ui.xaml.controls/splitview.md). Not intended for general use.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.splitviewtemplatesettings
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class SplitViewTemplateSettings extends DependencyObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISplitViewTemplateSettings

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISplitViewTemplateSettings.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the [OpenPaneLength](../windows.ui.xaml.controls/splitview_openpanelength.md) value.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.splitviewtemplatesettings.openpanelength
     * @type {Float} 
     */
    OpenPaneLength {
        get => this.get_OpenPaneLength()
    }

    /**
     * Gets the negative of the [OpenPaneLength](../windows.ui.xaml.controls/splitview_openpanelength.md) value.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.splitviewtemplatesettings.negativeopenpanelength
     * @type {Float} 
     */
    NegativeOpenPaneLength {
        get => this.get_NegativeOpenPaneLength()
    }

    /**
     * Gets a value calculated by subtracting the [CompactPaneLength](../windows.ui.xaml.controls/splitview_compactpanelength.md) value from the [OpenPaneLength](../windows.ui.xaml.controls/splitview_openpanelength.md) value.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.splitviewtemplatesettings.openpanelengthminuscompactlength
     * @type {Float} 
     */
    OpenPaneLengthMinusCompactLength {
        get => this.get_OpenPaneLengthMinusCompactLength()
    }

    /**
     * Gets the negative of the value calculated by subtracting the [CompactPaneLength](../windows.ui.xaml.controls/splitview_compactpanelength.md) value from the [OpenPaneLength](../windows.ui.xaml.controls/splitview_openpanelength.md) value.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.splitviewtemplatesettings.negativeopenpanelengthminuscompactlength
     * @type {Float} 
     */
    NegativeOpenPaneLengthMinusCompactLength {
        get => this.get_NegativeOpenPaneLengthMinusCompactLength()
    }

    /**
     * Gets the [OpenPaneLength](../windows.ui.xaml.controls/splitview_openpanelength.md) value as a [GridLength](../windows.ui.xaml/gridlength.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.splitviewtemplatesettings.openpanegridlength
     * @type {GridLength} 
     */
    OpenPaneGridLength {
        get => this.get_OpenPaneGridLength()
    }

    /**
     * Gets the [CompactPaneLength](../windows.ui.xaml.controls/splitview_compactpanelength.md) value as a [GridLength](../windows.ui.xaml/gridlength.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.splitviewtemplatesettings.compactpanegridlength
     * @type {GridLength} 
     */
    CompactPaneGridLength {
        get => this.get_CompactPaneGridLength()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_OpenPaneLength() {
        if (!this.HasProp("__ISplitViewTemplateSettings")) {
            if ((queryResult := this.QueryInterface(ISplitViewTemplateSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISplitViewTemplateSettings := ISplitViewTemplateSettings(outPtr)
        }

        return this.__ISplitViewTemplateSettings.get_OpenPaneLength()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_NegativeOpenPaneLength() {
        if (!this.HasProp("__ISplitViewTemplateSettings")) {
            if ((queryResult := this.QueryInterface(ISplitViewTemplateSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISplitViewTemplateSettings := ISplitViewTemplateSettings(outPtr)
        }

        return this.__ISplitViewTemplateSettings.get_NegativeOpenPaneLength()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_OpenPaneLengthMinusCompactLength() {
        if (!this.HasProp("__ISplitViewTemplateSettings")) {
            if ((queryResult := this.QueryInterface(ISplitViewTemplateSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISplitViewTemplateSettings := ISplitViewTemplateSettings(outPtr)
        }

        return this.__ISplitViewTemplateSettings.get_OpenPaneLengthMinusCompactLength()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_NegativeOpenPaneLengthMinusCompactLength() {
        if (!this.HasProp("__ISplitViewTemplateSettings")) {
            if ((queryResult := this.QueryInterface(ISplitViewTemplateSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISplitViewTemplateSettings := ISplitViewTemplateSettings(outPtr)
        }

        return this.__ISplitViewTemplateSettings.get_NegativeOpenPaneLengthMinusCompactLength()
    }

    /**
     * 
     * @returns {GridLength} 
     */
    get_OpenPaneGridLength() {
        if (!this.HasProp("__ISplitViewTemplateSettings")) {
            if ((queryResult := this.QueryInterface(ISplitViewTemplateSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISplitViewTemplateSettings := ISplitViewTemplateSettings(outPtr)
        }

        return this.__ISplitViewTemplateSettings.get_OpenPaneGridLength()
    }

    /**
     * 
     * @returns {GridLength} 
     */
    get_CompactPaneGridLength() {
        if (!this.HasProp("__ISplitViewTemplateSettings")) {
            if ((queryResult := this.QueryInterface(ISplitViewTemplateSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISplitViewTemplateSettings := ISplitViewTemplateSettings(outPtr)
        }

        return this.__ISplitViewTemplateSettings.get_CompactPaneGridLength()
    }

;@endregion Instance Methods
}
