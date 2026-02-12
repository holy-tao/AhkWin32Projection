#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Protection.PlayReady
 * @version WindowsRuntime 1.4
 */
class IPlayReadyStatics4 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPlayReadyStatics4
     * @type {Guid}
     */
    static IID => Guid("{50a91300-d824-4231-9d5e-78ef8844c7d7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_InputTrustAuthorityToCreate", "get_ProtectionSystemId"]

    /**
     * @type {HSTRING} 
     */
    InputTrustAuthorityToCreate {
        get => this.get_InputTrustAuthorityToCreate()
    }

    /**
     * @type {Guid} 
     */
    ProtectionSystemId {
        get => this.get_ProtectionSystemId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_InputTrustAuthorityToCreate() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_ProtectionSystemId() {
        value := Guid()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
