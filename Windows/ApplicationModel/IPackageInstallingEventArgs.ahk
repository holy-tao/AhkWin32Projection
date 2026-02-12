#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include .\Package.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel
 * @version WindowsRuntime 1.4
 */
class IPackageInstallingEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPackageInstallingEventArgs
     * @type {Guid}
     */
    static IID => Guid("{97741eb7-ab7a-401a-8b61-eb0e7faff237}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ActivityId", "get_Package", "get_Progress", "get_IsComplete", "get_ErrorCode"]

    /**
     * @type {Guid} 
     */
    ActivityId {
        get => this.get_ActivityId()
    }

    /**
     * @type {Package} 
     */
    Package {
        get => this.get_Package()
    }

    /**
     * @type {Float} 
     */
    Progress {
        get => this.get_Progress()
    }

    /**
     * @type {Boolean} 
     */
    IsComplete {
        get => this.get_IsComplete()
    }

    /**
     * @type {HRESULT} 
     */
    ErrorCode {
        get => this.get_ErrorCode()
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_ActivityId() {
        value := Guid()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Package} 
     */
    get_Package() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Package(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Progress() {
        result := ComCall(8, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsComplete() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    get_ErrorCode() {
        result := ComCall(10, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
