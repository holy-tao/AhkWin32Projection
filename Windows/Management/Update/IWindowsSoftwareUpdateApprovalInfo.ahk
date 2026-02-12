#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Management.Update
 * @version WindowsRuntime 1.4
 */
class IWindowsSoftwareUpdateApprovalInfo extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWindowsSoftwareUpdateApprovalInfo
     * @type {Guid}
     */
    static IID => Guid("{691e6b9e-80af-5882-9404-25437ecb791b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_UserInitiated", "get_AppClosure", "get_MeteredNetwork", "get_Seeker"]

    /**
     * @type {Boolean} 
     */
    UserInitiated {
        get => this.get_UserInitiated()
    }

    /**
     * @type {Boolean} 
     */
    AppClosure {
        get => this.get_AppClosure()
    }

    /**
     * @type {Boolean} 
     */
    MeteredNetwork {
        get => this.get_MeteredNetwork()
    }

    /**
     * @type {Boolean} 
     */
    Seeker {
        get => this.get_Seeker()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_UserInitiated() {
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
    get_AppClosure() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_MeteredNetwork() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Seeker() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
