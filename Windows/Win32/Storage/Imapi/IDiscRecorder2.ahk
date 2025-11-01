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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["EjectMedia", "CloseTray", "AcquireExclusiveAccess", "ReleaseExclusiveAccess", "DisableMcn", "EnableMcn", "InitializeDiscRecorder", "get_ActiveDiscRecorder", "get_VendorId", "get_ProductId", "get_ProductRevision", "get_VolumeName", "get_VolumePathNames", "get_DeviceCanLoadMedia", "get_LegacyDeviceNumber", "get_SupportedFeaturePages", "get_CurrentFeaturePages", "get_SupportedProfiles", "get_CurrentProfiles", "get_SupportedModePages", "get_ExclusiveAccessOwner"]

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscrecorder2-ejectmedia
     */
    EjectMedia() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscrecorder2-closetray
     */
    CloseTray() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} force 
     * @param {BSTR} __MIDL__IDiscRecorder20000 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscrecorder2-acquireexclusiveaccess
     */
    AcquireExclusiveAccess(force, __MIDL__IDiscRecorder20000) {
        __MIDL__IDiscRecorder20000 := __MIDL__IDiscRecorder20000 is String ? BSTR.Alloc(__MIDL__IDiscRecorder20000).Value : __MIDL__IDiscRecorder20000

        result := ComCall(9, this, "short", force, "ptr", __MIDL__IDiscRecorder20000, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscrecorder2-releaseexclusiveaccess
     */
    ReleaseExclusiveAccess() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscrecorder2-disablemcn
     */
    DisableMcn() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscrecorder2-enablemcn
     */
    EnableMcn() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} recorderUniqueId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscrecorder2-initializediscrecorder
     */
    InitializeDiscRecorder(recorderUniqueId) {
        recorderUniqueId := recorderUniqueId is String ? BSTR.Alloc(recorderUniqueId).Value : recorderUniqueId

        result := ComCall(13, this, "ptr", recorderUniqueId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscrecorder2-get_activediscrecorder
     */
    get_ActiveDiscRecorder(value) {
        result := ComCall(14, this, "ptr", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscrecorder2-get_vendorid
     */
    get_VendorId(value) {
        result := ComCall(15, this, "ptr", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscrecorder2-get_productid
     */
    get_ProductId(value) {
        result := ComCall(16, this, "ptr", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscrecorder2-get_productrevision
     */
    get_ProductRevision(value) {
        result := ComCall(17, this, "ptr", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscrecorder2-get_volumename
     */
    get_VolumeName(value) {
        result := ComCall(18, this, "ptr", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<SAFEARRAY>>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscrecorder2-get_volumepathnames
     */
    get_VolumePathNames(value) {
        result := ComCall(19, this, "ptr*", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscrecorder2-get_devicecanloadmedia
     */
    get_DeviceCanLoadMedia(value) {
        result := ComCall(20, this, "ptr", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} legacyDeviceNumber 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscrecorder2-get_legacydevicenumber
     */
    get_LegacyDeviceNumber(legacyDeviceNumber) {
        legacyDeviceNumberMarshal := legacyDeviceNumber is VarRef ? "int*" : "ptr"

        result := ComCall(21, this, legacyDeviceNumberMarshal, legacyDeviceNumber, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<SAFEARRAY>>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscrecorder2-get_supportedfeaturepages
     */
    get_SupportedFeaturePages(value) {
        result := ComCall(22, this, "ptr*", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<SAFEARRAY>>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscrecorder2-get_currentfeaturepages
     */
    get_CurrentFeaturePages(value) {
        result := ComCall(23, this, "ptr*", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<SAFEARRAY>>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscrecorder2-get_supportedprofiles
     */
    get_SupportedProfiles(value) {
        result := ComCall(24, this, "ptr*", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<SAFEARRAY>>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscrecorder2-get_currentprofiles
     */
    get_CurrentProfiles(value) {
        result := ComCall(25, this, "ptr*", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<SAFEARRAY>>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscrecorder2-get_supportedmodepages
     */
    get_SupportedModePages(value) {
        result := ComCall(26, this, "ptr*", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscrecorder2-get_exclusiveaccessowner
     */
    get_ExclusiveAccessOwner(value) {
        result := ComCall(27, this, "ptr", value, "HRESULT")
        return result
    }
}
