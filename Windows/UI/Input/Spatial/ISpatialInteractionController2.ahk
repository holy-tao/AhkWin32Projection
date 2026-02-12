#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\..\Storage\Streams\IRandomAccessStreamWithContentType.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Input.Spatial
 * @version WindowsRuntime 1.4
 */
class ISpatialInteractionController2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpatialInteractionController2
     * @type {Guid}
     */
    static IID => Guid("{35b6d924-c7a2-49b7-b72e-5436b2fb8f9c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["TryGetRenderableModelAsync"]

    /**
     * 
     * @returns {IAsyncOperation<IRandomAccessStreamWithContentType>} 
     */
    TryGetRenderableModelAsync() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IRandomAccessStreamWithContentType, value)
    }
}
