#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\PreviewBuildsState.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Management.Update
 * @version WindowsRuntime 1.4
 */
class IPreviewBuildsManager extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPreviewBuildsManager
     * @type {Guid}
     */
    static IID => Guid("{fa07dd61-7e4f-59f7-7c9f-def9051c5f62}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ArePreviewBuildsAllowed", "put_ArePreviewBuildsAllowed", "GetCurrentState", "SyncAsync"]

    /**
     * @type {Boolean} 
     */
    ArePreviewBuildsAllowed {
        get => this.get_ArePreviewBuildsAllowed()
        set => this.put_ArePreviewBuildsAllowed(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ArePreviewBuildsAllowed() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_ArePreviewBuildsAllowed(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {PreviewBuildsState} 
     */
    GetCurrentState() {
        result := ComCall(8, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PreviewBuildsState(result_)
    }

    /**
     * 
     * @returns {IAsyncOperation<Boolean>} 
     */
    SyncAsync() {
        result := ComCall(9, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), result_)
    }
}
