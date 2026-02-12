#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.SerialCommunication
 * @version WindowsRuntime 1.4
 */
class IErrorReceivedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IErrorReceivedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{fcc6bf59-1283-4d8a-bfdf-566b33ddb28f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Error"]

    /**
     * @type {Integer} 
     */
    Error {
        get => this.get_Error()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Error() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
