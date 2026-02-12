#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\Com\IUnknown.ahk

/**
 * Represents the callback that is invoked when the effective property value of a dependency property changes.
 * @remarks
 * You implement callbacks based on this delegate to provide the property-changed behavior for a custom dependency property. You might use this callback to provide value constraints, or to initiate value changes in other properties that depend on the value of the property that is being changed. For more info see [Custom dependency properties](/windows/uwp/xaml-platform/custom-dependency-properties).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.propertychangedcallback
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class PropertyChangedCallback extends IUnknown {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for PropertyChangedCallback
     * @type {Guid}
     */
    static IID => Guid("{5a9f8a25-d142-44a4-8231-fd676724f29b}")

    /**
     * The class identifier for PropertyChangedCallback
     * @type {Guid}
     */
    static CLSID => Guid("{5a9f8a25-d142-44a4-8231-fd676724f29b}")

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
     * @param {DependencyObject} d 
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
    Invoke(d, e) {
        result := ComCall(3, this, "ptr", d, "ptr", e, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
