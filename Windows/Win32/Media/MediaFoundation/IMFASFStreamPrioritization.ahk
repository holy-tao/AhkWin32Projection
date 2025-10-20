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
     * 
     * @param {Pointer<UInt32>} pdwStreamCount 
     * @returns {HRESULT} 
     */
    GetStreamCount(pdwStreamCount) {
        result := ComCall(3, this, "uint*", pdwStreamCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwStreamIndex 
     * @param {Pointer<UInt16>} pwStreamNumber 
     * @param {Pointer<UInt16>} pwStreamFlags 
     * @returns {HRESULT} 
     */
    GetStream(dwStreamIndex, pwStreamNumber, pwStreamFlags) {
        result := ComCall(4, this, "uint", dwStreamIndex, "ushort*", pwStreamNumber, "ushort*", pwStreamFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} wStreamNumber 
     * @param {Integer} wStreamFlags 
     * @returns {HRESULT} 
     */
    AddStream(wStreamNumber, wStreamFlags) {
        result := ComCall(5, this, "ushort", wStreamNumber, "ushort", wStreamFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwStreamIndex 
     * @returns {HRESULT} 
     */
    RemoveStream(dwStreamIndex) {
        result := ComCall(6, this, "uint", dwStreamIndex, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMFASFStreamPrioritization>} ppIStreamPrioritization 
     * @returns {HRESULT} 
     */
    Clone(ppIStreamPrioritization) {
        result := ComCall(7, this, "ptr", ppIStreamPrioritization, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
