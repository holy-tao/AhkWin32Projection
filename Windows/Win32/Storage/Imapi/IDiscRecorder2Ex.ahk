#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * This interface represents a physical device.
 * @remarks
 * 
  * To write data to media, you need to attach this recorder to the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nn-imapi2-iwriteengine2">IWriteEngine2</a> data writer, using the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nf-imapi2-iwriteengine2-put_recorder">IWriteEngine2::put_Recorder</a> method.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//imapi2/nn-imapi2-idiscrecorder2ex
 * @namespace Windows.Win32.Storage.Imapi
 * @version v4.0.30319
 */
class IDiscRecorder2Ex extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDiscRecorder2Ex
     * @type {Guid}
     */
    static IID => Guid("{27354132-7f64-5b0f-8f00-5d77afbe261e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SendCommandNoData", "SendCommandSendDataToDevice", "SendCommandGetDataFromDevice", "ReadDvdStructure", "SendDvdStructure", "GetAdapterDescriptor", "GetDeviceDescriptor", "GetDiscInformation", "GetTrackInformation", "GetFeaturePage", "GetModePage", "SetModePage", "GetSupportedFeaturePages", "GetSupportedProfiles", "GetSupportedModePages", "GetByteAlignmentMask", "GetMaximumNonPageAlignedTransferSize", "GetMaximumPageAlignedTransferSize"]

    /**
     * 
     * @param {Pointer<Integer>} Cdb 
     * @param {Integer} CdbSize 
     * @param {Integer} Timeout 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscrecorder2ex-sendcommandnodata
     */
    SendCommandNoData(Cdb, CdbSize, Timeout) {
        CdbMarshal := Cdb is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, CdbMarshal, Cdb, "uint", CdbSize, "char*", &SenseBuffer := 0, "uint", Timeout, "HRESULT")
        return SenseBuffer
    }

    /**
     * 
     * @param {Pointer<Integer>} Cdb 
     * @param {Integer} CdbSize 
     * @param {Integer} Timeout 
     * @param {Pointer<Integer>} Buffer 
     * @param {Integer} BufferSize 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscrecorder2ex-sendcommandsenddatatodevice
     */
    SendCommandSendDataToDevice(Cdb, CdbSize, Timeout, Buffer, BufferSize) {
        CdbMarshal := Cdb is VarRef ? "char*" : "ptr"
        BufferMarshal := Buffer is VarRef ? "char*" : "ptr"

        result := ComCall(4, this, CdbMarshal, Cdb, "uint", CdbSize, "char*", &SenseBuffer := 0, "uint", Timeout, BufferMarshal, Buffer, "uint", BufferSize, "HRESULT")
        return SenseBuffer
    }

    /**
     * 
     * @param {Pointer<Integer>} Cdb 
     * @param {Integer} CdbSize 
     * @param {Pointer<Integer>} SenseBuffer 
     * @param {Integer} Timeout 
     * @param {Pointer<Integer>} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<Integer>} BufferFetched 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscrecorder2ex-sendcommandgetdatafromdevice
     */
    SendCommandGetDataFromDevice(Cdb, CdbSize, SenseBuffer, Timeout, Buffer, BufferSize, BufferFetched) {
        CdbMarshal := Cdb is VarRef ? "char*" : "ptr"
        SenseBufferMarshal := SenseBuffer is VarRef ? "char*" : "ptr"
        BufferMarshal := Buffer is VarRef ? "char*" : "ptr"
        BufferFetchedMarshal := BufferFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, CdbMarshal, Cdb, "uint", CdbSize, SenseBufferMarshal, SenseBuffer, "uint", Timeout, BufferMarshal, Buffer, "uint", BufferSize, BufferFetchedMarshal, BufferFetched, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} format 
     * @param {Integer} address 
     * @param {Integer} layer 
     * @param {Integer} agid 
     * @param {Pointer<Pointer<Integer>>} data 
     * @param {Pointer<Integer>} count 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscrecorder2ex-readdvdstructure
     */
    ReadDvdStructure(format, address, layer, agid, data, count) {
        dataMarshal := data is VarRef ? "ptr*" : "ptr"
        countMarshal := count is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, "uint", format, "uint", address, "uint", layer, "uint", agid, dataMarshal, data, countMarshal, count, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} format 
     * @param {Pointer<Integer>} data 
     * @param {Integer} count 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscrecorder2ex-senddvdstructure
     */
    SendDvdStructure(format, data, count) {
        dataMarshal := data is VarRef ? "char*" : "ptr"

        result := ComCall(7, this, "uint", format, dataMarshal, data, "uint", count, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Integer>>} data 
     * @param {Pointer<Integer>} byteSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscrecorder2ex-getadapterdescriptor
     */
    GetAdapterDescriptor(data, byteSize) {
        dataMarshal := data is VarRef ? "ptr*" : "ptr"
        byteSizeMarshal := byteSize is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, dataMarshal, data, byteSizeMarshal, byteSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Integer>>} data 
     * @param {Pointer<Integer>} byteSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscrecorder2ex-getdevicedescriptor
     */
    GetDeviceDescriptor(data, byteSize) {
        dataMarshal := data is VarRef ? "ptr*" : "ptr"
        byteSizeMarshal := byteSize is VarRef ? "uint*" : "ptr"

        result := ComCall(9, this, dataMarshal, data, byteSizeMarshal, byteSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Integer>>} discInformation 
     * @param {Pointer<Integer>} byteSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscrecorder2ex-getdiscinformation
     */
    GetDiscInformation(discInformation, byteSize) {
        discInformationMarshal := discInformation is VarRef ? "ptr*" : "ptr"
        byteSizeMarshal := byteSize is VarRef ? "uint*" : "ptr"

        result := ComCall(10, this, discInformationMarshal, discInformation, byteSizeMarshal, byteSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} address 
     * @param {Integer} addressType 
     * @param {Pointer<Pointer<Integer>>} trackInformation 
     * @param {Pointer<Integer>} byteSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscrecorder2ex-gettrackinformation
     */
    GetTrackInformation(address, addressType, trackInformation, byteSize) {
        trackInformationMarshal := trackInformation is VarRef ? "ptr*" : "ptr"
        byteSizeMarshal := byteSize is VarRef ? "uint*" : "ptr"

        result := ComCall(11, this, "uint", address, "int", addressType, trackInformationMarshal, trackInformation, byteSizeMarshal, byteSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} requestedFeature 
     * @param {BOOLEAN} currentFeatureOnly 
     * @param {Pointer<Pointer<Integer>>} featureData 
     * @param {Pointer<Integer>} byteSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscrecorder2ex-getfeaturepage
     */
    GetFeaturePage(requestedFeature, currentFeatureOnly, featureData, byteSize) {
        featureDataMarshal := featureData is VarRef ? "ptr*" : "ptr"
        byteSizeMarshal := byteSize is VarRef ? "uint*" : "ptr"

        result := ComCall(12, this, "int", requestedFeature, "char", currentFeatureOnly, featureDataMarshal, featureData, byteSizeMarshal, byteSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} requestedModePage 
     * @param {Integer} requestType 
     * @param {Pointer<Pointer<Integer>>} modePageData 
     * @param {Pointer<Integer>} byteSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscrecorder2ex-getmodepage
     */
    GetModePage(requestedModePage, requestType, modePageData, byteSize) {
        modePageDataMarshal := modePageData is VarRef ? "ptr*" : "ptr"
        byteSizeMarshal := byteSize is VarRef ? "uint*" : "ptr"

        result := ComCall(13, this, "int", requestedModePage, "int", requestType, modePageDataMarshal, modePageData, byteSizeMarshal, byteSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} requestType 
     * @param {Pointer<Integer>} data 
     * @param {Integer} byteSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscrecorder2ex-setmodepage
     */
    SetModePage(requestType, data, byteSize) {
        dataMarshal := data is VarRef ? "char*" : "ptr"

        result := ComCall(14, this, "int", requestType, dataMarshal, data, "uint", byteSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOLEAN} currentFeatureOnly 
     * @param {Pointer<Pointer<Integer>>} featureData 
     * @param {Pointer<Integer>} byteSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscrecorder2ex-getsupportedfeaturepages
     */
    GetSupportedFeaturePages(currentFeatureOnly, featureData, byteSize) {
        featureDataMarshal := featureData is VarRef ? "ptr*" : "ptr"
        byteSizeMarshal := byteSize is VarRef ? "uint*" : "ptr"

        result := ComCall(15, this, "char", currentFeatureOnly, featureDataMarshal, featureData, byteSizeMarshal, byteSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOLEAN} currentOnly 
     * @param {Pointer<Pointer<Integer>>} profileTypes 
     * @param {Pointer<Integer>} validProfiles 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscrecorder2ex-getsupportedprofiles
     */
    GetSupportedProfiles(currentOnly, profileTypes, validProfiles) {
        profileTypesMarshal := profileTypes is VarRef ? "ptr*" : "ptr"
        validProfilesMarshal := validProfiles is VarRef ? "uint*" : "ptr"

        result := ComCall(16, this, "char", currentOnly, profileTypesMarshal, profileTypes, validProfilesMarshal, validProfiles, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} requestType 
     * @param {Pointer<Pointer<Integer>>} modePageTypes 
     * @param {Pointer<Integer>} validPages 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscrecorder2ex-getsupportedmodepages
     */
    GetSupportedModePages(requestType, modePageTypes, validPages) {
        modePageTypesMarshal := modePageTypes is VarRef ? "ptr*" : "ptr"
        validPagesMarshal := validPages is VarRef ? "uint*" : "ptr"

        result := ComCall(17, this, "int", requestType, modePageTypesMarshal, modePageTypes, validPagesMarshal, validPages, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscrecorder2ex-getbytealignmentmask
     */
    GetByteAlignmentMask() {
        result := ComCall(18, this, "uint*", &value := 0, "HRESULT")
        return value
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscrecorder2ex-getmaximumnonpagealignedtransfersize
     */
    GetMaximumNonPageAlignedTransferSize() {
        result := ComCall(19, this, "uint*", &value := 0, "HRESULT")
        return value
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscrecorder2ex-getmaximumpagealignedtransfersize
     */
    GetMaximumPageAlignedTransferSize() {
        result := ComCall(20, this, "uint*", &value := 0, "HRESULT")
        return value
    }
}
