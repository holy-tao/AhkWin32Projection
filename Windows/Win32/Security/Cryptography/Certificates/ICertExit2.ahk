#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\ICertExit.ahk

/**
 * Provide communications between the Certificate Services server and an exit module.
 * @see https://docs.microsoft.com/windows/win32/api//certexit/nn-certexit-icertexit2
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class ICertExit2 extends ICertExit{
    /**
     * The interface identifier for ICertExit2
     * @type {Guid}
     */
    static IID => Guid("{0abf484b-d049-464d-a7ed-552e7529b0ff}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 10

    /**
     * 
     * @param {Pointer<ICertManageModule>} ppManageModule 
     * @returns {HRESULT} 
     */
    GetManageModule(ppManageModule) {
        result := ComCall(10, this, "ptr", ppManageModule, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
