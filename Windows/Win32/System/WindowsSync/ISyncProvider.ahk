#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Represents a synchronization provider that can be used by a synchronization session to synchronize data with another synchronization provider.
 * @see https://docs.microsoft.com/windows/win32/api//winsync/nn-winsync-isyncprovider
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class ISyncProvider extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISyncProvider
     * @type {Guid}
     */
    static IID => Guid("{8f657056-2bce-4a17-8c68-c7bb7898b56f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetIdParameters"]

    /**
     * 
     * @param {Pointer<ID_PARAMETERS>} pIdParameters 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncprovider-getidparameters
     */
    GetIdParameters(pIdParameters) {
        result := ComCall(3, this, "ptr", pIdParameters, "HRESULT")
        return result
    }
}
