#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Foundation\IAsyncAction.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media
 * @version WindowsRuntime 1.4
 */
class IVideoFrame2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVideoFrame2
     * @type {Guid}
     */
    static IID => Guid("{3837840d-336c-4366-8d46-060798736c5d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CopyToWithBoundsAsync"]

    /**
     * 
     * @param {VideoFrame} frame_ 
     * @param {IReference<BitmapBounds>} sourceBounds 
     * @param {IReference<BitmapBounds>} destinationBounds 
     * @returns {IAsyncAction} 
     */
    CopyToWithBoundsAsync(frame_, sourceBounds, destinationBounds) {
        result := ComCall(6, this, "ptr", frame_, "ptr", sourceBounds, "ptr", destinationBounds, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }
}
