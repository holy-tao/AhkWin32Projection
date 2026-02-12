#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\SystemIdentificationInfo.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System.Profile
 * @version WindowsRuntime 1.4
 */
class ISystemIdentificationStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISystemIdentificationStatics
     * @type {Guid}
     */
    static IID => Guid("{5581f42a-d3df-4d93-a37d-c41a616c6d01}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSystemIdForPublisher", "GetSystemIdForUser"]

    /**
     * 
     * @returns {SystemIdentificationInfo} 
     */
    GetSystemIdForPublisher() {
        result := ComCall(6, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SystemIdentificationInfo(result_)
    }

    /**
     * 
     * @param {User} user_ 
     * @returns {SystemIdentificationInfo} 
     */
    GetSystemIdForUser(user_) {
        result := ComCall(7, this, "ptr", user_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SystemIdentificationInfo(result_)
    }
}
