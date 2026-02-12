#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\CompositionDrawingSurface.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * A native interoperation interface that allows getting and setting the graphics device. This is interface is available in C++ only.
 * @remarks
 * See <a href="https://docs.microsoft.com/windows/desktop/api/windows.ui.composition.interop/nn-windows-ui-composition-interop-icompositiondrawingsurfaceinterop">ICompositionDrawingSurfaceInterop</a> for usage examples.
 * @see https://learn.microsoft.com/windows/win32/api//content/windows.ui.composition.interop/nn-windows-ui-composition-interop-icompositiongraphicsdeviceinterop
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class ICompositionGraphicsDevice extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICompositionGraphicsDevice
     * @type {Guid}
     */
    static IID => Guid("{fb22c6e1-80a2-4667-9936-dbeaf6eefe95}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateDrawingSurface", "add_RenderingDeviceReplaced", "remove_RenderingDeviceReplaced"]

    /**
     * 
     * @param {SIZE} sizePixels 
     * @param {Integer} pixelFormat 
     * @param {Integer} alphaMode 
     * @returns {CompositionDrawingSurface} 
     */
    CreateDrawingSurface(sizePixels, pixelFormat, alphaMode) {
        result := ComCall(6, this, "ptr", sizePixels, "int", pixelFormat, "int", alphaMode, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CompositionDrawingSurface(result_)
    }

    /**
     * 
     * @param {TypedEventHandler<CompositionGraphicsDevice, RenderingDeviceReplacedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_RenderingDeviceReplaced(handler) {
        token := EventRegistrationToken()
        result := ComCall(7, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_RenderingDeviceReplaced(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(8, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
