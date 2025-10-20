#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Note  This interface is deprecated.
 * @see https://docs.microsoft.com/windows/win32/api//mmstream/nn-mmstream-imediastream
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IMediaStream extends IUnknown{
    /**
     * The interface identifier for IMediaStream
     * @type {Guid}
     */
    static IID => Guid("{b502d1bd-9a57-11d0-8fde-00c04fd9189d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IMultiMediaStream>} ppMultiMediaStream 
     * @returns {HRESULT} 
     */
    GetMultiMediaStream(ppMultiMediaStream) {
        result := ComCall(3, this, "ptr", ppMultiMediaStream, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pPurposeId 
     * @param {Pointer<Int32>} pType 
     * @returns {HRESULT} 
     */
    GetInformation(pPurposeId, pType) {
        result := ComCall(4, this, "ptr", pPurposeId, "int*", pType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMediaStream>} pStreamThatHasDesiredFormat 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    SetSameFormat(pStreamThatHasDesiredFormat, dwFlags) {
        result := ComCall(5, this, "ptr", pStreamThatHasDesiredFormat, "uint", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {Pointer<IStreamSample>} ppSample 
     * @returns {HRESULT} 
     */
    AllocateSample(dwFlags, ppSample) {
        result := ComCall(6, this, "uint", dwFlags, "ptr", ppSample, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IStreamSample>} pExistingSample 
     * @param {Integer} dwFlags 
     * @param {Pointer<IStreamSample>} ppNewSample 
     * @returns {HRESULT} 
     */
    CreateSharedSample(pExistingSample, dwFlags, ppNewSample) {
        result := ComCall(7, this, "ptr", pExistingSample, "uint", dwFlags, "ptr", ppNewSample, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    SendEndOfStream(dwFlags) {
        result := ComCall(8, this, "uint", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
