#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.WinRT
 * @version v4.0.30319
 */
class IAppServiceConnectionExtendedExecution extends IUnknown{
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
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} operation 
     * @returns {HRESULT} 
     */
    OpenForExtendedExecutionAsync(riid, operation) {
        result := ComCall(3, this, "ptr", riid, "ptr", operation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
