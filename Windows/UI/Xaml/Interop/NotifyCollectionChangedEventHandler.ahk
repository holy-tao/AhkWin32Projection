#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\Com\IUnknown.ahk

/**
 * Represents the method that will handle the [CollectionChanged](inotifycollectionchanged_collectionchanged.md) event.
  * 
  * 
  * 
  * > **.NET**
  * > This interface appears as [System.Collections.Specialized.NotifyCollectionChangedEventHandler](/dotnet/api/system.collections.specialized.notifycollectionchangedeventhandler?view=dotnet-uwp-10.0&preserve-view=true).
 * @remarks
 * When programming with .NET, this delegate is hidden and developers should use the [System.Collections.Specialized.NotifyCollectionChangedEventHandler](/dotnet/api/system.collections.specialized.notifycollectionchangedeventhandler?view=dotnet-uwp-10.0&preserve-view=true) delegate.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.interop.notifycollectionchangedeventhandler
 * @namespace Windows.UI.Xaml.Interop
 * @version WindowsRuntime 1.4
 */
class NotifyCollectionChangedEventHandler extends IUnknown {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for NotifyCollectionChangedEventHandler
     * @type {Guid}
     */
    static IID => Guid("{ca10b37c-f382-4591-8557-5e24965279b0}")

    /**
     * The class identifier for NotifyCollectionChangedEventHandler
     * @type {Guid}
     */
    static CLSID => Guid("{ca10b37c-f382-4591-8557-5e24965279b0}")

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
     * @param {NotifyCollectionChangedEventArgs} e 
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
