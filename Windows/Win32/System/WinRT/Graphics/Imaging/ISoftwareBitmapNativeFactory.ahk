#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\IInspectable.ahk

/**
 * @namespace Windows.Win32.System.WinRT.Graphics.Imaging
 * @version v4.0.30319
 */
class ISoftwareBitmapNativeFactory extends IInspectable{
    /**
     * The interface identifier for ISoftwareBitmapNativeFactory
     * @type {Guid}
     */
    static IID => Guid("{c3c181ec-2914-4791-af02-02d224a10b43}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * 
     * @param {Pointer<IWICBitmap>} data 
     * @param {BOOL} forceReadOnly 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppv 
     * @returns {HRESULT} 
     */
    CreateFromWICBitmap(data, forceReadOnly, riid, ppv) {
        result := ComCall(6, this, "ptr", data, "int", forceReadOnly, "ptr", riid, "ptr", ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMF2DBuffer2>} data 
     * @param {Pointer<Guid>} subtype 
     * @param {Integer} width 
     * @param {Integer} height 
     * @param {BOOL} forceReadOnly 
     * @param {Pointer<MFVideoArea>} minDisplayAperture 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppv 
     * @returns {HRESULT} 
     */
    CreateFromMF2DBuffer2(data, subtype, width, height, forceReadOnly, minDisplayAperture, riid, ppv) {
        result := ComCall(7, this, "ptr", data, "ptr", subtype, "uint", width, "uint", height, "int", forceReadOnly, "ptr", minDisplayAperture, "ptr", riid, "ptr", ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
