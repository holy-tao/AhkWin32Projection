#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * A dynamic virtual channel plug-in implements this interface to be notified when the size of the rendering area changes.
 * @see https://docs.microsoft.com/windows/win32/api//tsvirtualchannels/nn-tsvirtualchannels-iwtsbitmaprenderercallback
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class IWTSBitmapRendererCallback extends IUnknown{
    /**
     * The interface identifier for IWTSBitmapRendererCallback
     * @type {Guid}
     */
    static IID => Guid("{d782928e-fe4e-4e77-ae90-9cd0b3e3b353}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {RECT} rcNewSize 
     * @returns {HRESULT} 
     */
    OnTargetSizeChanged(rcNewSize) {
        result := ComCall(3, this, "ptr", rcNewSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
