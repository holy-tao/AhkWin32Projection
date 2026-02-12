#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class INetworkOperatorTetheringAccessPointConfiguration3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INetworkOperatorTetheringAccessPointConfiguration3
     * @type {Guid}
     */
    static IID => Guid("{a9bb0081-9eed-5d18-b676-24b74a182b8c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsAuthenticationKindSupported", "IsAuthenticationKindSupportedAsync", "get_AuthenticationKind", "put_AuthenticationKind"]

    /**
     * @type {Integer} 
     */
    AuthenticationKind {
        get => this.get_AuthenticationKind()
        set => this.put_AuthenticationKind(value)
    }

    /**
     * 
     * @param {Integer} authenticationKind 
     * @returns {Boolean} 
     */
    IsAuthenticationKindSupported(authenticationKind) {
        result := ComCall(6, this, "int", authenticationKind, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {Integer} authenticationKind 
     * @returns {IAsyncOperation<Boolean>} 
     */
    IsAuthenticationKindSupportedAsync(authenticationKind) {
        result := ComCall(7, this, "int", authenticationKind, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AuthenticationKind() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_AuthenticationKind(value) {
        result := ComCall(9, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
