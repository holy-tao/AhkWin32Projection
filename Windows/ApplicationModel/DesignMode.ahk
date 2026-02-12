#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDesignModeStatics.ahk
#Include .\IDesignModeStatics2.ahk
#Include ..\..\Guid.ahk

/**
 * Enables you to detect whether your app is in design mode in a visual designer.
 * @remarks
 * Visual designers like Microsoft Visual Studio and Blend for Microsoft Visual Studio 2013 enable you to build UI for UWP app by editing activated instances of your custom types. Design tools create an instance of your app in a special authoring mode, known as design mode. When your app runs in design mode, it can execute special logic that enables coordination with the visual designer.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.designmode
 * @namespace Windows.ApplicationModel
 * @version WindowsRuntime 1.4
 */
class DesignMode extends IInspectable {
;@region Static Properties
    /**
     * Gets a value that indicates whether the process is running in design mode.
     * @remarks
     * Use this property when your custom types require special logic when running in a visual designer. For example, you can query this property to determine whether to display placeholder data instead of live data from a web service.
     * 
     * > [!NOTE]
     * > The DesignModeEnabled property is available only in the presence of a developer certificate.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.designmode.designmodeenabled
     * @type {Boolean} 
     */
    static DesignModeEnabled {
        get => DesignMode.get_DesignModeEnabled()
    }

    /**
     * Used to enable or disable user code inside a XAML designer that targets the Windows 10 Fall Creators Update SDK, or later.
     * @remarks
     * [Windows.ApplicationModel.DesignMode.DesignModeEnabled](designmode_designmodeenabled.md) returns **true** when called from user code running inside any version of the XAML designer--regardless of which SDK version you target. This check is recommended for most users.
     * 
     * Starting with the Windows 10 Fall Creators Update, Visual Studio provides a new XAML designer that targets the Windows 10 Fall Creators Update and later.  
     * 
     * Use **Windows.ApplicationModel.DesignMode.DesignMode2Enabled** to differentiate code that depends on functionality only enabled for a XAML designer that targets the Windows 10 Fall Creators Update SDK or later.
     * 
     * The following table lists differences in functionality supported by the XAML designer, depending on the version of the Windows 10 SDK that the XAML designer targets.
     * 
     * |           | XAML designer that targets the Windows 10 Creators Update SDK or earlier  | Xaml designer that targets the Windows 10 Fall Creators Update SDK or later |
     * |-----------|:------------------:|:------------------:|
     * | [CoreWindow](/uwp/api/windows.ui.core.corewindow) | :x: | :heavy_check_mark: |
     * | [CoreDispatcher](/uwp/api/windows.ui.core.coredispatcher) | :x: | :heavy_check_mark: |
     * | Threading model | Single-threaded apartment (STA) | Application single-threaded apartment (ASTA) |
     * | .NET Framework | Desktop | Core |
     * | UI Composition support | :x: | :heavy_check_mark: |
     * | Acrylic brush support | :x: | :heavy_check_mark: |
     * | Fluent design system | Limited | Full support |
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.designmode.designmode2enabled
     * @type {Boolean} 
     */
    static DesignMode2Enabled {
        get => DesignMode.get_DesignMode2Enabled()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {Boolean} 
     */
    static get_DesignModeEnabled() {
        if (!DesignMode.HasProp("__IDesignModeStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.DesignMode")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDesignModeStatics.IID)
            DesignMode.__IDesignModeStatics := IDesignModeStatics(factoryPtr)
        }

        return DesignMode.__IDesignModeStatics.get_DesignModeEnabled()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    static get_DesignMode2Enabled() {
        if (!DesignMode.HasProp("__IDesignModeStatics2")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.DesignMode")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDesignModeStatics2.IID)
            DesignMode.__IDesignModeStatics2 := IDesignModeStatics2(factoryPtr)
        }

        return DesignMode.__IDesignModeStatics2.get_DesignMode2Enabled()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
