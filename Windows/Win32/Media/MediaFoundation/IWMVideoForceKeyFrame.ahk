#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Forces the encoder to encode the current frame as a key frame.
 * @see https://docs.microsoft.com/windows/win32/api//wmcodecdsp/nn-wmcodecdsp-iwmvideoforcekeyframe
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IWMVideoForceKeyFrame extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMVideoForceKeyFrame
     * @type {Guid}
     */
    static IID => Guid("{9f8496be-5b9a-41b9-a9e8-f21cd80596c2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetKeyFrame"]

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/nf-wmcodecdsp-iwmvideoforcekeyframe-setkeyframe
     */
    SetKeyFrame() {
        result := ComCall(3, this, "HRESULT")
        return result
    }
}
