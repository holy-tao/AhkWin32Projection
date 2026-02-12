#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\SmartCardReader.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Storage\Streams\IBuffer.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.SmartCards
 * @version WindowsRuntime 1.4
 */
class ISmartCard extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISmartCard
     * @type {Guid}
     */
    static IID => Guid("{1b718871-6434-43f4-b55a-6a29623870aa}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Reader", "GetStatusAsync", "GetAnswerToResetAsync"]

    /**
     * @type {SmartCardReader} 
     */
    Reader {
        get => this.get_Reader()
    }

    /**
     * 
     * @returns {SmartCardReader} 
     */
    get_Reader() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SmartCardReader(value)
    }

    /**
     * 
     * @returns {IAsyncOperation<Integer>} 
     */
    GetStatusAsync() {
        result := ComCall(7, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), result_)
    }

    /**
     * 
     * @returns {IAsyncOperation<IBuffer>} 
     */
    GetAnswerToResetAsync() {
        result := ComCall(8, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IBuffer, result_)
    }
}
