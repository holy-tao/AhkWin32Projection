#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Creates an instance of the IMFMediaSharingEngine.
 * @see https://docs.microsoft.com/windows/win32/api//mfsharingengine/nn-mfsharingengine-imfmediasharingengineclassfactory
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFMediaSharingEngineClassFactory extends IUnknown{
    /**
     * The interface identifier for IMFMediaSharingEngineClassFactory
     * @type {Guid}
     */
    static IID => Guid("{524d2bc4-b2b1-4fe5-8fac-fa4e4512b4e0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {Pointer<IMFAttributes>} pAttr 
     * @param {Pointer<IMFMediaSharingEngine>} ppEngine 
     * @returns {HRESULT} 
     */
    CreateInstance(dwFlags, pAttr, ppEngine) {
        result := ComCall(3, this, "uint", dwFlags, "ptr", pAttr, "ptr", ppEngine, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
