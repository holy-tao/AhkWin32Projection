#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\..\Foundation\Collections\IVectorView.ahk
#Include .\CoreInputViewOcclusion.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.ViewManagement.Core
 * @version WindowsRuntime 1.4
 */
class ICoreInputView extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICoreInputView
     * @type {Guid}
     */
    static IID => Guid("{c770cd7a-7001-4c32-bf94-25c1f554cbf1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["add_OcclusionsChanged", "remove_OcclusionsChanged", "GetCoreInputViewOcclusions", "TryShowPrimaryView", "TryHidePrimaryView"]

    /**
     * 
     * @param {TypedEventHandler<CoreInputView, CoreInputViewOcclusionsChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_OcclusionsChanged(handler) {
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
    remove_OcclusionsChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(7, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IVectorView<CoreInputViewOcclusion>} 
     */
    GetCoreInputViewOcclusions() {
        result := ComCall(8, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(CoreInputViewOcclusion, result_)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    TryShowPrimaryView() {
        result := ComCall(9, this, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {Boolean} 
     */
    TryHidePrimaryView() {
        result := ComCall(10, this, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}
