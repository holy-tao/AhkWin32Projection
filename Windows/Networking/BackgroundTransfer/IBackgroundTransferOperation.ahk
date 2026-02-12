#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Uri.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Storage\Streams\IInputStream.ahk
#Include .\ResponseInformation.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Represents a background transfer operation.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.ibackgroundtransferoperation
 * @namespace Windows.Networking.BackgroundTransfer
 * @version WindowsRuntime 1.4
 */
class IBackgroundTransferOperation extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBackgroundTransferOperation
     * @type {Guid}
     */
    static IID => Guid("{ded06846-90ca-44fb-8fb1-124154c0d539}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Guid", "get_RequestedUri", "get_Method", "get_Group", "get_CostPolicy", "put_CostPolicy", "GetResultStreamAt", "GetResponseInformation"]

    /**
     * Gets the Guid for the background transfer operation.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.ibackgroundtransferoperation.guid
     * @type {Guid} 
     */
    Guid {
        get => this.get_Guid()
    }

    /**
     * Gets the URI for the background transfer.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.ibackgroundtransferoperation.requesteduri
     * @type {Uri} 
     */
    RequestedUri {
        get => this.get_RequestedUri()
    }

    /**
     * Specifies the method to use for the background transfer operation.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.ibackgroundtransferoperation.method
     * @type {HSTRING} 
     */
    Method {
        get => this.get_Method()
    }

    /**
     * > [!NOTE]
     * > Group may be altered or unavailable for releases after Windows 8.1. Instead, use the relevant [DownloadOperation](downloadoperation.md) or [UploadOperation](uploadoperation.md) TransferGroup.
     * 
     * Gets a string value indicating the group the transfer belongs to.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.ibackgroundtransferoperation.group
     * @type {HSTRING} 
     */
    Group {
        get => this.get_Group()
    }

    /**
     * Gets and sets the cost policy for the background transfer.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.ibackgroundtransferoperation.costpolicy
     * @type {Integer} 
     */
    CostPolicy {
        get => this.get_CostPolicy()
        set => this.put_CostPolicy(value)
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_Guid() {
        value := Guid()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_RequestedUri() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Uri(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Method() {
        value := HSTRING()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Group() {
        value := HSTRING()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CostPolicy() {
        result := ComCall(10, this, "int*", &value := 0, "int")
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
    put_CostPolicy(value) {
        result := ComCall(11, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets the partial response at the specified position.
     * @param {Integer} position The position at which to start reading.
     * @returns {IInputStream} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.ibackgroundtransferoperation.getresultstreamat
     */
    GetResultStreamAt(position) {
        result := ComCall(12, this, "uint", position, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInputStream(value)
    }

    /**
     * Gets the response information.
     * @returns {ResponseInformation} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.ibackgroundtransferoperation.getresponseinformation
     */
    GetResponseInformation() {
        result := ComCall(13, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ResponseInformation(value)
    }
}
