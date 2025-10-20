#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents a collection of IMFSourceBuffer objects.
 * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nn-mfmediaengine-imfsourcebufferlist
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFSourceBufferList extends IUnknown{
    /**
     * The interface identifier for IMFSourceBufferList
     * @type {Guid}
     */
    static IID => Guid("{249981f8-8325-41f3-b80c-3b9e3aad0cbe}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @returns {Integer} 
     */
    GetLength() {
        result := ComCall(3, this, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @returns {Pointer<IMFSourceBuffer>} 
     */
    GetSourceBuffer(index) {
        result := ComCall(4, this, "uint", index, "ptr")
        return result
    }
}
