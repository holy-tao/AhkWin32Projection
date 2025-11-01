#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IMFMediaEngineClassFactory.ahk

/**
 * Extension for the IMFMediaEngineClassFactory interface.
 * @remarks
 * 
  * This class is implemented by the Media Engine (CLSID_MFMediaEngineClassFactory).
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nn-mfmediaengine-imfmediaengineclassfactoryex
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFMediaEngineClassFactoryEx extends IMFMediaEngineClassFactory{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFMediaEngineClassFactoryEx
     * @type {Guid}
     */
    static IID => Guid("{c56156c6-ea5b-48a5-9df8-fbe035d0929e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateMediaSourceExtension", "CreateMediaKeys", "IsTypeSupported"]

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {IMFAttributes} pAttr 
     * @param {Pointer<IMFMediaSourceExtension>} ppMSE 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengineclassfactoryex-createmediasourceextension
     */
    CreateMediaSourceExtension(dwFlags, pAttr, ppMSE) {
        result := ComCall(6, this, "uint", dwFlags, "ptr", pAttr, "ptr*", ppMSE, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} keySystem 
     * @param {BSTR} cdmStorePath 
     * @param {Pointer<IMFMediaKeys>} ppKeys 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengineclassfactoryex-createmediakeys
     */
    CreateMediaKeys(keySystem, cdmStorePath, ppKeys) {
        keySystem := keySystem is String ? BSTR.Alloc(keySystem).Value : keySystem
        cdmStorePath := cdmStorePath is String ? BSTR.Alloc(cdmStorePath).Value : cdmStorePath

        result := ComCall(7, this, "ptr", keySystem, "ptr", cdmStorePath, "ptr*", ppKeys, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} type 
     * @param {BSTR} keySystem 
     * @param {Pointer<BOOL>} isSupported 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediaengineclassfactoryex-istypesupported
     */
    IsTypeSupported(type, keySystem, isSupported) {
        type := type is String ? BSTR.Alloc(type).Value : type
        keySystem := keySystem is String ? BSTR.Alloc(keySystem).Value : keySystem

        result := ComCall(8, this, "ptr", type, "ptr", keySystem, "ptr", isSupported, "HRESULT")
        return result
    }
}
