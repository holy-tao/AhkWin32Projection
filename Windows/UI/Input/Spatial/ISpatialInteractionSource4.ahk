#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Perception\People\HandMeshObserver.ahk
#Include ..\..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Input.Spatial
 * @version WindowsRuntime 1.4
 */
class ISpatialInteractionSource4 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpatialInteractionSource4
     * @type {Guid}
     */
    static IID => Guid("{0073bc4d-df66-5a91-a2ba-cea3e5c58a19}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["TryCreateHandMeshObserver", "TryCreateHandMeshObserverAsync"]

    /**
     * 
     * @returns {HandMeshObserver} 
     */
    TryCreateHandMeshObserver() {
        result := ComCall(6, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HandMeshObserver(result_)
    }

    /**
     * 
     * @returns {IAsyncOperation<HandMeshObserver>} 
     */
    TryCreateHandMeshObserverAsync() {
        result := ComCall(7, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(HandMeshObserver, operation)
    }
}
