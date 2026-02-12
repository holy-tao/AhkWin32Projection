#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Manages enterprise protection policy on protected content. (IProtectionPolicyManagerInterop)
 * @see https://learn.microsoft.com/windows/win32/api//content/efswrtinterop/nn-efswrtinterop-iprotectionpolicymanagerinterop
 * @namespace Windows.Security.EnterpriseData
 * @version WindowsRuntime 1.4
 */
class IProtectionPolicyManager extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IProtectionPolicyManager
     * @type {Guid}
     */
    static IID => Guid("{d5703e18-a08d-47e6-a240-9934d7165eb5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_Identity", "get_Identity"]

    /**
     * @type {HSTRING} 
     */
    Identity {
        get => this.get_Identity()
        set => this.put_Identity(value)
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Identity(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Identity() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
