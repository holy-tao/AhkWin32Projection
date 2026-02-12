#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Use this interface to determine the priority of a downloads or uploads within a [BackgroundTransferGroup](backgroundtransfergroup.md). Possible values are defined by the [BackgroundTransferPriority](backgroundtransferpriority.md) enumeration.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.ibackgroundtransferoperationpriority
 * @namespace Windows.Networking.BackgroundTransfer
 * @version WindowsRuntime 1.4
 */
class IBackgroundTransferOperationPriority extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBackgroundTransferOperationPriority
     * @type {Guid}
     */
    static IID => Guid("{04854327-5254-4b3a-915e-0aa49275c0f9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Priority", "put_Priority"]

    /**
     * Gets or sets the priority of a download or upload operation. Possible values are defined by the [BackgroundTransferPriority](backgroundtransferpriority.md) enumeration.
     * 
     * For example, setting high priority ensures that the operation doesn't get placed at the very end of the queue, instead placed near the front.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.ibackgroundtransferoperationpriority.priority
     * @type {Integer} 
     */
    Priority {
        get => this.get_Priority()
        set => this.put_Priority(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Priority() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Priority(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
