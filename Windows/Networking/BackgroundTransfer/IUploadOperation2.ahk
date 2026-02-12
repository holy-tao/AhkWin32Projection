#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\BackgroundTransferGroup.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.BackgroundTransfer
 * @version WindowsRuntime 1.4
 */
class IUploadOperation2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUploadOperation2
     * @type {Guid}
     */
    static IID => Guid("{556189f2-2774-4df6-9fa5-209f2bfb12f7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_TransferGroup"]

    /**
     * @type {BackgroundTransferGroup} 
     */
    TransferGroup {
        get => this.get_TransferGroup()
    }

    /**
     * 
     * @returns {BackgroundTransferGroup} 
     */
    get_TransferGroup() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return BackgroundTransferGroup(value)
    }
}
