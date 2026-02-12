#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\ESimOperationResult.ahk
#Include .\ESimProfileMetadata.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class IESimDownloadProfileMetadataResult extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IESimDownloadProfileMetadataResult
     * @type {Guid}
     */
    static IID => Guid("{c4234d9e-5ad6-426d-8d00-4434f449afec}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Result", "get_ProfileMetadata"]

    /**
     * @type {ESimOperationResult} 
     */
    Result {
        get => this.get_Result()
    }

    /**
     * @type {ESimProfileMetadata} 
     */
    ProfileMetadata {
        get => this.get_ProfileMetadata()
    }

    /**
     * 
     * @returns {ESimOperationResult} 
     */
    get_Result() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ESimOperationResult(value)
    }

    /**
     * 
     * @returns {ESimProfileMetadata} 
     */
    get_ProfileMetadata() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ESimProfileMetadata(value)
    }
}
