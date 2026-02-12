#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include .\UIContext.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI
 * @version WindowsRuntime 1.4
 */
class IUIContentRoot extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUIContentRoot
     * @type {Guid}
     */
    static IID => Guid("{1dfcbac6-b36b-5cb9-9bc5-2b7a0eddc378}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_UIContext"]

    /**
     * @type {UIContext} 
     */
    UIContext {
        get => this.get_UIContext()
    }

    /**
     * 
     * @returns {UIContext} 
     */
    get_UIContext() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return UIContext(value)
    }
}
