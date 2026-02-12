#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * The ICoreFrameworkInputViewInterop interface is to be determined.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api//content/windows.ui.viewmanagement.core.coreframeworkinputviewinterop/nn-windows-ui-viewmanagement-core-coreframeworkinputviewinterop-icoreframeworkinputviewinterop
 * @namespace Windows.UI.ViewManagement.Core
 * @version WindowsRuntime 1.4
 */
class ICoreFrameworkInputView extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICoreFrameworkInputView
     * @type {Guid}
     */
    static IID => Guid("{d77c94ae-46b8-5d4a-9489-8ddec3d639a6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["add_PrimaryViewAnimationStarting", "remove_PrimaryViewAnimationStarting", "add_OcclusionsChanged", "remove_OcclusionsChanged"]

    /**
     * 
     * @param {TypedEventHandler<CoreFrameworkInputView, CoreFrameworkInputViewAnimationStartingEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PrimaryViewAnimationStarting(handler) {
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
    remove_PrimaryViewAnimationStarting(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(7, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<CoreFrameworkInputView, CoreFrameworkInputViewOcclusionsChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_OcclusionsChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(8, this, "ptr", handler, "ptr", token, "int")
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
    remove_OcclusionsChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(9, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
