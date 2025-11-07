#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\ICertManageModule.ahk
#Include .\ICertExit.ahk

/**
 * Provide communications between the Certificate Services server and an exit module.
 * @see https://docs.microsoft.com/windows/win32/api//certexit/nn-certexit-icertexit2
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class ICertExit2 extends ICertExit{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetManageModule"]

    /**
     * 
     * @returns {ICertManageModule} 
     * @see https://learn.microsoft.com/windows/win32/api/certexit/nf-certexit-icertexit2-getmanagemodule
     */
    GetManageModule() {
        result := ComCall(10, this, "ptr*", &ppManageModule := 0, "HRESULT")
        return ICertManageModule(ppManageModule)
    }
}
