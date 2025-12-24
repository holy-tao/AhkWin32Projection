#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID2D1DeviceContext.ahk
#Include .\ID2D1PrintControl.ahk
#Include .\ID2D1Resource.ahk

/**
 * Represents a resource domain whose objects and device contexts can be used together.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1_1/nn-d2d1_1-id2d1device
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class ID2D1Device extends ID2D1Resource{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateDeviceContext", "CreatePrintControl", "SetMaximumTextureMemory", "GetMaximumTextureMemory", "ClearResources"]

    /**
     * Creates a new device context from a Direct2D device.
     * @param {Integer} options Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/ne-d2d1_1-d2d1_device_context_options">D2D1_DEVICE_CONTEXT_OPTIONS</a></b>
     * 
     * The options to be applied to the created device context.
     * @returns {ID2D1DeviceContext} Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nn-d2d1_1-id2d1devicecontext">ID2D1DeviceContext</a>**</b>
     * 
     * When this method returns, contains the address of a pointer to the new device context.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_1/nf-d2d1_1-id2d1device-createdevicecontext
     */
    CreateDeviceContext(options) {
        result := ComCall(4, this, "int", options, "ptr*", &deviceContext := 0, "HRESULT")
        return ID2D1DeviceContext(deviceContext)
    }

    /**
     * 
     * @param {IWICImagingFactory} wicFactory 
     * @param {IPrintDocumentPackageTarget} documentTarget 
     * @param {Pointer<D2D1_PRINT_CONTROL_PROPERTIES>} printControlProperties 
     * @returns {ID2D1PrintControl} 
     * @see https://learn.microsoft.com/windows/win32/Direct2D/id2d1device-createprintcontrol
     */
    CreatePrintControl(wicFactory, documentTarget, printControlProperties) {
        result := ComCall(5, this, "ptr", wicFactory, "ptr", documentTarget, "ptr", printControlProperties, "ptr*", &printControl := 0, "HRESULT")
        return ID2D1PrintControl(printControl)
    }

    /**
     * Sets the maximum amount of texture memory Direct2D accumulates before it purges the image caches and cached texture allocations.
     * @remarks
     * 
     * <div class="alert"><b>Note</b>  Direct2D may exceed the  maximum texture memory you set with this method for a single frame if necessary to render the frame.</div>
     * <div> </div>
     * 
     * 
     * @param {Integer} maximumInBytes Type: <b>UINT64</b>
     * 
     * The new maximum texture memory in bytes.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_1/nf-d2d1_1-id2d1device-setmaximumtexturememory
     */
    SetMaximumTextureMemory(maximumInBytes) {
        ComCall(6, this, "uint", maximumInBytes)
    }

    /**
     * Sets the maximum amount of texture memory Direct2D accumulates before it purges the image caches and cached texture allocations.
     * @returns {Integer} Type: <b>UINT64</b>
     * 
     * The maximum amount of texture memory in bytes.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_1/nf-d2d1_1-id2d1device-getmaximumtexturememory
     */
    GetMaximumTextureMemory() {
        result := ComCall(7, this, "uint")
        return result
    }

    /**
     * Clears all of the rendering resources used by Direct2D.
     * @param {Integer} millisecondsSinceUse Type: <b>UINT</b>
     * 
     * Discards only resources that haven't been used for greater than the specified time in milliseconds. The default is 0 milliseconds.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d2d1_1/nf-d2d1_1-id2d1device-clearresources
     */
    ClearResources(millisecondsSinceUse) {
        ComCall(8, this, "uint", millisecondsSinceUse)
    }
}
