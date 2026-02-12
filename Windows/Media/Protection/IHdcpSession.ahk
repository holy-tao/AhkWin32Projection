#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IReference.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Protection
 * @version WindowsRuntime 1.4
 */
class IHdcpSession extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHdcpSession
     * @type {Guid}
     */
    static IID => Guid("{718845e9-64d7-426d-809b-1be461941a2a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsEffectiveProtectionAtLeast", "GetEffectiveProtection", "SetDesiredMinProtectionAsync", "add_ProtectionChanged", "remove_ProtectionChanged"]

    /**
     * 
     * @param {Integer} protection 
     * @returns {Boolean} 
     */
    IsEffectiveProtectionAtLeast(protection) {
        result := ComCall(6, this, "int", protection, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    GetEffectiveProtection() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetInt32(), value)
    }

    /**
     * 
     * @param {Integer} protection 
     * @returns {IAsyncOperation<Integer>} 
     */
    SetDesiredMinProtectionAsync(protection) {
        result := ComCall(8, this, "int", protection, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), value)
    }

    /**
     * 
     * @param {TypedEventHandler<HdcpSession, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ProtectionChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(9, this, "ptr", handler, "ptr", token, "int")
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
    remove_ProtectionChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(10, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
