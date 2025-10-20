#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\ISurfaceImageSourceNative.ahk

/**
 * @namespace Windows.Win32.System.WinRT.Xaml
 * @version v4.0.30319
 */
class IVirtualSurfaceImageSourceNative extends ISurfaceImageSourceNative{
    /**
     * The interface identifier for IVirtualSurfaceImageSourceNative
     * @type {Guid}
     */
    static IID => Guid("{e9550983-360b-4f53-b391-afd695078691}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * 
     * @param {RECT} updateRect 
     * @returns {HRESULT} 
     */
    Invalidate(updateRect) {
        result := ComCall(6, this, "ptr", updateRect, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} count 
     * @returns {HRESULT} 
     */
    GetUpdateRectCount(count) {
        result := ComCall(7, this, "uint*", count, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} updates 
     * @param {Integer} count 
     * @returns {HRESULT} 
     */
    GetUpdateRects(updates, count) {
        result := ComCall(8, this, "ptr", updates, "uint", count, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} bounds 
     * @returns {HRESULT} 
     */
    GetVisibleBounds(bounds) {
        result := ComCall(9, this, "ptr", bounds, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IVirtualSurfaceUpdatesCallbackNative>} callback 
     * @returns {HRESULT} 
     */
    RegisterForUpdatesNeeded(callback) {
        result := ComCall(10, this, "ptr", callback, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} newWidth 
     * @param {Integer} newHeight 
     * @returns {HRESULT} 
     */
    Resize(newWidth, newHeight) {
        result := ComCall(11, this, "int", newWidth, "int", newHeight, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
