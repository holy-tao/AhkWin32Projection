#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.AI.Actions.Hosting
 * @version WindowsRuntime 1.4
 */
class IActionDefinition2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IActionDefinition2
     * @type {Guid}
     */
    static IID => Guid("{c1f44733-f563-54e2-bd2b-dc4c732054cf}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DisplaysUI", "get_UsesGenerativeAI", "get_SchemaVersion"]

    /**
     * @type {Boolean} 
     */
    DisplaysUI {
        get => this.get_DisplaysUI()
    }

    /**
     * @type {Boolean} 
     */
    UsesGenerativeAI {
        get => this.get_UsesGenerativeAI()
    }

    /**
     * @type {Integer} 
     */
    SchemaVersion {
        get => this.get_SchemaVersion()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_DisplaysUI() {
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
    get_UsesGenerativeAI() {
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
    get_SchemaVersion() {
        result := ComCall(8, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
