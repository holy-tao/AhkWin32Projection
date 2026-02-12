#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\Com\IUnknown.ahk

/**
 * Represents the asynchronous method that will handle callback for the [SetRelativeScrollPositionAsync](listviewpersistencehelper_setrelativescrollpositionasync_2138322716.md) method.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.listviewkeytoitemhandler
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ListViewKeyToItemHandler extends IUnknown {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ListViewKeyToItemHandler
     * @type {Guid}
     */
    static IID => Guid("{26fd5855-b530-4688-b9f0-428249178ef8}")

    /**
     * The class identifier for ListViewKeyToItemHandler
     * @type {Guid}
     */
    static CLSID => Guid("{26fd5855-b530-4688-b9f0-428249178ef8}")

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
     * @param {HSTRING} key 
     * @returns {IAsyncOperation<IInspectable>} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(key) {
        if(key is String) {
            pin := HSTRING.Create(key)
            key := pin.Value
        }
        key := key is Win32Handle ? NumGet(key, "ptr") : key

        result := ComCall(3, this, "ptr", key, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IInspectable, operation)
    }
}
