#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Provides methods to let an item be inserted between other items in a drag-and-drop operation.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.iinsertionpanel
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IInsertionPanel extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInsertionPanel
     * @type {Guid}
     */
    static IID => Guid("{6b8de08f-6527-4d39-bcbf-58b01da923d7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetInsertionIndexes"]

    /**
     * Returns the index values of the items that the specified point is between.
     * @remarks
     * Call this method when handling a [DragOver](../windows.ui.xaml/uielement_dragover.md) event to return the indices of the two items between which the [DragOver](../windows.ui.xaml/uielement_dragover.md) is happening and where a potential drop and insertion would happen.
     * @param {POINT} position The point for which to get insertion indexes.
     * @param {Pointer<Int32>} first The index of the item before the specified point.
     * @param {Pointer<Int32>} second The index of the item after the specified point.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.iinsertionpanel.getinsertionindexes
     */
    GetInsertionIndexes(position, first, second) {
        result := ComCall(6, this, "ptr", position, "ptr", first, "ptr", second, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
