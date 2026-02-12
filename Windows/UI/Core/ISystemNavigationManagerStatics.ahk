#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\SystemNavigationManager.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Core
 * @version WindowsRuntime 1.4
 */
class ISystemNavigationManagerStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISystemNavigationManagerStatics
     * @type {Guid}
     */
    static IID => Guid("{dc52b5ce-bee0-4305-8c54-68228ed683b5}")

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
     * @returns {SystemNavigationManager} 
     */
    GetForCurrentView() {
        result := ComCall(6, this, "ptr*", &loader := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SystemNavigationManager(loader)
    }
}
