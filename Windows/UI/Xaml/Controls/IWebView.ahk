#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\Uri.ahk
#Include ..\..\..\Foundation\Collections\IVector.ahk
#Include ..\..\..\ApplicationModel\DataTransfer\DataPackage.ahk
#Include ..\..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Creates a URI that you can pass to [NavigateToLocalStreamUri](iwebviewcontrol_navigatetolocalstreamuri_1538250901.md)
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.web.ui.iwebviewcontrol.buildlocalstreamuri
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IWebView extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWebView
     * @type {Guid}
     */
    static IID => Guid("{5862cc46-1f7d-479b-92a6-de7858fe8d54}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Source", "put_Source", "get_AllowedScriptNotifyUris", "put_AllowedScriptNotifyUris", "get_DataTransferPackage", "add_LoadCompleted", "remove_LoadCompleted", "add_ScriptNotify", "remove_ScriptNotify", "add_NavigationFailed", "remove_NavigationFailed", "InvokeScript", "Navigate", "NavigateToString"]

    /**
     * @type {Uri} 
     */
    Source {
        get => this.get_Source()
        set => this.put_Source(value)
    }

    /**
     * @type {IVector<Uri>} 
     */
    AllowedScriptNotifyUris {
        get => this.get_AllowedScriptNotifyUris()
        set => this.put_AllowedScriptNotifyUris(value)
    }

    /**
     * @type {DataPackage} 
     */
    DataTransferPackage {
        get => this.get_DataTransferPackage()
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_Source() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Uri(value)
    }

    /**
     * 
     * @param {Uri} value 
     * @returns {HRESULT} 
     */
    put_Source(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IVector<Uri>} 
     */
    get_AllowedScriptNotifyUris() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(Uri, value)
    }

    /**
     * 
     * @param {IVector<Uri>} value 
     * @returns {HRESULT} 
     */
    put_AllowedScriptNotifyUris(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DataPackage} 
     */
    get_DataTransferPackage() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DataPackage(value)
    }

    /**
     * 
     * @param {LoadCompletedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_LoadCompleted(handler) {
        token := EventRegistrationToken()
        result := ComCall(11, this, "ptr", handler, "ptr", token, "int")
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
    remove_LoadCompleted(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(12, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {NotifyEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ScriptNotify(handler) {
        token := EventRegistrationToken()
        result := ComCall(13, this, "ptr", handler, "ptr", token, "int")
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
    remove_ScriptNotify(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(14, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {WebViewNavigationFailedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_NavigationFailed(handler) {
        token := EventRegistrationToken()
        result := ComCall(15, this, "ptr", handler, "ptr", token, "int")
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
    remove_NavigationFailed(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(16, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} scriptName 
     * @param {Integer} arguments_length 
     * @param {Pointer<HSTRING>} arguments 
     * @returns {HSTRING} 
     */
    InvokeScript(scriptName, arguments_length, arguments) {
        if(scriptName is String) {
            pin := HSTRING.Create(scriptName)
            scriptName := pin.Value
        }
        scriptName := scriptName is Win32Handle ? NumGet(scriptName, "ptr") : scriptName

        result_ := HSTRING()
        result := ComCall(17, this, "ptr", scriptName, "uint", arguments_length, "ptr", arguments, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * Note This section describes functionality designed for use by online stores. Use of this functionality outside the context of an online store is not supported. The Navigate element specifies a URL used by calls to External.NavigateTaskPaneURL.
     * @param {Uri} source 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/WMP/navigate-element
     */
    Navigate(source) {
        result := ComCall(18, this, "ptr", source, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} text 
     * @returns {HRESULT} 
     */
    NavigateToString(text) {
        if(text is String) {
            pin := HSTRING.Create(text)
            text := pin.Value
        }
        text := text is Win32Handle ? NumGet(text, "ptr") : text

        result := ComCall(19, this, "ptr", text, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
