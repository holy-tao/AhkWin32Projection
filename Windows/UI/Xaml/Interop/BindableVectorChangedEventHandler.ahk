#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\Com\IUnknown.ahk

/**
 * Represents the method that will handle the [VectorChanged](ibindableobservablevector_vectorchanged.md) event.
 * @remarks
 * Analogous to the [VectorChangedEventHandler<T>](../windows.foundation.collections/vectorchangedeventhandler_1.md) delegate. Although the parameter *e* is of type [Object](/dotnet/api/system.object?view=dotnet-uwp-10.0&preserve-view=true), you can cast it to type [IVectorChangedEventArgs](../windows.foundation.collections/ivectorchangedeventargs.md).
 * 
 * This delegate supports the creation of data bindable collections in C++. When programming with .NET, you should use [ObservableCollection(Of T)](/dotnet/api/system.collections.objectmodel.observablecollection-1?view=dotnet-uwp-10.0&preserve-view=true) or implement [IList](/dotnet/api/system.collections.ilist?view=dotnet-uwp-10.0&preserve-view=true) and [INotifyCollectionChanged](/dotnet/api/system.collections.specialized.inotifycollectionchanged?view=dotnet-uwp-10.0&preserve-view=true). For more info, see [Binding to collections](/windows/uwp/data-binding/data-binding-quickstart).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.interop.bindablevectorchangedeventhandler
 * @namespace Windows.UI.Xaml.Interop
 * @version WindowsRuntime 1.4
 */
class BindableVectorChangedEventHandler extends IUnknown {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for BindableVectorChangedEventHandler
     * @type {Guid}
     */
    static IID => Guid("{624cd4e1-d007-43b1-9c03-af4d3e6258c4}")

    /**
     * The class identifier for BindableVectorChangedEventHandler
     * @type {Guid}
     */
    static CLSID => Guid("{624cd4e1-d007-43b1-9c03-af4d3e6258c4}")

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
     * @param {IBindableObservableVector} vector 
     * @param {IInspectable} e 
     * @returns {HRESULT} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(vector, e) {
        result := ComCall(3, this, "ptr", vector, "ptr", e, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
