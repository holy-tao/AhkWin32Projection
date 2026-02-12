#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Storage\Streams\IRandomAccessStreamWithContentType.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Printers
 * @version WindowsRuntime 1.4
 */
class IPrintSchema extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrintSchema
     * @type {Guid}
     */
    static IID => Guid("{c2b98316-26b8-4bfb-8138-9f962c22a35b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDefaultPrintTicketAsync", "GetCapabilitiesAsync", "MergeAndValidateWithDefaultPrintTicketAsync"]

    /**
     * 
     * @returns {IAsyncOperation<IRandomAccessStreamWithContentType>} 
     */
    GetDefaultPrintTicketAsync() {
        result := ComCall(6, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IRandomAccessStreamWithContentType, operation)
    }

    /**
     * 
     * @param {IRandomAccessStreamWithContentType} constrainTicket 
     * @returns {IAsyncOperation<IRandomAccessStreamWithContentType>} 
     */
    GetCapabilitiesAsync(constrainTicket) {
        result := ComCall(7, this, "ptr", constrainTicket, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IRandomAccessStreamWithContentType, operation)
    }

    /**
     * 
     * @param {IRandomAccessStreamWithContentType} deltaTicket 
     * @returns {IAsyncOperation<IRandomAccessStreamWithContentType>} 
     */
    MergeAndValidateWithDefaultPrintTicketAsync(deltaTicket) {
        result := ComCall(8, this, "ptr", deltaTicket, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IRandomAccessStreamWithContentType, operation)
    }
}
