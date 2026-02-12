#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\IMediaProtectionServiceRequest.ahk
#Include .\MediaProtectionServiceCompletion.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Protection
 * @version WindowsRuntime 1.4
 */
class IServiceRequestedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IServiceRequestedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{34283baf-abb4-4fc1-bd89-93f106573a49}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Request", "get_Completion"]

    /**
     * @type {IMediaProtectionServiceRequest} 
     */
    Request {
        get => this.get_Request()
    }

    /**
     * @type {MediaProtectionServiceCompletion} 
     */
    Completion {
        get => this.get_Completion()
    }

    /**
     * 
     * @returns {IMediaProtectionServiceRequest} 
     */
    get_Request() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMediaProtectionServiceRequest(value)
    }

    /**
     * 
     * @returns {MediaProtectionServiceCompletion} 
     */
    get_Completion() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaProtectionServiceCompletion(value)
    }
}
