#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Foundation\IAsyncAction.ahk
#Include ..\..\..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\..\..\Storage\Streams\IBuffer.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Media.Imaging
 * @version WindowsRuntime 1.4
 */
class IRenderTargetBitmap extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRenderTargetBitmap
     * @type {Guid}
     */
    static IID => Guid("{500dee81-893c-4c0a-8fec-4678ac717589}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PixelWidth", "get_PixelHeight", "RenderAsync", "RenderToSizeAsync", "GetPixelsAsync"]

    /**
     * @type {Integer} 
     */
    PixelWidth {
        get => this.get_PixelWidth()
    }

    /**
     * @type {Integer} 
     */
    PixelHeight {
        get => this.get_PixelHeight()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PixelWidth() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PixelHeight() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {UIElement} element 
     * @returns {IAsyncAction} 
     */
    RenderAsync(element) {
        result := ComCall(8, this, "ptr", element, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }

    /**
     * 
     * @param {UIElement} element 
     * @param {Integer} scaledWidth 
     * @param {Integer} scaledHeight 
     * @returns {IAsyncAction} 
     */
    RenderToSizeAsync(element, scaledWidth, scaledHeight) {
        result := ComCall(9, this, "ptr", element, "int", scaledWidth, "int", scaledHeight, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }

    /**
     * 
     * @returns {IAsyncOperation<IBuffer>} 
     */
    GetPixelsAsync() {
        result := ComCall(10, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IBuffer, operation)
    }
}
