#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\Com\IUnknown.ahk

/**
 * Represents the callback that is invoked when a property value changes, for property change notifications that are registered with the [RegisterPropertyChangedCallback](dependencyobject_registerpropertychangedcallback_1557279748.md) technique.
 * @remarks
 * The parameter values of the delegate are based on the parameter given to the [RegisterPropertyChangedCallback](dependencyobject_registerpropertychangedcallback_1557279748.md) invocation that registered a particular property for property-changed notification, and the instance that invoked it.
 * 
 * Because the callback has the *dp* parameter that identifies which property value changed, you can use the same callback to handle multiple property-changed cases, and your logic can write cases for each different property.
 * 
 * For performance reasons, you don't get an [OldValue](dependencypropertychangedeventargs_oldvalue.md) / [NewValue](dependencypropertychangedeventargs_newvalue.md) property pair from a [PropertyChangedCallback](propertychangedcallback.md) method like you do from [DependencyPropertyChangedEventArgs](dependencypropertychangedeventargs.md). The property value is changed before the callback, so once the method has been invoked, you can call [DependencyObject.GetValue](dependencyobject_getvalue_1188551207.md) to retrieve the new value.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.dependencypropertychangedcallback
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class DependencyPropertyChangedCallback extends IUnknown {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for DependencyPropertyChangedCallback
     * @type {Guid}
     */
    static IID => Guid("{45883d16-27bf-4bc1-ac26-94c1601f3a49}")

    /**
     * The class identifier for DependencyPropertyChangedCallback
     * @type {Guid}
     */
    static CLSID => Guid("{45883d16-27bf-4bc1-ac26-94c1601f3a49}")

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
     * @param {DependencyObject} sender 
     * @param {DependencyProperty} dp 
     * @returns {HRESULT} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(sender, dp) {
        result := ComCall(3, this, "ptr", sender, "ptr", dp, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
