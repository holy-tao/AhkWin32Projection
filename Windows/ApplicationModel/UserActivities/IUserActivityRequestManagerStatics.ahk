#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\UserActivityRequestManager.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.UserActivities
 * @version WindowsRuntime 1.4
 */
class IUserActivityRequestManagerStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUserActivityRequestManagerStatics
     * @type {Guid}
     */
    static IID => Guid("{c0392df1-224a-432c-81e5-0c76b4c4cefa}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetForCurrentView"]

    /**
     * 
     * @returns {UserActivityRequestManager} 
     */
    GetForCurrentView() {
        result := ComCall(6, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return UserActivityRequestManager(result_)
    }
}
