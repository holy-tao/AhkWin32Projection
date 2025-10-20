#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID2D1Resource.ahk

/**
 * Represents a resource domain whose objects and device contexts can be used together.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1_1/nn-d2d1_1-id2d1device
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class ID2D1Device extends ID2D1Resource{
    /**
     * The interface identifier for ID2D1Device
     * @type {Guid}
     */
    static IID => Guid("{47dd575d-ac05-4cdd-8049-9b02cd16f44c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * 
     * @param {Integer} options 
     * @param {Pointer<ID2D1DeviceContext>} deviceContext 
     * @returns {HRESULT} 
     */
    CreateDeviceContext(options, deviceContext) {
        result := ComCall(4, this, "int", options, "ptr", deviceContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IWICImagingFactory>} wicFactory 
     * @param {Pointer<IPrintDocumentPackageTarget>} documentTarget 
     * @param {Pointer<D2D1_PRINT_CONTROL_PROPERTIES>} printControlProperties 
     * @param {Pointer<ID2D1PrintControl>} printControl 
     * @returns {HRESULT} 
     */
    CreatePrintControl(wicFactory, documentTarget, printControlProperties, printControl) {
        result := ComCall(5, this, "ptr", wicFactory, "ptr", documentTarget, "ptr", printControlProperties, "ptr", printControl, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} maximumInBytes 
     * @returns {String} Nothing - always returns an empty string
     */
    SetMaximumTextureMemory(maximumInBytes) {
        ComCall(6, this, "uint", maximumInBytes)
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetMaximumTextureMemory() {
        result := ComCall(7, this, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} millisecondsSinceUse 
     * @returns {String} Nothing - always returns an empty string
     */
    ClearResources(millisecondsSinceUse) {
        ComCall(8, this, "uint", millisecondsSinceUse)
        return result
    }
}
