#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Email
 * @version WindowsRuntime 1.4
 */
class IEmailMailbox2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEmailMailbox2
     * @type {Guid}
     */
    static IID => Guid("{14f8e404-6ca2-4ab2-9241-79cd7bf46346}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_LinkedMailboxId", "get_NetworkAccountId", "get_NetworkId"]

    /**
     * @type {HSTRING} 
     */
    LinkedMailboxId {
        get => this.get_LinkedMailboxId()
    }

    /**
     * @type {HSTRING} 
     */
    NetworkAccountId {
        get => this.get_NetworkAccountId()
    }

    /**
     * @type {HSTRING} 
     */
    NetworkId {
        get => this.get_NetworkId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_LinkedMailboxId() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_NetworkAccountId() {
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
    get_NetworkId() {
        value := HSTRING()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
