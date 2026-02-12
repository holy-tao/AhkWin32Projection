#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\MobileBroadbandCellsInfo.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class IMobileBroadbandNetwork3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMobileBroadbandNetwork3
     * @type {Guid}
     */
    static IID => Guid("{33670a8a-c7ef-444c-ab6c-df7ef7a390fe}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCellsInfoAsync"]

    /**
     * 
     * @returns {IAsyncOperation<MobileBroadbandCellsInfo>} 
     */
    GetCellsInfoAsync() {
        result := ComCall(6, this, "ptr*", &asyncOperation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(MobileBroadbandCellsInfo, asyncOperation)
    }
}
