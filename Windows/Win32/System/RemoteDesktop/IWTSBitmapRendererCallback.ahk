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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnTargetSizeChanged"]

    /**
     * 
     * @param {RECT} rcNewSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tsvirtualchannels/nf-tsvirtualchannels-iwtsbitmaprenderercallback-ontargetsizechanged
     */
    OnTargetSizeChanged(rcNewSize) {
        result := ComCall(3, this, "ptr", rcNewSize, "HRESULT")
        return result
    }
}
