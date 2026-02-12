#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\ESimDiscoverEvent.ahk
#Include .\ESimProfileMetadata.ahk
#Include .\ESimOperationResult.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class IESimDiscoverResult extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IESimDiscoverResult
     * @type {Guid}
     */
    static IID => Guid("{56b4bb5e-ab2f-5ac6-b359-dd5a8e237926}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Events", "get_Kind", "get_ProfileMetadata", "get_Result"]

    /**
     * @type {IVectorView<ESimDiscoverEvent>} 
     */
    Events {
        get => this.get_Events()
    }

    /**
     * @type {Integer} 
     */
    Kind {
        get => this.get_Kind()
    }

    /**
     * @type {ESimProfileMetadata} 
     */
    ProfileMetadata {
        get => this.get_ProfileMetadata()
    }

    /**
     * @type {ESimOperationResult} 
     */
    Result {
        get => this.get_Result()
    }

    /**
     * 
     * @returns {IVectorView<ESimDiscoverEvent>} 
     */
    get_Events() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(ESimDiscoverEvent, value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Kind() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {ESimProfileMetadata} 
     */
    get_ProfileMetadata() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ESimProfileMetadata(value)
    }

    /**
     * 
     * @returns {ESimOperationResult} 
     */
    get_Result() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ESimOperationResult(value)
    }
}
