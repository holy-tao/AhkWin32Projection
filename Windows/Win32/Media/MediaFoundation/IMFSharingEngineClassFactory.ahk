#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMFAttributes.ahk" { IMFAttributes }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Creates an instance of the media sharing engine. (IMFSharingEngineClassFactory)
 * @see https://learn.microsoft.com/windows/win32/api/mfsharingengine/nn-mfsharingengine-imfsharingengineclassfactory
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFSharingEngineClassFactory extends IUnknown {
    /**
     * The interface identifier for IMFSharingEngineClassFactory
     * @type {Guid}
     */
    static IID := Guid("{2ba61f92-8305-413b-9733-faf15f259384}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFSharingEngineClassFactory interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CreateInstance : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFSharingEngineClassFactory.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Creates an instance of the media sharing engine. (IMFSharingEngineClassFactory.CreateInstance)
     * @param {Integer} dwFlags A bitwise <b>OR</b> of zero or more flags from the <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/ne-mfmediaengine-mf_media_engine_createflags">MF_MEDIA_ENGINE_CREATEFLAGS</a> enumeration.
     * @param {IMFAttributes} pAttr A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfattributes">IMFAttributes</a> interface. This parameter  specifies configuration attributes; see <a href="https://docs.microsoft.com/windows/desktop/medfound/media-engine-attributes">Media Engine Attributes</a>.
     * @returns {IUnknown} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface of the media sharing engine. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/mfsharingengine/nf-mfsharingengine-imfsharingengineclassfactory-createinstance
     */
    CreateInstance(dwFlags, pAttr) {
        result := ComCall(3, this, "uint", dwFlags, "ptr", pAttr, "ptr*", &ppEngine := 0, "HRESULT")
        return IUnknown(ppEngine)
    }

    Query(iid) {
        if (IMFSharingEngineClassFactory.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateInstance := CallbackCreate(GetMethod(implObj, "CreateInstance"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateInstance)
    }
}
