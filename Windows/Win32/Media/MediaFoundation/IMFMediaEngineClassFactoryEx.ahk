#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IMFMediaEngineClassFactory.ahk" { IMFMediaEngineClassFactory }
#Import ".\IMFMediaKeys.ahk" { IMFMediaKeys }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMFAttributes.ahk" { IMFAttributes }
#Import ".\IMFMediaSourceExtension.ahk" { IMFMediaSourceExtension }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Extension for the IMFMediaEngineClassFactory interface.
 * @remarks
 * This class is implemented by the Media Engine (CLSID_MFMediaEngineClassFactory).
 * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nn-mfmediaengine-imfmediaengineclassfactoryex
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFMediaEngineClassFactoryEx extends IMFMediaEngineClassFactory {
    /**
     * The interface identifier for IMFMediaEngineClassFactoryEx
     * @type {Guid}
     */
    static IID := Guid("{c56156c6-ea5b-48a5-9df8-fbe035d0929e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFMediaEngineClassFactoryEx interfaces
    */
    struct Vtbl extends IMFMediaEngineClassFactory.Vtbl {
        CreateMediaSourceExtension : IntPtr
        CreateMediaKeys            : IntPtr
        IsTypeSupported            : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFMediaEngineClassFactoryEx.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Creates an instance of IMFMediaSourceExtension.
     * @param {Integer} dwFlags This parameter is reserved and must be set to 0.
     * @param {IMFAttributes} pAttr This method supports the following  Media Foundation attributes:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-mse-callback">MF_MSE_CALLBACK</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-mse-bufferlist-callback">MF_MSE_BUFFERLIST_CALLBACK</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-mse-activelist-callback">MF_MSE_ACTIVELIST_CALLBACK</a>
     * </li>
     * </ul>
     * @returns {IMFMediaSourceExtension} The <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nn-mfmediaengine-imfmediasourceextension">IMFMediaSourceExtension</a> which was created.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengineclassfactoryex-createmediasourceextension
     */
    CreateMediaSourceExtension(dwFlags, pAttr) {
        result := ComCall(6, this, "uint", dwFlags, "ptr", pAttr, "ptr*", &ppMSE := 0, "HRESULT")
        return IMFMediaSourceExtension(ppMSE)
    }

    /**
     * Creates a media keys object based on the specified key system. (IMFMediaEngineClassFactoryEx.CreateMediaKeys)
     * @remarks
     * Checks if <i>keySystem</i> is a supported key system and creates the related Content Decryption Module (CDM).
     * @param {BSTR} keySystem The media keys system.
     * @param {BSTR} cdmStorePath Points to a location to store Content Decryption Module (CDM) data which might be locked by multiple process and so might be incompatible with store app suspension.
     * @returns {IMFMediaKeys} The media keys.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengineclassfactoryex-createmediakeys
     */
    CreateMediaKeys(keySystem, cdmStorePath) {
        keySystem := keySystem is String ? BSTR.Alloc(keySystem).Value : keySystem
        cdmStorePath := cdmStorePath is String ? BSTR.Alloc(cdmStorePath).Value : cdmStorePath

        result := ComCall(7, this, BSTR, keySystem, BSTR, cdmStorePath, "ptr*", &ppKeys := 0, "HRESULT")
        return IMFMediaKeys(ppKeys)
    }

    /**
     * Gets a value that indicates if the specified key system supports the specified media type.
     * @param {BSTR} type The MIME type to check support for.
     * @param {BSTR} keySystem The key system to check support for.
     * @returns {BOOL} <b>true</b> if type is supported by <i>keySystem</i>; otherwise, <b>false.</b>
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengineclassfactoryex-istypesupported
     */
    IsTypeSupported(type, keySystem) {
        type := type is String ? BSTR.Alloc(type).Value : type
        keySystem := keySystem is String ? BSTR.Alloc(keySystem).Value : keySystem

        result := ComCall(8, this, BSTR, type, BSTR, keySystem, BOOL.Ptr, &isSupported := 0, "HRESULT")
        return isSupported
    }

    Query(iid) {
        if (IMFMediaEngineClassFactoryEx.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateMediaSourceExtension := CallbackCreate(GetMethod(implObj, "CreateMediaSourceExtension"), flags, 4)
        this.vtbl.CreateMediaKeys := CallbackCreate(GetMethod(implObj, "CreateMediaKeys"), flags, 4)
        this.vtbl.IsTypeSupported := CallbackCreate(GetMethod(implObj, "IsTypeSupported"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateMediaSourceExtension)
        CallbackFree(this.vtbl.CreateMediaKeys)
        CallbackFree(this.vtbl.IsTypeSupported)
    }
}
