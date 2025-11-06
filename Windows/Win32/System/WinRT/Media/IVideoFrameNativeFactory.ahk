#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\IInspectable.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/windows.media.core.interop/nn-windows-media-core-interop-ivideoframenativefactory
 * @namespace Windows.Win32.System.WinRT.Media
 * @version v4.0.30319
 */
class IVideoFrameNativeFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVideoFrameNativeFactory
     * @type {Guid}
     */
    static IID => Guid("{69e3693e-8e1e-4e63-ac4c-7fdc21d9731d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateFromMFSample"]

    /**
     * 
     * @param {IMFSample} data 
     * @param {Pointer<Guid>} subtype 
     * @param {Integer} width 
     * @param {Integer} height 
     * @param {BOOL} forceReadOnly 
     * @param {Pointer<MFVideoArea>} minDisplayAperture 
     * @param {IMFDXGIDeviceManager} device 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    CreateFromMFSample(data, subtype, width, height, forceReadOnly, minDisplayAperture, device, riid) {
        result := ComCall(6, this, "ptr", data, "ptr", subtype, "uint", width, "uint", height, "int", forceReadOnly, "ptr", minDisplayAperture, "ptr", device, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }
}
