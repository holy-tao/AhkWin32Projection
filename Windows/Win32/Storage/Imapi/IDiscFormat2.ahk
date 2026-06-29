#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import ".\IDiscRecorder2.ahk" { IDiscRecorder2 }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\..\System\Com\SAFEARRAY.ahk" { SAFEARRAY }

/**
 * This is a base interface. Use the following interfaces which inherit this interface IDiscFormat2Data, IDiscFormat2Erase, IDiscFormat2TrackAtOnce, IDiscFormat2RawCD
 * @see https://learn.microsoft.com/windows/win32/api/imapi2/nn-imapi2-idiscformat2
 * @namespace Windows.Win32.Storage.Imapi
 */
export default struct IDiscFormat2 extends IDispatch {
    /**
     * The interface identifier for IDiscFormat2
     * @type {Guid}
     */
    static IID := Guid("{27354152-8f64-5b0f-8f00-5d77afbe261e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDiscFormat2 interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        IsRecorderSupported         : IntPtr
        IsCurrentMediaSupported     : IntPtr
        get_MediaPhysicallyBlank    : IntPtr
        get_MediaHeuristicallyBlank : IntPtr
        get_SupportedMediaTypes     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDiscFormat2.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @remarks
     * When implemented by the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nn-imapi2-idiscformat2rawcd">IDiscFormat2RawCD</a> interface, this method will return  E_IMAPI_DF2RAW_MEDIA_IS_NOT_SUPPORTED in the event the recorder does not support the given format. It is important to note that in this specific scenario the value does not indicate that an error has occurred, but rather the result of a successful operation.
     * @param {IDiscRecorder2} recorder An <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nn-imapi2-idiscrecorder2">IDiscRecorder2</a> interface of the recorder to test.
     * @returns {VARIANT_BOOL} Is VARIANT_TRUE if the recorder supports the given format; otherwise, VARIANT_FALSE.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2-isrecordersupported
     */
    IsRecorderSupported(recorder) {
        result := ComCall(7, this, "ptr", recorder, VARIANT_BOOL.Ptr, &value := 0, "HRESULT")
        return value
    }

    /**
     * Determines if the current media in a supported recorder supports the given format.
     * @param {IDiscRecorder2} recorder An <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nn-imapi2-idiscrecorder2">IDiscRecorder2</a> interface of the recorder to test.
     * @returns {VARIANT_BOOL} Is VARIANT_TRUE if the media in the recorder supports the given format; otherwise, VARIANT_FALSE.
     * 
     * <div class="alert"><b>Note</b>  VARIANT_TRUE also implies that the result from <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nf-imapi2-idiscformat2-isrecordersupported">IsDiscRecorderSupported</a> is VARIANT_TRUE. </div>
     * <div> </div>
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2-iscurrentmediasupported
     */
    IsCurrentMediaSupported(recorder) {
        result := ComCall(8, this, "ptr", recorder, VARIANT_BOOL.Ptr, &value := 0, "HRESULT")
        return value
    }

    /**
     * Determines if the current media is reported as physically blank by the drive.
     * @returns {VARIANT_BOOL} Is VARIANT_TRUE if the disc is physically blank; otherwise, VARIANT_FALSE.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2-get_mediaphysicallyblank
     */
    get_MediaPhysicallyBlank() {
        result := ComCall(9, this, VARIANT_BOOL.Ptr, &value := 0, "HRESULT")
        return value
    }

    /**
     * Attempts to determine if the media is blank using heuristics (mainly for DVD+RW and DVD-RAM media).
     * @remarks
     * This method checks, for example, for a mounted file system on the device, verifying the first and last 2MB of the disc are filled with zeros, and other media-specific checks.  These checks can help to determine if the media may have files on it for media that cannot be erased physically to a blank status.
     * 
     * For a positive check that a disc is blank, call the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nf-imapi2-idiscformat2-get_mediaphysicallyblank">IDiscFormat2::get_MediaPhysicallyBlank</a> method.
     * @returns {VARIANT_BOOL} Is VARIANT_TRUE if the disc is likely to be blank; otherwise; VARIANT_FALSE.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2-get_mediaheuristicallyblank
     */
    get_MediaHeuristicallyBlank() {
        result := ComCall(10, this, VARIANT_BOOL.Ptr, &value := 0, "HRESULT")
        return value
    }

    /**
     * Retrieves the media types that are supported by the current implementation of the IDiscFormat2 interface.
     * @returns {Pointer<SAFEARRAY>} List of media types supported by the current implementation of the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nn-imapi2-idiscformat2">IDiscFormat2</a> interface. Each element of the array is a <b>VARIANT</b> of type <b>VT_I4</b>. The <b>lVal</b> member of <b>VARIANT</b> contains the media type. For a list of media types, see the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/ne-imapi2-imapi_media_physical_type">IMAPI_MEDIA_PHYSICAL_TYPE</a> enumeration type.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-idiscformat2-get_supportedmediatypes
     */
    get_SupportedMediaTypes() {
        result := ComCall(11, this, "ptr*", &value := 0, "HRESULT")
        return value
    }

    Query(iid) {
        if (IDiscFormat2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.IsRecorderSupported := CallbackCreate(GetMethod(implObj, "IsRecorderSupported"), flags, 3)
        this.vtbl.IsCurrentMediaSupported := CallbackCreate(GetMethod(implObj, "IsCurrentMediaSupported"), flags, 3)
        this.vtbl.get_MediaPhysicallyBlank := CallbackCreate(GetMethod(implObj, "get_MediaPhysicallyBlank"), flags, 2)
        this.vtbl.get_MediaHeuristicallyBlank := CallbackCreate(GetMethod(implObj, "get_MediaHeuristicallyBlank"), flags, 2)
        this.vtbl.get_SupportedMediaTypes := CallbackCreate(GetMethod(implObj, "get_SupportedMediaTypes"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.IsRecorderSupported)
        CallbackFree(this.vtbl.IsCurrentMediaSupported)
        CallbackFree(this.vtbl.get_MediaPhysicallyBlank)
        CallbackFree(this.vtbl.get_MediaHeuristicallyBlank)
        CallbackFree(this.vtbl.get_SupportedMediaTypes)
    }
}
