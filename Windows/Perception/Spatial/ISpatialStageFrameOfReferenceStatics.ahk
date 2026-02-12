#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\SpatialStageFrameOfReference.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Perception.Spatial
 * @version WindowsRuntime 1.4
 */
class ISpatialStageFrameOfReferenceStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpatialStageFrameOfReferenceStatics
     * @type {Guid}
     */
    static IID => Guid("{f78d5c4d-a0a4-499c-8d91-a8c965d40654}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Current", "add_CurrentChanged", "remove_CurrentChanged", "RequestNewStageAsync"]

    /**
     * @type {SpatialStageFrameOfReference} 
     */
    Current {
        get => this.get_Current()
    }

    /**
     * 
     * @returns {SpatialStageFrameOfReference} 
     */
    get_Current() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SpatialStageFrameOfReference(value)
    }

    /**
     * 
     * @param {EventHandler<IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_CurrentChanged(handler) {
        cookie := EventRegistrationToken()
        result := ComCall(7, this, "ptr", handler, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return cookie
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_CurrentChanged(cookie) {
        cookie := cookie is Win32Handle ? NumGet(cookie, "ptr") : cookie

        result := ComCall(8, this, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IAsyncOperation<SpatialStageFrameOfReference>} 
     */
    RequestNewStageAsync() {
        result := ComCall(9, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(SpatialStageFrameOfReference, result_)
    }
}
