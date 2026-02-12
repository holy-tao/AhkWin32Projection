#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\GameSaveProvider.ahk
#Include ..\..\..\Foundation\IAsyncOperation.ahk
#Include .\GameSaveOperationResult.ahk
#Include .\GameSaveBlobGetResult.ahk
#Include .\GameSaveBlobInfoQuery.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Gaming.XboxLive.Storage
 * @version WindowsRuntime 1.4
 */
class IGameSaveContainer extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGameSaveContainer
     * @type {Guid}
     */
    static IID => Guid("{c3c08f89-563f-4ecd-9c6f-33fd0e323d10}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Name", "get_Provider", "SubmitUpdatesAsync", "ReadAsync", "GetAsync", "SubmitPropertySetUpdatesAsync", "CreateBlobInfoQuery"]

    /**
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * @type {GameSaveProvider} 
     */
    Provider {
        get => this.get_Provider()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Name() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {GameSaveProvider} 
     */
    get_Provider() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return GameSaveProvider(value)
    }

    /**
     * 
     * @param {IMapView<HSTRING, IBuffer>} blobsToWrite 
     * @param {IIterable<HSTRING>} blobsToDelete 
     * @param {HSTRING} displayName 
     * @returns {IAsyncOperation<GameSaveOperationResult>} 
     */
    SubmitUpdatesAsync(blobsToWrite, blobsToDelete, displayName) {
        if(displayName is String) {
            pin := HSTRING.Create(displayName)
            displayName := pin.Value
        }
        displayName := displayName is Win32Handle ? NumGet(displayName, "ptr") : displayName

        result := ComCall(8, this, "ptr", blobsToWrite, "ptr", blobsToDelete, "ptr", displayName, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(GameSaveOperationResult, operation)
    }

    /**
     * 
     * @param {IMapView<HSTRING, IBuffer>} blobsToRead 
     * @returns {IAsyncOperation<GameSaveOperationResult>} 
     */
    ReadAsync(blobsToRead) {
        result := ComCall(9, this, "ptr", blobsToRead, "ptr*", &action := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(GameSaveOperationResult, action)
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
     * @param {IIterable<HSTRING>} blobsToRead 
     * @returns {IAsyncOperation<GameSaveBlobGetResult>} 
     * @see https://learn.microsoft.com/windows/win32/api//content/winuser/nf-winuser-getasynckeystate
     */
    GetAsync(blobsToRead) {
        result := ComCall(10, this, "ptr", blobsToRead, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(GameSaveBlobGetResult, operation)
    }

    /**
     * 
     * @param {IPropertySet} blobsToWrite 
     * @param {IIterable<HSTRING>} blobsToDelete 
     * @param {HSTRING} displayName 
     * @returns {IAsyncOperation<GameSaveOperationResult>} 
     */
    SubmitPropertySetUpdatesAsync(blobsToWrite, blobsToDelete, displayName) {
        if(displayName is String) {
            pin := HSTRING.Create(displayName)
            displayName := pin.Value
        }
        displayName := displayName is Win32Handle ? NumGet(displayName, "ptr") : displayName

        result := ComCall(11, this, "ptr", blobsToWrite, "ptr", blobsToDelete, "ptr", displayName, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(GameSaveOperationResult, operation)
    }

    /**
     * 
     * @param {HSTRING} blobNamePrefix 
     * @returns {GameSaveBlobInfoQuery} 
     */
    CreateBlobInfoQuery(blobNamePrefix) {
        if(blobNamePrefix is String) {
            pin := HSTRING.Create(blobNamePrefix)
            blobNamePrefix := pin.Value
        }
        blobNamePrefix := blobNamePrefix is Win32Handle ? NumGet(blobNamePrefix, "ptr") : blobNamePrefix

        result := ComCall(12, this, "ptr", blobNamePrefix, "ptr*", &query := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return GameSaveBlobInfoQuery(query)
    }
}
