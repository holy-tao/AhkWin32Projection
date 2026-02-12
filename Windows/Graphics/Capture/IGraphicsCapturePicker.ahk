#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\GraphicsCaptureItem.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Capture
 * @version WindowsRuntime 1.4
 */
class IGraphicsCapturePicker extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGraphicsCapturePicker
     * @type {Guid}
     */
    static IID => Guid("{5a1711b3-ad79-4b4a-9336-1318fdde3539}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["PickSingleItemAsync"]

    /**
     * 
     * @returns {IAsyncOperation<GraphicsCaptureItem>} 
     */
    PickSingleItemAsync() {
        result := ComCall(6, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(GraphicsCaptureItem, operation)
    }
}
