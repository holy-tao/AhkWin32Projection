#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\CoreWindow.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Core
 * @version WindowsRuntime 1.4
 */
class ICoreWindowStatic extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICoreWindowStatic
     * @type {Guid}
     */
    static IID => Guid("{4d239005-3c2a-41b1-9022-536bb9cf93b1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetForCurrentThread"]

    /**
     * 
     * @returns {CoreWindow} 
     */
    GetForCurrentThread() {
        result := ComCall(6, this, "ptr*", &ppWindow := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CoreWindow(ppWindow)
    }
}
