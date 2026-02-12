#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel
 * @version WindowsRuntime 1.4
 */
class IDesignModeStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDesignModeStatics
     * @type {Guid}
     */
    static IID => Guid("{2c3893cc-f81a-4e7a-b857-76a80887e185}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DesignModeEnabled"]

    /**
     * @type {Boolean} 
     */
    DesignModeEnabled {
        get => this.get_DesignModeEnabled()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_DesignModeEnabled() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
