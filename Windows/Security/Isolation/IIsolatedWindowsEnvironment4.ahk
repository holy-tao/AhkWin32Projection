#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.Isolation
 * @version WindowsRuntime 1.4
 */
class IIsolatedWindowsEnvironment4 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IIsolatedWindowsEnvironment4
     * @type {Guid}
     */
    static IID => Guid("{11e3701a-dd9e-4f1b-812c-4020f307f93c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ChangePriority"]

    /**
     * 
     * @param {Integer} Priority_ 
     * @returns {HRESULT} 
     */
    ChangePriority(Priority_) {
        result := ComCall(6, this, "int", Priority_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
