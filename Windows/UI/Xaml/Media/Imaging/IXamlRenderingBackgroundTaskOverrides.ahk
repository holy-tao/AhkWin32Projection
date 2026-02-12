#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Media.Imaging
 * @version WindowsRuntime 1.4
 */
class IXamlRenderingBackgroundTaskOverrides extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXamlRenderingBackgroundTaskOverrides
     * @type {Guid}
     */
    static IID => Guid("{9c2a6997-a908-4711-b4b2-a960db3d8e5a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnRun"]

    /**
     * 
     * @param {IBackgroundTaskInstance} taskInstance 
     * @returns {HRESULT} 
     */
    OnRun(taskInstance) {
        result := ComCall(6, this, "ptr", taskInstance, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
