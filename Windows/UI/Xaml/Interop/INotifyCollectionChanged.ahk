#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Provides a collection-changed pattern interface for C++ bindable classes.
  * 
  * 
  * 
  * > **.NET**
  * > This interface appears as [System.Collections.Specialized.INotifyCollectionChanged](/dotnet/api/system.collections.specialized.inotifycollectionchanged?view=dotnet-uwp-10.0&preserve-view=true).
 * @remarks
 * When programming with .NET, this interface is hidden and developers should use the [System.Collections.Specialized.INotifyCollectionChanged](/dotnet/api/system.collections.specialized.inotifycollectionchanged?view=dotnet-uwp-10.0&preserve-view=true) interface.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.interop.inotifycollectionchanged
 * @namespace Windows.UI.Xaml.Interop
 * @version WindowsRuntime 1.4
 */
class INotifyCollectionChanged extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INotifyCollectionChanged
     * @type {Guid}
     */
    static IID => Guid("{28b167d5-1a31-465b-9b25-d5c3ae686c40}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["add_CollectionChanged", "remove_CollectionChanged"]

    /**
     * 
     * @param {NotifyCollectionChangedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_CollectionChanged(handler) {
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
    remove_CollectionChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(7, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
