#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IShellDispatch4.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/shell/ishelldispatch5
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IShellDispatch5 extends IShellDispatch4{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IShellDispatch5
     * @type {Guid}
     */
    static IID => Guid("{866738b9-6cf2-4de8-8767-f794ebe74f4e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 44

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["WindowSwitcher"]

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/shell/ishelldispatch5-windowswitcher
     */
    WindowSwitcher() {
        result := ComCall(44, this, "HRESULT")
        return result
    }
}
