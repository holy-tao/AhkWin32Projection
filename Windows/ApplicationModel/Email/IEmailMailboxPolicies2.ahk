#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Email
 * @version WindowsRuntime 1.4
 */
class IEmailMailboxPolicies2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEmailMailboxPolicies2
     * @type {Guid}
     */
    static IID => Guid("{bab58afb-a14b-497c-a8e2-55eac29cc4b5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_MustEncryptSmimeMessages", "get_MustSignSmimeMessages"]

    /**
     * @type {Boolean} 
     */
    MustEncryptSmimeMessages {
        get => this.get_MustEncryptSmimeMessages()
    }

    /**
     * @type {Boolean} 
     */
    MustSignSmimeMessages {
        get => this.get_MustSignSmimeMessages()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_MustEncryptSmimeMessages() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_MustSignSmimeMessages() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
