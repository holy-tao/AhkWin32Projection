#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Storage\Provider\FileUpdateRequest.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Background
 * @version WindowsRuntime 1.4
 */
class ICachedFileUpdaterTriggerDetails extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICachedFileUpdaterTriggerDetails
     * @type {Guid}
     */
    static IID => Guid("{71838c13-1314-47b4-9597-dc7e248c17cc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_UpdateTarget", "get_UpdateRequest", "get_CanRequestUserInput"]

    /**
     * @type {Integer} 
     */
    UpdateTarget {
        get => this.get_UpdateTarget()
    }

    /**
     * @type {FileUpdateRequest} 
     */
    UpdateRequest {
        get => this.get_UpdateRequest()
    }

    /**
     * @type {Boolean} 
     */
    CanRequestUserInput {
        get => this.get_CanRequestUserInput()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_UpdateTarget() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {FileUpdateRequest} 
     */
    get_UpdateRequest() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return FileUpdateRequest(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanRequestUserInput() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
