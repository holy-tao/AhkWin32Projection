#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Provides methods that can be called whenever Dllhost.exe starts up or shuts down.
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nn-comsvcs-iprocessinitializer
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class IProcessInitializer extends IUnknown{
    /**
     * The interface identifier for IProcessInitializer
     * @type {Guid}
     */
    static IID => Guid("{1113f52d-dc7f-4943-aed6-88d04027e32a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IUnknown>} punkProcessControl 
     * @returns {HRESULT} 
     */
    Startup(punkProcessControl) {
        result := ComCall(3, this, "ptr", punkProcessControl, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Shutdown() {
        result := ComCall(4, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
