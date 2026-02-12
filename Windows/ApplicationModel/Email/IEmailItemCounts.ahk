#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Email
 * @version WindowsRuntime 1.4
 */
class IEmailItemCounts extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEmailItemCounts
     * @type {Guid}
     */
    static IID => Guid("{5bd13321-fec8-4bab-83ba-0baf3c1f6cbd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Flagged", "get_Important", "get_Total", "get_Unread"]

    /**
     * @type {Integer} 
     */
    Flagged {
        get => this.get_Flagged()
    }

    /**
     * @type {Integer} 
     */
    Important {
        get => this.get_Important()
    }

    /**
     * @type {Integer} 
     */
    Total {
        get => this.get_Total()
    }

    /**
     * @type {Integer} 
     */
    Unread {
        get => this.get_Unread()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Flagged() {
        result := ComCall(6, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Important() {
        result := ComCall(7, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Total() {
        result := ComCall(8, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Unread() {
        result := ComCall(9, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
