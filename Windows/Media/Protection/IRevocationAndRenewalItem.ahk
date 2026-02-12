#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Protection
 * @version WindowsRuntime 1.4
 */
class IRevocationAndRenewalItem extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRevocationAndRenewalItem
     * @type {Guid}
     */
    static IID => Guid("{3099c20c-3cf0-49ea-902d-caf32d2dde2c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Reasons", "get_HeaderHash", "get_PublicKeyHash", "get_Name", "get_RenewalId"]

    /**
     * @type {Integer} 
     */
    Reasons {
        get => this.get_Reasons()
    }

    /**
     * @type {HSTRING} 
     */
    HeaderHash {
        get => this.get_HeaderHash()
    }

    /**
     * @type {HSTRING} 
     */
    PublicKeyHash {
        get => this.get_PublicKeyHash()
    }

    /**
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * @type {HSTRING} 
     */
    RenewalId {
        get => this.get_RenewalId()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Reasons() {
        result := ComCall(6, this, "uint*", &reasons := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return reasons
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_HeaderHash() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PublicKeyHash() {
        value := HSTRING()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Name() {
        name := HSTRING()
        result := ComCall(9, this, "ptr", name, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return name
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_RenewalId() {
        value := HSTRING()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
