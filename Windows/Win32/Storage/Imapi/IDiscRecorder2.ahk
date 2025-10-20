#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * This interface represents a physical device. You use this interface to retrieve information about a CD and DVD device installed on the computer and to perform operations such as closing the tray or eject the media.
 * @remarks
 * 
  * To create the <b>MsftDiscRecorder2</b> object in a script, use IMAPI2.MsftDiscRecorder2 as the program identifier when calling <b>CreateObject</b>.
  * 
  * To write data to media, you need to attach a recorder to a format writer, for example, to attach the recorder to a data writer, call the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nf-imapi2-idiscformat2data-put_recorder">IDiscFormat2Data::put_Recorder</a> method.
  * 
  * Several properties of this interface return packet data defined by Multimedia Command (MMC). For information on the format of the packet data, see the latest revision of the MMC specification at ftp://ftp.t10.org/t10/drafts/mmc5.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//imapi2/nn-imapi2-idiscrecorder2
 * @namespace Windows.Win32.Storage.Imapi
 * @version v4.0.30319
 */
class IDiscRecorder2 extends IDispatch{
    /**
     * The interface identifier for IDiscRecorder2
     * @type {Guid}
     */
    static IID => Guid("{27354133-7f64-5b0f-8f00-5d77afbe261e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @returns {HRESULT} 
     */
    EjectMedia() {
        result := ComCall(7, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    CloseTray() {
        result := ComCall(8, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} force 
     * @param {BSTR} __MIDL__IDiscRecorder20000 
     * @returns {HRESULT} 
     */
    AcquireExclusiveAccess(force, __MIDL__IDiscRecorder20000) {
        __MIDL__IDiscRecorder20000 := __MIDL__IDiscRecorder20000 is String ? BSTR.Alloc(__MIDL__IDiscRecorder20000).Value : __MIDL__IDiscRecorder20000

        result := ComCall(9, this, "short", force, "ptr", __MIDL__IDiscRecorder20000, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ReleaseExclusiveAccess() {
        result := ComCall(10, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    DisableMcn() {
        result := ComCall(11, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    EnableMcn() {
        result := ComCall(12, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} recorderUniqueId 
     * @returns {HRESULT} 
     */
    InitializeDiscRecorder(recorderUniqueId) {
        recorderUniqueId := recorderUniqueId is String ? BSTR.Alloc(recorderUniqueId).Value : recorderUniqueId

        result := ComCall(13, this, "ptr", recorderUniqueId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} value 
     * @returns {HRESULT} 
     */
    get_ActiveDiscRecorder(value) {
        result := ComCall(14, this, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} value 
     * @returns {HRESULT} 
     */
    get_VendorId(value) {
        result := ComCall(15, this, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} value 
     * @returns {HRESULT} 
     */
    get_ProductId(value) {
        result := ComCall(16, this, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} value 
     * @returns {HRESULT} 
     */
    get_ProductRevision(value) {
        result := ComCall(17, this, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} value 
     * @returns {HRESULT} 
     */
    get_VolumeName(value) {
        result := ComCall(18, this, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} value 
     * @returns {HRESULT} 
     */
    get_VolumePathNames(value) {
        result := ComCall(19, this, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} value 
     * @returns {HRESULT} 
     */
    get_DeviceCanLoadMedia(value) {
        result := ComCall(20, this, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} legacyDeviceNumber 
     * @returns {HRESULT} 
     */
    get_LegacyDeviceNumber(legacyDeviceNumber) {
        result := ComCall(21, this, "int*", legacyDeviceNumber, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} value 
     * @returns {HRESULT} 
     */
    get_SupportedFeaturePages(value) {
        result := ComCall(22, this, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} value 
     * @returns {HRESULT} 
     */
    get_CurrentFeaturePages(value) {
        result := ComCall(23, this, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} value 
     * @returns {HRESULT} 
     */
    get_SupportedProfiles(value) {
        result := ComCall(24, this, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} value 
     * @returns {HRESULT} 
     */
    get_CurrentProfiles(value) {
        result := ComCall(25, this, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} value 
     * @returns {HRESULT} 
     */
    get_SupportedModePages(value) {
        result := ComCall(26, this, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} value 
     * @returns {HRESULT} 
     */
    get_ExclusiveAccessOwner(value) {
        result := ComCall(27, this, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
