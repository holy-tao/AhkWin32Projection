#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IShellDispatch5.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/shell/ishelldispatch6
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IShellDispatch6 extends IShellDispatch5{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IShellDispatch6
     * @type {Guid}
     */
    static IID => Guid("{286e6f1b-7113-4355-9562-96b7e9d64c54}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 45

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SearchCommand"]

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/shell/ishelldispatch6-searchcommand
     */
    SearchCommand() {
        result := ComCall(45, this, "HRESULT")
        return result
    }
}
