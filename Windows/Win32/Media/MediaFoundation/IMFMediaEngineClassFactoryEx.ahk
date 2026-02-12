#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IMFMediaSourceExtension.ahk
#Include .\IMFMediaKeys.ahk
#Include .\IMFMediaEngineClassFactory.ahk

/**
 * Extension for the IMFMediaEngineClassFactory interface.
 * @remarks
 * This class is implemented by the Media Engine (CLSID_MFMediaEngineClassFactory).
 * @see https://learn.microsoft.com/windows/win32/api//content/mfmediaengine/nn-mfmediaengine-imfmediaengineclassfactoryex
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
     * @returns {Pointer<IMFMediaSourceExtension>} The <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nn-mfmediaengine-imfmediasourceextension">IMFMediaSourceExtension</a> which was created.
     * @see https://learn.microsoft.com/windows/win32/api//content/mfmediaengine/nf-mfmediaengine-imfmediaengineclassfactoryex-createmediasourceextension
     */
    CreateMediaSourceExtension(dwFlags, pAttr) {
        result := ComCall(6, this, "uint", dwFlags, "ptr", pAttr, "ptr*", &ppMSE := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppMSE
    }

    /**
     * Creates a media keys object based on the specified key system. (IMFMediaEngineClassFactoryEx.CreateMediaKeys)
     * @remarks
     * Checks if <i>keySystem</i> is a supported key system and creates the related Content Decryption Module (CDM).
     * @param {BSTR} keySystem The media keys system.
     * @param {BSTR} cdmStorePath Points to a location to store Content Decryption Module (CDM) data which might be locked by multiple process and so might be incompatible with store app suspension.
     * @returns {Pointer<IMFMediaKeys>} The media keys.
     * @see https://learn.microsoft.com/windows/win32/api//content/mfmediaengine/nf-mfmediaengine-imfmediaengineclassfactoryex-createmediakeys
     */
    CreateMediaKeys(keySystem, cdmStorePath) {
        if(keySystem is String) {
            pin := BSTR.Alloc(keySystem)
            keySystem := pin.Value
        }
        if(cdmStorePath is String) {
            pin := BSTR.Alloc(cdmStorePath)
            cdmStorePath := pin.Value
        }

        result := ComCall(7, this, "ptr", keySystem, "ptr", cdmStorePath, "ptr*", &ppKeys := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppKeys
    }

    /**
     * Gets a value that indicates if the specified key system supports the specified media type.
     * @param {BSTR} type The MIME type to check support for.
     * @param {BSTR} keySystem The key system to check support for.
     * @returns {BOOL} <b>true</b> if type is supported by <i>keySystem</i>; otherwise, <b>false.</b>
     * @see https://learn.microsoft.com/windows/win32/api//content/mfmediaengine/nf-mfmediaengine-imfmediaengineclassfactoryex-istypesupported
     */
    IsTypeSupported(type, keySystem) {
        if(type is String) {
            pin := BSTR.Alloc(type)
            type := pin.Value
        }
        if(keySystem is String) {
            pin := BSTR.Alloc(keySystem)
            keySystem := pin.Value
        }

        result := ComCall(8, this, "ptr", type, "ptr", keySystem, "int*", &isSupported := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return isSupported
    }
}
