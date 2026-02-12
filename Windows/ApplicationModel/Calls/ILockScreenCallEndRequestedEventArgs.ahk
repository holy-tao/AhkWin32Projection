#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\LockScreenCallEndCallDeferral.ahk
#Include ..\..\Foundation\DateTime.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Calls
 * @version WindowsRuntime 1.4
 */
class ILockScreenCallEndRequestedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILockScreenCallEndRequestedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{8190a363-6f27-46e9-aeb6-c0ae83e47dc7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDeferral", "get_Deadline"]

    /**
     * @type {DateTime} 
     */
    Deadline {
        get => this.get_Deadline()
    }

    /**
     * 
     * @returns {LockScreenCallEndCallDeferral} 
     */
    GetDeferral() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return LockScreenCallEndCallDeferral(value)
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_Deadline() {
        value := DateTime()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
