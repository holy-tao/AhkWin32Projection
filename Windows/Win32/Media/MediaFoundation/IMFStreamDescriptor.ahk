#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMFAttributes.ahk" { IMFAttributes }
#Import ".\IMFMediaTypeHandler.ahk" { IMFMediaTypeHandler }

/**
 * Gets information about one stream in a media source.
 * @remarks
 * A presentation descriptor contains one or more stream descriptors. To get the stream descriptors from a presentation descriptor, call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfpresentationdescriptor-getstreamdescriptorbyindex">IMFPresentationDescriptor::GetStreamDescriptorByIndex</a>. To create a new stream descriptor, call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-mfcreatestreamdescriptor">MFCreateStreamDescriptor</a>.
 * 
 * This interface is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
 * 
 * <ul>
 * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
 * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
 * </ul>
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nn-mfidl-imfstreamdescriptor
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFStreamDescriptor extends IMFAttributes {
    /**
     * The interface identifier for IMFStreamDescriptor
     * @type {Guid}
     */
    static IID := Guid("{56c03d9c-9dbb-45f5-ab4b-d80f47c05938}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFStreamDescriptor interfaces
    */
    struct Vtbl extends IMFAttributes.Vtbl {
        GetStreamIdentifier : IntPtr
        GetMediaTypeHandler : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFStreamDescriptor.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves an identifier for the stream.
     * @remarks
     * The stream identifier uniquely identifies a stream within a presentation. It does not change throughout the lifetime of the stream. For example, if the presentation changes while the source is running, the index number of the stream may change, but the stream identifier does not.
     * 
     * In general, stream identifiers do not have a specific meaning, other than to identify the stream. Some media sources may assign stream identifiers based on meaningful values, such as packet identifiers, but this depends on the implementation.
     * 
     * This interface is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
     * 
     * <ul>
     * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
     * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
     * </ul>
     * @returns {Integer} Receives the stream identifier.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfstreamdescriptor-getstreamidentifier
     */
    GetStreamIdentifier() {
        result := ComCall(33, this, "uint*", &pdwStreamIdentifier := 0, "HRESULT")
        return pdwStreamIdentifier
    }

    /**
     * Retrieves a media type handler for the stream. The media type handler can be used to enumerate supported media types for the stream, get the current media type, and set the media type.
     * @remarks
     * This interface is available on the following platforms if the Windows Media Format 11 SDK redistributable components are installed:
     * 
     * <ul>
     * <li>Windows XP with Service Pack 2 (SP2) and later.</li>
     * <li>Windows XP Media Center Edition 2005 with KB900325 (Windows XP Media Center Edition 2005) and KB925766 (October 2006 Update Rollup for Windows XP Media Center Edition) installed.</li>
     * </ul>
     * @returns {IMFMediaTypeHandler} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfmediatypehandler">IMFMediaTypeHandler</a> interface. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfstreamdescriptor-getmediatypehandler
     */
    GetMediaTypeHandler() {
        result := ComCall(34, this, "ptr*", &ppMediaTypeHandler := 0, "HRESULT")
        return IMFMediaTypeHandler(ppMediaTypeHandler)
    }

    Query(iid) {
        if (IMFStreamDescriptor.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetStreamIdentifier := CallbackCreate(GetMethod(implObj, "GetStreamIdentifier"), flags, 2)
        this.vtbl.GetMediaTypeHandler := CallbackCreate(GetMethod(implObj, "GetMediaTypeHandler"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetStreamIdentifier)
        CallbackFree(this.vtbl.GetMediaTypeHandler)
    }
}
