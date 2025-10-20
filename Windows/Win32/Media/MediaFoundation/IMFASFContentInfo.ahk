#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides methods to work with the header section of files conforming to the Advanced Systems Format (ASF) specification.
 * @see https://docs.microsoft.com/windows/win32/api//wmcontainer/nn-wmcontainer-imfasfcontentinfo
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFASFContentInfo extends IUnknown{
    /**
     * The interface identifier for IMFASFContentInfo
     * @type {Guid}
     */
    static IID => Guid("{b1dca5cd-d5da-4451-8e9e-db5c59914ead}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IMFMediaBuffer>} pIStartOfContent 
     * @param {Pointer<UInt64>} cbHeaderSize 
     * @returns {HRESULT} 
     */
    GetHeaderSize(pIStartOfContent, cbHeaderSize) {
        result := ComCall(3, this, "ptr", pIStartOfContent, "uint*", cbHeaderSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMFMediaBuffer>} pIHeaderBuffer 
     * @param {Integer} cbOffsetWithinHeader 
     * @returns {HRESULT} 
     */
    ParseHeader(pIHeaderBuffer, cbOffsetWithinHeader) {
        result := ComCall(4, this, "ptr", pIHeaderBuffer, "uint", cbOffsetWithinHeader, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMFMediaBuffer>} pIHeader 
     * @param {Pointer<UInt32>} pcbHeader 
     * @returns {HRESULT} 
     */
    GenerateHeader(pIHeader, pcbHeader) {
        result := ComCall(5, this, "ptr", pIHeader, "uint*", pcbHeader, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMFASFProfile>} ppIProfile 
     * @returns {HRESULT} 
     */
    GetProfile(ppIProfile) {
        result := ComCall(6, this, "ptr", ppIProfile, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMFASFProfile>} pIProfile 
     * @returns {HRESULT} 
     */
    SetProfile(pIProfile) {
        result := ComCall(7, this, "ptr", pIProfile, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMFPresentationDescriptor>} ppIPresentationDescriptor 
     * @returns {HRESULT} 
     */
    GeneratePresentationDescriptor(ppIPresentationDescriptor) {
        result := ComCall(8, this, "ptr", ppIPresentationDescriptor, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} wStreamNumber 
     * @param {Pointer<IPropertyStore>} ppIStore 
     * @returns {HRESULT} 
     */
    GetEncodingConfigurationPropertyStore(wStreamNumber, ppIStore) {
        result := ComCall(9, this, "ushort", wStreamNumber, "ptr", ppIStore, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
