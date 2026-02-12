#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Enumeration
 * @version WindowsRuntime 1.4
 */
class IEnclosureLocation extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnclosureLocation
     * @type {Guid}
     */
    static IID => Guid("{42340a27-5810-459c-aabb-c65e1f813ecf}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_InDock", "get_InLid", "get_Panel"]

    /**
     * @type {Boolean} 
     */
    InDock {
        get => this.get_InDock()
    }

    /**
     * @type {Boolean} 
     */
    InLid {
        get => this.get_InLid()
    }

    /**
     * @type {Integer} 
     */
    Panel {
        get => this.get_Panel()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_InDock() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_InLid() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Panel() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
