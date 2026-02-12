#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Foundation\Collections\IVector.ahk
#Include .\AppResourceGroupInfo.ahk
#Include .\AppResourceGroupInfoWatcher.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System
 * @version WindowsRuntime 1.4
 */
class IAppDiagnosticInfo2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppDiagnosticInfo2
     * @type {Guid}
     */
    static IID => Guid("{df46fbd7-191a-446c-9473-8fbc2374a354}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetResourceGroups", "CreateResourceGroupWatcher"]

    /**
     * 
     * @returns {IVector<AppResourceGroupInfo>} 
     */
    GetResourceGroups() {
        result := ComCall(6, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(AppResourceGroupInfo, result_)
    }

    /**
     * 
     * @returns {AppResourceGroupInfoWatcher} 
     */
    CreateResourceGroupWatcher() {
        result := ComCall(7, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AppResourceGroupInfoWatcher(result_)
    }
}
