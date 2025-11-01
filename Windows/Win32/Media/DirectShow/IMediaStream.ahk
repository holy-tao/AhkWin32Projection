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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetMultiMediaStream", "GetInformation", "SetSameFormat", "AllocateSample", "CreateSharedSample", "SendEndOfStream"]

    /**
     * 
     * @param {Pointer<IMultiMediaStream>} ppMultiMediaStream 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmstream/nf-mmstream-imediastream-getmultimediastream
     */
    GetMultiMediaStream(ppMultiMediaStream) {
        result := ComCall(3, this, "ptr*", ppMultiMediaStream, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pPurposeId 
     * @param {Pointer<Integer>} pType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmstream/nf-mmstream-imediastream-getinformation
     */
    GetInformation(pPurposeId, pType) {
        pTypeMarshal := pType is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, "ptr", pPurposeId, pTypeMarshal, pType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMediaStream} pStreamThatHasDesiredFormat 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmstream/nf-mmstream-imediastream-setsameformat
     */
    SetSameFormat(pStreamThatHasDesiredFormat, dwFlags) {
        result := ComCall(5, this, "ptr", pStreamThatHasDesiredFormat, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {Pointer<IStreamSample>} ppSample 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmstream/nf-mmstream-imediastream-allocatesample
     */
    AllocateSample(dwFlags, ppSample) {
        result := ComCall(6, this, "uint", dwFlags, "ptr*", ppSample, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IStreamSample} pExistingSample 
     * @param {Integer} dwFlags 
     * @param {Pointer<IStreamSample>} ppNewSample 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmstream/nf-mmstream-imediastream-createsharedsample
     */
    CreateSharedSample(pExistingSample, dwFlags, ppNewSample) {
        result := ComCall(7, this, "ptr", pExistingSample, "uint", dwFlags, "ptr*", ppNewSample, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmstream/nf-mmstream-imediastream-sendendofstream
     */
    SendEndOfStream(dwFlags) {
        result := ComCall(8, this, "uint", dwFlags, "HRESULT")
        return result
    }
}
