#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Management.Update
 * @version WindowsRuntime 1.4
 */
class IWindowsUpdateActionProgress extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWindowsUpdateActionProgress
     * @type {Guid}
     */
    static IID => Guid("{83b22d8a-4bb0-549f-ba39-59724882d137}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Action", "get_Progress"]

    /**
     * @type {HSTRING} 
     */
    Action {
        get => this.get_Action()
    }

    /**
     * @type {Float} 
     */
    Progress {
        get => this.get_Progress()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Action() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Progress() {
        result := ComCall(7, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
