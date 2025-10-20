#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Implemented by the media engine to add encrypted media extensions methods.
 * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nn-mfmediaengine-imfmediaengineeme
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFMediaEngineEME extends IUnknown{
    /**
     * The interface identifier for IMFMediaEngineEME
     * @type {Guid}
     */
    static IID => Guid("{50dc93e4-ba4f-4275-ae66-83e836e57469}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IMFMediaKeys>} keys 
     * @returns {HRESULT} 
     */
    get_Keys(keys) {
        result := ComCall(3, this, "ptr", keys, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMFMediaKeys>} keys 
     * @returns {HRESULT} 
     */
    SetMediaKeys(keys) {
        result := ComCall(4, this, "ptr", keys, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
