#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\Com\IUnknown.ahk

/**
 * Represents the method that will handle callback for the [GetRelativeScrollPosition](listviewpersistencehelper_getrelativescrollposition_2012223023.md) method.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.listviewitemtokeyhandler
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ListViewItemToKeyHandler extends IUnknown {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ListViewItemToKeyHandler
     * @type {Guid}
     */
    static IID => Guid("{6af5da76-7e8b-4a91-9a56-460cb47d523f}")

    /**
     * The class identifier for ListViewItemToKeyHandler
     * @type {Guid}
     */
    static CLSID => Guid("{6af5da76-7e8b-4a91-9a56-460cb47d523f}")

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
     * @param {IInspectable} item 
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(item) {
        result_ := HSTRING()
        result := ComCall(3, this, "ptr", item, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}
