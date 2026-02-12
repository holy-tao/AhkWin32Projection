#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Foundation\Collections\IVectorView.ahk
#Include .\AppDiagnosticInfo.ahk
#Include .\AppResourceGroupInfo.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System
 * @version WindowsRuntime 1.4
 */
class IAppResourceGroupInfoWatcherEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppResourceGroupInfoWatcherEventArgs
     * @type {Guid}
     */
    static IID => Guid("{7a787637-6302-4d2f-bf89-1c12d0b2a6b9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AppDiagnosticInfos", "get_AppResourceGroupInfo"]

    /**
     * @type {IVectorView<AppDiagnosticInfo>} 
     */
    AppDiagnosticInfos {
        get => this.get_AppDiagnosticInfos()
    }

    /**
     * @type {AppResourceGroupInfo} 
     */
    AppResourceGroupInfo {
        get => this.get_AppResourceGroupInfo()
    }

    /**
     * 
     * @returns {IVectorView<AppDiagnosticInfo>} 
     */
    get_AppDiagnosticInfos() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(AppDiagnosticInfo, value)
    }

    /**
     * 
     * @returns {AppResourceGroupInfo} 
     */
    get_AppResourceGroupInfo() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AppResourceGroupInfo(value)
    }
}
