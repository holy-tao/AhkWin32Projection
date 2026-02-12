#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include .\AppDiagnosticInfo.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System
 * @version WindowsRuntime 1.4
 */
class IAppDiagnosticInfoWatcherEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppDiagnosticInfoWatcherEventArgs
     * @type {Guid}
     */
    static IID => Guid("{7017c716-e1da-4c65-99df-046dff5be71a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AppDiagnosticInfo"]

    /**
     * @type {AppDiagnosticInfo} 
     */
    AppDiagnosticInfo {
        get => this.get_AppDiagnosticInfo()
    }

    /**
     * 
     * @returns {AppDiagnosticInfo} 
     */
    get_AppDiagnosticInfo() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AppDiagnosticInfo(value)
    }
}
