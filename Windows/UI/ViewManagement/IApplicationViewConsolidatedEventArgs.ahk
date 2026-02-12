#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.ViewManagement
 * @version WindowsRuntime 1.4
 */
class IApplicationViewConsolidatedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IApplicationViewConsolidatedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{514449ec-7ea2-4de7-a6a6-7dfbaaebb6fb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsUserInitiated"]

    /**
     * @type {Boolean} 
     */
    IsUserInitiated {
        get => this.get_IsUserInitiated()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsUserInitiated() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
