#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\IAsyncOperation.ahk
#Include .\GattWriteResult.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Bluetooth.GenericAttributeProfile
 * @version WindowsRuntime 1.4
 */
class IGattReliableWriteTransaction2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGattReliableWriteTransaction2
     * @type {Guid}
     */
    static IID => Guid("{51113987-ef12-462f-9fb2-a1a43a679416}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CommitWithResultAsync"]

    /**
     * 
     * @returns {IAsyncOperation<GattWriteResult>} 
     */
    CommitWithResultAsync() {
        result := ComCall(6, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(GattWriteResult, operation)
    }
}
