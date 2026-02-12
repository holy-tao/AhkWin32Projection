#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Foundation\IAsyncAction.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IListViewPersistenceHelperStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IListViewPersistenceHelperStatics
     * @type {Guid}
     */
    static IID => Guid("{6d0c2b08-bb9b-44f9-8063-5c3f9c21884b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetRelativeScrollPosition", "SetRelativeScrollPositionAsync"]

    /**
     * 
     * @param {ListViewBase} listViewBase_ 
     * @param {ListViewItemToKeyHandler} itemToKeyHandler 
     * @returns {HSTRING} 
     */
    GetRelativeScrollPosition(listViewBase_, itemToKeyHandler) {
        result_ := HSTRING()
        result := ComCall(6, this, "ptr", listViewBase_, "ptr", itemToKeyHandler, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {ListViewBase} listViewBase_ 
     * @param {HSTRING} relativeScrollPosition 
     * @param {ListViewKeyToItemHandler} keyToItemHandler 
     * @returns {IAsyncAction} 
     */
    SetRelativeScrollPositionAsync(listViewBase_, relativeScrollPosition, keyToItemHandler) {
        if(relativeScrollPosition is String) {
            pin := HSTRING.Create(relativeScrollPosition)
            relativeScrollPosition := pin.Value
        }
        relativeScrollPosition := relativeScrollPosition is Win32Handle ? NumGet(relativeScrollPosition, "ptr") : relativeScrollPosition

        result := ComCall(7, this, "ptr", listViewBase_, "ptr", relativeScrollPosition, "ptr", keyToItemHandler, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }
}
