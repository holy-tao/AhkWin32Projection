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
     * 
     * @param {Pointer<Byte>} Cdb 
     * @param {Integer} CdbSize 
     * @param {Pointer<Byte>} SenseBuffer 
     * @param {Integer} Timeout 
     * @returns {HRESULT} 
     */
    SendCommandNoData(Cdb, CdbSize, SenseBuffer, Timeout) {
        result := ComCall(3, this, "char*", Cdb, "uint", CdbSize, "char*", SenseBuffer, "uint", Timeout, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} Cdb 
     * @param {Integer} CdbSize 
     * @param {Pointer<Byte>} SenseBuffer 
     * @param {Integer} Timeout 
     * @param {Pointer<Byte>} Buffer 
     * @param {Integer} BufferSize 
     * @returns {HRESULT} 
     */
    SendCommandSendDataToDevice(Cdb, CdbSize, SenseBuffer, Timeout, Buffer, BufferSize) {
        result := ComCall(4, this, "char*", Cdb, "uint", CdbSize, "char*", SenseBuffer, "uint", Timeout, "char*", Buffer, "uint", BufferSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} Cdb 
     * @param {Integer} CdbSize 
     * @param {Pointer<Byte>} SenseBuffer 
     * @param {Integer} Timeout 
     * @param {Pointer<Byte>} Buffer 
     * @param {Integer} BufferSize 
     * @param {Pointer<UInt32>} BufferFetched 
     * @returns {HRESULT} 
     */
    SendCommandGetDataFromDevice(Cdb, CdbSize, SenseBuffer, Timeout, Buffer, BufferSize, BufferFetched) {
        result := ComCall(5, this, "char*", Cdb, "uint", CdbSize, "char*", SenseBuffer, "uint", Timeout, "char*", Buffer, "uint", BufferSize, "uint*", BufferFetched, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} format 
     * @param {Integer} address 
     * @param {Integer} layer 
     * @param {Integer} agid 
     * @param {Pointer<Byte>} data 
     * @param {Pointer<UInt32>} count 
     * @returns {HRESULT} 
     */
    ReadDvdStructure(format, address, layer, agid, data, count) {
        result := ComCall(6, this, "uint", format, "uint", address, "uint", layer, "uint", agid, "char*", data, "uint*", count, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} format 
     * @param {Pointer<Byte>} data 
     * @param {Integer} count 
     * @returns {HRESULT} 
     */
    SendDvdStructure(format, data, count) {
        result := ComCall(7, this, "uint", format, "char*", data, "uint", count, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} data 
     * @param {Pointer<UInt32>} byteSize 
     * @returns {HRESULT} 
     */
    GetAdapterDescriptor(data, byteSize) {
        result := ComCall(8, this, "char*", data, "uint*", byteSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} data 
     * @param {Pointer<UInt32>} byteSize 
     * @returns {HRESULT} 
     */
    GetDeviceDescriptor(data, byteSize) {
        result := ComCall(9, this, "char*", data, "uint*", byteSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} discInformation 
     * @param {Pointer<UInt32>} byteSize 
     * @returns {HRESULT} 
     */
    GetDiscInformation(discInformation, byteSize) {
        result := ComCall(10, this, "char*", discInformation, "uint*", byteSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} address 
     * @param {Integer} addressType 
     * @param {Pointer<Byte>} trackInformation 
     * @param {Pointer<UInt32>} byteSize 
     * @returns {HRESULT} 
     */
    GetTrackInformation(address, addressType, trackInformation, byteSize) {
        result := ComCall(11, this, "uint", address, "int", addressType, "char*", trackInformation, "uint*", byteSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} requestedFeature 
     * @param {BOOLEAN} currentFeatureOnly 
     * @param {Pointer<Byte>} featureData 
     * @param {Pointer<UInt32>} byteSize 
     * @returns {HRESULT} 
     */
    GetFeaturePage(requestedFeature, currentFeatureOnly, featureData, byteSize) {
        result := ComCall(12, this, "int", requestedFeature, "char", currentFeatureOnly, "char*", featureData, "uint*", byteSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} requestedModePage 
     * @param {Integer} requestType 
     * @param {Pointer<Byte>} modePageData 
     * @param {Pointer<UInt32>} byteSize 
     * @returns {HRESULT} 
     */
    GetModePage(requestedModePage, requestType, modePageData, byteSize) {
        result := ComCall(13, this, "int", requestedModePage, "int", requestType, "char*", modePageData, "uint*", byteSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} requestType 
     * @param {Pointer<Byte>} data 
     * @param {Integer} byteSize 
     * @returns {HRESULT} 
     */
    SetModePage(requestType, data, byteSize) {
        result := ComCall(14, this, "int", requestType, "char*", data, "uint", byteSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOLEAN} currentFeatureOnly 
     * @param {Pointer<Int32>} featureData 
     * @param {Pointer<UInt32>} byteSize 
     * @returns {HRESULT} 
     */
    GetSupportedFeaturePages(currentFeatureOnly, featureData, byteSize) {
        result := ComCall(15, this, "char", currentFeatureOnly, "int*", featureData, "uint*", byteSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOLEAN} currentOnly 
     * @param {Pointer<Int32>} profileTypes 
     * @param {Pointer<UInt32>} validProfiles 
     * @returns {HRESULT} 
     */
    GetSupportedProfiles(currentOnly, profileTypes, validProfiles) {
        result := ComCall(16, this, "char", currentOnly, "int*", profileTypes, "uint*", validProfiles, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} requestType 
     * @param {Pointer<Int32>} modePageTypes 
     * @param {Pointer<UInt32>} validPages 
     * @returns {HRESULT} 
     */
    GetSupportedModePages(requestType, modePageTypes, validPages) {
        result := ComCall(17, this, "int", requestType, "int*", modePageTypes, "uint*", validPages, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} value 
     * @returns {HRESULT} 
     */
    GetByteAlignmentMask(value) {
        result := ComCall(18, this, "uint*", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} value 
     * @returns {HRESULT} 
     */
    GetMaximumNonPageAlignedTransferSize(value) {
        result := ComCall(19, this, "uint*", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} value 
     * @returns {HRESULT} 
     */
    GetMaximumPageAlignedTransferSize(value) {
        result := ComCall(20, this, "uint*", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
