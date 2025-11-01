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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetHeaderSize", "ParseHeader", "GenerateHeader", "GetProfile", "SetProfile", "GeneratePresentationDescriptor", "GetEncodingConfigurationPropertyStore"]

    /**
     * 
     * @param {IMFMediaBuffer} pIStartOfContent 
     * @param {Pointer<Integer>} cbHeaderSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-imfasfcontentinfo-getheadersize
     */
    GetHeaderSize(pIStartOfContent, cbHeaderSize) {
        cbHeaderSizeMarshal := cbHeaderSize is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", pIStartOfContent, cbHeaderSizeMarshal, cbHeaderSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMFMediaBuffer} pIHeaderBuffer 
     * @param {Integer} cbOffsetWithinHeader 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-imfasfcontentinfo-parseheader
     */
    ParseHeader(pIHeaderBuffer, cbOffsetWithinHeader) {
        result := ComCall(4, this, "ptr", pIHeaderBuffer, "uint", cbOffsetWithinHeader, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMFMediaBuffer} pIHeader 
     * @param {Pointer<Integer>} pcbHeader 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-imfasfcontentinfo-generateheader
     */
    GenerateHeader(pIHeader, pcbHeader) {
        pcbHeaderMarshal := pcbHeader is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "ptr", pIHeader, pcbHeaderMarshal, pcbHeader, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IMFASFProfile>} ppIProfile 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-imfasfcontentinfo-getprofile
     */
    GetProfile(ppIProfile) {
        result := ComCall(6, this, "ptr*", ppIProfile, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMFASFProfile} pIProfile 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-imfasfcontentinfo-setprofile
     */
    SetProfile(pIProfile) {
        result := ComCall(7, this, "ptr", pIProfile, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IMFPresentationDescriptor>} ppIPresentationDescriptor 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-imfasfcontentinfo-generatepresentationdescriptor
     */
    GeneratePresentationDescriptor(ppIPresentationDescriptor) {
        result := ComCall(8, this, "ptr*", ppIPresentationDescriptor, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} wStreamNumber 
     * @param {Pointer<IPropertyStore>} ppIStore 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-imfasfcontentinfo-getencodingconfigurationpropertystore
     */
    GetEncodingConfigurationPropertyStore(wStreamNumber, ppIStore) {
        result := ComCall(9, this, "ushort", wStreamNumber, "ptr*", ppIStore, "HRESULT")
        return result
    }
}
