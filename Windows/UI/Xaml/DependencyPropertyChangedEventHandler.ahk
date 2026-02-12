#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\Com\IUnknown.ahk

/**
 * Represents the method that will handle events that occur when a [DependencyProperty](dependencyproperty.md) is changed on a particular [DependencyObject](dependencyobject.md) implementation.
 * @remarks
 * DependencyPropertyChangedEventHandler is the delegate to use when writing handlers for the [Control.IsEnabledChanged](../windows.ui.xaml.controls/control_isenabledchanged.md) event. That event is the only defined Windows Runtime event that uses this delegate.
 * 
 * A custom control implementer might consider using DependencyPropertyChangedEventHandler as the delegate type if a custom event is fired as a result of a dependency property value change. You can only fire such an event from within the context of a [PropertyChangedCallback](propertychangedcallback.md). This is because the value that changed (the property, the old and new value) should be in the [DependencyPropertyChangedEventArgs](dependencypropertychangedeventargs.md) that are reported for the event at the property-system level. But there aren't any constructors for [DependencyPropertyChangedEventArgs](dependencypropertychangedeventargs.md) and none of its properties are settable, so the only way to get a [DependencyPropertyChangedEventArgs](dependencypropertychangedeventargs.md) value is to get it from the original [PropertyChangedCallback](propertychangedcallback.md) parameters and pass it through when you fire your custom event.
 * 
 * DependencyPropertyChangedEventHandler is not the delegate that you use for custom dependency property metadata and a custom property-changed callback behavior. For that, you want [PropertyChangedCallback](propertychangedcallback.md). For more info, see [Custom dependency properties](/windows/uwp/xaml-platform/custom-dependency-properties).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.dependencypropertychangedeventhandler
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class DependencyPropertyChangedEventHandler extends IUnknown {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for DependencyPropertyChangedEventHandler
     * @type {Guid}
     */
    static IID => Guid("{09223e5a-75be-4499-8180-1ddc005421c0}")

    /**
     * The class identifier for DependencyPropertyChangedEventHandler
     * @type {Guid}
     */
    static CLSID => Guid("{09223e5a-75be-4499-8180-1ddc005421c0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {IInspectable} sender 
     * @param {DependencyPropertyChangedEventArgs} e 
     * @returns {HRESULT} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(sender, e) {
        result := ComCall(3, this, "ptr", sender, "ptr", e, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
