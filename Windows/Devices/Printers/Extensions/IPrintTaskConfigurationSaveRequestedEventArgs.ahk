#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\PrintTaskConfigurationSaveRequest.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Printers.Extensions
 * @version WindowsRuntime 1.4
 */
class IPrintTaskConfigurationSaveRequestedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrintTaskConfigurationSaveRequestedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{e06c2879-0d61-4938-91d0-96a45bee8479}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Request"]

    /**
     * @type {PrintTaskConfigurationSaveRequest} 
     */
    Request {
        get => this.get_Request()
    }

    /**
     * 
     * @returns {PrintTaskConfigurationSaveRequest} 
     */
    get_Request() {
        result := ComCall(6, this, "ptr*", &context_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PrintTaskConfigurationSaveRequest(context_)
    }
}
