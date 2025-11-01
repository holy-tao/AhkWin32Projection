#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Used to enable the client to notify the Content Decryption Module (CDM) when global resources should be brought into a consistent state prior to suspending.
 * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nn-mfmediaengine-imfcdmsuspendnotify
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFCdmSuspendNotify extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFCdmSuspendNotify
     * @type {Guid}
     */
    static IID => Guid("{7a5645d2-43bd-47fd-87b7-dcd24cc7d692}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Begin", "End"]

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfcdmsuspendnotify-begin
     */
    Begin() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfcdmsuspendnotify-end
     */
    End() {
        result := ComCall(4, this, "HRESULT")
        return result
    }
}
