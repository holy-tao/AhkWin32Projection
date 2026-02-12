#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\Foundation\Collections\IMapView.ahk
#Include .\IIndexableContent.ahk
#Include ..\StorageFolder.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Storage.Search
 * @version WindowsRuntime 1.4
 */
class IContentIndexerQuery extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IContentIndexerQuery
     * @type {Guid}
     */
    static IID => Guid("{70e3b0f8-4bfc-428a-8889-cc51da9a7b9d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCountAsync", "GetPropertiesAsync", "GetPropertiesRangeAsync", "GetAsync", "GetRangeAsync", "get_QueryFolder"]

    /**
     * @type {StorageFolder} 
     */
    QueryFolder {
        get => this.get_QueryFolder()
    }

    /**
     * 
     * @returns {IAsyncOperation<Integer>} 
     */
    GetCountAsync() {
        result := ComCall(6, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetUInt32(), operation)
    }

    /**
     * 
     * @returns {IAsyncOperation<IVectorView<IMapView<HSTRING, IInspectable>>>} 
     */
    GetPropertiesAsync() {
        result := ComCall(7, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, IMapView.Call.Bind(IMapView, (ptr) => HSTRING({ Value: ptr }), IInspectable)), operation)
    }

    /**
     * 
     * @param {Integer} startIndex 
     * @param {Integer} maxItems 
     * @returns {IAsyncOperation<IVectorView<IMapView<HSTRING, IInspectable>>>} 
     */
    GetPropertiesRangeAsync(startIndex, maxItems) {
        result := ComCall(8, this, "uint", startIndex, "uint", maxItems, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, IMapView.Call.Bind(IMapView, (ptr) => HSTRING({ Value: ptr }), IInspectable)), operation)
    }

    /**
     * Determines whether a key is up or down at the time the function is called, and whether the key was pressed after a previous call to GetAsyncKeyState.
     * @remarks
     * The <b>GetAsyncKeyState</b> function works with mouse buttons. However, it checks on the state of the physical mouse buttons, not on the logical mouse buttons that the physical buttons are mapped to. For example, the call <b>GetAsyncKeyState</b>(VK_LBUTTON) always returns the state of the left physical mouse button, regardless of whether it is mapped to the left or right logical mouse button. You can determine the system's current mapping of physical mouse buttons to logical mouse buttons by calling <c>GetSystemMetrics(SM_SWAPBUTTON)</c>.
     * 
     * which returns TRUE if the mouse buttons have been swapped.
     * 
     * Although the least significant bit of the return value indicates whether the key has been pressed since the last query, due to the preemptive multitasking nature of Windows, another application can call <b>GetAsyncKeyState</b> and receive the "recently pressed" bit instead of your application. The behavior of the least significant bit of the return value is retained strictly for compatibility with 16-bit Windows applications (which are non-preemptive) and should not be relied upon.
     * 
     * You can use the virtual-key code constants <b>VK_SHIFT</b>, <b>VK_CONTROL</b>, and <b>VK_MENU</b> as values for the 
     *     <i>vKey</i> parameter. This gives the state of the SHIFT, CTRL, or ALT keys without distinguishing between left and right.
     * 
     * You can use the following virtual-key code constants as values for 
     *     <i>vKey</i> to distinguish between the left and right instances of those keys.
     * 
     * <table class="clsStd">
     * <tr>
     * <th>Code</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td><b>VK_LSHIFT</b></td>
     * <td>
     * Left-shift key.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td><b>VK_RSHIFT</b></td>
     * <td>
     * Right-shift key.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td><b>VK_LCONTROL</b></td>
     * <td>
     * Left-control key.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td><b>VK_RCONTROL</b></td>
     * <td>
     * Right-control key.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td><b>VK_LMENU</b></td>
     * <td>
     * Left-menu key.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td><b>VK_RMENU</b></td>
     * <td>
     * Right-menu key.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * These left- and right-distinguishing constants are only available when you call the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getkeyboardstate">GetKeyboardState</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-setkeyboardstate">SetKeyboardState</a>, <b>GetAsyncKeyState</b>, <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getkeystate">GetKeyState</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-mapvirtualkeya">MapVirtualKey</a> functions.
     * @returns {IAsyncOperation<IVectorView<IIndexableContent>>} 
     * @see https://learn.microsoft.com/windows/win32/api//content/winuser/nf-winuser-getasynckeystate
     */
    GetAsync() {
        result := ComCall(9, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, IIndexableContent), operation)
    }

    /**
     * Determines whether a key is up or down at the time the function is called, and whether the key was pressed after a previous call to GetAsyncKeyState.
     * @remarks
     * The <b>GetAsyncKeyState</b> function works with mouse buttons. However, it checks on the state of the physical mouse buttons, not on the logical mouse buttons that the physical buttons are mapped to. For example, the call <b>GetAsyncKeyState</b>(VK_LBUTTON) always returns the state of the left physical mouse button, regardless of whether it is mapped to the left or right logical mouse button. You can determine the system's current mapping of physical mouse buttons to logical mouse buttons by calling <c>GetSystemMetrics(SM_SWAPBUTTON)</c>.
     * 
     * which returns TRUE if the mouse buttons have been swapped.
     * 
     * Although the least significant bit of the return value indicates whether the key has been pressed since the last query, due to the preemptive multitasking nature of Windows, another application can call <b>GetAsyncKeyState</b> and receive the "recently pressed" bit instead of your application. The behavior of the least significant bit of the return value is retained strictly for compatibility with 16-bit Windows applications (which are non-preemptive) and should not be relied upon.
     * 
     * You can use the virtual-key code constants <b>VK_SHIFT</b>, <b>VK_CONTROL</b>, and <b>VK_MENU</b> as values for the 
     *     <i>vKey</i> parameter. This gives the state of the SHIFT, CTRL, or ALT keys without distinguishing between left and right.
     * 
     * You can use the following virtual-key code constants as values for 
     *     <i>vKey</i> to distinguish between the left and right instances of those keys.
     * 
     * <table class="clsStd">
     * <tr>
     * <th>Code</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td><b>VK_LSHIFT</b></td>
     * <td>
     * Left-shift key.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td><b>VK_RSHIFT</b></td>
     * <td>
     * Right-shift key.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td><b>VK_LCONTROL</b></td>
     * <td>
     * Left-control key.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td><b>VK_RCONTROL</b></td>
     * <td>
     * Right-control key.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td><b>VK_LMENU</b></td>
     * <td>
     * Left-menu key.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td><b>VK_RMENU</b></td>
     * <td>
     * Right-menu key.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * These left- and right-distinguishing constants are only available when you call the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getkeyboardstate">GetKeyboardState</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-setkeyboardstate">SetKeyboardState</a>, <b>GetAsyncKeyState</b>, <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getkeystate">GetKeyState</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-mapvirtualkeya">MapVirtualKey</a> functions.
     * @param {Integer} startIndex 
     * @param {Integer} maxItems 
     * @returns {IAsyncOperation<IVectorView<IIndexableContent>>} 
     * @see https://learn.microsoft.com/windows/win32/api//content/winuser/nf-winuser-getasynckeystate
     */
    GetRangeAsync(startIndex, maxItems) {
        result := ComCall(10, this, "uint", startIndex, "uint", maxItems, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, IIndexableContent), operation)
    }

    /**
     * 
     * @returns {StorageFolder} 
     */
    get_QueryFolder() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return StorageFolder(value)
    }
}
