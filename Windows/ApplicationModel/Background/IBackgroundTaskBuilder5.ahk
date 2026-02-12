#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Background
 * @version WindowsRuntime 1.4
 */
class IBackgroundTaskBuilder5 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBackgroundTaskBuilder5
     * @type {Guid}
     */
    static IID => Guid("{077103f6-99f5-4af4-bcad-4731d0330d43}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetTaskEntryPointClsid"]

    /**
     * 
     * @param {Guid} TaskEntryPoint 
     * @returns {HRESULT} 
     */
    SetTaskEntryPointClsid(TaskEntryPoint) {
        result := ComCall(6, this, "ptr", TaskEntryPoint, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
