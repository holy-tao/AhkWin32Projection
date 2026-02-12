#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Extends [IBindableVector](ibindablevector.md) by adding a [VectorChanged](ibindableobservablevector_vectorchanged.md) event for change notification.
 * @remarks
 * This interface supports the creation of data bindable collections in C++. When programming with .NET, you should use [ObservableCollection(Of T)](/dotnet/api/system.collections.objectmodel.observablecollection-1?view=dotnet-uwp-10.0&preserve-view=true) or implement [IList](/dotnet/api/system.collections.ilist?view=dotnet-uwp-10.0&preserve-view=true) and [INotifyCollectionChanged](/dotnet/api/system.collections.specialized.inotifycollectionchanged?view=dotnet-uwp-10.0&preserve-view=true). For more info, see [Binding to collections](/windows/uwp/data-binding/data-binding-quickstart).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.interop.ibindableobservablevector
 * @namespace Windows.UI.Xaml.Interop
 * @version WindowsRuntime 1.4
 */
class IBindableObservableVector extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBindableObservableVector
     * @type {Guid}
     */
    static IID => Guid("{fe1eb536-7e7f-4f90-ac9a-474984aae512}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["add_VectorChanged", "remove_VectorChanged"]

    /**
     * 
     * @param {BindableVectorChangedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_VectorChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(6, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_VectorChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(7, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
