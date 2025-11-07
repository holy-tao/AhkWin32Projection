#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.WinRT
 * @version v4.0.30319
 */
class IAppServiceConnectionExtendedExecution extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppServiceConnectionExtendedExecution
     * @type {Guid}
     */
    static IID => Guid("{65219584-f9cb-4ae3-81f9-a28a6ca450d9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OpenForExtendedExecutionAsync"]

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    OpenForExtendedExecutionAsync(riid) {
        result := ComCall(3, this, "ptr", riid, "ptr*", &operation := 0, "HRESULT")
        return operation
    }
}
