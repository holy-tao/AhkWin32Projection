#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Not implemented.
 * @see https://docs.microsoft.com/windows/win32/api//wmcontainer/nn-wmcontainer-imfasfstreamprioritization
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFASFStreamPrioritization extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFASFStreamPrioritization
     * @type {Guid}
     */
    static IID => Guid("{699bdc27-bbaf-49ff-8e38-9c39c9b5e088}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetStreamCount", "GetStream", "AddStream", "RemoveStream", "Clone"]

    /**
     * 
     * @param {Pointer<Integer>} pdwStreamCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-imfasfstreamprioritization-getstreamcount
     */
    GetStreamCount(pdwStreamCount) {
        result := ComCall(3, this, "uint*", pdwStreamCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwStreamIndex 
     * @param {Pointer<Integer>} pwStreamNumber 
     * @param {Pointer<Integer>} pwStreamFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-imfasfstreamprioritization-getstream
     */
    GetStream(dwStreamIndex, pwStreamNumber, pwStreamFlags) {
        result := ComCall(4, this, "uint", dwStreamIndex, "ushort*", pwStreamNumber, "ushort*", pwStreamFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} wStreamNumber 
     * @param {Integer} wStreamFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-imfasfstreamprioritization-addstream
     */
    AddStream(wStreamNumber, wStreamFlags) {
        result := ComCall(5, this, "ushort", wStreamNumber, "ushort", wStreamFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwStreamIndex 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-imfasfstreamprioritization-removestream
     */
    RemoveStream(dwStreamIndex) {
        result := ComCall(6, this, "uint", dwStreamIndex, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IMFASFStreamPrioritization>} ppIStreamPrioritization 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-imfasfstreamprioritization-clone
     */
    Clone(ppIStreamPrioritization) {
        result := ComCall(7, this, "ptr*", ppIStreamPrioritization, "HRESULT")
        return result
    }
}
