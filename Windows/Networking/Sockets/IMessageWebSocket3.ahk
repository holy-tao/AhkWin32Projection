#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperationWithProgress.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.Sockets
 * @version WindowsRuntime 1.4
 */
class IMessageWebSocket3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMessageWebSocket3
     * @type {Guid}
     */
    static IID => Guid("{59d9defb-71af-4349-8487-911fcf681597}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SendNonfinalFrameAsync", "SendFinalFrameAsync"]

    /**
     * 
     * @param {IBuffer} data 
     * @returns {IAsyncOperationWithProgress<Integer, Integer>} 
     */
    SendNonfinalFrameAsync(data) {
        result := ComCall(6, this, "ptr", data, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperationWithProgress((ptr) => IPropertyValue(ptr).GetUInt32(), (ptr) => IPropertyValue(ptr).GetUInt32(), operation)
    }

    /**
     * 
     * @param {IBuffer} data 
     * @returns {IAsyncOperationWithProgress<Integer, Integer>} 
     */
    SendFinalFrameAsync(data) {
        result := ComCall(7, this, "ptr", data, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperationWithProgress((ptr) => IPropertyValue(ptr).GetUInt32(), (ptr) => IPropertyValue(ptr).GetUInt32(), operation)
    }
}
