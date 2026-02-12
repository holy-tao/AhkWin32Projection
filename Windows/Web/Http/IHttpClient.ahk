#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperationWithProgress.ahk
#Include .\HttpResponseMessage.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Storage\Streams\IBuffer.ahk
#Include ..\..\Storage\Streams\IInputStream.ahk
#Include Headers\HttpRequestHeaderCollection.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Web.Http
 * @version WindowsRuntime 1.4
 */
class IHttpClient extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHttpClient
     * @type {Guid}
     */
    static IID => Guid("{7fda1151-3574-4880-a8ba-e6b1e0061f3d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["DeleteAsync", "GetAsync", "GetWithOptionAsync", "GetBufferAsync", "GetInputStreamAsync", "GetStringAsync", "PostAsync", "PutAsync", "SendRequestAsync", "SendRequestWithOptionAsync", "get_DefaultRequestHeaders"]

    /**
     * @type {HttpRequestHeaderCollection} 
     */
    DefaultRequestHeaders {
        get => this.get_DefaultRequestHeaders()
    }

    /**
     * 
     * @param {Uri} uri_ 
     * @returns {IAsyncOperationWithProgress<HttpResponseMessage, HttpProgress>} 
     */
    DeleteAsync(uri_) {
        result := ComCall(6, this, "ptr", uri_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperationWithProgress(HttpResponseMessage, (ptr) => IPropertyValue(ptr).GetHttpProgress(), operation)
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
     * @param {Uri} uri_ 
     * @returns {IAsyncOperationWithProgress<HttpResponseMessage, HttpProgress>} 
     * @see https://learn.microsoft.com/windows/win32/api//content/winuser/nf-winuser-getasynckeystate
     */
    GetAsync(uri_) {
        result := ComCall(7, this, "ptr", uri_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperationWithProgress(HttpResponseMessage, (ptr) => IPropertyValue(ptr).GetHttpProgress(), operation)
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
     * @param {Uri} uri_ 
     * @param {Integer} completionOption 
     * @returns {IAsyncOperationWithProgress<HttpResponseMessage, HttpProgress>} 
     * @see https://learn.microsoft.com/windows/win32/api//content/winuser/nf-winuser-getasynckeystate
     */
    GetWithOptionAsync(uri_, completionOption) {
        result := ComCall(8, this, "ptr", uri_, "int", completionOption, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperationWithProgress(HttpResponseMessage, (ptr) => IPropertyValue(ptr).GetHttpProgress(), operation)
    }

    /**
     * 
     * @param {Uri} uri_ 
     * @returns {IAsyncOperationWithProgress<IBuffer, HttpProgress>} 
     */
    GetBufferAsync(uri_) {
        result := ComCall(9, this, "ptr", uri_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperationWithProgress(IBuffer, (ptr) => IPropertyValue(ptr).GetHttpProgress(), operation)
    }

    /**
     * 
     * @param {Uri} uri_ 
     * @returns {IAsyncOperationWithProgress<IInputStream, HttpProgress>} 
     */
    GetInputStreamAsync(uri_) {
        result := ComCall(10, this, "ptr", uri_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperationWithProgress(IInputStream, (ptr) => IPropertyValue(ptr).GetHttpProgress(), operation)
    }

    /**
     * 
     * @param {Uri} uri_ 
     * @returns {IAsyncOperationWithProgress<HSTRING, HttpProgress>} 
     */
    GetStringAsync(uri_) {
        result := ComCall(11, this, "ptr", uri_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperationWithProgress((ptr) => HSTRING({ Value: ptr }), (ptr) => IPropertyValue(ptr).GetHttpProgress(), operation)
    }

    /**
     * 
     * @param {Uri} uri_ 
     * @param {IHttpContent} content 
     * @returns {IAsyncOperationWithProgress<HttpResponseMessage, HttpProgress>} 
     */
    PostAsync(uri_, content) {
        result := ComCall(12, this, "ptr", uri_, "ptr", content, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperationWithProgress(HttpResponseMessage, (ptr) => IPropertyValue(ptr).GetHttpProgress(), operation)
    }

    /**
     * 
     * @param {Uri} uri_ 
     * @param {IHttpContent} content 
     * @returns {IAsyncOperationWithProgress<HttpResponseMessage, HttpProgress>} 
     */
    PutAsync(uri_, content) {
        result := ComCall(13, this, "ptr", uri_, "ptr", content, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperationWithProgress(HttpResponseMessage, (ptr) => IPropertyValue(ptr).GetHttpProgress(), operation)
    }

    /**
     * 
     * @param {HttpRequestMessage} request 
     * @returns {IAsyncOperationWithProgress<HttpResponseMessage, HttpProgress>} 
     */
    SendRequestAsync(request) {
        result := ComCall(14, this, "ptr", request, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperationWithProgress(HttpResponseMessage, (ptr) => IPropertyValue(ptr).GetHttpProgress(), operation)
    }

    /**
     * 
     * @param {HttpRequestMessage} request 
     * @param {Integer} completionOption 
     * @returns {IAsyncOperationWithProgress<HttpResponseMessage, HttpProgress>} 
     */
    SendRequestWithOptionAsync(request, completionOption) {
        result := ComCall(15, this, "ptr", request, "int", completionOption, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperationWithProgress(HttpResponseMessage, (ptr) => IPropertyValue(ptr).GetHttpProgress(), operation)
    }

    /**
     * 
     * @returns {HttpRequestHeaderCollection} 
     */
    get_DefaultRequestHeaders() {
        result := ComCall(16, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HttpRequestHeaderCollection(value)
    }
}
