#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * This is a base interface. Use the following interfaces which inherit this interface IDiscFormat2Data, IDiscFormat2Erase, IDiscFormat2TrackAtOnce, IDiscFormat2RawCD
 * @see https://docs.microsoft.com/windows/win32/api//imapi2/nn-imapi2-idiscformat2
 * @namespace Windows.Win32.Storage.Imapi
 * @version v4.0.30319
 */
class IDiscFormat2 extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDiscFormat2
     * @type {Guid}
     */
    static IID => Guid("{27354152-8f64-5b0f-8f00-5d77afbe261e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsRecorderSupported", "IsCurrentMediaSupported", "get_MediaPhysicallyBlank", "get_MediaHeuristicallyBlank", "get_SupportedMediaTypes"]

    /**
     * @type {VARIANT_BOOL} 
     */
    MediaPhysicallyBlank {
        get => this.get_MediaPhysicallyBlank()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    MediaHeuristicallyBlank {
        get => this.get_MediaHeuristicallyBlank()
    }

    /**
     * @type {Pointer<SAFEARRAY>} 
     */
    SupportedMediaTypes {
        get => this.get_SupportedMediaTypes()
    }

    /**
     * Determines if the recorder supports the given format.
     * @param {IDiscRecorder2} recorder An <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nn-imapi2-idiscrecorder2">IDiscRecorder2</a> interface of the recorder to test.
     * @returns {VARIANT_BOOL} Is VARIANT_TRUE if the recorder supports the given format; otherwise, VARIANT_FALSE.
     * @see https://docs.microsoft.com/windows/win32/api//imapi2/nf-imapi2-idiscformat2-isrecordersupported
     */
    IsRecorderSupported(recorder) {
        result := ComCall(7, this, "ptr", recorder, "short*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Determines if the current media in a supported recorder supports the given format.
     * @param {IDiscRecorder2} recorder An <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nn-imapi2-idiscrecorder2">IDiscRecorder2</a> interface of the recorder to test.
     * @returns {VARIANT_BOOL} Is VARIANT_TRUE if the media in the recorder supports the given format; otherwise, VARIANT_FALSE.
     * 
     * <div class="alert"><b>Note</b>  VARIANT_TRUE also implies that the result from <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nf-imapi2-idiscformat2-isrecordersupported">IsDiscRecorderSupported</a> is VARIANT_TRUE. </div>
     * <div> </div>
     * @see https://docs.microsoft.com/windows/win32/api//imapi2/nf-imapi2-idiscformat2-iscurrentmediasupported
     */
    IsCurrentMediaSupported(recorder) {
        result := ComCall(8, this, "ptr", recorder, "short*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Determines if the current media is reported as physically blank by the drive.
     * @returns {VARIANT_BOOL} Is VARIANT_TRUE if the disc is physically blank; otherwise, VARIANT_FALSE.
     * @see https://docs.microsoft.com/windows/win32/api//imapi2/nf-imapi2-idiscformat2-get_mediaphysicallyblank
     */
    get_MediaPhysicallyBlank() {
        result := ComCall(9, this, "short*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Attempts to determine if the media is blank using heuristics (mainly for DVD+RW and DVD-RAM media).
     * @returns {VARIANT_BOOL} Is VARIANT_TRUE if the disc is likely to be blank; otherwise; VARIANT_FALSE.
     * @see https://docs.microsoft.com/windows/win32/api//imapi2/nf-imapi2-idiscformat2-get_mediaheuristicallyblank
     */
    get_MediaHeuristicallyBlank() {
        result := ComCall(10, this, "short*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Retrieves the media types that are supported by the current implementation of the IDiscFormat2 interface.
     * @returns {Pointer<SAFEARRAY>} List of media types supported by the current implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nn-imapi2-idiscformat2">IDiscFormat2</a> interface. Each element of the array is a <b>VARIANT</b> of type <b>VT_I4</b>. The <b>lVal</b> member of <b>VARIANT</b> contains the media type. For a list of media types, see the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/ne-imapi2-imapi_media_physical_type">IMAPI_MEDIA_PHYSICAL_TYPE</a> enumeration type.
     * @see https://docs.microsoft.com/windows/win32/api//imapi2/nf-imapi2-idiscformat2-get_supportedmediatypes
     */
    get_SupportedMediaTypes() {
        result := ComCall(11, this, "ptr*", &value := 0, "HRESULT")
        return value
    }
}
