#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IShellDispatch5.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IShellDispatch6 extends IShellDispatch5{
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
     * 
     * @returns {HRESULT} 
     */
    SearchCommand() {
        result := ComCall(45, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
