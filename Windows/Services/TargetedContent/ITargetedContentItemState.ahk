#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Services.TargetedContent
 * @version WindowsRuntime 1.4
 */
class ITargetedContentItemState extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITargetedContentItemState
     * @type {Guid}
     */
    static IID => Guid("{73935454-4c65-4b47-a441-472de53c79b6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ShouldDisplay", "get_AppInstallationState"]

    /**
     * @type {Boolean} 
     */
    ShouldDisplay {
        get => this.get_ShouldDisplay()
    }

    /**
     * @type {Integer} 
     */
    AppInstallationState {
        get => this.get_AppInstallationState()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ShouldDisplay() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AppInstallationState() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
