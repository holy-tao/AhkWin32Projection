#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IMFMediaEngineSrcElements.ahk

/**
 * Extends the IMFMediaEngineSrcElements interface to provide additional capabilities.
 * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nn-mfmediaengine-imfmediaenginesrcelementsex
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFMediaEngineSrcElementsEx extends IMFMediaEngineSrcElements{
    /**
     * The interface identifier for IMFMediaEngineSrcElementsEx
     * @type {Guid}
     */
    static IID => Guid("{654a6bb3-e1a3-424a-9908-53a43a0dfda0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 9

    /**
     * 
     * @param {BSTR} pURL 
     * @param {BSTR} pType 
     * @param {BSTR} pMedia 
     * @param {BSTR} keySystem 
     * @returns {HRESULT} 
     */
    AddElementEx(pURL, pType, pMedia, keySystem) {
        pURL := pURL is String ? BSTR.Alloc(pURL).Value : pURL
        pType := pType is String ? BSTR.Alloc(pType).Value : pType
        pMedia := pMedia is String ? BSTR.Alloc(pMedia).Value : pMedia
        keySystem := keySystem is String ? BSTR.Alloc(keySystem).Value : keySystem

        result := ComCall(9, this, "ptr", pURL, "ptr", pType, "ptr", pMedia, "ptr", keySystem, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<BSTR>} pType 
     * @returns {HRESULT} 
     */
    GetKeySystem(index, pType) {
        result := ComCall(10, this, "uint", index, "ptr", pType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
