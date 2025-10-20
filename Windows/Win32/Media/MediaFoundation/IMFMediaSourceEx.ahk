#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFMediaSource.ahk

/**
 * Extends the IMFMediaSource interface to provide additional capabilities for a media source.
 * @remarks
 * 
  * Implementations of this interface can return <b>E_NOTIMPL</b> for any methods that are not required by the media source.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfmediasourceex
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFMediaSourceEx extends IMFMediaSource{
    /**
     * The interface identifier for IMFMediaSourceEx
     * @type {Guid}
     */
    static IID => Guid("{3c9b2eb9-86d5-4514-a394-f56664f9f0d8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 13

    /**
     * 
     * @param {Pointer<IMFAttributes>} ppAttributes 
     * @returns {HRESULT} 
     */
    GetSourceAttributes(ppAttributes) {
        result := ComCall(13, this, "ptr", ppAttributes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwStreamIdentifier 
     * @param {Pointer<IMFAttributes>} ppAttributes 
     * @returns {HRESULT} 
     */
    GetStreamAttributes(dwStreamIdentifier, ppAttributes) {
        result := ComCall(14, this, "uint", dwStreamIdentifier, "ptr", ppAttributes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} pManager 
     * @returns {HRESULT} 
     */
    SetD3DManager(pManager) {
        result := ComCall(15, this, "ptr", pManager, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
