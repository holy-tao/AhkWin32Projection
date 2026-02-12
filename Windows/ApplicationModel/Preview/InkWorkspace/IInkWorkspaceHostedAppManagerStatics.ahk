#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\InkWorkspaceHostedAppManager.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Preview.InkWorkspace
 * @version WindowsRuntime 1.4
 */
class IInkWorkspaceHostedAppManagerStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInkWorkspaceHostedAppManagerStatics
     * @type {Guid}
     */
    static IID => Guid("{cbfd8cc5-a162-4bc4-84ee-e8716d5233c5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetForCurrentApp"]

    /**
     * 
     * @returns {InkWorkspaceHostedAppManager} 
     */
    GetForCurrentApp() {
        result := ComCall(6, this, "ptr*", &current := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return InkWorkspaceHostedAppManager(current)
    }
}
