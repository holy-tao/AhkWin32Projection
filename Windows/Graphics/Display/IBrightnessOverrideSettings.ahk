#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Display
 * @version WindowsRuntime 1.4
 */
class IBrightnessOverrideSettings extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBrightnessOverrideSettings
     * @type {Guid}
     */
    static IID => Guid("{d112ab2a-7604-4dba-bcf8-4b6f49502cb0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DesiredLevel", "get_DesiredNits"]

    /**
     * @type {Float} 
     */
    DesiredLevel {
        get => this.get_DesiredLevel()
    }

    /**
     * @type {Float} 
     */
    DesiredNits {
        get => this.get_DesiredNits()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_DesiredLevel() {
        result := ComCall(6, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_DesiredNits() {
        result := ComCall(7, this, "float*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
