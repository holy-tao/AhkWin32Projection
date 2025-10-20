#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\IInspectable.ahk

/**
 * @namespace Windows.Win32.System.WinRT.Media
 * @version v4.0.30319
 */
class IVideoFrameNativeFactory extends IInspectable{
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
     * 
     * @param {Pointer<IMFSample>} data 
     * @param {Pointer<Guid>} subtype 
     * @param {Integer} width 
     * @param {Integer} height 
     * @param {BOOL} forceReadOnly 
     * @param {Pointer<MFVideoArea>} minDisplayAperture 
     * @param {Pointer<IMFDXGIDeviceManager>} device 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppv 
     * @returns {HRESULT} 
     */
    CreateFromMFSample(data, subtype, width, height, forceReadOnly, minDisplayAperture, device, riid, ppv) {
        result := ComCall(6, this, "ptr", data, "ptr", subtype, "uint", width, "uint", height, "int", forceReadOnly, "ptr", minDisplayAperture, "ptr", device, "ptr", riid, "ptr", ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
