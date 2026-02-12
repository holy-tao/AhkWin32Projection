#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System
 * @version WindowsRuntime 1.4
 */
class IProcessLauncherResult extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IProcessLauncherResult
     * @type {Guid}
     */
    static IID => Guid("{544c8934-86d8-4991-8e75-ece8a43b6b6d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ExitCode"]

    /**
     * @type {Integer} 
     */
    ExitCode {
        get => this.get_ExitCode()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ExitCode() {
        result := ComCall(6, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
